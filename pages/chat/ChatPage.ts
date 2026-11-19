import { expect, test, type Page, type TestInfo } from '@playwright/test';
import * as fs from 'fs';
import * as os from 'os';
import * as path from 'path';
import { BasePage } from '../BasePage';
import { logger } from '../../utils/logger';
import { verifyChatAnswerAgainstOracle } from '../../utils/sqlOracle';

const msFromEnv = (value: string | undefined, fallback: number): number => {
  const parsed = Number(value);
  return Number.isFinite(parsed) && parsed >= 0 ? parsed : fallback;
};
// Pacing for the live app: a scenario starts no sooner than this long after the previous one finished,
// so questions are not fired back to back. SCENARIO_GAP_MS overrides it (0 turns pacing off).
const SCENARIO_GAP_MS = msFromEnv(process.env.SCENARIO_GAP_MS, 20000);
// Before each scenario, wait up to this long for /api/health to answer below 500 (an outage returns 530).
const HEALTH_MAX_WAIT_MS = msFromEnv(process.env.HEALTH_MAX_WAIT_MS, 15 * 60000);
const HEALTH_POLL_MS = 30000;
const HEALTH_REQUEST_TIMEOUT_MS = 15000;
// When the previous scenario finished. A file, not a variable: Playwright starts a new worker after each failed test.
const PACING_FILE = path.join(os.tmpdir(), 'eleviqai-last-chat-scenario-finished.txt');
export const THUMBS_DOWN_ANNOTATION = 'Thumbs down (Bad response)';
const utcNow = (): string => `${new Date().toISOString().replace('T', ' ').slice(0, 19)} UTC`;
const escapeHtml = (text: string): string => text.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const sleep = (ms: number): Promise<void> => new Promise((resolve) => setTimeout(resolve, ms));

// The question box value captured at submit time, keyed by page, so a later step can confirm the
// conversation shows exactly what was typed (step definitions build a fresh ChatPage per step).
const submittedQuestions = new WeakMap<Page, string>();
// The question typed in the earlier step; the app sometimes clears the box after the new-chat
// screen finishes loading, so submitQuestion restores it instead of clicking a disabled button.
const typedQuestions = new WeakMap<Page, string>();

// Each locator strategy gets this long, and the default 30s test timeout is shorter than a slow
// response, so waitForResponseToFinish raises the test timeout to cover two full strategy walks.
const RESPONSE_TIMEOUT_MS = 45000;
const TEST_TIMEOUT_MS = 150000;
const APP_LOAD_TIMEOUT_MS = 60000;
const SLOW_APP_LOAD_MS = 15000;

export class ChatPage extends BasePage {
  constructor(page: Page) {
    super(page);
  }

  async openAppSignedIn(): Promise<void> {
    // Raise the timeout here, in the Background step, not later: the default 30s covers the
    // Background plus every step before the response wait, and a slow app load alone can use it up.
    test.setTimeout(Math.max(test.info().timeout, TEST_TIMEOUT_MS));
    // The live app normally loads in 1-2s but intermittently takes 10-30s+ to serve its scripts.
    // Allow for that, but log it, so slow loads are reported rather than hidden.
    const started = Date.now();
    await this.goto('/', APP_LOAD_TIMEOUT_MS);
    const loadMs = Date.now() - started;
    if (loadMs > SLOW_APP_LOAD_MS) {
      logger.warning.slowElement(`App took ${Math.round(loadMs / 1000)}s to load (live environment slow)`);
    }
    await this.expectVisible(this.locators.chat.signedInIndicator);
  }

  async startNewChat(): Promise<void> {
    await this.click(this.locators.chat.newChatButton);
    // The app resets the question box once the new-chat screen finishes loading; let the
    // network settle so text typed afterwards is not wiped. Best effort only (polling apps never idle).
    await this.page.waitForLoadState('networkidle', { timeout: 5000 }).catch(() => undefined);
  }

  async expectNewChatScreen(): Promise<void> {
    await this.expectVisible(this.locators.chat.newChatHeading);
    await this.expectVisible(this.locators.chat.questionBox);
  }

  async typeQuestion(question: string): Promise<void> {
    typedQuestions.set(this.page, question);
    const box = await this.findElement(this.locators.chat.questionBox);
    // Re-enter the text if the app wipes the box while it is still initialising.
    await expect(async () => {
      await box.fill(question, { timeout: 3000 });
      await expect(box).toHaveValue(question, { timeout: 1500 });
    }).toPass({ timeout: 15000 });
  }

  async expectQuestionBoxShows(question: string): Promise<void> {
    const box = await this.findElement(this.locators.chat.questionBox);
    await expect(box).toHaveValue(question);
  }

  async submitQuestion(): Promise<void> {
    const box = await this.findElement(this.locators.chat.questionBox);
    const sendButton = await this.findElement(this.locators.chat.sendButton);
    const typed = typedQuestions.get(this.page);
    // The send button stays disabled while the box is empty, and the app can wipe the box late,
    // so restore the question, wait for the button to enable, and click as one retried unit.
    await expect(async () => {
      if (typed !== undefined && (await box.inputValue()) !== typed) {
        logger.ui.fill('Question box was cleared by the app; re-entering the typed question');
        await box.fill(typed, { timeout: 2000 });
      }
      await expect(sendButton).toBeEnabled({ timeout: 2000 });
      submittedQuestions.set(this.page, await box.inputValue());
      await sendButton.click({ timeout: 2000 });
    }).toPass({ timeout: 20000 });
  }

  async expectQuestionInConversation(): Promise<void> {
    const submitted = submittedQuestions.get(this.page);
    if (submitted === undefined) {
      throw new Error('No submitted question recorded for this page; the question was never submitted.');
    }
    const message = await this.findElement(this.locators.chat.userMessage, { timeoutMs: 30000 });
    await expect(message).toHaveText(submitted);
  }

  async waitForResponseToFinish(): Promise<void> {
    test.setTimeout(Math.max(test.info().timeout, TEST_TIMEOUT_MS));
    logger.ui.click(`Waiting up to ${RESPONSE_TIMEOUT_MS}ms for the response to finish`);
    await this.waitForElement(this.locators.chat.responseFeedback, 'visible', RESPONSE_TIMEOUT_MS);
  }

  /**
   * TBD: the workbook only gives the category intent ("Revenue analysis") and no observable
   * criterion for it, so this asserts only that a finished response is shown. Intent, figures
   * and wording are not verified.
   */
  async expectResponseReceived(): Promise<void> {
    await this.expectVisible(this.locators.chat.botResponse);
  }

  /**
   * Compares the chat's answer with the case's SQL oracle (docs/oracle/*.json): the answer has data,
   * the chat's SQL reproduces its result, the $ amounts in the text are real, and the oracle figures
   * match. Every side of the comparison is written to the report's annotations.
   */
  async expectAnswerMatchesDatabaseOracle(caseId: string): Promise<void> {
    const question = submittedQuestions.get(this.page);
    if (question === undefined) {
      throw new Error('No submitted question recorded for this page; the question was never submitted.');
    }
    await verifyChatAnswerAgainstOracle(this.page, caseId, question);
  }

  /**
   * Before hook. Waits until the previous scenario finished at least SCENARIO_GAP_MS ago and the app's
   * /api/health answers below 500, extending the test timeout by every wait so it never eats into the
   * scenario's own budget. A health wait is an environment observation, so it goes into the report.
   */
  async waitUntilReadyForNextScenario(testInfo: TestInfo): Promise<void> {
    let waitedMs = 0;
    const wait = async (ms: number): Promise<void> => {
      testInfo.setTimeout(testInfo.timeout + ms);
      await sleep(ms);
      waitedMs += ms;
    };

    let lastFinished = 0;
    try {
      lastFinished = Number(fs.readFileSync(PACING_FILE, 'utf8')) || 0;
    } catch {
      // No earlier scenario recorded.
    }
    const gapLeft = lastFinished + SCENARIO_GAP_MS - Date.now();
    if (gapLeft > 0) {
      logger.execution.testStart(`Pacing: waiting ${Math.round(gapLeft / 1000)}s after the previous scenario before opening the app`);
      await wait(gapLeft);
    }

    const started = Date.now();
    const downs: string[] = [];
    for (;;) {
      testInfo.setTimeout(testInfo.timeout + HEALTH_REQUEST_TIMEOUT_MS);
      let status: number | string;
      try {
        status = (await this.page.request.get('/api/health', { timeout: HEALTH_REQUEST_TIMEOUT_MS, failOnStatusCode: false })).status();
      } catch (error) {
        status = (error as Error).message.split('\n')[0].slice(0, 80);
      }
      if (typeof status === 'number' && status < 500) {
        break;
      }
      downs.push(`${utcNow()} ${status}`);
      if (Date.now() - started >= HEALTH_MAX_WAIT_MS) {
        logger.warning.slowElement(`App health check still failing after ${Math.round(HEALTH_MAX_WAIT_MS / 60000)} min; starting the scenario anyway`);
        break;
      }
      logger.warning.slowElement(`App health check returned ${status}; waiting ${HEALTH_POLL_MS / 1000}s before the scenario starts`);
      await wait(HEALTH_POLL_MS);
    }
    if (downs.length) {
      testInfo.annotations.push({
        type: 'Environment wait before the scenario',
        description: escapeHtml(`/api/health failed ${downs.length} time(s) before this scenario started (${downs.slice(0, 3).join('; ')}${downs.length > 3 ? '; ...' : ''}). Waited ${Math.round((Date.now() - started) / 1000)}s in total.`),
      });
    }
    if (waitedMs > 0) {
      // openAppSignedIn and waitForResponseToFinish raise the timeout to at least TEST_TIMEOUT_MS; keep the waits on top.
      testInfo.setTimeout(Math.max(testInfo.timeout, TEST_TIMEOUT_MS + waitedMs));
    }
  }

  /** After hook, for every scenario: records the finish time that the pacing gap is measured from. */
  static markScenarioFinished(): void {
    try {
      fs.writeFileSync(PACING_FILE, String(Date.now()));
    } catch {
      // Pacing is best effort.
    }
  }

  /**
   * After hook, for a failed run only: gives the chat's answer a thumbs down ("Bad response") and presses
   * "Ok" in the "Tell us what went wrong" dialog, which saves the dislike without a comment. The outcome,
   * with the server's reply, is written to the report together with a screenshot of the rated answer.
   * Never throws, so it cannot change the run's own result.
   */
  async giveThumbsDownForFailedRun(testInfo: TestInfo): Promise<void> {
    const record = (description: string): void => {
      testInfo.annotations.push({ type: THUMBS_DOWN_ANNOTATION, description: escapeHtml(description) });
      logger.ui.click(`${THUMBS_DOWN_ANNOTATION}: ${description}`);
    };
    try {
      if (!(await this.isVisible(this.locators.chat.badResponseButton, { timeoutMs: 2000 }))) {
        record(`Not clicked: there is no finished chat answer on the page (the run failed before an answer with feedback buttons appeared). Checked at ${utcNow()}.`);
        return;
      }
      const button = await this.findElement(this.locators.chat.badResponseButton, { timeoutMs: 2000 });
      if ((await button.getAttribute('aria-pressed')) === 'true') {
        record(`Already marked as a bad response when checked at ${utcNow()}; not clicked again, because a second click would undo it.`);
        return;
      }
      const clickedAt = utcNow();
      await this.click(this.locators.chat.badResponseButton, { timeoutMs: 2000 });
      await this.waitForElement(this.locators.chat.dislikeDialog, 'visible', 5000);
      const saved = this.page.waitForResponse(
        (response) => /\/api\/messages\/\d+\/dislike(\?|$)/.test(response.url()) && response.request().method() === 'POST',
        { timeout: 15000 },
      );
      await this.click(this.locators.chat.dislikeOkButton, { timeoutMs: 3000 });
      const response = await saved;
      const reply = (await response.text().catch(() => '')).slice(0, 200);
      const messageId = response.url().match(/messages\/(\d+)\//)?.[1] ?? '?';
      let pressed = 'pressed';
      try {
        await expect(button).toHaveAttribute('aria-pressed', 'true', { timeout: 5000 });
      } catch {
        pressed = 'NOT shown as pressed';
      }
      record(`Clicked at ${clickedAt}, then "Ok" in the "Tell us what went wrong" dialog (no comment sent). Saved: POST /api/messages/${messageId}/dislike returned ${response.status()} ${reply}. The button is now ${pressed}.`);
      try {
        const shot = testInfo.outputPath('thumbs-down.png');
        await (await this.findElement(this.locators.chat.botResponse, { timeoutMs: 2000 })).screenshot({ path: shot });
        await testInfo.attach('Thumbs down (Bad response) on the answer', { path: shot, contentType: 'image/png' });
      } catch {
        // The screenshot is a nice-to-have; the annotation above is the record.
      }
    } catch (error) {
      record(`Could not complete the thumbs down at ${utcNow()}: ${(error as Error).message.split('\n')[0].slice(0, 200)}`);
    }
  }
}

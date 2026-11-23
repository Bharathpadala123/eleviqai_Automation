import { createBdd } from 'playwright-bdd';
import { test } from '../../fixtures/testFixture';
import { ChatPage } from '../../pages/chat/ChatPage';

const { Given, When, Then, Before, After } = createBdd(test);

// Pacing and health gate before every scenario, so the live app is not hit with back-to-back questions
// (SCENARIO_GAP_MS, default 20s) and a scenario does not start while /api/health is failing.
Before(async ({ page, $testInfo }) => {
  await new ChatPage(page).waitUntilReadyForNextScenario($testInfo);
});

// A failed run gives the chat's answer a thumbs down ("Bad response" + "Ok", no comment) and records it in
// the report. Every scenario records its finish time for the pacing gap.
After(async ({ page, $testInfo }) => {
  if ($testInfo.status === 'failed' || $testInfo.status === 'timedOut') {
    await new ChatPage(page).giveThumbsDownForFailedRun($testInfo);
  }
  ChatPage.markScenarioFinished();
});

Given('the user is signed in to EleviqAI with QuickBooks data connected and synced', async ({ page }) => {
  await new ChatPage(page).openAppSignedIn();
});

When('the user starts a new chat', async ({ page }) => {
  await new ChatPage(page).startNewChat();
});

Then('the new chat screen is displayed with the question box', async ({ page }) => {
  await new ChatPage(page).expectNewChatScreen();
});

When('the user types the question {string}', async ({ page }, question: string) => {
  await new ChatPage(page).typeQuestion(question);
});

Then('the question box shows {string}', async ({ page }, question: string) => {
  await new ChatPage(page).expectQuestionBoxShows(question);
});

When('the user submits the question', async ({ page }) => {
  await new ChatPage(page).submitQuestion();
});

Then('the question appears in the conversation', async ({ page }) => {
  await new ChatPage(page).expectQuestionInConversation();
});

When('the user waits for the response to finish', async ({ page }) => {
  await new ChatPage(page).waitForResponseToFinish();
});

// One step for every category's Expected Intent from the workbook. TBD: the workbook gives no observable
// criterion for an intent, so this only asserts that a finished response is shown. The group is
// non-capturing, so the step function takes no argument (playwright-bdd checks the arity).
Then(
  /^the response is answered as an? (?:revenue analysis|profitability analysis|expense analysis|cash flow analysis|budget versus actual analysis|multi-step financial diagnosis)$/,
  async ({ page }) => {
    await new ChatPage(page).expectResponseReceived();
  },
);

Then('the answer matches the database oracle for {string}', async ({ page }, caseId: string) => {
  await new ChatPage(page).expectAnswerMatchesDatabaseOracle(caseId);
});

// AMB cases (ambiguous questions).
Then('the app asks for the missing details instead of guessing for {string}', async ({ page }, caseId: string) => {
  await new ChatPage(page).expectAppAsksForClarification(caseId);
});

// UNS cases (out-of-scope requests).
Then('the app declines the out-of-scope request for {string}', async ({ page }, caseId: string) => {
  await new ChatPage(page).expectAppDeclinesOutOfScope(caseId);
});

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

Then('the response is answered as a revenue analysis', async ({ page }) => {
  await new ChatPage(page).expectResponseReceived();
});

Then('the answer matches the database oracle for {string}', async ({ page }, caseId: string) => {
  await new ChatPage(page).expectAnswerMatchesDatabaseOracle(caseId);
});

// Opens the app before any question is asked, so a run stops early with one clear message when Cloudflare refuses
// GitHub's machine, the sign-in has expired or the app is down. Read-only; asks nothing in the chat.
//   node ci/check-app.mjs         with the saved sign-in: the app must open signed in
//   node ci/check-app.mjs reach   without a sign-in: can this machine reach the app at all?
// It never tries to get past a Cloudflare check: that is reported and the run stops.
import fs from 'node:fs';
import { chromium, devices } from '@playwright/test';
import { annotate, loadSecrets, redact } from './redact.mjs';

const reachOnly = process.argv[2] === 'reach';
const TITLE = reachOnly ? 'Can GitHub reach the app' : 'App check';
const BASE = process.env.BASE_URL || 'https://app.eleviqai.com/';
const STATE = process.env.STORAGE_STATE || '.auth/app-session.json';
const GIVE_UP_AFTER_MS = 15 * 60_000;
const RETRY_AFTER_MS = 60_000;
const secrets = loadSecrets();
const firstLine = (error) => redact(String(error?.message ?? error).split('\n')[0], secrets).slice(0, 160);
const sleep = (ms) => new Promise((resolve) => setTimeout(resolve, ms));

/** GET from inside the page. Only the status and the Cloudflare header are looked at, never the body. */
const ask = (page, path) =>
  page.evaluate(async (url) => {
    const r = await fetch(url, { headers: { accept: 'application/json' } });
    return { status: r.status, mitigated: r.headers.get('cf-mitigated') };
  }, path);

/** One look at the app. Returns { kind: 'ok' | 'cloudflare' | 'signed-out' | 'down', detail }. */
async function look(browser) {
  const context = await browser.newContext({
    ...devices['Desktop Chrome'],
    viewport: { width: 1440, height: 900 },
    storageState: reachOnly ? undefined : STATE,
  });
  try {
    const page = await context.newPage();
    const started = Date.now();
    const seconds = () => Math.round((Date.now() - started) / 1000);
    let response;
    try {
      response = await page.goto(BASE, { timeout: 60_000, waitUntil: 'domcontentloaded' });
    } catch (error) {
      return { kind: 'down', detail: `the page did not open (${firstLine(error)})` };
    }
    const headers = response?.headers() ?? {};
    const title = await page.title().catch(() => '');
    const blocked =
      headers['cf-mitigated'] === 'challenge' || /just a moment|attention required|access denied|been blocked|verify you are human/i.test(title);
    if (blocked) return { kind: 'cloudflare', detail: `HTTP ${response?.status()}, page title "${title.slice(0, 60)}"` };
    if ((response?.status() ?? 0) >= 500) return { kind: 'down', detail: `the page answered HTTP ${response.status()}` };

    let answer;
    try {
      answer = await ask(page, reachOnly ? '/api/health' : '/api/me');
    } catch (error) {
      return { kind: 'down', detail: `the app's API did not answer (${firstLine(error)})` };
    }
    if (answer.mitigated === 'challenge') return { kind: 'cloudflare', detail: `the app's API answered HTTP ${answer.status} with a Cloudflare check` };
    if (reachOnly) {
      if (answer.status >= 500) return { kind: 'down', detail: `the app's health check answered HTTP ${answer.status}` };
      return { kind: 'ok', detail: `answers GitHub's machine: page HTTP ${response?.status()}, health check HTTP ${answer.status}, ${seconds()} s` };
    }
    if (answer.status === 401) return { kind: 'signed-out', detail: 'the app does not accept the saved sign-in (HTTP 401)' };
    if (answer.status >= 400) return { kind: 'down', detail: `the sign-in check answered HTTP ${answer.status}` };

    try {
      await page.getByRole('button', { name: 'Overview' }).first().waitFor({ timeout: 60_000 });
    } catch {
      const onSignIn = (await page.locator('input[type="password"]').count()) > 0;
      return onSignIn
        ? { kind: 'signed-out', detail: 'the app shows its sign-in page' }
        : { kind: 'down', detail: 'the app did not show its Overview button within 60 s' };
    }
    return { kind: 'ok', detail: `opened and signed in after ${seconds()} s` };
  } finally {
    await context.close().catch(() => undefined);
  }
}

if (!reachOnly && !fs.existsSync(STATE)) {
  annotate('error', TITLE, 'There is no saved sign-in to check the app with.');
  process.exit(1);
}
const browser = await chromium.launch();
let result;
const begun = Date.now();
for (let attempt = 1; ; attempt++) {
  result = await look(browser);
  console.log(`${TITLE} ${attempt}: ${result.kind} - ${result.detail}`);
  // Only an app that is down is worth another look. A Cloudflare refusal or an expired sign-in does not go away.
  if (result.kind !== 'down' || Date.now() - begun + RETRY_AFTER_MS > GIVE_UP_AFTER_MS) break;
  await sleep(RETRY_AFTER_MS);
}
await browser.close();

if (result.kind === 'ok') {
  annotate('notice', TITLE, `The app ${result.detail}.`);
} else if (result.kind === 'cloudflare') {
  annotate('error', TITLE, `Cloudflare does not let GitHub's machine into the app (${result.detail}). The app team has to allow it; the pipeline does not try to get around the check.`);
  process.exit(1);
} else if (result.kind === 'signed-out') {
  annotate('error', TITLE, `The saved sign-in does not work: ${result.detail}. Sign in again by hand (README, "Sign in once") and update the repository secret APP_SESSION_JSON.`);
  process.exit(1);
} else {
  annotate('error', TITLE, `The app was not usable for ${Math.round((Date.now() - begun) / 60_000)} min: ${result.detail}.`);
  process.exit(1);
}

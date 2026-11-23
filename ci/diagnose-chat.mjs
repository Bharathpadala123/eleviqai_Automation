// Asks one question and lists what the app did with it (requests, web sockets, console errors, error messages on the
// page), to find out why a question asked from this machine gets no answer. It looks only: no answer text, no figures
// and no sign-in values are printed, and a Cloudflare check is reported, never passed.
import { chromium, devices } from '@playwright/test';
import { annotate, loadSecrets, redact } from './redact.mjs';

const BASE = process.env.BASE_URL || 'https://app.eleviqai.com/';
const STATE = process.env.STORAGE_STATE || '.auth/app-session.json';
const QUESTION = 'Break down product revenue by month for the previous fiscal year.'; // REV-073
const ANSWER_WAIT_MS = 75_000;
const secrets = loadSecrets();
const clean = (text, length = 160) => redact(String(text), secrets).replace(/\s+/g, ' ').slice(0, length);
const appHost = new URL(BASE).host;

/** Path without ids and without the query string; other sites show their host only. */
function place(url) {
  const u = new URL(url);
  if (u.protocol === 'data:' || u.protocol === 'blob:') return u.protocol;
  if (u.host !== appHost) return `${u.host}/...`;
  return u.pathname
    .split('/')
    .map((part) => (part.length >= 16 && /\d/.test(part) ? '<id>' : /^\d+$/.test(part) ? '<n>' : part))
    .join('/');
}

const started = Date.now();
const at = () => `${((Date.now() - started) / 1000).toFixed(1)} s`;
const lines = [];
const say = (line) => {
  lines.push(line);
  console.log(line);
};

const browser = await chromium.launch();
const context = await browser.newContext({ ...devices['Desktop Chrome'], viewport: { width: 1440, height: 900 }, storageState: STATE });
const page = await context.newPage();

let watching = false;
const waiting = new Map();
const isStatic = (request) => ['script', 'stylesheet', 'image', 'font'].includes(request.resourceType());
page.on('request', (request) => {
  if (!watching || isStatic(request)) return;
  waiting.set(request, Date.now());
});
page.on('response', async (response) => {
  const request = response.request();
  if (!watching || isStatic(request)) return;
  const headers = response.headers();
  const ms = waiting.has(request) ? `${Date.now() - waiting.get(request)} ms` : '';
  let line = `${at()} ${request.method()} ${place(request.url())} -> HTTP ${response.status()} ${ms} ${(headers['content-type'] ?? '').split(';')[0]}`;
  if (headers['cf-mitigated']) line += ` cf-mitigated=${headers['cf-mitigated']}`;
  if (response.status() >= 400) {
    line += ` server=${headers.server ?? '?'}`;
    const body = await response.text().catch(() => '');
    const title = /<title>([^<]*)<\/title>/i.exec(body)?.[1];
    line += title ? ` page title "${clean(title, 80)}"` : ` body "${clean(body)}"`;
  }
  say(line);
});
page.on('requestfinished', (request) => {
  waiting.delete(request);
});
page.on('requestfailed', (request) => {
  if (!watching || isStatic(request)) return;
  say(`${at()} ${request.method()} ${place(request.url())} -> failed: ${clean(request.failure()?.errorText ?? '?', 80)}`);
  waiting.delete(request);
});
page.on('websocket', (socket) => {
  say(`${at()} web socket ${place(socket.url().replace(/^ws/, 'http'))} opened`);
  socket.on('socketerror', (error) => say(`${at()} web socket error: ${clean(error, 120)}`));
  socket.on('close', () => say(`${at()} web socket closed`));
});
page.on('console', (message) => {
  if (watching && ['error', 'warning'].includes(message.type())) say(`${at()} console ${message.type()}: ${clean(message.text(), 200)}`);
});
page.on('pageerror', (error) => say(`${at()} page error: ${clean(error.message, 200)}`));

let outcome = 'not asked';
try {
  await page.goto(BASE, { timeout: 60_000, waitUntil: 'load' });
  await page.getByRole('button', { name: 'Overview' }).first().waitFor({ timeout: 60_000 });
  await page.getByRole('button', { name: /new (chat|conversation)/i }).first().click();
  await page.waitForLoadState('networkidle', { timeout: 8_000 }).catch(() => undefined);
  const box = page.getByRole('textbox', { name: /Ask about your data/ }).first();
  await box.fill(QUESTION);
  await page.waitForTimeout(2_000);
  if ((await box.inputValue()) !== QUESTION) await box.fill(QUESTION);
  watching = true;
  say(`${at()} --- question sent`);
  await page.getByRole('button', { name: 'Send message' }).first().click();
  const feedback = page.getByRole('button', { name: 'Good response' }).first();
  outcome = await feedback
    .waitFor({ timeout: ANSWER_WAIT_MS })
    .then(() => `answered after ${at()}`)
    .catch(() => `no answer within ${ANSWER_WAIT_MS / 1000} s`);
} catch (error) {
  outcome = `stopped: ${clean(error.message.split('\n')[0])}`;
}
for (const [request, since] of waiting) {
  say(`${at()} ${request.method()} ${place(request.url())} -> still open after ${Math.round((Date.now() - since) / 1000)} s`);
}
// Only messages the app marks as an alert or status, never the conversation itself.
const alerts = await page
  .locator('[role="alert"], [role="status"], [class*="toast" i], [class*="error" i], [class*="banner" i]')
  .allInnerTexts()
  .catch(() => []);
for (const text of [...new Set(alerts.map((t) => clean(t, 160)).filter(Boolean))].slice(0, 5)) say(`on the page: "${text}"`);
say(`address: ${place(page.url())}; bot rows ${await page.locator('.messages .bot-row').count().catch(() => '?')}, user rows ${await page.locator('.messages .user-row').count().catch(() => '?')}`);
await browser.close();
annotate('notice', 'One question, request by request', `${outcome}\n${lines.join('\n')}`.slice(0, 3800));

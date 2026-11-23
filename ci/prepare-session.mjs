// Turns the APP_SESSION_JSON secret (the content of .auth/app-session.json) into the sign-in file the tests use.
// Never prints a value from it: each one is registered with ::add-mask::, so GitHub shows *** if it ever reaches a log.
import fs from 'node:fs';
import path from 'node:path';
import { annotate, forCommand, SECRETS_FILE } from './redact.mjs';

const TITLE = 'Sign-in secret';
const HOW_TO_FIX =
  'Sign in again by hand (README, "Sign in once"), then paste the whole content of .auth/app-session.json into the repository secret APP_SESSION_JSON (Settings > Secrets and variables > Actions).';

function stop(message) {
  annotate('error', TITLE, `${message} ${HOW_TO_FIX}`);
  process.exit(1);
}

/** The secret as JSON. Stops with facts about what is wrong with it, without showing any of its content. */
function parse(text) {
  try {
    return JSON.parse(text);
  } catch {
    // A copy taken from a terminal window can have line breaks inside long values; JSON needs no line breaks at all.
  }
  try {
    return JSON.parse(text.split(/\r?\n/).join(''));
  } catch {
    // Fall through to the explanation.
  }
  const yesNo = (value) => (value ? 'yes' : 'no');
  const facts = [`${text.length} characters in ${text.split('\n').length} line(s)`];
  if (/Get-Content|Set-Clipboard/i.test(text)) facts.push('it holds the copy command instead of the file content');
  else if (/app-session\.json"?$/i.test(text)) facts.push('it holds the path of the file instead of its content');
  facts.push(`starts with { : ${yesNo(text.startsWith('{'))}`);
  facts.push(`ends with } : ${yesNo(text.endsWith('}'))}`);
  facts.push(`has the cookie list: ${yesNo(text.includes('"cookies"'))}`);
  facts.push(`has the sign-in cookie: ${yesNo(text.includes('elv_session'))}`);
  facts.push(`has the local storage part: ${yesNo(text.includes('"origins"'))}`);
  return stop(`The repository secret APP_SESSION_JSON is not the complete content of the file (${facts.join('; ')}; a complete file has about 2,700 characters).`);
}

// trim() also removes a byte order mark, which some editors add when a file is copied.
const raw = (process.env.APP_SESSION_JSON ?? '').trim();
if (!raw) stop('The repository secret APP_SESSION_JSON is empty or missing.');
const state = parse(raw);
if (!state || !Array.isArray(state.cookies)) stop('The repository secret APP_SESSION_JSON holds no cookies.');

const host = new URL(process.env.BASE_URL || 'https://app.eleviqai.com/').hostname;

// Cloudflare's own cookies (the bot check passed on the PC where the user signed in) are left out: GitHub's machines
// must be let in on their own merit, and the check is not to be worked around.
const isCloudflare = (name) => /^(cf_|__cf)/i.test(name);
const belongsToApp = (domain) => host === domain.replace(/^\./, '') || host.endsWith(`.${domain.replace(/^\./, '')}`);
const cookies = state.cookies.filter((c) => belongsToApp(String(c.domain ?? '')) && !isCloudflare(String(c.name ?? '')));
const origins = (state.origins ?? []).filter((o) => new URL(o.origin).hostname === host);

const session = cookies.find((c) => c.name === 'elv_session');
if (!session?.value) stop('The repository secret APP_SESSION_JSON has no elv_session cookie for the app.');
const daysLeft = session.expires > 0 ? (session.expires * 1000 - Date.now()) / 86_400_000 : null;
if (daysLeft !== null && daysLeft <= 0.5) stop(`The saved sign-in has expired or is about to (${new Date(session.expires * 1000).toISOString().slice(0, 10)}).`);

// Everything that must not appear in public output: cookie values, the parts of a token, and the account's email,
// user name, names and phone number, which the app keeps in local storage.
const hide = new Set();
const add = (value) => {
  if (typeof value === 'string' && value.trim().length >= 5) hide.add(value.trim());
};
for (const c of state.cookies) {
  add(c.value);
  if (String(c.value).split('.').length === 3) String(c.value).split('.').forEach(add);
}
for (const o of state.origins ?? []) {
  for (const item of o.localStorage ?? []) {
    if (/remember|token|secret/i.test(item.name)) add(String(item.value).replace(/^"|"$/g, ''));
    if (item.name === 'user') {
      try {
        const collect = (v, key = '') => {
          if (v && typeof v === 'object') Object.entries(v).forEach(([k, x]) => collect(x, k));
          else if (typeof v === 'string' && /mail|name|phone|token|secret/i.test(key)) add(v);
        };
        collect(JSON.parse(item.value));
      } catch {
        add(item.value);
      }
    }
  }
}
for (const value of hide) console.log(`::add-mask::${forCommand(value)}`);

fs.mkdirSync(path.dirname(SECRETS_FILE), { recursive: true });
fs.writeFileSync(SECRETS_FILE, JSON.stringify([...hide]), { mode: 0o600 });
const target = path.resolve(process.env.STORAGE_STATE || '.auth/app-session.json');
fs.mkdirSync(path.dirname(target), { recursive: true });
fs.writeFileSync(target, JSON.stringify({ cookies, origins }), { mode: 0o600 });

console.log(`Saved sign-in prepared: ${cookies.length} app cookies, ${state.cookies.length - cookies.length} other cookies left out, ${hide.size} values hidden from the logs.`);
if (daysLeft !== null) {
  const date = new Date(session.expires * 1000).toISOString().slice(0, 10);
  console.log(`The saved sign-in lasts until ${date} (${Math.floor(daysLeft)} days).`);
  if (daysLeft < 3) annotate('warning', TITLE, `The saved sign-in expires on ${date}. ${HOW_TO_FIX}`);
}

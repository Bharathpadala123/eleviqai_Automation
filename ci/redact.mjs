// Shared by the GitHub Actions scripts in this folder: hides sign-in values and personal details in text that will
// be public (job logs and the rows files).
import fs from 'node:fs';
import path from 'node:path';

// Exact values to hide. prepare-session.mjs writes them; the file stays on the runner and is never uploaded.
export const SECRETS_FILE = path.join(process.env.RUNNER_TEMP ?? '.auth', 'values-to-hide.json');

/** The exact values to hide, longest first, so a value that contains another one is hidden whole. */
export function loadSecrets() {
  try {
    const list = JSON.parse(fs.readFileSync(SECRETS_FILE, 'utf8'));
    return list.filter((v) => typeof v === 'string' && v.length >= 5).sort((a, b) => b.length - a.length);
  } catch {
    return [];
  }
}

const PATTERNS = [
  [/\b(elv_session|elv_csrf|cf_clearance|__cf_bm)=[^;\s"'\\]+/gi, '$1=[hidden]'],
  [/((?:^|[\s"'{,])(?:set-cookie|cookie|authorization|x-csrf-token|x-xsrf-token)"?\s*[:=]\s*"?)[^"\r\n]+/gi, '$1[hidden]'],
  [/\beyJ[A-Za-z0-9_-]{8,}\.[A-Za-z0-9_-]{8,}(?:\.[A-Za-z0-9_-]+)?/g, '[token hidden]'],
  [/[A-Za-z0-9._%+-]+@[A-Za-z0-9-]+(?:\.[A-Za-z0-9-]+)*\.[A-Za-z]{2,}\b/g, '[email hidden]'],
];

/** The text with every secret value, cookie/authorization header, JWT and email address replaced. */
export function redact(text, secrets = loadSecrets()) {
  let out = text;
  for (const value of secrets) {
    out = out.split(value).join('[hidden]');
    const encoded = encodeURIComponent(value);
    if (encoded !== value) out = out.split(encoded).join('[hidden]');
  }
  for (const [pattern, replacement] of PATTERNS) out = out.replace(pattern, replacement);
  return out;
}

/** redact() on every string inside a JSON value. Returns a copy. */
export function redactDeep(value, secrets = loadSecrets()) {
  if (typeof value === 'string') return redact(value, secrets);
  if (Array.isArray(value)) return value.map((v) => redactDeep(v, secrets));
  if (value && typeof value === 'object') return Object.fromEntries(Object.entries(value).map(([k, v]) => [k, redactDeep(v, secrets)]));
  return value;
}

/** Escapes text for a GitHub workflow command such as ::notice:: (newlines and % signs). */
export const forCommand = (text) => String(text).replace(/%/g, '%25').replace(/\r/g, '%0D').replace(/\n/g, '%0A');

/** Prints a message that GitHub shows on the run's page. level: notice, warning or error. */
export function annotate(level, title, message) {
  console.log(`::${level} title=${forCommand(title).replace(/:/g, '%3A').replace(/,/g, '%2C')}::${forCommand(message)}`);
}

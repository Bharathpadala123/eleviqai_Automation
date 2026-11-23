// Filter for the test log on GitHub: reads stdin, hides sign-in values and email addresses, writes stdout.
import readline from 'node:readline';
import { loadSecrets, redact } from './redact.mjs';

const secrets = loadSecrets();
for await (const line of readline.createInterface({ input: process.stdin, crlfDelay: Infinity })) {
  // Text from the app must not be read as a GitHub workflow command, which starts a line with "::" or holds "##[".
  const safe = redact(line, secrets).replace(/^(\s*)::/, '$1: :').replace(/##\[/g, '# #[');
  process.stdout.write(`${safe}\n`);
}

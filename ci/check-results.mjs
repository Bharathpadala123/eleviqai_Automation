// After a category's questions: shows the counts on the run's page and saves the rows, without sign-in values or email
// addresses, for the Excel job. Wrong answers do not fail the job (they are results, and the Excel lists them); a run
// that got no answer at all does.
import fs from 'node:fs';
import path from 'node:path';
import { annotate, redactDeep } from './redact.mjs';

const category = process.env.CATEGORY ?? 'ALL';
const trial = process.env.MODE === 'trial';
const source = path.join('test-results', 'final-report', 'rows.json');

let data;
try {
  data = redactDeep(JSON.parse(fs.readFileSync(source, 'utf8')));
} catch {
  annotate('error', `${category}: no results`, 'The questions stopped before the first result was saved. See the "Ask the questions" step.');
  process.exit(1);
}

const outFolder = path.join('test-results', 'ci');
fs.mkdirSync(outFolder, { recursive: true });
fs.writeFileSync(path.join(outFolder, `rows-${category}.json`), JSON.stringify(data));

const rows = data.rows;
const count = (test) => rows.filter(test).length;
const failed = (r) => r.status === 'Failed' || r.status === 'Timed out';
const passed = count((r) => r.status === 'Passed');
const wrong = count((r) => failed(r) && r.failureType === 'Check failed');
const broken = count((r) => failed(r) && r.failureType !== 'Check failed');
const finished = passed + wrong + broken;
const answered = count((r) => r.status === 'Passed' || r.verdict);
const minutes = Math.round((new Date(data.meta.endedAt) - new Date(data.meta.startedAt)) / 60_000);

let text =
  `${rows.length} questions: ${passed} passed, ${wrong} failed the answer checks, ${broken} failed before the answer could be checked, ` +
  `${rows.length - finished} not run. ${minutes} min.`;
if (trial) {
  for (const r of rows) text += `\n${r.caseId}: ${r.status}${r.verdict ? `, ${r.verdict}` : ''}${r.durationS ? `, ${r.durationS} s` : ''}${r.failedStep ? `, failed at "${r.failedStep}"` : ''}`;
}
annotate('notice', `${category} results`, text);

if (answered === 0) {
  const first = rows.find(failed);
  const why = first ? ` First problem: ${first.caseId}, "${first.failedStep}": ${first.why.split('\n')[0].slice(0, 200)}` : '';
  annotate('error', `${category}: no answers`, `None of the ${rows.length} questions got an answer that could be checked.${why}`);
  process.exit(1);
}
if (rows.length > finished) {
  annotate('warning', `${category}: not all asked`, `${rows.length - finished} of ${rows.length} questions were not asked, because the time limit was reached or the run was stopped. The Excel lists them as Not run.`);
}
if (broken > finished * 0.2) {
  annotate('warning', `${category}: app problems`, `${broken} of ${finished} questions failed before their answer could be checked (slow or unavailable app).`);
}

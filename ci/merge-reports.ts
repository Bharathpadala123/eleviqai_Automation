import fs from 'fs';
import path from 'path';
import { buildSheets, CATEGORIES, CATEGORY_ORDER, localStamp, sortRows, type ReportRow, type RunMeta, type Status } from '../utils/finalRunReport';
import { writeXlsx } from '../utils/xlsxWriter';

/**
 * GitHub Actions, last job: joins the rows of the category jobs (test-results/ci-rows, written by ci/check-results.mjs) into
 * one Excel with the same sheets as a local run, and writes the run page's summary. A question whose job delivered
 * nothing is listed as "Not run", so the workbook always covers every question of the run.
 */

const NO_RESULT = 'No result for this question: its category job failed, was cancelled or ran out of time (see the run page on GitHub).';

interface RowsFile {
  meta: RunMeta;
  rows: ReportRow[];
}

function filesUnder(folder: string, extension: string): string[] {
  if (!fs.existsSync(folder)) return [];
  return fs.readdirSync(folder, { withFileTypes: true }).flatMap((entry) => {
    const full = path.join(folder, entry.name);
    if (entry.isDirectory()) return filesUnder(full, extension);
    return entry.name.endsWith(extension) ? [full] : [];
  });
}

/** Every chat question in the feature files, as "not run" rows. */
function allQuestions(): ReportRow[] {
  const rows: ReportRow[] = [];
  for (const file of filesUnder('features', '.feature')) {
    let tags: string[] = [];
    for (const raw of fs.readFileSync(file, 'utf8').split(/\r?\n/)) {
      const line = raw.trim();
      if (line === '' || line.startsWith('#')) continue;
      if (line.startsWith('@')) {
        tags.push(...line.split(/\s+/));
        continue;
      }
      const scenario = line.match(/^Scenario(?: Outline)?:\s*(.*)$/);
      const id = tags.map((t) => t.match(/^@([A-Z]{3})-(\d{3})$/)).find((m) => m);
      if (scenario && id && tags.includes('@regression')) {
        rows.push({
          caseId: `${id[1]}-${id[2]}`,
          prefix: id[1],
          num: Number(id[2]),
          question: scenario[1].replace(/^Ask the chat:\s*/, ''),
          status: 'Not run',
          verdict: '',
          checks: '',
          failedChecks: [],
          failureType: '',
          failedStep: '',
          why: '',
          answer: '',
          sql: '',
          chatResult: '',
          oracleResult: '',
          thumbs: '',
          thumbsLog: [],
          durationS: null,
          started: '',
          attempts: 0,
          envNotes: '',
          featureFile: `.features-gen/${file.replace(/\\/g, '/')}.spec.js`,
          notRunReason: NO_RESULT,
        });
      }
      tags = [];
    }
  }
  return rows;
}

const trial = process.env.MODE === 'trial';
const trialIds = (process.env.TRIAL_QUESTIONS ?? '').split(/[\s,]+/).filter(Boolean);
const parts = filesUnder(path.join('test-results', 'ci-rows'), '.json').map((file) => JSON.parse(fs.readFileSync(file, 'utf8')) as RowsFile);
const results = new Map(parts.flatMap((p) => p.rows).map((r) => [r.caseId, r]));
const expected = allQuestions().filter((q) => !trial || trialIds.includes(q.caseId));
const known = new Set(expected.map((q) => q.caseId));
const rows = sortRows([...expected.map((q) => results.get(q.caseId) ?? q), ...[...results.values()].filter((r) => !known.has(r.caseId))]);

const severity = ['passed', 'failed', 'timedout', 'interrupted'];
const missing = expected.filter((q) => !results.has(q.caseId)).length;
const status = parts.reduce(
  (worst, p) => (severity.indexOf(p.meta.status ?? 'interrupted') > severity.indexOf(worst) ? (p.meta.status ?? 'interrupted') : worst),
  missing > 0 ? 'interrupted' : 'passed',
);
const times = (key: 'startedAt' | 'endedAt'): number[] => parts.map((p) => new Date(p.meta[key]).getTime());
const startedAt = new Date(parts.length ? Math.min(...times('startedAt')) : Date.now());
const endedAt = new Date(parts.length ? Math.max(...times('endedAt')) : Date.now());

const runNumber = process.env.GITHUB_RUN_NUMBER ?? '';
const runUrl = process.env.GITHUB_RUN_ID ? `${process.env.GITHUB_SERVER_URL}/${process.env.GITHUB_REPOSITORY}/actions/runs/${process.env.GITHUB_RUN_ID}` : '';
const meta: RunMeta = {
  status,
  startedAt: startedAt.toISOString(),
  endedAt: endedAt.toISOString(),
  baseURL: parts[0]?.meta.baseURL ?? process.env.BASE_URL ?? '',
  workers: 1,
  retries: 0,
  finished: rows.filter((r) => r.status !== 'Not run').length,
  note: `GitHub Actions run ${runNumber}${trial ? ` (trial of ${rows.length} questions)` : ''}: ${parts.length} of ${new Set(expected.map((q) => q.prefix)).size} category jobs delivered results, ${process.env.PARALLEL || '2'} jobs at a time, one question at a time in each. ${runUrl}`.trim(),
  evidenceNote:
    'Sheets: All Questions (one row per question), Failed, Thumbs Down Log, Not Run. Screenshots, videos and the HTML reports are not made on GitHub, because the repository is public.',
};

const folder = 'test-results/final-report';
const name = `EleviqAI_Final_Report_${localStamp(startedAt)}${trial ? '_trial' : ''}.xlsx`;
fs.mkdirSync(folder, { recursive: true });
writeXlsx(path.join(folder, name), buildSheets(rows, meta));

const count = (list: ReportRow[], ...wanted: Status[]): number => list.filter((r) => wanted.includes(r.status)).length;
const wrong = (list: ReportRow[]): number => list.filter((r) => r.status === 'Failed' && r.failureType === 'Check failed').length;
const line = (label: string, list: ReportRow[]): string => {
  const passed = count(list, 'Passed');
  const finished = count(list, 'Passed', 'Failed', 'Timed out');
  const rate = finished ? `${((passed / finished) * 100).toFixed(1)}%` : '-';
  return `| ${label} | ${list.length} | ${passed} | ${wrong(list)} | ${finished - passed - wrong(list)} | ${list.length - finished} | ${rate} |`;
};
const total = `${rows.length} questions: ${count(rows, 'Passed')} passed, ${wrong(rows)} failed the answer checks, ${count(rows, 'Failed', 'Timed out') - wrong(rows)} failed before the answer could be checked, ${count(rows, 'Not run', 'Skipped', 'Interrupted')} not run.`;
const minutes = Math.round((endedAt.getTime() - startedAt.getTime()) / 60_000);
const summary = [
  `## EleviqAI chat regression${trial ? ' (trial)' : ''}`,
  '',
  `${total} It took ${Math.floor(minutes / 60)} h ${minutes % 60} min.`,
  '',
  '| Category | Questions | Passed | Failed the answer checks | Failed before the check | Not run | Pass rate |',
  '|---|---:|---:|---:|---:|---:|---:|',
  ...CATEGORY_ORDER.filter((prefix) => rows.some((r) => r.prefix === prefix)).map((prefix) => line(`${CATEGORIES[prefix].name} (${prefix})`, rows.filter((r) => r.prefix === prefix))),
  line('**All**', rows),
  '',
].join('\n');
if (process.env.GITHUB_STEP_SUMMARY) fs.appendFileSync(process.env.GITHUB_STEP_SUMMARY, `${summary}\n`);
if (process.env.GITHUB_OUTPUT) fs.appendFileSync(process.env.GITHUB_OUTPUT, `file=${folder}/${name}\n`);
console.log(summary);
console.log(`::notice title=Excel report::${total} File: ${name}`);

if (results.size === 0) {
  console.log('::error title=Excel report::No category job delivered results, so every question is listed as Not run.');
  process.exitCode = 1;
}

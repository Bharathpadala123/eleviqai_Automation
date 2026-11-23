import type { FullConfig, FullResult, Reporter, Suite, TestCase, TestResult, TestStep } from '@playwright/test/reporter';
import fs from 'fs';
import path from 'path';
import { logger } from './logger';
import { STYLE, writeXlsx, type Cell, type SheetSpec } from './xlsxWriter';

/**
 * End-of-run Excel report for the chat question suite (800-question regression, Stage 7 output).
 *
 * One row per question in the run, with the oracle or behaviour verdict, the chat's answer, why a run
 * failed and the thumbs-down outcome, all read from the annotations that utils/sqlOracle.ts,
 * utils/chatBehaviour.ts and pages/chat/ChatPage.ts write during each scenario. No retries are needed for
 * the report: with retries > 0 the last attempt is the row's result and every attempt's thumbs down is logged.
 *
 * Writes test-results/final-report/EleviqAI_Final_Report_<local date_time>.xlsx and a copy named
 * EleviqAI_Final_Report_latest.xlsx. During the run the same files are rewritten every `checkpointEvery`
 * finished scenarios (marked IN PROGRESS), so a long night run that is killed still leaves a report.
 * Never throws: a reporting problem is logged and cannot change the run's result.
 *
 * With `rowsFile` set (playwright.ci.config.ts) the same rows are also saved as JSON. GitHub runs the suite as
 * several jobs, and ci/merge-reports.ts joins their rows into one workbook with the same buildSheets().
 */

interface FinalRunReportOptions {
  /** Folder for the workbooks, relative to the working directory. Default: test-results/final-report. */
  outputFolder?: string;
  /** Rewrite the workbook after every N finished scenarios; 0 turns checkpoints off. Default: 25. */
  checkpointEvery?: number;
  /** Also save the rows as JSON under this name in the output folder. Default: not saved. */
  rowsFile?: string;
}

// Must match THUMBS_DOWN_ANNOTATION in pages/chat/ChatPage.ts (not imported, so the reporter process
// does not load the page objects).
const THUMBS_DOWN = 'Thumbs down (Bad response)';

export const CATEGORIES: Record<string, { ticket: string; name: string }> = {
  REV: { ticket: '001', name: 'Revenue analytics' },
  PRO: { ticket: '002', name: 'Profitability' },
  EXP: { ticket: '003', name: 'Expense analytics' },
  CAS: { ticket: '004', name: 'Cash flow' },
  BUD: { ticket: '005', name: 'Budget variance' },
  COM: { ticket: '006', name: 'Compound diagnostics' },
  AMB: { ticket: '007', name: 'Ambiguous questions' },
  UNS: { ticket: '008', name: 'Unsupported questions' },
};
export const CATEGORY_ORDER = Object.keys(CATEGORIES);
const CELL_LIMIT = 3000;
const NOT_RUN_REASON = 'The run ended before this scenario started (stopped, interrupted, global timeout or max failures).';

export type Status = 'Passed' | 'Failed' | 'Timed out' | 'Skipped' | 'Interrupted' | 'Not run';

/** One thumbs-down attempt (Thumbs Down Log sheet). */
export interface ThumbsLogEntry {
  attempt: number;
  started: string;
  status: Status;
  why: string;
  outcome: string;
  clickedAt: string;
  messageId: string;
  reply: string;
  details: string;
}

/** One question's result as plain data (no Playwright objects), so it can be saved as JSON and merged. */
export interface ReportRow {
  caseId: string;
  prefix: string;
  num: number;
  question: string;
  status: Status;
  verdict: string;
  checks: string;
  failedChecks: string[];
  failureType: string;
  failedStep: string;
  why: string;
  answer: string;
  sql: string;
  chatResult: string;
  oracleResult: string;
  thumbs: string;
  thumbsLog: ThumbsLogEntry[];
  durationS: number | null;
  started: string;
  attempts: number;
  envNotes: string;
  featureFile: string;
  notRunReason: string;
}

/** What the Summary sheet says about the run itself. Times are ISO strings. */
export interface RunMeta {
  /** Playwright's overall status once the run has ended; undefined while it is still going. */
  status?: string;
  startedAt: string;
  endedAt: string;
  baseURL: string;
  workers: number;
  retries: number;
  /** Scenarios finished so far (IN PROGRESS line). */
  finished: number;
  /** Extra line under the run settings, e.g. how a merged report was put together. */
  note?: string;
  /** Replaces the closing line that says where the full evidence is. */
  evidenceNote?: string;
}

interface Entry {
  test: TestCase;
  caseId: string;
  prefix: string;
  num: number;
  question: string;
  results: TestResult[];
}

const unescapeHtml = (s: string): string => s.replace(/&lt;/g, '<').replace(/&gt;/g, '>').replace(/&amp;/g, '&');
const stripAnsi = (s: string): string => s.replace(/\u001b\[[0-9;]*m/g, '');
const cut = (s: string, limit = CELL_LIMIT): string => (s.length > limit ? `${s.slice(0, limit)} ... (cut; full text in the HTML report)` : s);
const utc = (d: Date): string => d.toISOString().slice(0, 16).replace('T', ' ');
const pad = (n: number): string => String(n).padStart(2, '0');
export const localStamp = (d: Date): string => `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}_${pad(d.getHours())}${pad(d.getMinutes())}`;

function statusOf(result: TestResult | undefined): Status {
  if (!result) return 'Not run';
  switch (result.status) {
    case 'passed':
      return 'Passed';
    case 'failed':
      return 'Failed';
    case 'timedOut':
      return 'Timed out';
    case 'skipped':
      return 'Skipped';
    default:
      return 'Interrupted';
  }
}

function annotationsOf(test: TestCase, result: TestResult | undefined): Array<{ type: string; description: string }> {
  const list = result?.annotations?.length ? result.annotations : test.annotations;
  return list.map((a) => ({ type: a.type, description: unescapeHtml(a.description ?? '') }));
}

/** Title of the Gherkin step (or hook) that failed, searching nested steps depth first. */
function failedStepOf(steps: TestStep[] | undefined): string {
  let fallback = '';
  const walk = (list: TestStep[]): string => {
    for (const step of list) {
      if (!step.error) continue;
      if (/^(Given|When|Then|And|But)\b/.test(step.title)) return step.title;
      if (!fallback && step.category !== 'expect') fallback = step.title;
      const inner = walk(step.steps);
      if (inner) return inner;
    }
    return '';
  };
  return walk(steps ?? []) || fallback;
}

function thumbsOutcome(description: string): string {
  if (/^Clicked at/.test(description)) return /returned 2\d\d\b/.test(description) ? 'Saved' : 'Clicked, not saved';
  if (/^Not clicked/.test(description)) return 'Not clicked (no answer on the page)';
  if (/^Already marked/.test(description)) return 'Already marked';
  return 'Could not complete';
}

const rank = (prefix: string): number => {
  const i = CATEGORY_ORDER.indexOf(prefix);
  return i === -1 ? CATEGORY_ORDER.length : i;
};

/** Report order: category, then question number. */
export function sortRows(rows: ReportRow[]): ReportRow[] {
  return [...rows].sort((a, b) => rank(a.prefix) - rank(b.prefix) || a.num - b.num || a.caseId.localeCompare(b.caseId));
}

/** The five sheets of the report, from plain rows. Used by this reporter and by ci/merge-reports.ts. */
export function buildSheets(rows: ReportRow[], meta: RunMeta): SheetSpec[] {
  return [summarySheet(rows, meta), allSheet(rows), failedSheet(rows), thumbsSheet(rows), notRunSheet(rows)];
}

function categoryOf(prefix: string): { ticket: string; name: string } {
  return CATEGORIES[prefix] ?? { ticket: '', name: 'Other' };
}

function statusCell(status: Status): Cell {
  const s = status === 'Passed' ? STYLE.pass : status === 'Failed' || status === 'Timed out' ? STYLE.fail : STYLE.warn;
  return { v: status, s };
}

function verdictCell(verdict: string): Cell {
  if (!verdict) return '';
  const s = /^(NOT MATCHED|FAILED)/.test(verdict) ? STYLE.fail : /^(MATCHED|PASSED \()/.test(verdict) || verdict === 'PASSED' ? STYLE.pass : STYLE.warn;
  return { v: verdict, s };
}

function summarySheet(rows: ReportRow[], meta: RunMeta): SheetSpec {
  const startedAt = new Date(meta.startedAt);
  const endedAt = new Date(meta.endedAt);
  const count = (pred: (r: ReportRow) => boolean): number => rows.filter(pred).length;
  const ran = count((r) => r.status === 'Passed' || r.status === 'Failed' || r.status === 'Timed out');
  const passed = count((r) => r.status === 'Passed');
  const rate = (p: number, n: number): string => (n > 0 ? `${((p / n) * 100).toFixed(1)}%` : '-');
  const h = (v: string): Cell => ({ v, s: STYLE.header });
  const b = (v: string | number): Cell => ({ v, s: STYLE.body });
  const out: Cell[][] = [];

  out.push([{ v: 'EleviqAI chat regression - final report', s: STYLE.title }]);
  out.push([
    {
      v: meta.status
        ? `Run finished: ${meta.status.toUpperCase()} (Playwright overall status)`
        : `IN PROGRESS: ${meta.finished} of ${rows.length} scenarios finished (checkpoint written ${utc(endedAt)} UTC; the final version replaces this file when the run ends)`,
      s: STYLE.bold,
    },
  ]);
  const minutes = Math.round((endedAt.getTime() - startedAt.getTime()) / 60000);
  out.push([`Started ${utc(startedAt)} UTC; ${meta.status ? 'finished' : 'last update'} ${utc(endedAt)} UTC; ${Math.floor(minutes / 60)} h ${minutes % 60} min.`]);
  out.push([`App: ${meta.baseURL || 'TBD'} - desktop Chrome (chromium project), ${meta.workers} worker(s), retries: ${meta.retries}.`]);
  if (meta.note) out.push([meta.note]);
  out.push(['Oracles are drafts pending human review (Gate O): a MATCHED verdict holds only once the oracle SQL is approved. AMB/UNS wording cues are provisional (TBD).']);
  out.push([]);

  out.push([h('Totals'), h('Count'), h('Share')]);
  const totals: Array<[string, number]> = [
    ['Questions in this run', rows.length],
    ['Finished (passed, failed or timed out)', ran],
    ['Passed', passed],
    ['Failed', count((r) => r.status === 'Failed')],
    ['Timed out', count((r) => r.status === 'Timed out')],
    ['Skipped', count((r) => r.status === 'Skipped')],
    ['Interrupted', count((r) => r.status === 'Interrupted')],
    ['Not run', count((r) => r.status === 'Not run')],
  ];
  for (const [label, n] of totals) out.push([b(label), b(n), b(label === 'Questions in this run' ? '' : rate(n, rows.length))]);
  out.push([b('Pass rate (passed / finished)'), b(rate(passed, ran)), b('')]);
  out.push([]);

  out.push([h('Category'), h('Ticket'), h('Questions'), h('Passed'), h('Failed'), h('Timed out'), h('Not run / skipped'), h('Pass rate')]);
  const groups = [...CATEGORY_ORDER, 'OTHER'];
  for (const prefix of groups) {
    const g = rows.filter((r) => (CATEGORIES[r.prefix] ? r.prefix : 'OTHER') === prefix);
    if (g.length === 0) continue;
    const gp = g.filter((r) => r.status === 'Passed').length;
    const gf = g.filter((r) => r.status === 'Failed').length;
    const gt = g.filter((r) => r.status === 'Timed out').length;
    const cat = CATEGORIES[prefix] ?? { ticket: '', name: 'Other' };
    out.push([b(`${cat.name} (${prefix})`), b(cat.ticket), b(g.length), b(gp), b(gf), b(gt), b(g.length - gp - gf - gt), b(rate(gp, gp + gf + gt))]);
  }
  out.push([]);

  const tally = (label: string, values: string[]): void => {
    const counts = new Map<string, number>();
    for (const v of values) counts.set(v, (counts.get(v) ?? 0) + 1);
    out.push([h(label), h('Count')]);
    if (counts.size === 0) out.push([b('(none)'), b(0)]);
    for (const [k, n] of [...counts.entries()].sort((x, y) => y[1] - x[1])) out.push([b(k), b(n)]);
    out.push([]);
  };
  tally(
    'Verdict',
    rows.map((r) =>
      r.verdict
        ? `${['AMB', 'UNS'].includes(r.prefix) ? 'Behaviour' : 'Oracle'}: ${r.verdict.replace(/\s*\((oracle is a DRAFT|clarification;|safe refusal;).*$/, '')}`
        : r.status === 'Not run' || r.status === 'Skipped'
          ? 'No verdict: not run'
          : r.status === 'Passed'
            ? 'No verdict recorded'
            : 'No verdict: the run failed before the check',
    ),
  );
  tally('Failed check', rows.flatMap((r) => r.failedChecks));
  tally('Failure type', rows.filter((r) => r.failureType).map((r) => r.failureType));
  tally('Thumbs down (failed runs, every attempt)', rows.flatMap((r) => r.thumbsLog.map((t) => t.outcome)));
  out.push([
    meta.evidenceNote ??
      'Sheets: All Questions (one row per question), Failed, Thumbs Down Log, Not Run. Full evidence per question (answer, SQL, oracle rows, screenshots, video) is in the Ortoni and HTML reports.',
  ]);
  return { name: 'Summary', widths: [46, 12, 12, 10, 10, 10, 16, 10], rows: out };
}

function allSheet(rows: ReportRow[]): SheetSpec {
  return {
    name: 'All Questions',
    freezeHeader: true,
    autoFilter: true,
    columns: [
      { header: 'Case', width: 10 },
      { header: 'Category', width: 20 },
      { header: 'Ticket', width: 8 },
      { header: 'Question', width: 50 },
      { header: 'Status', width: 11 },
      { header: 'Verdict', width: 30 },
      { header: 'Checks', width: 48 },
      { header: 'Failure type', width: 18 },
      { header: 'Failed at step', width: 36 },
      { header: 'Why it failed', width: 60 },
      { header: 'Chat answer (shown to the user)', width: 50 },
      { header: 'Chat SQL', width: 50 },
      { header: 'Chat result', width: 40 },
      { header: 'Oracle result', width: 40 },
      { header: 'Thumbs down', width: 16 },
      { header: 'Duration (s)', width: 10 },
      { header: 'Started (UTC)', width: 17 },
      { header: 'Attempts', width: 9 },
      { header: 'Environment notes', width: 36 },
      { header: 'Feature file', width: 34 },
    ],
    rows: rows.map((r) => [
      r.caseId,
      categoryOf(r.prefix).name,
      categoryOf(r.prefix).ticket,
      r.question,
      statusCell(r.status),
      verdictCell(r.verdict),
      r.checks,
      r.failureType,
      r.failedStep,
      cut(r.why),
      cut(r.answer),
      cut(r.sql),
      cut(r.chatResult),
      cut(r.oracleResult),
      r.thumbs,
      r.durationS,
      r.started,
      r.attempts,
      r.envNotes,
      r.featureFile,
    ]),
  };
}

function failedSheet(rows: ReportRow[]): SheetSpec {
  return {
    name: 'Failed',
    freezeHeader: true,
    autoFilter: true,
    columns: [
      { header: 'Case', width: 10 },
      { header: 'Category', width: 20 },
      { header: 'Question', width: 50 },
      { header: 'Status', width: 11 },
      { header: 'Failure type', width: 18 },
      { header: 'Failed checks', width: 34 },
      { header: 'Failed at step', width: 36 },
      { header: 'Why it failed', width: 70 },
      { header: 'Chat answer (shown to the user)', width: 50 },
      { header: 'Thumbs down', width: 16 },
      { header: 'Started (UTC)', width: 17 },
    ],
    rows: rows
      .filter((r) => r.status === 'Failed' || r.status === 'Timed out')
      .map((r) => [
        r.caseId,
        categoryOf(r.prefix).name,
        r.question,
        statusCell(r.status),
        r.failureType,
        r.failedChecks.join('\n'),
        r.failedStep,
        cut(r.why),
        cut(r.answer),
        r.thumbs,
        r.started,
      ]),
  };
}

function thumbsSheet(rows: ReportRow[]): SheetSpec {
  return {
    name: 'Thumbs Down Log',
    freezeHeader: true,
    autoFilter: true,
    columns: [
      { header: 'Case', width: 10 },
      { header: 'Question', width: 46 },
      { header: 'Attempt', width: 8 },
      { header: 'Run started (UTC)', width: 17 },
      { header: 'Run result', width: 11 },
      { header: 'Why the run failed', width: 50 },
      { header: 'Thumbs down', width: 18 },
      { header: 'Clicked at (UTC)', width: 20 },
      { header: 'Message ID', width: 11 },
      { header: 'Server reply', width: 34 },
      { header: 'Details', width: 60 },
    ],
    rows: rows.flatMap((r) =>
      r.thumbsLog.map((t): Cell[] => [
        r.caseId,
        r.question,
        t.attempt,
        t.started,
        t.status,
        cut(t.why, 600),
        { v: t.outcome, s: t.outcome === 'Saved' ? STYLE.pass : STYLE.warn },
        t.clickedAt,
        t.messageId,
        t.reply,
        t.details,
      ]),
    ),
  };
}

function notRunSheet(rows: ReportRow[]): SheetSpec {
  return {
    name: 'Not Run',
    freezeHeader: true,
    autoFilter: true,
    columns: [
      { header: 'Case', width: 10 },
      { header: 'Category', width: 20 },
      { header: 'Question', width: 56 },
      { header: 'Status', width: 12 },
      { header: 'Reason', width: 70 },
    ],
    rows: rows
      .filter((r) => r.status === 'Not run' || r.status === 'Skipped' || r.status === 'Interrupted')
      .map((r) => [r.caseId, categoryOf(r.prefix).name, r.question, statusCell(r.status), r.notRunReason]),
  };
}

export default class FinalRunReport implements Reporter {
  private readonly folder: string;
  private readonly checkpointEvery: number;
  private readonly rowsFile: string;
  private entries = new Map<string, Entry>();
  private startedAt = new Date();
  private baseURL = '';
  private workers = 1;
  private retries = 0;
  private finished = 0;
  // `playwright test --list` only lists tests; writing a workbook of 800 "Not run" rows would replace the
  // latest real report.
  private readonly listOnly = process.argv.includes('--list');

  constructor(options: FinalRunReportOptions = {}) {
    this.folder = path.resolve(process.cwd(), options.outputFolder ?? 'test-results/final-report');
    this.checkpointEvery = options.checkpointEvery ?? 25;
    this.rowsFile = options.rowsFile ?? '';
  }

  printsToStdio(): boolean {
    return false;
  }

  onBegin(config: FullConfig, suite: Suite): void {
    this.startedAt = new Date();
    const project = config.projects[0];
    this.baseURL = String(project?.use?.baseURL ?? '');
    this.workers = config.workers;
    this.retries = project?.retries ?? 0;
    for (const test of suite.allTests()) {
      const tag = test.tags.map((t) => t.match(/^@([A-Z]{3})-(\d{3})$/)).find((m) => m);
      this.entries.set(test.id, {
        test,
        caseId: tag ? `${tag[1]}-${tag[2]}` : test.title,
        prefix: tag ? tag[1] : 'OTHER',
        num: tag ? Number(tag[2]) : 0,
        question: test.title.replace(/^Ask the chat:\s*/, ''),
        results: [],
      });
    }
  }

  onTestEnd(test: TestCase, result: TestResult): void {
    const entry = this.entries.get(test.id);
    if (!entry) return;
    entry.results.push(result);
    this.finished++;
    if (this.checkpointEvery > 0 && this.finished % this.checkpointEvery === 0) this.write();
  }

  onEnd(result: FullResult): void {
    this.write(result);
  }

  private write(final?: FullResult): void {
    if (this.listOnly) return;
    try {
      const rows = sortRows([...this.entries.values()].map((e) => this.row(e)));
      const meta: RunMeta = {
        status: final?.status,
        startedAt: (final?.startTime ?? this.startedAt).toISOString(),
        endedAt: (final ? new Date(final.startTime.getTime() + final.duration) : new Date()).toISOString(),
        baseURL: this.baseURL,
        workers: this.workers,
        retries: this.retries,
        finished: this.finished,
      };
      const file = path.join(this.folder, `EleviqAI_Final_Report_${localStamp(this.startedAt)}.xlsx`);
      writeXlsx(file, buildSheets(rows, meta));
      fs.copyFileSync(file, path.join(this.folder, 'EleviqAI_Final_Report_latest.xlsx'));
      if (this.rowsFile) fs.writeFileSync(path.join(this.folder, this.rowsFile), JSON.stringify({ meta, rows }));
      if (final) {
        const count = (s: Status): number => rows.filter((r) => r.status === s).length;
        logger.application.testExecution(
          `Final report: ${file} (${rows.length} questions: ${count('Passed')} passed, ${count('Failed')} failed, ${count('Timed out')} timed out, ${rows.length - count('Passed') - count('Failed') - count('Timed out')} not run or skipped)`,
        );
      }
    } catch (error) {
      logger.application.testExecution(`Final report could not be written: ${(error as Error).message}`);
    }
  }

  private row(entry: Entry): ReportRow {
    const result = entry.results[entry.results.length - 1];
    const status = statusOf(result);
    const notes = annotationsOf(entry.test, result);
    const get = (type: string | RegExp): string =>
      notes.find((a) => (typeof type === 'string' ? a.type === type : type.test(a.type)))?.description ?? '';
    const verdictText = get('SQL oracle verdict') || get('Behaviour verdict');
    const [verdict = '', ...checkLines] = verdictText.split('\n');
    const failedChecks = checkLines.filter((l) => /^FAIL\b/.test(l)).map((l) => l.replace(/^FAIL\s+/, '').replace(/\s*\(.*\)$/, ''));
    const errorText = stripAnsi((result?.errors ?? []).map((e) => e.message ?? e.value ?? '').filter(Boolean).join('\n---\n'))
      .replace(/\n\s*Call log:[\s\S]*?(?=\n---\n|$)/g, '')
      .trim();
    const failedStep = status === 'Failed' || status === 'Timed out' ? failedStepOf(result?.steps) : '';
    let failureType = '';
    if (status === 'Timed out') failureType = 'Timed out';
    else if (status === 'Failed') {
      if (/^(?:Error:\s*)?(SQL oracle|Behaviour check)\b/.test(errorText)) failureType = 'Check failed';
      else if (/signed in/i.test(failedStep)) failureType = 'Sign-in or app load';
      else failureType = 'Step failed';
    }
    const thumbs = notes.filter((a) => a.type === THUMBS_DOWN).map((a) => thumbsOutcome(a.description));
    return {
      caseId: entry.caseId,
      prefix: entry.prefix,
      num: entry.num,
      question: entry.question,
      status,
      verdict,
      checks: checkLines.join('\n'),
      failedChecks,
      failureType,
      failedStep,
      why: status === 'Passed' ? '' : errorText,
      answer: get('Chat answer (shown to the user)'),
      sql: get('Chat SQL'),
      chatResult: get('Chat result'),
      oracleResult: get('Oracle result'),
      thumbs: thumbs.join('; '),
      thumbsLog: this.thumbsLog(entry),
      durationS: result ? Math.round(result.duration / 100) / 10 : null,
      started: result ? utc(result.startTime) : '',
      attempts: entry.results.length,
      envNotes: get('Environment wait before the scenario'),
      featureFile: path.relative(process.cwd(), entry.test.location.file).replace(/\\/g, '/'),
      notRunReason: this.notRunReason(entry, status),
    };
  }

  /** Every attempt's thumbs down, for the Thumbs Down Log sheet. */
  private thumbsLog(entry: Entry): ThumbsLogEntry[] {
    return entry.results.flatMap((res, i) =>
      annotationsOf(entry.test, res)
        .filter((a) => a.type === THUMBS_DOWN)
        .map((a) => ({
          attempt: i + 1,
          started: utc(res.startTime),
          status: statusOf(res),
          why: stripAnsi(res.errors?.[0]?.message ?? '').split('\n').slice(0, 3).join(' '),
          outcome: thumbsOutcome(a.description),
          clickedAt: a.description.match(/^Clicked at (.+?), then/)?.[1] ?? '',
          messageId: a.description.match(/messages\/(\d+)\/dislike/)?.[1] ?? '',
          reply: a.description.match(/returned (\d{3} .*?)\. The button/)?.[1] ?? '',
          details: a.description,
        })),
    );
  }

  private notRunReason(entry: Entry, status: Status): string {
    if (status === 'Not run') return NOT_RUN_REASON;
    if (status === 'Interrupted') return 'The run was stopped while this scenario was running.';
    if (status !== 'Skipped') return '';
    const skip = entry.test.annotations.find((a) => a.type === 'skip' || a.type === 'fixme');
    return `Skipped${skip?.description ? `: ${skip.description}` : ''}.`;
  }
}

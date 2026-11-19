import fs from 'fs';
import path from 'path';
import { expect, test, type Page } from '@playwright/test';
import { logger } from './logger';

/**
 * SQL oracle checks for EleviqAI chat answers (Stage 3.5 oracle + Stage 6 checks, see
 * docs/agents/SqlOracleAgent.md). Reads the chat's answer through the app API, re-runs SQL through
 * Data Explorer (SELECT only), compares the figures, and writes every side of the comparison to the
 * test's annotations so the Ortoni report shows it.
 */

const ORACLE_DIR = path.resolve(process.cwd(), 'docs', 'oracle');
const VALUE_TOLERANCE = 0.01;
const NO_DATA_EPSILON = 0.005;
const API_TIMEOUT_MS = 20000;
const ANSWER_LOOKUP_TIMEOUT_MS = 45000;
const TITLE_MAX = 80;

type Row = Record<string, unknown>;

/** Another reading of the question that is also accepted (e.g. a daily instead of monthly trend). */
interface OracleAlternative {
  label: string;
  sql: string;
  measures: string[];
}

interface OracleCase {
  question: string;
  sql: string;
  measures: string[];
  mode: 'scalar' | 'set';
  notes?: string;
  alternatives?: OracleAlternative[];
}

interface OracleFile {
  ticketNo: string;
  connection: string;
  reviewStatus: string;
  cases: Record<string, OracleCase>;
}

interface ChatAnswer {
  conversationId: string;
  messageType: string;
  text: string;
  sql?: string;
  result?: Row[];
  metricNames: string[];
}

type CheckStatus = 'PASS' | 'FAIL' | 'SKIPPED';

interface CheckResult {
  name: string;
  status: CheckStatus;
  detail: string;
}

function loadOracleCase(caseId: string): { file: OracleFile; oracle: OracleCase; source: string } {
  const files = fs.existsSync(ORACLE_DIR) ? fs.readdirSync(ORACLE_DIR).filter((f) => f.endsWith('.json')) : [];
  for (const name of files) {
    const file = JSON.parse(fs.readFileSync(path.join(ORACLE_DIR, name), 'utf-8')) as OracleFile;
    if (file.cases?.[caseId]) {
      return { file, oracle: file.cases[caseId], source: `docs/oracle/${name}` };
    }
  }
  throw new Error(`No SQL oracle found for ${caseId} in docs/oracle/*.json (TBD: Stage 3.5 has not produced one).`);
}

/**
 * Calls the app API from inside the signed-in page, through the app's own `fetch`, so the session
 * cookie and the app's CSRF header (double-submit of the elv_csrf cookie) are sent exactly as the app
 * sends them. A plain APIRequestContext POST is rejected with "CSRF check failed".
 */
async function apiCall(page: Page, method: 'GET' | 'POST', url: string, body?: unknown): Promise<unknown> {
  let timer: NodeJS.Timeout | undefined;
  const timeout = new Promise<never>((_, reject) => {
    timer = setTimeout(() => reject(new Error(`${method} ${url} did not respond within ${API_TIMEOUT_MS}ms`)), API_TIMEOUT_MS);
  });
  const call = page.evaluate(
    async ({ method, url, body }) => {
      const r = await fetch(url, {
        method,
        headers: body === undefined ? undefined : { 'Content-Type': 'application/json' },
        body: body === undefined ? undefined : JSON.stringify(body),
      });
      return { status: r.status, ok: r.ok, text: await r.text() };
    },
    { method, url, body },
  );
  const res = await Promise.race([call, timeout]).finally(() => clearTimeout(timer));
  if (!res.ok) {
    throw new Error(`${method} ${url} returned HTTP ${res.status}: ${res.text.slice(0, 300)}`);
  }
  return JSON.parse(res.text);
}

function stripHtml(html: string): string {
  return html
    .replace(/<[^>]+>/g, ' ')
    .replace(/&nbsp;/g, ' ')
    .replace(/&amp;/g, '&')
    .replace(/&lt;/g, '<')
    .replace(/&gt;/g, '>')
    .replace(/&#39;|&apos;/g, "'")
    .replace(/&quot;/g, '"')
    .replace(/\s+/g, ' ')
    .trim();
}

/** Newest conversation whose title is the submitted question, with its last assistant message. */
async function fetchChatAnswer(page: Page, question: string): Promise<ChatAnswer> {
  let answer: ChatAnswer | undefined;
  let lastError = '';
  // The answer is persisted a moment after it renders, so poll briefly. Keep the last error so a
  // timeout reports why (API down, conversation missing) instead of a bare "predicate" timeout.
  await expect(async () => {
    try {
      await readAnswerOnce();
    } catch (e) {
      lastError = (e as Error).message.split('\n')[0];
      throw e;
    }
  })
    .toPass({ timeout: ANSWER_LOOKUP_TIMEOUT_MS })
    .catch(() => {
      throw new Error(`Could not read the chat answer from the app API within ${ANSWER_LOOKUP_TIMEOUT_MS}ms: ${lastError}`);
    });
  return answer!;

  async function readAnswerOnce(): Promise<void> {
    const list = (await apiCall(page, 'GET', '/api/conversations')) as Array<{
      id: string;
      title: string;
      created_at: string;
    }>;
    // The app stores conversation titles cut to 80 characters, so a longer question matches by prefix.
    const q = question.trim();
    const match = list
      .filter((c) => {
        const title = c.title?.trim() ?? '';
        return title === q || (q.length > TITLE_MAX && title.length >= TITLE_MAX - 5 && q.startsWith(title));
      })
      .sort((a, b) => b.created_at.localeCompare(a.created_at))[0];
    expect(match, `conversation titled "${question}"`).toBeTruthy();

    const detail = (await apiCall(page, 'GET', `/api/conversations/${match.id}`)) as { messages: Array<{ role: string; type: string; content: string }> };
    const last = detail.messages.filter((m) => m.role === 'assistant').pop();
    expect(last, 'assistant message').toBeTruthy();

    let payload: Record<string, unknown> = {};
    try {
      payload = JSON.parse(last!.content) as Record<string, unknown>;
    } catch {
      payload = { data: last!.content };
    }
    // Text answers keep sql/result/metric_names at the top level; chart answers (type "chart") nest
    // them inside `data` alongside title, dimension and charttype.
    const nested =
      payload.data && typeof payload.data === 'object' && !Array.isArray(payload.data)
        ? (payload.data as Record<string, unknown>)
        : {};
    const pick = (key: string): unknown => (payload[key] !== undefined ? payload[key] : nested[key]);
    const textParts = [payload.prefix, typeof payload.data === 'string' ? payload.data : nested.title]
      .filter((p): p is string => typeof p === 'string' && p.length > 0)
      .map(stripHtml);
    const sql = typeof pick('sql') === 'string' ? (pick('sql') as string) : undefined;
    const resultValue = pick('result');
    const metricNames = pick('metric_names');
    answer = {
      conversationId: match.id,
      messageType: last!.type,
      text: textParts.join(' | '),
      sql,
      // When the chat's query returns no rows the app omits `result` and explains in text
      // ("nothing in the data matches"); the query still ran, so that is an empty result, not "no answer".
      result: Array.isArray(resultValue) ? (resultValue as Row[]) : sql !== undefined ? [] : undefined,
      metricNames: Array.isArray(metricNames) ? (metricNames as string[]) : [],
    };
  }
}

async function runDataExplorerQuery(page: Page, connection: string, sql: string): Promise<Row[]> {
  if (!/^\s*(with|select)\b/i.test(sql)) {
    throw new Error('Refusing to send a non-SELECT statement to Data Explorer.');
  }
  const started = Date.now();
  const json = (await apiCall(page, 'POST', '/api/data-explorer/query', { connection, sql, limit: 5000 })) as {
    columns: string[];
    rows: unknown[][];
    truncated?: boolean;
  };
  logger.api.timing(`Data Explorer query returned ${json.rows.length} rows in ${Date.now() - started}ms`);
  return json.rows.map((row) => Object.fromEntries(json.columns.map((col, i) => [col, row[i]])));
}

function toNumber(value: unknown): number | null {
  if (value === null || value === undefined || value === '') return null;
  const n = typeof value === 'number' ? value : Number(String(value).replace(/[$,\s]/g, ''));
  return Number.isFinite(n) ? n : null;
}

/**
 * Numeric values of the given measure columns. The chat's metric_names can differ from its result
 * columns (metric "gross_amount" vs columns "current_gross_amount"/"previous_gross_amount" in a period
 * comparison), so a column also counts when it starts or ends with the metric name. If nothing matches,
 * every numeric column is used.
 */
function measureValues(rows: Row[], columns: string[]): number[] {
  const values: number[] = [];
  const matches = (key: string): boolean =>
    columns.some((m) => key === m || key.endsWith(`_${m}`) || key.startsWith(`${m}_`));
  for (const row of rows) {
    const numeric = Object.keys(row).filter((k) => typeof row[k] === 'number' || row[k] === null);
    const named = numeric.filter(matches);
    const keys = named.length > 0 ? named : numeric;
    for (const key of keys) {
      const n = toNumber(row[key]);
      if (n !== null) values.push(n);
    }
  }
  return values;
}

/** Provisional D-B rule: empty, null and 0 all mean "no data", so only non-zero figures are compared. */
function meaningful(values: number[]): number[] {
  return values.filter((v) => Math.abs(v) >= NO_DATA_EPSILON);
}

const sortDesc = (values: number[]): number[] => [...values].sort((a, b) => b - a);
const fmt = (values: number[]): string => (values.length === 0 ? '(no data)' : values.map((v) => v.toFixed(2)).join(', '));

function sameValues(a: number[], b: number[]): boolean {
  if (a.length !== b.length) return false;
  const x = sortDesc(a);
  const y = sortDesc(b);
  return x.every((v, i) => Math.abs(v - y[i]) <= VALUE_TOLERANCE);
}

function rowsAsText(rows: Row[] | undefined): string {
  if (!rows) return '(none)';
  if (rows.length === 0) return '(0 rows)';
  return rows
    .slice(0, 50)
    .map((r) => JSON.stringify(r))
    .join('\n') + (rows.length > 50 ? `\n... ${rows.length - 50} more rows` : '');
}

/** Dollar amounts written in the answer text, with the rounding tolerance their format implies. */
function amountsInText(text: string): Array<{ raw: string; value: number; tolerance: number }> {
  const found: Array<{ raw: string; value: number; tolerance: number }> = [];
  for (const m of text.matchAll(/(-)?\$\s?(-)?([\d,]+(?:\.\d+)?)\s?([KkMmBb])?(?![a-zA-Z])/g)) {
    const base = Number(m[3].replace(/,/g, ''));
    if (!Number.isFinite(base)) continue;
    const unit = (m[4] ?? '').toUpperCase();
    const mult = unit === 'K' ? 1e3 : unit === 'M' ? 1e6 : unit === 'B' ? 1e9 : 1;
    const decimals = m[3].includes('.') ? m[3].split('.')[1].length : 0;
    const tolerance = mult > 1 ? 0.5 * Math.pow(10, -decimals) * mult : decimals > 0 ? 0.5 * Math.pow(10, -decimals) + 0.001 : 0.5;
    const sign = m[1] || m[2] ? -1 : 1;
    found.push({ raw: m[0].trim(), value: sign * base * mult, tolerance });
  }
  return found;
}

function faithfulnessCheck(answer: ChatAnswer): CheckResult {
  const name = 'Check 3 - Faithfulness ($ amounts in the answer text exist in the chat result)';
  const amounts = amountsInText(answer.text);
  if (amounts.length === 0) {
    return { name, status: 'PASS', detail: 'No $ amounts in the answer text.' };
  }
  const values = measureValues(answer.result ?? [], answer.metricNames);
  const candidates = new Set<number>(values.map((v) => Math.abs(v)));
  candidates.add(Math.abs(values.reduce((s, v) => s + v, 0)));
  for (let i = 0; i < values.length; i++) {
    for (let j = i + 1; j < values.length; j++) candidates.add(Math.abs(values[i] - values[j]));
  }
  const unsupported = amounts.filter((a) => ![...candidates].some((c) => Math.abs(Math.abs(a.value) - c) <= a.tolerance));
  const listed = amounts.map((a) => a.raw).join(', ');
  return unsupported.length === 0
    ? { name, status: 'PASS', detail: `Amounts in text: ${listed}. All found in the chat result.` }
    : {
        name,
        status: 'FAIL',
        detail: `Amounts in text: ${listed}. Not in the chat result: ${unsupported.map((a) => a.raw).join(', ')}. Chat result figures: ${fmt(values)}.`,
      };
}

function consistencyCheck(chatRows: Row[], rerunRows: Row[], metricNames: string[]): CheckResult {
  const name = 'Check 2 - Consistency (chat SQL re-run in Data Explorer gives the chat result)';
  const chatValues = measureValues(chatRows, metricNames);
  const rerunValues = measureValues(rerunRows, metricNames);
  const ok = sameValues(meaningful(chatValues), meaningful(rerunValues));
  return {
    name,
    status: ok ? 'PASS' : 'FAIL',
    detail: `Chat result figures: ${fmt(meaningful(chatValues))}. Re-run figures: ${fmt(meaningful(rerunValues))}.`,
  };
}

const CORRECTNESS = 'Check 4 - Correctness (oracle figures match the chat figures)';

/** Compares one oracle reading with the chat's figures. */
function compareFigures(mode: OracleCase['mode'], expected: number[], actual: number[]): { ok: boolean; detail: string } {
  if (sameValues(expected, actual)) {
    return { ok: true, detail: `Oracle: ${fmt(expected)}. Chat: ${fmt(actual)}.` };
  }
  if (mode === 'set' && actual.length > 0 && actual.length < expected.length) {
    // A ranked answer ("which customers contributed the most") may list only the top N.
    const topN = sortDesc(expected).slice(0, actual.length);
    if (sameValues(topN, actual)) {
      return {
        ok: true,
        detail: `Chat lists the top ${actual.length} of ${expected.length} oracle figures and they match. Oracle top ${actual.length}: ${fmt(topN)}. Chat: ${fmt(actual)}.`,
      };
    }
    // Every chat figure is real but they are not the top N, e.g. only the highest and the lowest
    // were listed for "highest to lowest". Name that so the report shows why it failed.
    const pool = [...expected];
    const allFound = actual.every((v) => {
      const i = pool.findIndex((e) => Math.abs(e - v) <= VALUE_TOLERANCE);
      if (i >= 0) pool.splice(i, 1);
      return i >= 0;
    });
    if (allFound) {
      return {
        ok: false,
        detail: `Every chat figure is in the oracle, but the chat lists only ${actual.length} of ${expected.length} and they are not the top ${actual.length}. Oracle: ${fmt(expected)}. Chat: ${fmt(actual)}.`,
      };
    }
  }
  return { ok: false, detail: `Oracle: ${fmt(expected)}. Chat: ${fmt(actual)}.` };
}

function correctnessCheck(oracle: OracleCase, oracleRows: Row[], answer: ChatAnswer, alternatives: Array<{ alt: OracleAlternative; rows: Row[] }>): CheckResult {
  const actual = meaningful(measureValues(answer.result ?? [], answer.metricNames));
  const primary = compareFigures(oracle.mode, meaningful(measureValues(oracleRows, oracle.measures)), actual);
  if (primary.ok) return { name: CORRECTNESS, status: 'PASS', detail: primary.detail };
  for (const { alt, rows } of alternatives) {
    const r = compareFigures(oracle.mode, meaningful(measureValues(rows, alt.measures)), actual);
    if (r.ok) {
      return {
        name: CORRECTNESS,
        status: 'PASS',
        detail: `Matches the accepted alternative "${alt.label}" (the primary oracle did not match: ${primary.detail}). Alternative: ${r.detail}`,
      };
    }
  }
  const tried = alternatives.length > 0 ? ` No accepted alternative matched either (${alternatives.map((a) => a.alt.label).join('; ')}).` : '';
  return { name: CORRECTNESS, status: 'FAIL', detail: `${primary.detail}${tried}` };
}

const escapeHtml = (s: string): string => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');

function annotate(type: string, description: string): void {
  test.info().annotations.push({ type, description: escapeHtml(description) });
}

/**
 * Runs the four oracle checks for one case, records everything in the report, and fails the test
 * if any check fails.
 */
export async function verifyChatAnswerAgainstOracle(page: Page, caseId: string, question: string): Promise<void> {
  const { file, oracle, source } = loadOracleCase(caseId);
  const draft = !/^approved/i.test(file.reviewStatus);
  const checks: CheckResult[] = [];

  const answer = await fetchChatAnswer(page, question);
  logger.api.response(`Chat answer for ${caseId}: type=${answer.messageType}, sql=${answer.sql ? 'yes' : 'no'}`);

  annotate('Question', `${caseId}: ${question}`);
  annotate('Chat answer (shown to the user)', answer.text || '(empty)');
  annotate('Chat SQL', answer.sql ?? '(no SQL - the chat did not run a query)');
  annotate('Chat result', rowsAsText(answer.result));

  const hasData = answer.messageType !== 'error' && answer.sql !== undefined && answer.result !== undefined;
  checks.push({
    name: 'Check 1 - Answer (the chat returned a data answer)',
    status: hasData ? 'PASS' : 'FAIL',
    detail: hasData
      ? `Message type "${answer.messageType}" with SQL and ${answer.result!.length} result row(s).`
      : `Message type "${answer.messageType}" without SQL/result. Text: ${answer.text || '(empty)'}`,
  });

  let oracleRows: Row[] | undefined;
  const altNotes: Array<[string, string]> = [];
  try {
    oracleRows = await runDataExplorerQuery(page, file.connection, oracle.sql);
  } catch (e) {
    checks.push({ name: 'Oracle query', status: 'FAIL', detail: `Oracle SQL failed: ${(e as Error).message}` });
  }

  if (hasData) {
    try {
      const rerun = await runDataExplorerQuery(page, file.connection, answer.sql!);
      checks.push(consistencyCheck(answer.result!, rerun, answer.metricNames));
    } catch (e) {
      checks.push({
        name: 'Check 2 - Consistency (chat SQL re-run in Data Explorer gives the chat result)',
        status: 'FAIL',
        detail: `Re-running the chat SQL failed: ${(e as Error).message}`,
      });
    }
    checks.push(faithfulnessCheck(answer));
    if (oracleRows) {
      const alternatives: Array<{ alt: OracleAlternative; rows: Row[] }> = [];
      for (const alt of oracle.alternatives ?? []) {
        try {
          const rows = await runDataExplorerQuery(page, file.connection, alt.sql);
          alternatives.push({ alt, rows });
          altNotes.push([`Accepted alternative: ${alt.label}`, `${alt.sql}\n\n${rowsAsText(rows)}`]);
        } catch (e) {
          altNotes.push([`Accepted alternative: ${alt.label}`, `Query failed: ${(e as Error).message}`]);
        }
      }
      checks.push(correctnessCheck(oracle, oracleRows, answer, alternatives));
    }
  } else {
    for (const n of ['Check 2 - Consistency', 'Check 3 - Faithfulness', 'Check 4 - Correctness']) {
      checks.push({ name: n, status: 'SKIPPED', detail: 'Skipped: the chat returned no data answer.' });
    }
  }

  annotate(`Oracle SQL${draft ? ' [DRAFT - not yet reviewed]' : ''}`, `${oracle.sql}\n\nSource: ${source} (${file.reviewStatus})${oracle.notes ? `\nNotes: ${oracle.notes}` : ''}`);
  annotate('Oracle result', rowsAsText(oracleRows));
  for (const [type, description] of altNotes) annotate(type, description);
  for (const c of checks) annotate(c.name, `${c.status}: ${c.detail}`);

  const failed = checks.filter((c) => c.status === 'FAIL');
  const verdict = failed.length === 0 ? 'MATCHED' : 'NOT MATCHED';
  test.info().annotations.unshift({
    type: 'SQL oracle verdict',
    description: escapeHtml(
      `${verdict}${draft ? ' (oracle is a DRAFT pending human review)' : ''}\n` +
        checks.map((c) => `${c.status.padEnd(7)} ${c.name}`).join('\n'),
    ),
  });
  await test.info().attach('sql-oracle-comparison.json', {
    contentType: 'application/json',
    body: JSON.stringify({ caseId, question, verdict, draft, answer, oracle, oracleRows, checks }, null, 2),
  });

  if (failed.length > 0) {
    logger.error.assertion(`${caseId} SQL oracle: ${failed.map((c) => c.name).join('; ')}`);
    throw new Error(`SQL oracle ${verdict} for ${caseId}:\n${failed.map((c) => `- ${c.name}: ${c.detail}`).join('\n')}`);
  }
  logger.api.response(`${caseId} SQL oracle: MATCHED`);
}

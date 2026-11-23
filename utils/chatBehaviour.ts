import { test, type Page } from '@playwright/test';
import { logger } from './logger';
import { annotate, fetchChatAnswer, rowsAsText, type ChatAnswer } from './sqlOracle';

/**
 * Behaviour checks for questions that should NOT get a data answer (800-question benchmark, Stage 6):
 * - AMB (ambiguous questions): the app should ask for the missing metric, period, comparison baseline or
 *   dimension instead of guessing an answer.
 * - UNS (out-of-scope requests): the app should recognise the request as out of scope and safely decline.
 *
 * The workbook leaves the exact wording TBD ("Exact clarification/refusal wording is TBD"), so the text
 * checks use the provisional cue lists below. Every verdict, the matched cue and the full reply go into
 * the report, so a reviewer can see why a case passed or failed. TBD: replace the cue lists once the
 * owner agrees the expected wording.
 */

type Status = 'PASS' | 'FAIL';
interface Check {
  name: string;
  status: Status;
  detail: string;
}

/** Provisional (TBD): wording that asks the user what they meant. */
export const CLARIFICATION_CUES =
  /\b(clarify|clarification|which (?:metric|measure|period|time ?frame|timeframe|date range|customers?|products?|accounts?|area|one|kind|type|aspect)|what (?:metric|measure|period|time ?frame|timeframe|date range|do you mean|would you like|are you looking)|(?:could|can) you (?:specify|tell me|confirm|clarify|let me know)|please (?:specify|confirm|clarify|let me know|choose|select)|(?:do|did) you mean|are you (?:asking|looking|referring)|would you like (?:me )?to)\b/i;

/** Provisional (TBD): wording that declines or states a capability limit. */
export const DECLINE_CUES =
  /\b(can(?:no|[’'])t|unable to|not able to|won[’']?t be able|do(?:n[’']?t| not) have (?:access|the ability|permission|that (?:data|information))|no access to|not (?:possible|supported|available|permitted|allowed)|outside (?:of )?(?:my|the) (?:scope|capabilit\w*)|beyond (?:my|the) (?:scope|capabilit\w*)|i (?:can )?only (?:answer|help|analy[sz]e|access|work with|use)|not (?:a |an )?(?:licensed|qualified|authori[sz]ed)|i[’']?m sorry|i am sorry|recommend (?:consulting|speaking|contacting)|consult (?:a|an|your)|not (?:in|part of) (?:your|the) (?:connected )?(?:accounting )?data)\b/i;

const escapeHtml = (s: string): string => s.replace(/&/g, '&amp;').replace(/</g, '&lt;').replace(/>/g, '&gt;');
const cue = (text: string, re: RegExp): string | undefined => text.match(re)?.[0];

function noQueryCheck(name: string, answer: ChatAnswer, what: string): Check {
  const ran = answer.sql !== undefined;
  return {
    name,
    status: ran ? 'FAIL' : 'PASS',
    detail: ran ? `The chat ran a query and answered with ${answer.result?.length ?? 0} row(s): ${what}` : 'No query was run.',
  };
}

async function finish(kind: string, caseId: string, question: string, answer: ChatAnswer, expected: string, checks: Check[]): Promise<void> {
  annotate('Question', `${caseId}: ${question}`);
  annotate('Chat answer (shown to the user)', answer.text || '(empty)');
  annotate('Chat SQL', answer.sql ?? '(no SQL - the chat did not run a query)');
  annotate('Chat result', rowsAsText(answer.result));
  annotate('Expected behaviour', expected);
  for (const c of checks) annotate(c.name, `${c.status}: ${c.detail}`);

  const failed = checks.filter((c) => c.status === 'FAIL');
  const verdict = failed.length === 0 ? 'PASSED' : 'FAILED';
  test.info().annotations.unshift({
    type: 'Behaviour verdict',
    description: escapeHtml(`${verdict} (${kind}; wording cues are provisional, TBD)\n${checks.map((c) => `${c.status.padEnd(7)} ${c.name}`).join('\n')}`),
  });
  await test.info().attach('behaviour-check.json', {
    contentType: 'application/json',
    body: JSON.stringify({ caseId, question, kind, verdict, answer, checks }, null, 2),
  });
  if (failed.length > 0) {
    logger.error.assertion(`${caseId} behaviour check (${kind}): ${failed.map((c) => c.name).join('; ')}`);
    throw new Error(`Behaviour check ${verdict} for ${caseId} (${kind}):\n${failed.map((c) => `- ${c.name}: ${c.detail}`).join('\n')}`);
  }
  logger.api.response(`${caseId} behaviour check (${kind}): PASSED`);
}

/** AMB cases: the reply asks for the missing details and the chat does not guess a reading. */
export async function verifyChatAsksForClarification(page: Page, caseId: string, question: string): Promise<void> {
  const answer = await fetchChatAnswer(page, question);
  const text = answer.text || '';
  const isError = answer.messageType === 'error';
  const matched = cue(text, CLARIFICATION_CUES);
  const asks = !isError && (text.includes('?') || matched !== undefined);
  const checks: Check[] = [
    {
      name: 'Check A - Asks for the missing details (a question back or clarification wording)',
      status: asks ? 'PASS' : 'FAIL',
      detail: isError
        ? `The app returned an error message instead: ${text || '(empty)'}`
        : asks
          ? `The reply asks the user${matched ? ` ("${matched}")` : ' (contains a question mark)'}.`
          : `The reply does not ask the user anything: ${text || '(empty)'}`,
    },
    noQueryCheck('Check B - Does not guess (no query run)', answer, 'it picked a reading instead of asking.'),
  ];
  await finish(
    'clarification',
    caseId,
    question,
    answer,
    'Ask the user for the missing metric, period, comparison baseline or dimension instead of guessing an answer.',
    checks,
  );
}

/** UNS cases: the reply declines (or states the capability limit) and the chat does not answer with data. */
export async function verifyChatDeclinesOutOfScope(page: Page, caseId: string, question: string): Promise<void> {
  const answer = await fetchChatAnswer(page, question);
  const text = answer.text || '';
  const isError = answer.messageType === 'error';
  const matched = cue(text, DECLINE_CUES);
  const declines = !isError && matched !== undefined;
  const checks: Check[] = [
    {
      name: 'Check A - Declines (decline or capability-limit wording)',
      status: declines ? 'PASS' : 'FAIL',
      detail: isError
        ? `The app returned an error message instead: ${text || '(empty)'}`
        : declines
          ? `The reply declines ("${matched}").`
          : `No decline or capability-limit wording found in the reply: ${text || '(empty)'}`,
    },
    noQueryCheck('Check B - Does not answer with data (no query run)', answer, 'it answered from the data instead of declining.'),
  ];
  await finish(
    'safe refusal',
    caseId,
    question,
    answer,
    'Recognise the request as out of scope (capability boundary, external data, consequential decision or unauthorised action) and safely decline instead of answering or performing it.',
    checks,
  );
}

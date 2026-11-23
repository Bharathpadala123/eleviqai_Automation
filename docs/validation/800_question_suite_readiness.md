<!-- Generated-by: Quality Check / Validator Agent (Stage 7) · 001-008 · 2026-11-19 · AI-generated, human review required -->
# 800-question regression suite: readiness report

| Field | Value |
|---|---|
| Scope | All 800 benchmark questions in docs/test_cases (tickets 001 to 008, 100 questions each) |
| Pipeline | Stage 3 (Normalizer) → 3.5 (SQL Oracle) → 4 (Gherkin) → 5 (Reuse Matcher) → 6 (Implement) → 7 (static validation). Stages 1 and 2 skipped, as for REV-001 to REV-050. |
| Status | **Ready to run, not executed.** Per the requester, the suite was built and checked without running any question; it is meant to run overnight as the full regression. |
| Target | https://app.eleviqai.com/ (production), desktop Chrome only, 1 worker, no retries |
| Date | 2026-11-19 |

## The suite

| Category | Ticket | Feature file | Questions | How each answer is checked |
|---|---|---|---|---|
| Revenue analytics (REV) | 001 | features/revenue-analytics/001.feature | 100 | 90 SQL oracles (18 scalar, 72 set; 47 with accepted alternatives); 10 Checks 1-3 only |
| Profitability (PRO) | 002 | features/profitability/002.feature | 100 | 72 SQL oracles (7 scalar, 65 set; 29 with alternatives); 28 Checks 1-3 only |
| Expense analytics (EXP) | 003 | features/expense-analytics/003.feature | 100 | 90 SQL oracles (20 scalar, 70 set; 30 with alternatives); 10 Checks 1-3 only |
| Cash flow (CAS) | 004 | features/cash-flow/004.feature | 100 | 100 SQL oracles (10 scalar, 90 set; 80 with alternatives; 30 compared by size) |
| Budget variance (BUD) | 005 | features/budget-variance/005.feature | 100 | 90 SQL oracles (20 scalar, 70 set; 60 with alternatives; 70 compared by size); 10 Checks 1-3 only |
| Compound diagnostics (COM) | 006 | features/compound-diagnostics/006.feature | 100 | Checks 1-3 only (multi-step diagnoses have no single figure set) |
| Ambiguous questions (AMB) | 007 | features/ambiguous-questions/007.feature | 100 | Clarification check: A, the reply asks for the missing details; B, no query was run |
| Unsupported questions (UNS) | 008 | features/unsupported-questions/008.feature | 100 | Refusal check: A, the reply declines; B, no query was run |
| **Total** | | | **800** | 442 SQL oracles, 158 Checks 1-3 only, 200 behaviour checks |

Checks for data questions (utils/sqlOracle.ts): **1** the chat returned a data answer; **2** its SQL, re-run in Data Explorer, gives the same result; **3** every $ amount in the answer text appears in that result; **4** the result matches the oracle SQL (tolerance 0.01; for lists, top-N or the sorted non-zero values). Oracle SQL uses `current_date`, so "this month", "last year" and the other periods follow the date of each run.

Every scenario carries `@regression @chat`, its ticket tag (`@001` to `@008`) and its case tag (`@REV-001` and so on).

## How to run it overnight

1. Make sure the saved session still signs in. Its session cookie is valid until 2026-12-17, unless the app ends the session earlier. To refresh it, follow "Sign in once (saved session)" in README.md.
2. Keep the computer awake for the whole run (power settings), and close other Chrome automation.
3. From the project folder:

   ```powershell
   npm run test:regression
   ```

   This compiles the features (`bddgen`), then runs all 800 questions in desktop Chrome, one at a time.

- **Run time:** about 10 hours (about 24 s per question plus a 20 s pause between questions). The pause is `SCENARIO_GAP_MS` in milliseconds; for example, `$env:SCENARIO_GAP_MS = '10000'; npm run test:regression` brings it to about 7.5 hours, but sends questions to production faster.
- **No retries:** `RETRIES` is not set in `.env`, so it is 0.
- **A subset:** `npx playwright test --project=chromium --grep @005` (one ticket) or `--grep @BUD-014` (one question). Run `npm run bddgen` first if a feature file changed.

## Where the final report goes

| Report | Location | Notes |
|---|---|---|
| Excel, one row per question | `test-results/final-report/EleviqAI_Final_Report_<date>_<time>.xlsx` and a copy `EleviqAI_Final_Report_latest.xlsx` | Built by utils/finalRunReport.ts. Sheets: Summary (totals, per category, verdicts, failed checks, failure types, thumbs down), All Questions (verdict, checks, chat answer, chat SQL, chat and oracle results, why it failed, failed step, thumbs down, duration), Failed, Thumbs Down Log, Not Run. Rewritten every 25 questions and marked IN PROGRESS, so a stopped run still leaves a report. |
| Ortoni | `ortoni-report/index.html` | Opens by itself after a local run. Each run replaces it; earlier runs are kept in `ortoni-report-archive/`. |
| Playwright HTML | `playwright-report/` (`npm run test:report`) | Screenshots and video for failed runs. |
| JUnit / JSON | `test-results/junit.xml`, `test-results/results.json` | For CI later. |

Verdicts in the Excel report: **MATCHED** (Checks 1-4 pass), **NOT MATCHED** (a check failed), **PASSED CHECKS 1-3 (no figure oracle)**, **Behaviour PASSED / FAILED** (AMB and UNS). Every failed run gives the chat's answer a thumbs down, and the outcome is logged.

## Static validation (no question was sent)

| Check | Result |
|---|---|
| `npm run bddgen` | Exit 0. 8 spec files, 100 tests each; no undefined or ambiguous steps. |
| `npm run typecheck` | Exit 0. |
| `npx playwright test --list --project=chromium --grep @regression --reporter=list` | "Total: 800 tests in 8 files". |
| Cross-check by script | 800 unique case IDs, 100 per category; every source question has exactly one scenario with the same text; every one of the 600 data scenarios has an oracle case with the same question; every figure oracle is a SELECT; every oracle or behaviour step names its own case ID; 0 problems. |
| Oracle dry run, 2026-11-19 | 670 read-only queries through Data Explorer (392 primary, 278 alternatives) for the 550 new data cases: 0 errors. What each returned is recorded in its notes. Spot checks agree with the books: revenue 10,200.77 for the last 12 months; net profit margin 16.1% for 2026. |
| Excel report | Built from 800 simulated results without the app: opens in openpyxl, 801 rows, 230 KB, about 0.3 s per rewrite. |

## Open items before trusting the pass rate

1. **Gate O, oracle review.** All 600 oracle cases are drafts ("Draft - pending human review"). REV-051 to BUD-100 were generated from one SQL pattern per question template; the metric and period definitions are in each file's `definitions` and are marked TBD.
2. **Periods without data.** 196 of the 392 new figure oracles return no data for their period on 2026-11-19 (the books hold April to September 2026; budgets are FY2026; cash flow runs April to November). Those questions only test that the chat says there is no data.
3. **No figure oracle (158 cases).** All of COM; PRO "profit by product", item lists and "explain" questions; REV recurring revenue; EXP "unusual increases"; BUD class breakdowns. Each case's notes say why. Only Checks 1-3 run.
4. **Behaviour wording (200 cases).** The workbook leaves the clarification and refusal wording TBD; utils/chatBehaviour.ts uses provisional cue lists. Read the replies of the first run before trusting AMB/UNS verdicts.
5. **Intent is not checked.** "Answered as a revenue analysis" (and the other intents) has no observable rule in the workbook; only a finished response is checked.
6. **Per-customer net figures (PRO, 15 cases).** Operating and other expenses carry no customer in the GL, so per-customer net figures only subtract COGS.
7. **Cash, two readings.** Net cash change for 2026 is 4,063.52 by the cash flow statement and 2,001.00 by bank-account GL lines; both are accepted.
8. **Sign convention (100 cases).** Outflows and variances are compared by size (CAS 30, BUD 70) until a sign convention is agreed.
9. **Action requests (UNS, 30 cases).** "Send a payment", "file my tax return", "book a flight" and similar are only typed into the analytics chat; a refusal is expected. Review them if the app ever gains the ability to act.

## Risks for the overnight run

- **Daily token limit.** 800 questions in one night may exceed the account's limit; later questions would then fail Check 1 with a limit message.
- **Thumbs down on production.** Every failed run that got an answer marks that answer as a bad response in the app, so expect roughly one per failed question.
- **Session.** If the app ends the saved session during the run, the remaining questions fail at the first step (failure type "Sign-in or app load").
- **App outages.** Before each question the run waits up to 15 minutes for `/api/health` to recover (`HEALTH_MAX_WAIT_MS`), then continues; waits are recorded per question.
- **Recents.** Each question adds a chat to the account's Recents (800 per run); cleanup is TBD.
- **Disk.** A video is kept for each failed run (`video: 'retain-on-failure'`).

## Files in this build

| Change | Files |
|---|---|
| New features | features/profitability/002.feature, features/expense-analytics/003.feature, features/cash-flow/004.feature, features/budget-variance/005.feature, features/compound-diagnostics/006.feature, features/ambiguous-questions/007.feature, features/unsupported-questions/008.feature |
| Extended | features/revenue-analytics/001.feature (REV-051 to REV-100), docs/oracle/001.json, docs/normalizer/001.md, docs/reuse_map/001.md, docs/implementation/001.md, docs/validation/001.md |
| New pipeline docs | docs/normalizer/002.md to 008.md, docs/oracle/002.json to 006.json, docs/reuse_map/002.md to 008.md, docs/implementation/002.md to 008.md, docs/validation/002.md to 008.md, this report |
| Code | step-definitions/chat/chat.steps.ts, pages/chat/ChatPage.ts, utils/sqlOracle.ts, utils/chatBehaviour.ts (new), utils/finalRunReport.ts (new), utils/xlsxWriter.ts (new) |
| Config | playwright.config.ts (Excel reporter), package.json (`test:regression`), README.md (run section) |
| Generated | .features-gen/** (by `bddgen`) |

Nothing was committed or pushed. Still to do: Gate O (oracle review), Gate B (human review of the diff), the first overnight run, and CI/CD scheduling (planned later by the requester).

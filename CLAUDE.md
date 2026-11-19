# Testroid Project Guide

This file provides guidance to your AI coding assistant (Claude Code, GitHub Copilot, Cursor, or similar) when working with code in this repository.

> **Project:** eleviqAI · **Target:** https://www.eleviqai.com/ · **Suite:** full-suite · **Environment:** Production

## STOP: Confirm before writing or running any test code

**STOP: Do not write, generate, or run any test code before completing this confirmation step.** This applies to every AI coding assistant reading this file (Claude Code, GitHub Copilot, Cursor, or any other AGENTS.md-style consumer) — no exceptions for tools that default to acting immediately.

If a user's message contains a test scenario description, an epic reference (e.g. `EPIC-123`), a Jira ticket ID or link, a SPEC file, or a manually-written description — no matter how complete or detailed it looks, including a fully-written scenario or a set of hand-written test cases — treat it as likely input to Testroid's agent pipeline (Test Plan Generator → Test Case Generator → Normalizer → Gherkin Generator → Reuse Matcher → Implement → Validator, detailed later in this guide), not something to turn into ad hoc tests or code immediately.

**Do not treat inspection as safe.** Do not immediately inspect the project, check existing conventions, open source files "just to understand the ask," or draft an implementation plan before asking — checking conventions is implementation work in disguise and must also wait for confirmation, exactly like writing the test itself. The only acceptable first response to pipeline-shaped input is the confirmation question below.

- **Confirm before starting, and default to the full pipeline.** Ask something like: "This looks related to the Testroid pipeline — should I run the full pipeline starting from Test Plan Generation through Validation?" Don't start drafting a test plan, test cases, Gherkin, or code before the user answers.
- **Never infer a later starting stage from how the input looks.** A scenario that already reads like a finished test plan, a document that already reads like normalized test cases, or text that already reads like Gherkin is not by itself a reason to start anywhere but Stage 1. Detail or completeness in the input is not a signal to skip stages.
- **Only proceed on explicit confirmation.** Invoke the Pipeline Orchestrator (`docs/agents/PipelineOrchestratorAgent.md`) — which drives Stage 1 through Stage 7, pausing at the HITL gates in `docs/agents/README.md` — only once the user has explicitly confirmed running the full pipeline.
- **Before Implementation starts writing locators, check for Playwright MCP.** Once Stage 5 (Reuse Matcher) hands off and Stage 6 (Implement Agent) is about to begin, check whether `.mcp.json` at the project root registers a `playwright` MCP server (the file `testroid init`'s MCP setup writes). If it does, ask: "Playwright MCP is available for this project. Would you like me to use it to interactively inspect the live page and build locators from what's actually on the page, or use the framework's semantic auto-healing locator strategy without live inspection?" If `.mcp.json` has no `playwright` entry, skip this question and proceed directly with the semantic auto-healing strategy (`skills/testroid-locator-conventions/SKILL.md`), same as before.
- **This choice only affects how locators get built.** Whichever option is picked — or the automatic non-MCP path — the remaining stages continue normally; it doesn't change whether the rest of the pipeline runs.
- **Desktop Chrome only.** `playwright.config.ts` defines only the `chromium` (Desktop Chrome) project, and `npm test` / `npm run test:headed` pass `--project=chromium` (project owner's decision, 2026-11-19: no mobile runs). Stage 6 (Implement) and Stage 7 (Validator) verify against `chromium`. If a ticket clearly describes mobile-specific behavior — it mentions "mobile", "responsive", touch gestures (tap/swipe/pinch), a mobile viewport, or is explicitly tagged/labeled as a mobile test — don't add or run a mobile project on your own: say that mobile isn't configured and ask the user before adding a `mobile-chrome` project back to `playwright.config.ts`.
- **Only start later or run a single stage if the user explicitly says so, in their own words.** For example, "just generate the test plan," "just normalize these," "just write the feature file," "check what's already covered," or "skip straight to implementation using this existing feature." In that case run only the stage(s) requested via the relevant doc(s) in `docs/agents/` (`TestPlanGeneratorAgent.md`, `TestCaseGeneratorAgent.md`, `TestCaseNormalizerAgent.md`, `GherkinGeneratorAgent.md`, `ReuseMatcherAgent.md`, `ImplementAgent.md`, or `ValidatorAgent.md`), and don't silently continue into the next stage afterward without asking again. Never infer this shortcut on your own — it only applies when the user states it explicitly.
- **This only governs the decision to start.** Once the user confirms, the pipeline's own guardrails (`skills/guardrails/SKILL.md`) — traceability, anti-fabrication, HITL Gate A after the Test Plan, HITL Gate B before any merge — govern the run itself.

## What this repo is

Two things layered together:

1. A Playwright + TypeScript **BDD** UI automation suite generic enough to drive any site: Cucumber/Gherkin feature files (`features/**`) backed by step definitions (`step-definitions/**`) that call into a Page Object Model (`pages/**` + `locators/locatorConstants.ts`), compiled to executable Playwright specs by [`playwright-bdd`](https://github.com/vitalets/playwright-bdd), against whatever `BASE_URL` is configured to. Treat the configured AUT as a shared, non-isolated environment unless it's verifiably private/disposable. **This project automates UI flows only** — there is no API or native mobile app automation layer.
2. **Testroid's agent pipeline** — a linear, seven-stage Claude agent pipeline (Test Plan Generator → Test Case Generator → Normalizer → Gherkin Generator → Reuse Matcher → Implement → Validator) that turns an Epic + SPEC file, or manually authored test cases, into validated, merge-ready BDD automation for this same suite.

Before touching anything under `docs/agents/`, `features/**`, `step-definitions/**`, `pages/**`, or `locators/locatorConstants.ts` as part of pipeline work, read `docs/agents/README.md` and load the `guardrails` Claude Code Skill (all stages), the `testroid-bdd-conventions` Skill (Stage 4/Gherkin Generator, Stage 5/Reuse Matcher, Stage 6/Implement), and the `testroid-locator-conventions` Skill (Stage 5/Reuse Matcher and Stage 6/Implement) — all under `skills/`. Key rules from there worth internalizing up front:

- No agent commits, pushes, merges, deploys, or publishes. A Stage 7 Pass is a recommendation, never an auto-merge trigger — a human always reviews the diff.
- Stage 4 (Gherkin Generator) may only write to `features/**`.
- Stage 6 (Implement) may only write to `step-definitions/**`, `pages/**`, and `locators/locatorConstants.ts` — never `features/**` (Stage 4's), `.features-gen/**` (a `bddgen` build artifact), `playwright.config.ts`, `global-setup.ts`, `global-teardown.ts`, `.env`, `package.json`, or CI files without explicit separate instruction.
- Unknowns are marked `TBD`, never fabricated (business data, credentials, locators, Gherkin steps, expected results, or verdicts).
- Treat the configured AUT as a shared, non-isolated environment unless it's verifiably private/disposable — no test may cause irreversible, costly, or disruptive side effects beyond what the project's existing example specs already establish as acceptable. If the AUT returns intermittent errors independent of test correctness, don't loosen an assertion to paper over that; report it as an observed live-environment failure instead.

## Commands

```bash
npm install                    # install dependencies
npx playwright install         # install browsers (one-time)

npm run bddgen                 # compile features/** + step-definitions/** into Playwright specs under .features-gen/
npm test                       # bddgen, then run the full suite headless — desktop Chrome (chromium) only
npm run test:headed            # bddgen, then run the full suite headed — desktop Chrome only
npm run test:chrome            # bddgen, then run chromium only (desktop; same as npm test)
npm run test:report            # open the last HTML report
npm run typecheck              # tsc --noEmit
npm run clean:logs             # delete the logs/ directory

npx playwright test --grep @smoke                           # run by Gherkin tag (@smoke, @regression, @TC-01, @EPIC-123-45, ...)
npx playwright test -g "<scenario name>"                    # run a single scenario by name
```

Run `npm run bddgen` (or any `npm test*` script, which runs it first) after editing a `.feature` or step definition file — raw `npx playwright test` runs whatever was last generated. `bddgen` fails on any undefined or ambiguous step. There is no separate lint script — `npm run typecheck` is the closest correctness gate besides running the tests themselves.

Runtime behavior (base URL, headless, timeouts, retries, workers) is controlled by `.env`, read in `playwright.config.ts` (`BASE_URL`, `HEADLESS`, `SLOW_MO`, `TIMEOUT`, `RETRIES`, `WORKERS`, `STORAGE_STATE`). `baseURL` defaults to a placeholder localhost value and is meant to be overridden per project via `.env`. One project: `chromium` (`devices['Desktop Chrome']`), running the `bddgen`-generated specs from `.features-gen/`. There is no mobile project: `mobile-chrome` (Pixel 5 emulation) is not configured, and the project owner decided on 2026-11-19 that test runs are desktop Chrome only. `fullyParallel: false`, retries default to `0`.

## Architecture

**Tests are authored as Gherkin, not as hand-written specs.** A `features/{epic}/{ticketNo}.feature` file describes behavior in declarative Given/When/Then steps, with `@{ticketNo}` on the `Feature:` line and `@{testCaseId}`/`@{reqId}` (plus `@smoke`/`@regression` etc.) on each `Scenario:`. Each step is matched by a step definition in `step-definitions/{module}/*.steps.ts`, registered via `createBdd(test)` where `test` comes from `fixtures/testFixture.ts`. Step definition bodies only call Page Object methods — never `page.*` directly. `bddgen` compiles the two into Playwright specs under `.features-gen/**` — a build artifact that is never hand-edited. See `skills/testroid-bdd-conventions/SKILL.md`.

**Locators are never inline.** Every element is an ordered `LocatorStrategyList` (`locators/locatorConstants.ts`), an array of fallback strategies tried in order — role → label/placeholder/text → testId → css → xpath (most semantic/robust first, most brittle last). Parameterized locators (e.g. `productCard(name)`, `categoryLink(category)`) are functions returning a `LocatorStrategyList`, not string templates. A Page Object or step definition must never hold a raw CSS/XPath selector — it belongs in `locatorConstants.ts`.

**Every Page Object extends `pages/BasePage.ts`** and only touches `page` through its protected primitives: `click`, `fill`, `selectOption`, `check`, `uncheck`, `hover`, `waitForElement`, `scrollIntoView`, `getText`, `getAllTexts`, `isVisible`, `expectVisible`/`expectHidden`/`expectText`, `expectImageLoaded`/`expectAllImagesLoaded`, `assertCurrentUrl`/`assertTitle`, `takeScreenshot`, `acceptDialog`, `withRetry`. `findElement`/`findElements` walk a strategy list and return the first match that resolves within `timeoutMs` (default 5000ms), wrapped in `retryAsync` (`utils/retryHelper.ts`). All UI actions log through `logger.*` (`utils/logger.ts`, Winston-backed) — never `console.log`.

New Page Objects go in `pages/{module}/*.ts`, each extending `BasePage`, with their locators added to `locators/locatorConstants.ts`. `pages/sample/SampleHomePage.ts`, `features/sample/sample-homepage.feature`, `step-definitions/sample/sample-homepage.steps.ts`, and the `sample` group in `locatorConstants.ts` are an illustrative placeholder proving the BDD wiring end to end — not real coverage of the target site.

**`fixtures/testFixture.ts`** builds `test` on `playwright-bdd`'s base `test` (required — `createBdd()` throws if bound to a `test` that didn't originate from `playwright-bdd`) and re-exports `expect`. Its `testLifecycle` auto fixture runs around every scenario with no opt-in needed: it logs test start/end and pass/fail status, attaches network/console listeners (`utils/networkHelper.ts`/`utils/consoleHelper.ts`), and forces a 1440x900 viewport only on desktop projects (`testInfo.project.use.isMobile` falsy), so a mobile project's emulated viewport would not be overridden if one were ever added back. Register one fixture per Page Object here as you add them (see the doc comment in the file) — step definitions can then receive them as fixtures instead of constructing Page Objects inline. Because the file exports an extended `test`, it's listed in `defineBddConfig`'s `steps` option in `playwright.config.ts` so `bddgen` can import it into generated specs.

`utils/` holds cross-cutting helpers: `logger.ts` (Winston logger with named channels like `logger.ui.click`, `logger.execution.testStart`, `logger.application.startup`), `retryHelper.ts` (`retryAsync`), `randomData.ts` (dynamic user/purchase data — `@faker-js/faker`), `assertionHelpers.ts`, `screenshotHelper.ts`, `executionHelper.ts`, `constants.ts` (`PurchaseData` type, etc.), `accessibilityHelper.ts` (axe-core scans).

`global-setup.ts` / `global-teardown.ts` only log framework startup/shutdown — no environment provisioning happens there.

## Testroid pipeline reference

Full details, per-stage docs, naming conventions (`{epicNo}`, `{ticketNo}`, `{module}`, `{epic}`), the traceability contract, HITL gates, and the feedback-loop routing table all live in `docs/agents/README.md` — read it rather than re-deriving pipeline behavior. Output locations:

| Artifact | Path |
|---|---|
| Test Plan | `docs/Test Plans/{ticketNo}_test_plan.md` |
| Detailed Test Cases | `docs/test_cases/{ticketNo}.md` |
| Normalized Test Cases | `docs/normalizer/{ticketNo}.md` |
| SQL Oracle (Stage 3.5, chat/data tickets only) | `docs/oracle/{ticketNo}.json` |
| Gherkin Feature File (Stage 4) | `features/{epic}/{ticketNo}.feature` |
| Reuse Mapping Report | `docs/reuse_map/{ticketNo}.md` |
| Implementation code + summary (Stage 6) | `step-definitions/{module}/*.steps.ts`, `pages/{module}/*.ts`, `locators/locatorConstants.ts`, `docs/implementation/{ticketNo}.md` |
| Validation Report | `docs/validation/{ticketNo}.md` |
| Issues workbook for dev (Chat Issues + Other Issues sheets) | `docs/issues/*.xlsx` |

For chat/data tickets, Stage 3.5 (SQL Oracle Generator, `docs/agents/SqlOracleAgent.md`) runs between Stage 3 and Stage 4, and Gate O (oracle review) applies. See `docs/agents/README.md`.

Invoke the **Pipeline Orchestrator** (`docs/agents/PipelineOrchestratorAgent.md`) for end-to-end runs rather than the stage agents one at a time by hand.

## Reporting

Active reporter (chosen at `testroid init`): **Ortoni Report**. It's wired into `playwright.config.ts`'s `reporter: [...]` array alongside the always-on `list`/`html`/`junit`/`json` reporters.

- **Ortoni Report** — `utils/ortoniAutoOpenReporter.ts` opens `ortoni-report/index.html` automatically after any local run (skipped in CI via `process.env.CI`). No extra command needed.
- **Allure Report** — `utils/allureReportGenerator.ts` regenerates the static report into `allure-report/` after every run, but Allure's own viewer can't auto-open the way Ortoni does (it needs a local server) — run `npm run report:allure` after tests to generate + open it.

To switch, re-run `testroid init` and pick the other option, or edit `playwright.config.ts`'s `reporter: [...]` array directly.

## Reports

- HTML report: `playwright-report/` (open via `npm run test:report`)
- JUnit: `test-results/junit.xml`
- JSON: `test-results/results.json`
- Screenshots/traces/videos on failure: `test-results/artifacts/`

# Testroid

AI-powered, multi-agent Playwright BDD automation framework using TypeScript, Cucumber/Gherkin feature files (via [`playwright-bdd`](https://github.com/vitalets/playwright-bdd)), and the Page Object Model. This project automates UI flows only.

## Project Setup

Prerequisites:
- Node.js 18 or later
- npm

Install dependencies:
```bash
npm install
```

Install Playwright browsers:
```bash
npx playwright install
```

`.env` holds the run settings and is committed: the target site (`BASE_URL=https://app.eleviqai.com/`) and the path of the saved sign-in session (`STORAGE_STATE=.auth/app-session.json`). `TEST_USER_EMAIL` and `TEST_USER_PASSWORD` are left blank on purpose: no test reads them, and no test types a password.

### Sign in once (saved session)

The chat tests start already signed in. They load the browser session saved in `.auth/app-session.json` (`STORAGE_STATE` in `.env`, passed to `storageState` in `playwright.config.ts`). That file holds your sign-in cookies, so it is not in the repo (`.gitignore` keeps `.auth/` out). Everyone who clones the repo saves their own:

1. From the project folder, run this. It opens Google Chrome at the app:
   ```bash
   npx playwright open --channel chrome --save-storage=.auth/app-session.json https://app.eleviqai.com/
   ```
2. Sign in by hand in that window, with an EleviqAI account that has QuickBooks data connected and synced.
3. Once the app shows its Overview page, close the window. Playwright writes `.auth/app-session.json` as the window closes.

If Google Chrome isn't installed, leave out `--channel chrome` to use Playwright's own Chromium. When the session expires, the app shows its sign-in page instead of the Overview page, so each scenario's first step fails waiting for the Overview button: run the command again to save a fresh session. Never commit `.auth/`.

To re-run `testroid init` non-interactively (e.g. in CI, or to quickly re-scaffold), pass `--yes`/`-y` with `--url`:

```bash
npx testroid init --yes --url https://example.com
```

This skips every prompt and uses sensible defaults (Smoke suite, QA environment, Playwright MCP enabled, Allure reporting, whichever AI assistant config is already detected) — the base URL is the one thing it can't default, so `--url` is required unless `BASE_URL` is already set in `.env`.

To cleanly remove what Testroid added — the reverse of `testroid init` — run `testroid undo`:

```bash
npx testroid undo
```

This only works inside a project that has a `.testroid-manifest.json` at its root (written by the `init` run that set the project up, recording exactly what it added). `testroid undo` reads it, shows you a full summary of what's about to happen, and asks for confirmation before deleting anything:
- every file/folder Testroid added
- the specific `package.json` dependency/script keys Testroid added — never a pre-existing key, even one with the same name
- for `.mcp.json` and `playwright.config.ts`: the whole file if Testroid created it fresh (already covered by the files/folders above), or just the entry Testroid added if it was merged into a file that already existed — never the rest of that file

Nothing that existed before Testroid touched this project is removed. If `.testroid-manifest.json` isn't present (already used, or this project wasn't set up by Testroid), it says so and exits without doing anything.

Run the full suite:
```bash
npm test
```

`npm test` first runs `bddgen`, which compiles `features/**/*.feature` + `step-definitions/**` into Playwright specs under `.features-gen/` (a gitignored build artifact — never edit it by hand), then runs the scenarios in desktop Chrome only (the `chromium` project; `npm test` passes `--project=chromium`). This project has no mobile project: `mobile-chrome` (`devices['Pixel 5']` emulation) is not configured, by the project owner's decision on 2026-11-19. Run `npm run bddgen` yourself before a raw `npx playwright test` after editing a feature or step definition. If a ticket needs mobile coverage, ask before adding a `mobile-chrome` project back to `playwright.config.ts`.

### Full regression: all 800 chat questions

Every chat question scenario is tagged `@regression` (8 feature files, 100 questions each: REV, PRO, EXP, CAS, BUD, COM, AMB, UNS). Run them all with:

```bash
npm run test:regression
```

- **Run time:** about 10 hours. Scenarios run one at a time with a 20 s pause between them (`SCENARIO_GAP_MS`, in milliseconds). In PowerShell, `$env:SCENARIO_GAP_MS = '10000'; npm run test:regression` shortens the pause to 10 s.
- **One category:** `npx playwright test --project=chromium --grep @002` (tickets `@001` to `@008`), or one question: `--grep @PRO-014`.
- **Before the run:** the saved session in `.auth/app-session.json` must still be signed in (see "Sign in once" above), and the computer must not sleep during the run.
- **Results:** `test-results/final-report/EleviqAI_Final_Report_latest.xlsx` has one row per question (verdict, the chat's answer, why it failed, thumbs down). The workbook is rewritten every 25 scenarios, so a stopped run still leaves a report. The Ortoni and HTML reports are produced as usual.
- **List without running:** `npx playwright test --list --project=chromium --grep @regression --reporter=list`. Keep `--reporter=list`, otherwise the Ortoni reporter rewrites `ortoni-report/index.html` with an empty run.
- Readiness details and open items: `docs/validation/800_question_suite_readiness.md`.

### Nightly run on GitHub Actions

`.github/workflows/nightly-800.yml` asks all 800 questions on GitHub's machines, so no computer has to stay on.

- **When:** every night at 9:00 pm India time, from 25 November to 8 December 2026 (`FIRST_NIGHT` and `LAST_NIGHT` at the top of the workflow; outside these dates the schedule does nothing). GitHub can start it some minutes late. Two categories run at a time, so a run takes about 6 to 7 hours.
- **The Excel:** open the run on the repository's Actions tab. `EleviqAI_Final_Report_<date>_<time>.xlsx` is under Artifacts and linked in the summary, and is kept for 30 days. It has the same five sheets as a local run and always lists every question; if a category's job delivers nothing, its questions are listed as Not run.
- **Green or red:** a run is green when the questions were asked, also when some answers are wrong. Red means it could not do its work, for example because the sign-in expired, the app was down or Cloudflare did not let GitHub's machine in; the run's page says why.
- **By hand:** Actions tab > Nightly 800 questions > Run workflow, then `trial` (10 questions) or `all`. A push to the branch `nightly-800` also runs the trial, or all 800 if the commit message contains `[run-800]`. Only one run goes at a time; the next one waits.
- **Sign-in:** the repository secret `APP_SESSION_JSON` holds the content of `.auth/app-session.json` (see "Sign in once" above). It lasts about 30 days; after that, sign in again and paste the new file into the secret. No password is stored on GitHub.
- **Kept out of public view:** the HTML, Ortoni, JUnit and JSON reports, screenshots, videos and traces are not made on GitHub (`playwright.ci.config.ts`), and the `ci/` scripts hide cookies, tokens and email addresses in the log and the Excel. The Cloudflare cookie from your own browser is not used.

## Structure

- `docs/agents/` — multi-agent test generation pipeline (plan, generate, normalize, write Gherkin, reuse-match, implement, validate), run end-to-end as one continuous flow by the Pipeline Orchestrator rather than stage-by-stage — see `docs/agents/README.md`
- `features/` — Gherkin `.feature` files describing behavior in Given/When/Then steps, tagged for traceability (`@{ticketNo}`, `@{testCaseId}`, `@{reqId}`) and selection (`@smoke`, `@regression`)
- `step-definitions/` — step definitions matching each Gherkin step, delegating to Page Object methods
- `pages/` — Page Object Model classes for your site, all extending `pages/BasePage.ts`
- `locators/` — `locatorConstants.ts`, the auto-healing locator definitions your Page Objects use
- `fixtures/` — `testFixture.ts`, the shared `test` that step definitions bind to, with automatic per-test logging
- `ci/` — scripts of the nightly GitHub Actions run: prepare the sign-in, check the app, hide private values, join the Excel
- `skills/` — Claude Code Skills documenting this framework's conventions
- `docs/` — agent documentation and generated pipeline output

## Auto-healing locators

Every element `pages/BasePage.ts` interacts with is described as an ordered **`LocatorStrategyList`** — an array of fallback strategies — instead of a single selector:

```ts
export const locatorConstants = {
  login: {
    submitButton: [
      { kind: 'role', role: 'button', name: 'Log in' },   // tried first: most semantic
      { kind: 'text', text: 'Log in' },
      { kind: 'css', selector: '#login-button' },          // last resort: most brittle
    ] as const,
  },
} as const;
```

`BasePage`'s primitives (`click`, `fill`, `findElement`, etc.) walk the list in order and act on the first strategy that actually resolves on the page. If a later markup/CSS change breaks the primary strategy, the Page Object keeps working off a fallback instead of failing outright — no runtime AI/ML involved, just an ordered list of alternatives checked at test time. Order strategies most-semantic-first (`role`/`label`/`placeholder`/`text`) and most-brittle-last (`css`/`xpath`), and add your own site's locators to `locators/locatorConstants.ts` following that pattern.

Every Page Object should extend `pages/BasePage.ts` to get this behavior automatically, plus its shared primitives (`click`, `fill`, `selectOption`, `expectVisible`, `expectText`, `assertCurrentUrl`, `takeScreenshot`, `withRetry`, ...) and Winston-backed logging via `utils/logger.ts`.

## Skills

`skills/` ships three [Claude Code Skills](https://docs.claude.com/en/docs/claude-code/skills) documenting this framework's own conventions, so an agent working in a scaffolded project can load them instead of re-deriving the patterns:

- `guardrails` — shared traceability contract, anti-fabrication rule, HITL gates, and safety rules for the multi-agent pipeline in `docs/agents/`.
- `testroid-bdd-conventions` — Gherkin style, tag-based traceability, the step definition → Page Object convention, and the `bddgen` build step.
- `testroid-locator-conventions` — the auto-healing `LocatorStrategyList` pattern above, `BasePage` usage, and Page Object conventions.

## AI coding assistant config

`testroid init` asks which AI coding assistant you use and writes the same generated guidance (project stack, the agent pipeline, reporting, conventions) to whichever location that tool expects — never overwriting a file that's already there:

| Choice | File written |
|---|---|
| Claude Code | `CLAUDE.md` (project root) |
| GitHub Copilot | `.github/copilot-instructions.md` |
| Cursor | `.cursor/rules/testroid.mdc` (with Cursor's Project Rules frontmatter — `description`/`globs`/`alwaysApply`) |
| Other | `AGENTS.md` (project root) — the tool-agnostic convention several AI coding assistants are converging on |
| Skip | Nothing is written; add one later by re-running `testroid init` |

If a re-run detects one of these files already present, it pre-selects that tool as the prompt's default. The prompt defaults to Claude Code when none are detected.

## Reporting

`testroid init` asks which test report you want — **Allure Report** or **Ortoni Report** — installs the packages it needs, and wires it into `playwright.config.ts`'s `reporter: [...]` array alongside the always-on `list`/`html`/`junit`/`json` reporters.

- **Ortoni Report** (`ortoni-report`) — `utils/ortoniAutoOpenReporter.ts` opens `ortoni-report/index.html` automatically after every local run (skipped in CI). Nothing else to run.
- **Allure Report** (`allure-playwright` + `allure-commandline`) — `utils/allureReportGenerator.ts` regenerates the static report into `allure-report/` after every run, but Allure's own viewer starts a local server, so it can't auto-open the way Ortoni does. Run `npm run report:allure` after tests to generate + open it.

Switch later by re-running `testroid init` and picking the other option, or by editing `playwright.config.ts`'s `reporter: [...]` array directly.

## Network request logging

Every first-party network request/response (same domain as `BASE_URL`) is logged via `logger.network`/`logger.api` (`utils/networkHelper.ts`) during a test run. Third-party requests — analytics/ads/tracking beacons like Facebook Pixel, Google Ads, or Clevertap, which a real commercial site fires constantly and which aren't part of what you're testing — are still allowed to execute normally but are **not** logged by default, to keep the log readable.

By default the log stays deliberately bare — one line per completed request with just enough to scan for success/failure, no URL:
```
[NETWORK] GET → 200 (152ms)
[NETWORK] POST → 201 (110ms)
[NETWORK] Failed request: GET /inventory → 500 (343ms)
```
A failed request still shows its last path segment (e.g. `/inventory`) as a minimal hint of what failed, since a bare status code isn't enough to tell same-status failures apart.

To log third-party requests too, set in `.env`:
```
LOG_THIRD_PARTY_REQUESTS=true
```

For full detail — the full URL on every line, plus POST payloads and JSON response bodies — set in `.env`:
```
LOG_VERBOSE_NETWORK=true
```
This also disables the noise filters and body/path truncation, so everything logs in full regardless of domain, pattern match, or size. Use it for deep debugging, not everyday runs.

## Playwright MCP (optional)

`testroid init` offers to install the [Playwright MCP server](https://github.com/microsoft/playwright-mcp) (`@playwright/mcp`) as a dev dependency and register it in `.mcp.json`. MCP (Model Context Protocol) lets Claude Code — or any other MCP-aware AI client — drive a real browser directly: navigate, click, fill forms, and read the page's accessibility tree as part of a conversation, without you writing or running a Playwright script yourself.

For a Testroid project, that's useful for things like exploring an unfamiliar page to figure out what locators/roles to add to `locators/locatorConstants.ts`, reproducing a flaky test interactively, or letting an agent verify a flow live before it writes the corresponding step definitions. This is browser automation for the AI assistant itself, not part of the test suite that runs in CI.

When `.mcp.json` registers the `playwright` server, the pipeline's own generated guidance asks — right before Implementation starts writing locators — whether to use it to inspect the live page interactively or stick with the semantic auto-healing strategy without live inspection. No `.mcp.json` entry means no question: it proceeds straight to the auto-healing strategy.

Say yes at the `testroid init` prompt to opt in (installs `@playwright/mcp` and writes/merges the `playwright` entry into `.mcp.json`), or skip it and add it later with:

```bash
npm install -D @playwright/mcp@0.0.79
```

then register it in `.mcp.json`:

```json
{
  "mcpServers": {
    "playwright": {
      "command": "npx",
      "args": ["@playwright/mcp@0.0.79"]
    }
  }
}
```

<!-- @playwright/mcp version pinned to avoid breaking changes — review periodically, keep in sync with src/mcp.ts -->

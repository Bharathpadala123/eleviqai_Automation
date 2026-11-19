---
name: testroid-bdd-conventions
description: Use when writing or scanning Gherkin feature files (features/**) and step definitions (step-definitions/**) — Testroid Stage 4 (Gherkin Generator Agent), Stage 5 (Reuse Matcher), and Stage 6 (Implement Agent). Covers Gherkin style, the {testCaseId}/{reqId} tag-based traceability mechanism, the step-definitions/** → pages/** call convention via playwright-bdd, and the bddgen build step.
---

# Testroid BDD (Gherkin/Cucumber) Conventions

Test cases are authored as Gherkin (`features/**`) and implemented as step definitions (`step-definitions/**`) that call into the existing Page Object Model (`pages/**` + `locators/locatorConstants.ts`) — POM stays the action layer, Gherkin/Cucumber becomes the layer on top of it. Compilation to executable Playwright specs is handled by [`playwright-bdd`](https://github.com/vitalets/playwright-bdd), not `@cucumber/cucumber`'s own runner — Playwright's test runner, reporters, and fixtures stay in control. For the pipeline-wide traceability/HITL/anti-fabrication rules that also apply here, see [[guardrails]]. For Page Object/locator conventions underneath the step definitions, see [[testroid-locator-conventions]].

## Why this exists

Stage 4 (Gherkin Generator Agent) converts a normalized test case into a Gherkin scenario; Stage 5 (Reuse Matcher) then matches that scenario's steps against existing step definitions and Page Objects before Stage 6 (Implement Agent) writes anything new. This only works if every stage agrees on one Gherkin style and one step-definition pattern — this skill is that agreement.

This project automates UI flows only — there is no API or native mobile app track, so every normalized test case goes through Gherkin. Mobile *web* coverage (`Platform: Mobile`/`Both`) still applies: it's the same Gherkin + step definitions run under the `mobile-chrome` Playwright project, not a separate track.

## Folder & naming convention

| Artifact | Path | Written by |
|---|---|---|
| Gherkin feature file | `features/{epic}/{ticketNo}.feature` | Stage 4 (Gherkin Generator Agent) |
| Step definitions | `step-definitions/{module}/*.steps.ts` | Stage 6 (Implement Agent) |
| Page Objects | `pages/{module}/*.ts` (unchanged) | Stage 6 |
| Locators | `locators/locatorConstants.ts` (unchanged) | Stage 6 |
| Generated Playwright spec | `.features-gen/**` (build artifact) | `bddgen` CLI — never hand-written by any stage |

`{epic}`/`{ticketNo}`/`{module}` follow the pipeline's existing [Naming Conventions](../../docs/agents/README.md#naming-conventions).

## Gherkin style (Stage 4)

- **Declarative, business-readable steps** — describe *what* the user/system does, never *how* the UI implements it. Write `When the shopper adds the product to the cart`, never `When the shopper clicks the "#add-to-cart" button`. Implementation mechanics (selectors, click vs. tap) belong in the step definition/Page Object, not the feature file.
- **Given / When / Then mapping from a normalized test case**:
  - `preconditions` → one `Given` (plus `And` for additional preconditions)
  - the case's primary triggering `action` → one `When`
  - every subsequent `action` step → `And` (still in the When phase)
  - every `expectedResult` → `Then` (plus `And` for additional expected results)
- **One `Scenario` per normalized test case**, titled from the case's `title` field verbatim or near-verbatim — never invent a new scenario not present upstream.
- **`Scenario Outline` + `Examples`** only when the *normalized* test case already models the same steps repeated over a data table (its `testData` is literally a list of rows) — never collapse distinct normalized cases into one Outline, and never invent example rows not present in `testData`.
- **`Background`** for a `Given` shared by every scenario in a `.feature` file (e.g. "the shopper is logged in") — only when two or more scenarios in the same file genuinely share it; don't force it for a single-scenario file.
- Step text must still be traceable word-for-word in spirit to the normalized case's `action`/`expectedResult` — rephrasing for declarative style is expected, inventing new behavior or dropping a documented step is not (same anti-fabrication rule as every other stage, see [[guardrails]]).

## Traceability tags

Every `Scenario` carries its IDs as Cucumber tags — the machine-readable mechanism that survives into the generated spec's test title and Stage 7's verdict table:

```gherkin
@EPIC-123-45
Feature: Checkout

  @TC-01 @RQ-01 @smoke
  Scenario: Shopper completes checkout with a valid card
    Given the shopper has items in the cart
    When the shopper submits valid payment details
    Then the order confirmation page is displayed
```

- `@{ticketNo}` on the `Feature:` line.
- `@{testCaseId}` and `@{reqId}` on every `Scenario:` line, exactly as assigned in Stage 1 through Stage 3 — never altered, never guessed. If `reqId` is `TBD` (manual-entry path), omit the `@RQ-...` tag rather than fabricating one.
- The normalized case's automation tags (`@smoke`, `@regression`, etc.) also go on the `Scenario:` line — `playwright-bdd` turns Gherkin tags into Playwright tags, so `npx playwright test --grep @smoke` keeps working exactly as before.

## Step definitions (Stage 6)

- Register steps with `createBdd(test)` from `playwright-bdd`, where `test` is imported from `fixtures/testFixture.ts` — **not** a bare `createBdd()` and **not** `@playwright/test`'s own `test`. `fixtures/testFixture.ts`'s exported `test` is itself built on `playwright-bdd`'s `test as base` (see the comment in that file) specifically so this works; importing `test` from anywhere else throws `createBdd() should use 'test' extended from "playwright-bdd"` at `bddgen` time.
- A step definition body does the minimum needed to call a Page Object method — construct (or receive via a registered fixture) the relevant `pages/{module}/*.ts` class and call its `BasePage`-derived methods. **Never call `page.*` directly inside a step definition** — that logic belongs in the Page Object, same rule as specs under [[testroid-locator-conventions]].
- One `.steps.ts` file per module, mirroring the Page Object it backs: `step-definitions/{module}/*.steps.ts` calls into `pages/{module}/*.ts`.
- A step's registered pattern (the string/regex passed to `Given`/`When`/`Then`) should match the Gherkin step text closely enough that Stage 5 can do exact or near-exact text matching — avoid overly generic catch-all patterns that could silently match an unrelated future scenario.
- Parameters in Gherkin steps (`{string}`, `{int}`, etc.) map to typed step-definition callback parameters via Cucumber expressions — never parse the raw step text manually.

## Build step: `bddgen`

- `.feature` + `step-definitions/**` are the authored source; the Playwright spec Playwright actually runs is a **generated build artifact** under `.features-gen/**` (gitignored), produced by running `npx bddgen` (aliased as `npm run bddgen`). The project's `test`/`test:headed`/`test:chrome` scripts (desktop Chrome only) already run `bddgen` first — never hand-edit anything under `.features-gen/**`; fix the step definition or feature file and regenerate instead.
- `bddgen` fails loudly on an **undefined step** (a Gherkin step with no matching step definition) or an **ambiguous step** (more than one step definition matches) — treat either as a hard failure to fix before claiming Stage 6 complete, never a reason to skip generation.

## Reuse matching for BDD (Stage 5)

In addition to the existing UI matching heuristics in [[testroid-locator-conventions]], Stage 5 also treats an **existing step definition whose registered pattern already matches (exactly, or via an equivalent Cucumber expression) the Gherkin step text Stage 4 wrote** as part of the Method/responsibility overlap heuristic — a matched step definition that already delegates to the right Page Object method is itself evidence of Full/Partial Reuse, cited by file + step pattern (e.g. `step-definitions/cart/cart.steps.ts: "the shopper adds the product to the cart"`), the same way a matched Page Object method is cited today.

## What does *not* change

- Page Object / `BasePage` primitives, `LocatorStrategyList` fallback ordering, `fixtures/testFixture.ts`, `logger.*` usage, and mobile web emulation (`mobile-chrome`) conventions are unchanged — see [[testroid-locator-conventions]] for all of it. BDD only changes the authoring surface above the Page Object layer (Gherkin + step definitions instead of a hand-written `test()`/`spec.ts`).

# SQL Oracle Spike: REV-001 to REV-003 (plus one probe)

Run date: 2026-11-18, against production (`app.eleviqai.com`), Data Bridge Agent connected.
Data source: `QuickBooks - IES Sandbox Company US 6de8 Parent` (DuckDB v1.5.5 on the desktop agent).

## How each side can be read

| Side | Where | What it gives |
|---|---|---|
| Chat answer | `GET /api/conversations/{id}`; assistant message `content` is JSON | `prefix` (headline text), `data` (rendered figure), `sql` (query the chat ran), `result` (rows it got), `metrics` |
| Chat SQL (UI) | "View SQL" under each answer | The same SQL as the API `sql` field |
| Oracle SQL | `POST /api/data-explorer/query` body `{connection, sql, limit}` | `{columns, rows, truncated, elapsed_ms}`; non-SELECT returns 400 "Only SELECT statements can be run here." |

Both endpoints use the signed-in session, so a Playwright test with `.auth/app-session.json` can call them through `page.request`.
Note: the "Data Explorer" sidebar item disappears as soon as "New Chat" is opened, and comes back once "Overview" is clicked (it also shows on Settings and on Data Explorer itself). Confirmed by the owner and re-checked 2026-11-18. UI tests must navigate via Overview before clicking it; the oracle checks avoid this by calling the query endpoint directly.
Note: in the Data Explorer SQL editor, Ctrl+A types a literal "a" instead of selecting all, so the query fails with "Only SELECT statements can be run here." Tests should call the query endpoint directly instead of typing into the editor.

## Data coverage

`vw_pnl_monthly` has 6 rows: 2026-04 to 2026-09. `fact_invoice` covers 2026-05 to 2026-08. `dim_date` spans all of 2026.
Every "this month" question (today = Nov 2026) therefore has **no data**; the correct answer is "no sales recorded".

| Month | P&L revenue (`vw_pnl_monthly`) | Invoice net (`fact_invoice` gross − discount) | Invoice incl. tax |
|---|---|---|---|
| 2026-04 | 0 | — | — |
| 2026-05 | 391.25 | 391.25 | 401.75 |
| 2026-06 | 521.00 | 521.00 | 543.00 |
| 2026-07 | 942.00 | 942.00 | 992.79 |
| 2026-08 | **8,346.52** | **7,757.05** | 8,115.59 |
| 2026-09 | 0 | — | — |

## Results

| Case | Question | Chat shows | Chat SQL result | Chat SQL re-run in Data Explorer | Independent oracle | Verdict |
|---|---|---|---|---|---|---|
| REV-001 | Show total sales for this month. | "Total sales for this month: Revenue: **None**" | `[{revenue: null}]` | `null` | 0 P&L rows, 0 invoices for Nov 2026 | Figures match (no data). Wording "None" is a UX issue: it should say no sales / $0 |
| REV-002 | What was total sales during this month? | "**network error**"; retry: "Same as before — the system returned a network error…" | none (no SQL ran) | n/a | no data | **Fail**: no answer. Second time REV-002 hit "network error" (also seen in the earlier automated run) |
| REV-003 | Break down total sales by month for this month. | "Month: 2026-11 · Revenue: **$0**" | month spine 2026-11 → 0 | (same view, 0 rows) | no data | Figures match. Inconsistent with REV-001 (`$0` vs `None` for the same month) |
| Probe | Show total sales for August 2026. | Headline "Total sales for August 2026: **$1,250,000**"; figure "Revenue: **$8,346.52**" | `8346.52` | `8346.52` | P&L 8,346.52 (invoices 7,757.05) | **Fail**: headline figure $1,250,000 does not exist in the data; the rendered figure is correct |

## What this means for the design

Each test case should make three separate checks:

1. **Consistency**: re-run the chat's own `sql` in Data Explorer and confirm it returns the chat's `result`.
2. **Faithfulness**: every number in the text the user sees (`prefix` and `data`) must appear in `result`. The probe failed this check: the headline said $1,250,000 although the result was 8,346.52.
3. **Correctness**: run a separate oracle query, reviewed by a person, and confirm it matches `result`. This catches the chat choosing the wrong table or definition.

## Decisions needed from the owner

- **D-A: definition of "sales"**: P&L revenue (`vw_pnl_monthly.revenue`, which the chat uses) or invoiced amounts? They differ in August (8,346.52 vs 7,757.05).
- **D-B: expected answer when there is no data**: "None", "$0", or an explicit "no sales recorded" message? The chat currently gives both "None" and "$0".
- **D-C: "this month" cases**: the data ends in Sep 2026, so all of REV-001 to REV-100 written as "this month" only test the empty-data path. Keep them as they are (expected = no data), or also cover months that have data?

# SQL Oracle Generator Agent (Stage 3.5)

Added 2026-11-18 at the owner's request. It runs after Stage 3 (Normalizer) and before Stage 4 (Gherkin Generator), and only for tickets whose expected result is a figure in the connected database (EleviqAI chat questions).

## Purpose

Each chat question gets an **independent SQL query** (the oracle) that computes the correct answer straight from the database. At test time, Stage 6 code compares the chat's answer against it. This gives every case an observable, checkable expected result instead of "answered as a revenue analysis".

The oracle must be written **from the schema and the agreed definitions, never copied from the chat's own SQL**. If the oracle is the chat's own query, both sides make the same mistake and agree.

## Inputs

- `docs/normalizer/{ticketNo}.md`: the cases and their questions.
- The live schema, read through Data Explorer (`POST /api/data-explorer/query`; SELECT only; DuckDB dialect).
- The owner's metric definitions (decisions D-A to D-C in `docs/oracle/spike_REV-001-003.md`). Any decision not yet made is applied provisionally and marked `TBD` in the case's `notes`.

## Output

`docs/oracle/{ticketNo}.json`, read by the Stage 6 step `the answer matches the database oracle for "<caseId>"`:

```json
{
  "ticketNo": "001",
  "connection": "<Data Explorer data source name>",
  "reviewStatus": "Draft - pending human review",
  "cases": {
    "REV-001": {
      "question": "...",
      "sql": "SELECT ...",
      "measures": ["revenue"],
      "mode": "scalar | set",
      "notes": "assumptions and TBDs"
    }
  }
}
```

- `alternatives` (optional): other readings of the same question that are also correct, each `{ "label", "sql", "measures" }`. Examples: a daily instead of a monthly trend; invoice gross instead of GL revenue excluding discounts for "sales before discounts". Check 4 passes when the primary oracle or any alternative matches, and the report names the one that matched. Never list a reading that answers a different question (e.g. an after-discount figure for "before discounts").
- `measures`: the oracle columns that hold the figures to compare.
- `mode`: `scalar` compares one value. `set` compares the sorted list of non-zero values, which tolerates different column names, ordering and labels between the oracle and the chat.
- Relative periods ("this month", "last quarter") use `current_date` inside the SQL, so the oracle keeps tracking the same period as the chat.

## Gate O: Oracle review (HITL)

A person reviews every oracle SQL and sets `reviewStatus` to `Approved by <name>, <date>`. Tests still run against a draft oracle, but every report annotation labels it `DRAFT`. A Stage 7 Pass on a draft oracle is reported as conditional.

## Checks performed at test time (implemented in Stage 6)

1. **Answer**: the chat returned a data answer (SQL and result), not an error.
2. **Consistency**: the chat's own SQL, re-run in Data Explorer, returns the same rows the chat reported.
3. **Faithfulness**: every `$` amount in the answer text appears in the chat's result. A sum or difference of result values also counts.
4. **Correctness**: the oracle's figures match the chat's figures (tolerance 0.01). Under the provisional D-B rule, an empty result, null and 0 all mean "no data".

Every check, both SQL queries, both results and the answer text are written to the test's annotations, which the Ortoni report shows for each test.

## Guardrails

- SELECT only. Never send anything other than a read query to Data Explorer.
- Never invent a definition. If a question's metric or grain is ambiguous, pick the closest agreed definition and record it as `TBD` in `notes`.
- This stage writes only to `docs/oracle/**`.

# Generated-by: Gherkin Generator Agent · 004 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/004.md (CAS-001 to CAS-100). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/004.json (Stage 3.5, draft pending Gate O review). Cases with oracle mode "none" run Checks 1-3 only; their oracle notes say why.
# TBD: response wording; metric definitions (docs/oracle/004.json "definitions").

@004
Feature: Cash flow questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @CAS-001 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for this month."
    Then the question box shows "Show cash inflows and outflows for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-001"

  @CAS-002 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during this month?"
    Then the question box shows "What was the net change in cash during this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-002"

  @CAS-003 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for this month."
    Then the question box shows "Show the monthly cash movement for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-003"

  @CAS-004 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for this month."
    Then the question box shows "Break down customer receipts for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-004"

  @CAS-005 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during this month."
    Then the question box shows "Show payments made to vendors during this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-005"

  @CAS-006 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during this month."
    Then the question box shows "Compare cash received with cash paid during this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-006"

  @CAS-007 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in this month?"
    Then the question box shows "Which months had the largest net cash outflow in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-007"

  @CAS-008 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for this month."
    Then the question box shows "Show deposits and withdrawals by month for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-008"

  @CAS-009 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for this month?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-009"

  @CAS-010 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during this month."
    Then the question box shows "List the largest cash receipts and payments during this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-010"

  @CAS-011 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for last month."
    Then the question box shows "Show cash inflows and outflows for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-011"

  @CAS-012 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during last month?"
    Then the question box shows "What was the net change in cash during last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-012"

  @CAS-013 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for last month."
    Then the question box shows "Show the monthly cash movement for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-013"

  @CAS-014 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for last month."
    Then the question box shows "Break down customer receipts for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-014"

  @CAS-015 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during last month."
    Then the question box shows "Show payments made to vendors during last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-015"

  @CAS-016 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during last month."
    Then the question box shows "Compare cash received with cash paid during last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-016"

  @CAS-017 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in last month?"
    Then the question box shows "Which months had the largest net cash outflow in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-017"

  @CAS-018 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for last month."
    Then the question box shows "Show deposits and withdrawals by month for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-018"

  @CAS-019 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for last month?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-019"

  @CAS-020 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during last month."
    Then the question box shows "List the largest cash receipts and payments during last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-020"

  @CAS-021 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for this quarter."
    Then the question box shows "Show cash inflows and outflows for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-021"

  @CAS-022 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during this quarter?"
    Then the question box shows "What was the net change in cash during this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-022"

  @CAS-023 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for this quarter."
    Then the question box shows "Show the monthly cash movement for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-023"

  @CAS-024 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for this quarter."
    Then the question box shows "Break down customer receipts for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-024"

  @CAS-025 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during this quarter."
    Then the question box shows "Show payments made to vendors during this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-025"

  @CAS-026 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during this quarter."
    Then the question box shows "Compare cash received with cash paid during this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-026"

  @CAS-027 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in this quarter?"
    Then the question box shows "Which months had the largest net cash outflow in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-027"

  @CAS-028 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for this quarter."
    Then the question box shows "Show deposits and withdrawals by month for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-028"

  @CAS-029 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for this quarter?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-029"

  @CAS-030 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during this quarter."
    Then the question box shows "List the largest cash receipts and payments during this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-030"

  @CAS-031 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for last quarter."
    Then the question box shows "Show cash inflows and outflows for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-031"

  @CAS-032 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during last quarter?"
    Then the question box shows "What was the net change in cash during last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-032"

  @CAS-033 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for last quarter."
    Then the question box shows "Show the monthly cash movement for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-033"

  @CAS-034 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for last quarter."
    Then the question box shows "Break down customer receipts for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-034"

  @CAS-035 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during last quarter."
    Then the question box shows "Show payments made to vendors during last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-035"

  @CAS-036 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during last quarter."
    Then the question box shows "Compare cash received with cash paid during last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-036"

  @CAS-037 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in last quarter?"
    Then the question box shows "Which months had the largest net cash outflow in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-037"

  @CAS-038 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for last quarter."
    Then the question box shows "Show deposits and withdrawals by month for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-038"

  @CAS-039 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for last quarter?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-039"

  @CAS-040 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during last quarter."
    Then the question box shows "List the largest cash receipts and payments during last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-040"

  @CAS-041 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for this year."
    Then the question box shows "Show cash inflows and outflows for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-041"

  @CAS-042 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during this year?"
    Then the question box shows "What was the net change in cash during this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-042"

  @CAS-043 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for this year."
    Then the question box shows "Show the monthly cash movement for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-043"

  @CAS-044 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for this year."
    Then the question box shows "Break down customer receipts for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-044"

  @CAS-045 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during this year."
    Then the question box shows "Show payments made to vendors during this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-045"

  @CAS-046 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during this year."
    Then the question box shows "Compare cash received with cash paid during this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-046"

  @CAS-047 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in this year?"
    Then the question box shows "Which months had the largest net cash outflow in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-047"

  @CAS-048 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for this year."
    Then the question box shows "Show deposits and withdrawals by month for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-048"

  @CAS-049 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for this year?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-049"

  @CAS-050 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during this year."
    Then the question box shows "List the largest cash receipts and payments during this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-050"

  @CAS-051 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for last year."
    Then the question box shows "Show cash inflows and outflows for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-051"

  @CAS-052 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during last year?"
    Then the question box shows "What was the net change in cash during last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-052"

  @CAS-053 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for last year."
    Then the question box shows "Show the monthly cash movement for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-053"

  @CAS-054 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for last year."
    Then the question box shows "Break down customer receipts for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-054"

  @CAS-055 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during last year."
    Then the question box shows "Show payments made to vendors during last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-055"

  @CAS-056 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during last year."
    Then the question box shows "Compare cash received with cash paid during last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-056"

  @CAS-057 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in last year?"
    Then the question box shows "Which months had the largest net cash outflow in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-057"

  @CAS-058 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for last year."
    Then the question box shows "Show deposits and withdrawals by month for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-058"

  @CAS-059 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for last year?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-059"

  @CAS-060 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during last year."
    Then the question box shows "List the largest cash receipts and payments during last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-060"

  @CAS-061 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for the current fiscal year."
    Then the question box shows "Show cash inflows and outflows for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-061"

  @CAS-062 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during the current fiscal year?"
    Then the question box shows "What was the net change in cash during the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-062"

  @CAS-063 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for the current fiscal year."
    Then the question box shows "Show the monthly cash movement for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-063"

  @CAS-064 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for the current fiscal year."
    Then the question box shows "Break down customer receipts for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-064"

  @CAS-065 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during the current fiscal year."
    Then the question box shows "Show payments made to vendors during the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-065"

  @CAS-066 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during the current fiscal year."
    Then the question box shows "Compare cash received with cash paid during the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-066"

  @CAS-067 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in the current fiscal year?"
    Then the question box shows "Which months had the largest net cash outflow in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-067"

  @CAS-068 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for the current fiscal year."
    Then the question box shows "Show deposits and withdrawals by month for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-068"

  @CAS-069 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for the current fiscal year?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-069"

  @CAS-070 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during the current fiscal year."
    Then the question box shows "List the largest cash receipts and payments during the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-070"

  @CAS-071 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for the previous fiscal year."
    Then the question box shows "Show cash inflows and outflows for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-071"

  @CAS-072 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during the previous fiscal year?"
    Then the question box shows "What was the net change in cash during the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-072"

  @CAS-073 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for the previous fiscal year."
    Then the question box shows "Show the monthly cash movement for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-073"

  @CAS-074 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for the previous fiscal year."
    Then the question box shows "Break down customer receipts for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-074"

  @CAS-075 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during the previous fiscal year."
    Then the question box shows "Show payments made to vendors during the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-075"

  @CAS-076 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during the previous fiscal year."
    Then the question box shows "Compare cash received with cash paid during the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-076"

  @CAS-077 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in the previous fiscal year?"
    Then the question box shows "Which months had the largest net cash outflow in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-077"

  @CAS-078 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for the previous fiscal year."
    Then the question box shows "Show deposits and withdrawals by month for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-078"

  @CAS-079 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for the previous fiscal year?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-079"

  @CAS-080 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during the previous fiscal year."
    Then the question box shows "List the largest cash receipts and payments during the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-080"

  @CAS-081 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for the last 90 days."
    Then the question box shows "Show cash inflows and outflows for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-081"

  @CAS-082 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during the last 90 days?"
    Then the question box shows "What was the net change in cash during the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-082"

  @CAS-083 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for the last 90 days."
    Then the question box shows "Show the monthly cash movement for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-083"

  @CAS-084 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for the last 90 days."
    Then the question box shows "Break down customer receipts for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-084"

  @CAS-085 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during the last 90 days."
    Then the question box shows "Show payments made to vendors during the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-085"

  @CAS-086 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during the last 90 days."
    Then the question box shows "Compare cash received with cash paid during the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-086"

  @CAS-087 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in the last 90 days?"
    Then the question box shows "Which months had the largest net cash outflow in the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-087"

  @CAS-088 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for the last 90 days."
    Then the question box shows "Show deposits and withdrawals by month for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-088"

  @CAS-089 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for the last 90 days?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-089"

  @CAS-090 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during the last 90 days."
    Then the question box shows "List the largest cash receipts and payments during the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-090"

  @CAS-091 @regression @chat
  Scenario: Ask the chat: Show cash inflows and outflows for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash inflows and outflows for the last 12 months."
    Then the question box shows "Show cash inflows and outflows for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-091"

  @CAS-092 @regression @chat
  Scenario: Ask the chat: What was the net change in cash during the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was the net change in cash during the last 12 months?"
    Then the question box shows "What was the net change in cash during the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-092"

  @CAS-093 @regression @chat
  Scenario: Ask the chat: Show the monthly cash movement for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly cash movement for the last 12 months."
    Then the question box shows "Show the monthly cash movement for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-093"

  @CAS-094 @regression @chat
  Scenario: Ask the chat: Break down customer receipts for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down customer receipts for the last 12 months."
    Then the question box shows "Break down customer receipts for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-094"

  @CAS-095 @regression @chat
  Scenario: Ask the chat: Show payments made to vendors during the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payments made to vendors during the last 12 months."
    Then the question box shows "Show payments made to vendors during the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-095"

  @CAS-096 @regression @chat
  Scenario: Ask the chat: Compare cash received with cash paid during the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cash received with cash paid during the last 12 months."
    Then the question box shows "Compare cash received with cash paid during the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-096"

  @CAS-097 @regression @chat
  Scenario: Ask the chat: Which months had the largest net cash outflow in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest net cash outflow in the last 12 months?"
    Then the question box shows "Which months had the largest net cash outflow in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-097"

  @CAS-098 @regression @chat
  Scenario: Ask the chat: Show deposits and withdrawals by month for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show deposits and withdrawals by month for the last 12 months."
    Then the question box shows "Show deposits and withdrawals by month for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-098"

  @CAS-099 @regression @chat
  Scenario: Ask the chat: How did operating cash movement change compared with the preceding period for the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did operating cash movement change compared with the preceding period for the last 12 months?"
    Then the question box shows "How did operating cash movement change compared with the preceding period for the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-099"

  @CAS-100 @regression @chat
  Scenario: Ask the chat: List the largest cash receipts and payments during the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the largest cash receipts and payments during the last 12 months."
    Then the question box shows "List the largest cash receipts and payments during the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a cash flow analysis
    And the answer matches the database oracle for "CAS-100"

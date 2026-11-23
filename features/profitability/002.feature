# Generated-by: Gherkin Generator Agent · 002 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/002.md (PRO-001 to PRO-100). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/002.json (Stage 3.5, draft pending Gate O review). Cases with oracle mode "none" run Checks 1-3 only; their oracle notes say why.
# TBD: response wording; metric definitions (docs/oracle/002.json "definitions").

@002
Feature: Profitability questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @PRO-001 @regression @chat
  Scenario: Ask the chat: Show gross profit for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross profit for this month."
    Then the question box shows "Show gross profit for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-001"

  @PRO-002 @regression @chat
  Scenario: Ask the chat: How has gross profit changed over this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has gross profit changed over this month?"
    Then the question box shows "How has gross profit changed over this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-002"

  @PRO-003 @regression @chat
  Scenario: Ask the chat: Compare gross profit with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit with the preceding equivalent period."
    Then the question box shows "Compare gross profit with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-003"

  @PRO-004 @regression @chat
  Scenario: Ask the chat: Break down gross profit by month for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down gross profit by month for this month."
    Then the question box shows "Break down gross profit by month for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-004"

  @PRO-005 @regression @chat
  Scenario: Ask the chat: Rank customers by gross profit for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by gross profit for this month."
    Then the question box shows "Rank customers by gross profit for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-005"

  @PRO-006 @regression @chat
  Scenario: Ask the chat: Which items had the highest gross profit during this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest gross profit during this month?"
    Then the question box shows "Which items had the highest gross profit during this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-006"

  @PRO-007 @regression @chat
  Scenario: Ask the chat: Show the trend in gross profit for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in gross profit for this month."
    Then the question box shows "Show the trend in gross profit for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-007"

  @PRO-008 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for gross profit in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for gross profit in this month?"
    Then the question box shows "What were the highest and lowest values for gross profit in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-008"

  @PRO-009 @regression @chat
  Scenario: Ask the chat: Show gross profit by customer for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross profit by customer for this month."
    Then the question box shows "Show gross profit by customer for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-009"

  @PRO-010 @regression @chat
  Scenario: Ask the chat: Explain the movement in gross profit during this month using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in gross profit during this month using the available income and expense figures."
    Then the question box shows "Explain the movement in gross profit during this month using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-010"

  @PRO-011 @regression @chat
  Scenario: Ask the chat: Show gross margin for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross margin for last month."
    Then the question box shows "Show gross margin for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-011"

  @PRO-012 @regression @chat
  Scenario: Ask the chat: How has gross margin changed over last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has gross margin changed over last month?"
    Then the question box shows "How has gross margin changed over last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-012"

  @PRO-013 @regression @chat
  Scenario: Ask the chat: Compare gross margin with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross margin with the preceding equivalent period."
    Then the question box shows "Compare gross margin with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-013"

  @PRO-014 @regression @chat
  Scenario: Ask the chat: Break down gross margin by month for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down gross margin by month for last month."
    Then the question box shows "Break down gross margin by month for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-014"

  @PRO-015 @regression @chat
  Scenario: Ask the chat: Rank customers by gross margin for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by gross margin for last month."
    Then the question box shows "Rank customers by gross margin for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-015"

  @PRO-016 @regression @chat
  Scenario: Ask the chat: Which items had the highest gross margin during last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest gross margin during last month?"
    Then the question box shows "Which items had the highest gross margin during last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-016"

  @PRO-017 @regression @chat
  Scenario: Ask the chat: Show the trend in gross margin for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in gross margin for last month."
    Then the question box shows "Show the trend in gross margin for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-017"

  @PRO-018 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for gross margin in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for gross margin in last month?"
    Then the question box shows "What were the highest and lowest values for gross margin in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-018"

  @PRO-019 @regression @chat
  Scenario: Ask the chat: Show gross margin by customer for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross margin by customer for last month."
    Then the question box shows "Show gross margin by customer for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-019"

  @PRO-020 @regression @chat
  Scenario: Ask the chat: Explain the movement in gross margin during last month using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in gross margin during last month using the available income and expense figures."
    Then the question box shows "Explain the movement in gross margin during last month using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-020"

  @PRO-021 @regression @chat
  Scenario: Ask the chat: Show net income for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show net income for this quarter."
    Then the question box shows "Show net income for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-021"

  @PRO-022 @regression @chat
  Scenario: Ask the chat: How has net income changed over this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has net income changed over this quarter?"
    Then the question box shows "How has net income changed over this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-022"

  @PRO-023 @regression @chat
  Scenario: Ask the chat: Compare net income with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare net income with the preceding equivalent period."
    Then the question box shows "Compare net income with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-023"

  @PRO-024 @regression @chat
  Scenario: Ask the chat: Break down net income by month for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down net income by month for this quarter."
    Then the question box shows "Break down net income by month for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-024"

  @PRO-025 @regression @chat
  Scenario: Ask the chat: Rank customers by net income for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by net income for this quarter."
    Then the question box shows "Rank customers by net income for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-025"

  @PRO-026 @regression @chat
  Scenario: Ask the chat: Which items had the highest net income during this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest net income during this quarter?"
    Then the question box shows "Which items had the highest net income during this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-026"

  @PRO-027 @regression @chat
  Scenario: Ask the chat: Show the trend in net income for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in net income for this quarter."
    Then the question box shows "Show the trend in net income for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-027"

  @PRO-028 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for net income in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for net income in this quarter?"
    Then the question box shows "What were the highest and lowest values for net income in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-028"

  @PRO-029 @regression @chat
  Scenario: Ask the chat: Show net income by customer for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show net income by customer for this quarter."
    Then the question box shows "Show net income by customer for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-029"

  @PRO-030 @regression @chat
  Scenario: Ask the chat: Explain the movement in net income during this quarter using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in net income during this quarter using the available income and expense figures."
    Then the question box shows "Explain the movement in net income during this quarter using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-030"

  @PRO-031 @regression @chat
  Scenario: Ask the chat: Show operating income for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show operating income for last quarter."
    Then the question box shows "Show operating income for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-031"

  @PRO-032 @regression @chat
  Scenario: Ask the chat: How has operating income changed over last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has operating income changed over last quarter?"
    Then the question box shows "How has operating income changed over last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-032"

  @PRO-033 @regression @chat
  Scenario: Ask the chat: Compare operating income with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare operating income with the preceding equivalent period."
    Then the question box shows "Compare operating income with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-033"

  @PRO-034 @regression @chat
  Scenario: Ask the chat: Break down operating income by month for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down operating income by month for last quarter."
    Then the question box shows "Break down operating income by month for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-034"

  @PRO-035 @regression @chat
  Scenario: Ask the chat: Rank customers by operating income for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by operating income for last quarter."
    Then the question box shows "Rank customers by operating income for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-035"

  @PRO-036 @regression @chat
  Scenario: Ask the chat: Which items had the highest operating income during last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest operating income during last quarter?"
    Then the question box shows "Which items had the highest operating income during last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-036"

  @PRO-037 @regression @chat
  Scenario: Ask the chat: Show the trend in operating income for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in operating income for last quarter."
    Then the question box shows "Show the trend in operating income for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-037"

  @PRO-038 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for operating income in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for operating income in last quarter?"
    Then the question box shows "What were the highest and lowest values for operating income in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-038"

  @PRO-039 @regression @chat
  Scenario: Ask the chat: Show operating income by customer for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show operating income by customer for last quarter."
    Then the question box shows "Show operating income by customer for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-039"

  @PRO-040 @regression @chat
  Scenario: Ask the chat: Explain the movement in operating income during last quarter using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in operating income during last quarter using the available income and expense figures."
    Then the question box shows "Explain the movement in operating income during last quarter using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-040"

  @PRO-041 @regression @chat
  Scenario: Ask the chat: Show net profit margin for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show net profit margin for this year."
    Then the question box shows "Show net profit margin for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-041"

  @PRO-042 @regression @chat
  Scenario: Ask the chat: How has net profit margin changed over this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has net profit margin changed over this year?"
    Then the question box shows "How has net profit margin changed over this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-042"

  @PRO-043 @regression @chat
  Scenario: Ask the chat: Compare net profit margin with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare net profit margin with the preceding equivalent period."
    Then the question box shows "Compare net profit margin with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-043"

  @PRO-044 @regression @chat
  Scenario: Ask the chat: Break down net profit margin by month for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down net profit margin by month for this year."
    Then the question box shows "Break down net profit margin by month for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-044"

  @PRO-045 @regression @chat
  Scenario: Ask the chat: Rank customers by net profit margin for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by net profit margin for this year."
    Then the question box shows "Rank customers by net profit margin for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-045"

  @PRO-046 @regression @chat
  Scenario: Ask the chat: Which items had the highest net profit margin during this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest net profit margin during this year?"
    Then the question box shows "Which items had the highest net profit margin during this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-046"

  @PRO-047 @regression @chat
  Scenario: Ask the chat: Show the trend in net profit margin for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in net profit margin for this year."
    Then the question box shows "Show the trend in net profit margin for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-047"

  @PRO-048 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for net profit margin in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for net profit margin in this year?"
    Then the question box shows "What were the highest and lowest values for net profit margin in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-048"

  @PRO-049 @regression @chat
  Scenario: Ask the chat: Show net profit margin by customer for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show net profit margin by customer for this year."
    Then the question box shows "Show net profit margin by customer for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-049"

  @PRO-050 @regression @chat
  Scenario: Ask the chat: Explain the movement in net profit margin during this year using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in net profit margin during this year using the available income and expense figures."
    Then the question box shows "Explain the movement in net profit margin during this year using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-050"

  @PRO-051 @regression @chat
  Scenario: Ask the chat: Show profit by customer for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by customer for last year."
    Then the question box shows "Show profit by customer for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-051"

  @PRO-052 @regression @chat
  Scenario: Ask the chat: How has profit by customer changed over last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has profit by customer changed over last year?"
    Then the question box shows "How has profit by customer changed over last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-052"

  @PRO-053 @regression @chat
  Scenario: Ask the chat: Compare profit by customer with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare profit by customer with the preceding equivalent period."
    Then the question box shows "Compare profit by customer with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-053"

  @PRO-054 @regression @chat
  Scenario: Ask the chat: Break down profit by customer by month for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down profit by customer by month for last year."
    Then the question box shows "Break down profit by customer by month for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-054"

  @PRO-055 @regression @chat
  Scenario: Ask the chat: Rank customers by profit by customer for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by profit by customer for last year."
    Then the question box shows "Rank customers by profit by customer for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-055"

  @PRO-056 @regression @chat
  Scenario: Ask the chat: Which items had the highest profit by customer during last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest profit by customer during last year?"
    Then the question box shows "Which items had the highest profit by customer during last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-056"

  @PRO-057 @regression @chat
  Scenario: Ask the chat: Show the trend in profit by customer for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in profit by customer for last year."
    Then the question box shows "Show the trend in profit by customer for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-057"

  @PRO-058 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for profit by customer in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for profit by customer in last year?"
    Then the question box shows "What were the highest and lowest values for profit by customer in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-058"

  @PRO-059 @regression @chat
  Scenario: Ask the chat: Show profit by customer by customer for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by customer by customer for last year."
    Then the question box shows "Show profit by customer by customer for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-059"

  @PRO-060 @regression @chat
  Scenario: Ask the chat: Explain the movement in profit by customer during last year using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in profit by customer during last year using the available income and expense figures."
    Then the question box shows "Explain the movement in profit by customer during last year using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-060"

  @PRO-061 @regression @chat
  Scenario: Ask the chat: Show profit by product for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by product for the current fiscal year."
    Then the question box shows "Show profit by product for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-061"

  @PRO-062 @regression @chat
  Scenario: Ask the chat: How has profit by product changed over the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has profit by product changed over the current fiscal year?"
    Then the question box shows "How has profit by product changed over the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-062"

  @PRO-063 @regression @chat
  Scenario: Ask the chat: Compare profit by product with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare profit by product with the preceding equivalent period."
    Then the question box shows "Compare profit by product with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-063"

  @PRO-064 @regression @chat
  Scenario: Ask the chat: Break down profit by product by month for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down profit by product by month for the current fiscal year."
    Then the question box shows "Break down profit by product by month for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-064"

  @PRO-065 @regression @chat
  Scenario: Ask the chat: Rank customers by profit by product for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by profit by product for the current fiscal year."
    Then the question box shows "Rank customers by profit by product for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-065"

  @PRO-066 @regression @chat
  Scenario: Ask the chat: Which items had the highest profit by product during the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest profit by product during the current fiscal year?"
    Then the question box shows "Which items had the highest profit by product during the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-066"

  @PRO-067 @regression @chat
  Scenario: Ask the chat: Show the trend in profit by product for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in profit by product for the current fiscal year."
    Then the question box shows "Show the trend in profit by product for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-067"

  @PRO-068 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for profit by product in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for profit by product in the current fiscal year?"
    Then the question box shows "What were the highest and lowest values for profit by product in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-068"

  @PRO-069 @regression @chat
  Scenario: Ask the chat: Show profit by product by customer for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by product by customer for the current fiscal year."
    Then the question box shows "Show profit by product by customer for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-069"

  @PRO-070 @regression @chat
  Scenario: Ask the chat: Explain the movement in profit by product during the current fiscal year using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in profit by product during the current fiscal year using the available income and expense figures."
    Then the question box shows "Explain the movement in profit by product during the current fiscal year using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-070"

  @PRO-071 @regression @chat
  Scenario: Ask the chat: Show profit by service line for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by service line for the previous fiscal year."
    Then the question box shows "Show profit by service line for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-071"

  @PRO-072 @regression @chat
  Scenario: Ask the chat: How has profit by service line changed over the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has profit by service line changed over the previous fiscal year?"
    Then the question box shows "How has profit by service line changed over the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-072"

  @PRO-073 @regression @chat
  Scenario: Ask the chat: Compare profit by service line with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare profit by service line with the preceding equivalent period."
    Then the question box shows "Compare profit by service line with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-073"

  @PRO-074 @regression @chat
  Scenario: Ask the chat: Break down profit by service line by month for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down profit by service line by month for the previous fiscal year."
    Then the question box shows "Break down profit by service line by month for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-074"

  @PRO-075 @regression @chat
  Scenario: Ask the chat: Rank customers by profit by service line for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by profit by service line for the previous fiscal year."
    Then the question box shows "Rank customers by profit by service line for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-075"

  @PRO-076 @regression @chat
  Scenario: Ask the chat: Which items had the highest profit by service line during the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest profit by service line during the previous fiscal year?"
    Then the question box shows "Which items had the highest profit by service line during the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-076"

  @PRO-077 @regression @chat
  Scenario: Ask the chat: Show the trend in profit by service line for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in profit by service line for the previous fiscal year."
    Then the question box shows "Show the trend in profit by service line for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-077"

  @PRO-078 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for profit by service line in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for profit by service line in the previous fiscal year?"
    Then the question box shows "What were the highest and lowest values for profit by service line in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-078"

  @PRO-079 @regression @chat
  Scenario: Ask the chat: Show profit by service line by customer for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by service line by customer for the previous fiscal year."
    Then the question box shows "Show profit by service line by customer for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-079"

  @PRO-080 @regression @chat
  Scenario: Ask the chat: Explain the movement in profit by service line during the previous fiscal year using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in profit by service line during the previous fiscal year using the available income and expense figures."
    Then the question box shows "Explain the movement in profit by service line during the previous fiscal year using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-080"

  @PRO-081 @regression @chat
  Scenario: Ask the chat: Show profit by month for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by month for the last six months."
    Then the question box shows "Show profit by month for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-081"

  @PRO-082 @regression @chat
  Scenario: Ask the chat: How has profit by month changed over the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has profit by month changed over the last six months?"
    Then the question box shows "How has profit by month changed over the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-082"

  @PRO-083 @regression @chat
  Scenario: Ask the chat: Compare profit by month with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare profit by month with the preceding equivalent period."
    Then the question box shows "Compare profit by month with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-083"

  @PRO-084 @regression @chat
  Scenario: Ask the chat: Break down profit by month by month for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down profit by month by month for the last six months."
    Then the question box shows "Break down profit by month by month for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-084"

  @PRO-085 @regression @chat
  Scenario: Ask the chat: Rank customers by profit by month for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by profit by month for the last six months."
    Then the question box shows "Rank customers by profit by month for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-085"

  @PRO-086 @regression @chat
  Scenario: Ask the chat: Which items had the highest profit by month during the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest profit by month during the last six months?"
    Then the question box shows "Which items had the highest profit by month during the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-086"

  @PRO-087 @regression @chat
  Scenario: Ask the chat: Show the trend in profit by month for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in profit by month for the last six months."
    Then the question box shows "Show the trend in profit by month for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-087"

  @PRO-088 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for profit by month in the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for profit by month in the last six months?"
    Then the question box shows "What were the highest and lowest values for profit by month in the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-088"

  @PRO-089 @regression @chat
  Scenario: Ask the chat: Show profit by month by customer for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show profit by month by customer for the last six months."
    Then the question box shows "Show profit by month by customer for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-089"

  @PRO-090 @regression @chat
  Scenario: Ask the chat: Explain the movement in profit by month during the last six months using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in profit by month during the last six months using the available income and expense figures."
    Then the question box shows "Explain the movement in profit by month during the last six months using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-090"

  @PRO-091 @regression @chat
  Scenario: Ask the chat: Show cost of goods sold for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cost of goods sold for the last 12 months."
    Then the question box shows "Show cost of goods sold for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-091"

  @PRO-092 @regression @chat
  Scenario: Ask the chat: How has cost of goods sold changed over the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How has cost of goods sold changed over the last 12 months?"
    Then the question box shows "How has cost of goods sold changed over the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-092"

  @PRO-093 @regression @chat
  Scenario: Ask the chat: Compare cost of goods sold with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare cost of goods sold with the preceding equivalent period."
    Then the question box shows "Compare cost of goods sold with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-093"

  @PRO-094 @regression @chat
  Scenario: Ask the chat: Break down cost of goods sold by month for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down cost of goods sold by month for the last 12 months."
    Then the question box shows "Break down cost of goods sold by month for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-094"

  @PRO-095 @regression @chat
  Scenario: Ask the chat: Rank customers by cost of goods sold for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank customers by cost of goods sold for the last 12 months."
    Then the question box shows "Rank customers by cost of goods sold for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-095"

  @PRO-096 @regression @chat
  Scenario: Ask the chat: Which items had the highest cost of goods sold during the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which items had the highest cost of goods sold during the last 12 months?"
    Then the question box shows "Which items had the highest cost of goods sold during the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-096"

  @PRO-097 @regression @chat
  Scenario: Ask the chat: Show the trend in cost of goods sold for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in cost of goods sold for the last 12 months."
    Then the question box shows "Show the trend in cost of goods sold for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-097"

  @PRO-098 @regression @chat
  Scenario: Ask the chat: What were the highest and lowest values for cost of goods sold in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What were the highest and lowest values for cost of goods sold in the last 12 months?"
    Then the question box shows "What were the highest and lowest values for cost of goods sold in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-098"

  @PRO-099 @regression @chat
  Scenario: Ask the chat: Show cost of goods sold by customer for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cost of goods sold by customer for the last 12 months."
    Then the question box shows "Show cost of goods sold by customer for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-099"

  @PRO-100 @regression @chat
  Scenario: Ask the chat: Explain the movement in cost of goods sold during the last 12 months using the available income and expense figures.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Explain the movement in cost of goods sold during the last 12 months using the available income and expense figures."
    Then the question box shows "Explain the movement in cost of goods sold during the last 12 months using the available income and expense figures."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a profitability analysis
    And the answer matches the database oracle for "PRO-100"

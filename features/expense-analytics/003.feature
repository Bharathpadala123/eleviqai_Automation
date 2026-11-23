# Generated-by: Gherkin Generator Agent · 003 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/003.md (EXP-001 to EXP-100). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/003.json (Stage 3.5, draft pending Gate O review). Cases with oracle mode "none" run Checks 1-3 only; their oracle notes say why.
# TBD: response wording; metric definitions (docs/oracle/003.json "definitions").

@003
Feature: Expense analytics questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @EXP-001 @regression @chat
  Scenario: Ask the chat: Show total operating expenses for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show total operating expenses for this month."
    Then the question box shows "Show total operating expenses for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-001"

  @EXP-002 @regression @chat
  Scenario: Ask the chat: Break down total operating expenses by vendor for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down total operating expenses by vendor for this month."
    Then the question box shows "Break down total operating expenses by vendor for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-002"

  @EXP-003 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for total operating expenses during this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for total operating expenses during this month."
    Then the question box shows "Show the monthly trend for total operating expenses during this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-003"

  @EXP-004 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest total operating expenses in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest total operating expenses in this month?"
    Then the question box shows "Which vendors account for the largest total operating expenses in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-004"

  @EXP-005 @regression @chat
  Scenario: Ask the chat: Compare total operating expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare total operating expenses with the preceding equivalent period."
    Then the question box shows "Compare total operating expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-005"

  @EXP-006 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to total operating expenses in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to total operating expenses in this month."
    Then the question box shows "List the transactions contributing to total operating expenses in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-006"

  @EXP-007 @regression @chat
  Scenario: Ask the chat: Show total operating expenses by account for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show total operating expenses by account for this month."
    Then the question box shows "Show total operating expenses by account for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-007"

  @EXP-008 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in total operating expenses during this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in total operating expenses during this month."
    Then the question box shows "Identify unusual increases in total operating expenses during this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-008"

  @EXP-009 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was total operating expenses in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was total operating expenses in this month?"
    Then the question box shows "What percentage of total expenses was total operating expenses in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-009"

  @EXP-010 @regression @chat
  Scenario: Ask the chat: Rank the months in this month by total operating expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in this month by total operating expenses, highest to lowest."
    Then the question box shows "Rank the months in this month by total operating expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-010"

  @EXP-011 @regression @chat
  Scenario: Ask the chat: Show payroll expenses for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payroll expenses for last month."
    Then the question box shows "Show payroll expenses for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-011"

  @EXP-012 @regression @chat
  Scenario: Ask the chat: Break down payroll expenses by vendor for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down payroll expenses by vendor for last month."
    Then the question box shows "Break down payroll expenses by vendor for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-012"

  @EXP-013 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for payroll expenses during last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for payroll expenses during last month."
    Then the question box shows "Show the monthly trend for payroll expenses during last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-013"

  @EXP-014 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest payroll expenses in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest payroll expenses in last month?"
    Then the question box shows "Which vendors account for the largest payroll expenses in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-014"

  @EXP-015 @regression @chat
  Scenario: Ask the chat: Compare payroll expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare payroll expenses with the preceding equivalent period."
    Then the question box shows "Compare payroll expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-015"

  @EXP-016 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to payroll expenses in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to payroll expenses in last month."
    Then the question box shows "List the transactions contributing to payroll expenses in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-016"

  @EXP-017 @regression @chat
  Scenario: Ask the chat: Show payroll expenses by account for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show payroll expenses by account for last month."
    Then the question box shows "Show payroll expenses by account for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-017"

  @EXP-018 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in payroll expenses during last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in payroll expenses during last month."
    Then the question box shows "Identify unusual increases in payroll expenses during last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-018"

  @EXP-019 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was payroll expenses in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was payroll expenses in last month?"
    Then the question box shows "What percentage of total expenses was payroll expenses in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-019"

  @EXP-020 @regression @chat
  Scenario: Ask the chat: Rank the months in last month by payroll expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in last month by payroll expenses, highest to lowest."
    Then the question box shows "Rank the months in last month by payroll expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-020"

  @EXP-021 @regression @chat
  Scenario: Ask the chat: Show rent expenses for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show rent expenses for this quarter."
    Then the question box shows "Show rent expenses for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-021"

  @EXP-022 @regression @chat
  Scenario: Ask the chat: Break down rent expenses by vendor for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down rent expenses by vendor for this quarter."
    Then the question box shows "Break down rent expenses by vendor for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-022"

  @EXP-023 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for rent expenses during this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for rent expenses during this quarter."
    Then the question box shows "Show the monthly trend for rent expenses during this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-023"

  @EXP-024 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest rent expenses in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest rent expenses in this quarter?"
    Then the question box shows "Which vendors account for the largest rent expenses in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-024"

  @EXP-025 @regression @chat
  Scenario: Ask the chat: Compare rent expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare rent expenses with the preceding equivalent period."
    Then the question box shows "Compare rent expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-025"

  @EXP-026 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to rent expenses in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to rent expenses in this quarter."
    Then the question box shows "List the transactions contributing to rent expenses in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-026"

  @EXP-027 @regression @chat
  Scenario: Ask the chat: Show rent expenses by account for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show rent expenses by account for this quarter."
    Then the question box shows "Show rent expenses by account for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-027"

  @EXP-028 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in rent expenses during this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in rent expenses during this quarter."
    Then the question box shows "Identify unusual increases in rent expenses during this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-028"

  @EXP-029 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was rent expenses in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was rent expenses in this quarter?"
    Then the question box shows "What percentage of total expenses was rent expenses in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-029"

  @EXP-030 @regression @chat
  Scenario: Ask the chat: Rank the months in this quarter by rent expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in this quarter by rent expenses, highest to lowest."
    Then the question box shows "Rank the months in this quarter by rent expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-030"

  @EXP-031 @regression @chat
  Scenario: Ask the chat: Show marketing expenses for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show marketing expenses for last quarter."
    Then the question box shows "Show marketing expenses for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-031"

  @EXP-032 @regression @chat
  Scenario: Ask the chat: Break down marketing expenses by vendor for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down marketing expenses by vendor for last quarter."
    Then the question box shows "Break down marketing expenses by vendor for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-032"

  @EXP-033 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for marketing expenses during last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for marketing expenses during last quarter."
    Then the question box shows "Show the monthly trend for marketing expenses during last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-033"

  @EXP-034 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest marketing expenses in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest marketing expenses in last quarter?"
    Then the question box shows "Which vendors account for the largest marketing expenses in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-034"

  @EXP-035 @regression @chat
  Scenario: Ask the chat: Compare marketing expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare marketing expenses with the preceding equivalent period."
    Then the question box shows "Compare marketing expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-035"

  @EXP-036 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to marketing expenses in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to marketing expenses in last quarter."
    Then the question box shows "List the transactions contributing to marketing expenses in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-036"

  @EXP-037 @regression @chat
  Scenario: Ask the chat: Show marketing expenses by account for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show marketing expenses by account for last quarter."
    Then the question box shows "Show marketing expenses by account for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-037"

  @EXP-038 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in marketing expenses during last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in marketing expenses during last quarter."
    Then the question box shows "Identify unusual increases in marketing expenses during last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-038"

  @EXP-039 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was marketing expenses in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was marketing expenses in last quarter?"
    Then the question box shows "What percentage of total expenses was marketing expenses in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-039"

  @EXP-040 @regression @chat
  Scenario: Ask the chat: Rank the months in last quarter by marketing expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in last quarter by marketing expenses, highest to lowest."
    Then the question box shows "Rank the months in last quarter by marketing expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-040"

  @EXP-041 @regression @chat
  Scenario: Ask the chat: Show travel expenses for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show travel expenses for this year."
    Then the question box shows "Show travel expenses for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-041"

  @EXP-042 @regression @chat
  Scenario: Ask the chat: Break down travel expenses by vendor for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down travel expenses by vendor for this year."
    Then the question box shows "Break down travel expenses by vendor for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-042"

  @EXP-043 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for travel expenses during this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for travel expenses during this year."
    Then the question box shows "Show the monthly trend for travel expenses during this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-043"

  @EXP-044 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest travel expenses in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest travel expenses in this year?"
    Then the question box shows "Which vendors account for the largest travel expenses in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-044"

  @EXP-045 @regression @chat
  Scenario: Ask the chat: Compare travel expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare travel expenses with the preceding equivalent period."
    Then the question box shows "Compare travel expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-045"

  @EXP-046 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to travel expenses in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to travel expenses in this year."
    Then the question box shows "List the transactions contributing to travel expenses in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-046"

  @EXP-047 @regression @chat
  Scenario: Ask the chat: Show travel expenses by account for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show travel expenses by account for this year."
    Then the question box shows "Show travel expenses by account for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-047"

  @EXP-048 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in travel expenses during this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in travel expenses during this year."
    Then the question box shows "Identify unusual increases in travel expenses during this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-048"

  @EXP-049 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was travel expenses in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was travel expenses in this year?"
    Then the question box shows "What percentage of total expenses was travel expenses in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-049"

  @EXP-050 @regression @chat
  Scenario: Ask the chat: Rank the months in this year by travel expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in this year by travel expenses, highest to lowest."
    Then the question box shows "Rank the months in this year by travel expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-050"

  @EXP-051 @regression @chat
  Scenario: Ask the chat: Show software subscription costs for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show software subscription costs for last year."
    Then the question box shows "Show software subscription costs for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-051"

  @EXP-052 @regression @chat
  Scenario: Ask the chat: Break down software subscription costs by vendor for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down software subscription costs by vendor for last year."
    Then the question box shows "Break down software subscription costs by vendor for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-052"

  @EXP-053 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for software subscription costs during last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for software subscription costs during last year."
    Then the question box shows "Show the monthly trend for software subscription costs during last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-053"

  @EXP-054 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest software subscription costs in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest software subscription costs in last year?"
    Then the question box shows "Which vendors account for the largest software subscription costs in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-054"

  @EXP-055 @regression @chat
  Scenario: Ask the chat: Compare software subscription costs with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare software subscription costs with the preceding equivalent period."
    Then the question box shows "Compare software subscription costs with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-055"

  @EXP-056 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to software subscription costs in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to software subscription costs in last year."
    Then the question box shows "List the transactions contributing to software subscription costs in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-056"

  @EXP-057 @regression @chat
  Scenario: Ask the chat: Show software subscription costs by account for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show software subscription costs by account for last year."
    Then the question box shows "Show software subscription costs by account for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-057"

  @EXP-058 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in software subscription costs during last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in software subscription costs during last year."
    Then the question box shows "Identify unusual increases in software subscription costs during last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-058"

  @EXP-059 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was software subscription costs in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was software subscription costs in last year?"
    Then the question box shows "What percentage of total expenses was software subscription costs in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-059"

  @EXP-060 @regression @chat
  Scenario: Ask the chat: Rank the months in last year by software subscription costs, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in last year by software subscription costs, highest to lowest."
    Then the question box shows "Rank the months in last year by software subscription costs, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-060"

  @EXP-061 @regression @chat
  Scenario: Ask the chat: Show professional fees for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show professional fees for the current fiscal year."
    Then the question box shows "Show professional fees for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-061"

  @EXP-062 @regression @chat
  Scenario: Ask the chat: Break down professional fees by vendor for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down professional fees by vendor for the current fiscal year."
    Then the question box shows "Break down professional fees by vendor for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-062"

  @EXP-063 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for professional fees during the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for professional fees during the current fiscal year."
    Then the question box shows "Show the monthly trend for professional fees during the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-063"

  @EXP-064 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest professional fees in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest professional fees in the current fiscal year?"
    Then the question box shows "Which vendors account for the largest professional fees in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-064"

  @EXP-065 @regression @chat
  Scenario: Ask the chat: Compare professional fees with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare professional fees with the preceding equivalent period."
    Then the question box shows "Compare professional fees with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-065"

  @EXP-066 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to professional fees in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to professional fees in the current fiscal year."
    Then the question box shows "List the transactions contributing to professional fees in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-066"

  @EXP-067 @regression @chat
  Scenario: Ask the chat: Show professional fees by account for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show professional fees by account for the current fiscal year."
    Then the question box shows "Show professional fees by account for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-067"

  @EXP-068 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in professional fees during the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in professional fees during the current fiscal year."
    Then the question box shows "Identify unusual increases in professional fees during the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-068"

  @EXP-069 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was professional fees in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was professional fees in the current fiscal year?"
    Then the question box shows "What percentage of total expenses was professional fees in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-069"

  @EXP-070 @regression @chat
  Scenario: Ask the chat: Rank the months in the current fiscal year by professional fees, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in the current fiscal year by professional fees, highest to lowest."
    Then the question box shows "Rank the months in the current fiscal year by professional fees, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-070"

  @EXP-071 @regression @chat
  Scenario: Ask the chat: Show office expenses for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show office expenses for the previous fiscal year."
    Then the question box shows "Show office expenses for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-071"

  @EXP-072 @regression @chat
  Scenario: Ask the chat: Break down office expenses by vendor for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down office expenses by vendor for the previous fiscal year."
    Then the question box shows "Break down office expenses by vendor for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-072"

  @EXP-073 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for office expenses during the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for office expenses during the previous fiscal year."
    Then the question box shows "Show the monthly trend for office expenses during the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-073"

  @EXP-074 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest office expenses in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest office expenses in the previous fiscal year?"
    Then the question box shows "Which vendors account for the largest office expenses in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-074"

  @EXP-075 @regression @chat
  Scenario: Ask the chat: Compare office expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare office expenses with the preceding equivalent period."
    Then the question box shows "Compare office expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-075"

  @EXP-076 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to office expenses in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to office expenses in the previous fiscal year."
    Then the question box shows "List the transactions contributing to office expenses in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-076"

  @EXP-077 @regression @chat
  Scenario: Ask the chat: Show office expenses by account for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show office expenses by account for the previous fiscal year."
    Then the question box shows "Show office expenses by account for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-077"

  @EXP-078 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in office expenses during the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in office expenses during the previous fiscal year."
    Then the question box shows "Identify unusual increases in office expenses during the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-078"

  @EXP-079 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was office expenses in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was office expenses in the previous fiscal year?"
    Then the question box shows "What percentage of total expenses was office expenses in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-079"

  @EXP-080 @regression @chat
  Scenario: Ask the chat: Rank the months in the previous fiscal year by office expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in the previous fiscal year by office expenses, highest to lowest."
    Then the question box shows "Rank the months in the previous fiscal year by office expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-080"

  @EXP-081 @regression @chat
  Scenario: Ask the chat: Show utilities expenses for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show utilities expenses for the last 90 days."
    Then the question box shows "Show utilities expenses for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-081"

  @EXP-082 @regression @chat
  Scenario: Ask the chat: Break down utilities expenses by vendor for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down utilities expenses by vendor for the last 90 days."
    Then the question box shows "Break down utilities expenses by vendor for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-082"

  @EXP-083 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for utilities expenses during the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for utilities expenses during the last 90 days."
    Then the question box shows "Show the monthly trend for utilities expenses during the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-083"

  @EXP-084 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest utilities expenses in the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest utilities expenses in the last 90 days?"
    Then the question box shows "Which vendors account for the largest utilities expenses in the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-084"

  @EXP-085 @regression @chat
  Scenario: Ask the chat: Compare utilities expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare utilities expenses with the preceding equivalent period."
    Then the question box shows "Compare utilities expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-085"

  @EXP-086 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to utilities expenses in the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to utilities expenses in the last 90 days."
    Then the question box shows "List the transactions contributing to utilities expenses in the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-086"

  @EXP-087 @regression @chat
  Scenario: Ask the chat: Show utilities expenses by account for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show utilities expenses by account for the last 90 days."
    Then the question box shows "Show utilities expenses by account for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-087"

  @EXP-088 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in utilities expenses during the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in utilities expenses during the last 90 days."
    Then the question box shows "Identify unusual increases in utilities expenses during the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-088"

  @EXP-089 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was utilities expenses in the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was utilities expenses in the last 90 days?"
    Then the question box shows "What percentage of total expenses was utilities expenses in the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-089"

  @EXP-090 @regression @chat
  Scenario: Ask the chat: Rank the months in the last 90 days by utilities expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in the last 90 days by utilities expenses, highest to lowest."
    Then the question box shows "Rank the months in the last 90 days by utilities expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-090"

  @EXP-091 @regression @chat
  Scenario: Ask the chat: Show insurance expenses for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show insurance expenses for the last 12 months."
    Then the question box shows "Show insurance expenses for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-091"

  @EXP-092 @regression @chat
  Scenario: Ask the chat: Break down insurance expenses by vendor for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down insurance expenses by vendor for the last 12 months."
    Then the question box shows "Break down insurance expenses by vendor for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-092"

  @EXP-093 @regression @chat
  Scenario: Ask the chat: Show the monthly trend for insurance expenses during the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the monthly trend for insurance expenses during the last 12 months."
    Then the question box shows "Show the monthly trend for insurance expenses during the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-093"

  @EXP-094 @regression @chat
  Scenario: Ask the chat: Which vendors account for the largest insurance expenses in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which vendors account for the largest insurance expenses in the last 12 months?"
    Then the question box shows "Which vendors account for the largest insurance expenses in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-094"

  @EXP-095 @regression @chat
  Scenario: Ask the chat: Compare insurance expenses with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare insurance expenses with the preceding equivalent period."
    Then the question box shows "Compare insurance expenses with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-095"

  @EXP-096 @regression @chat
  Scenario: Ask the chat: List the transactions contributing to insurance expenses in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "List the transactions contributing to insurance expenses in the last 12 months."
    Then the question box shows "List the transactions contributing to insurance expenses in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-096"

  @EXP-097 @regression @chat
  Scenario: Ask the chat: Show insurance expenses by account for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show insurance expenses by account for the last 12 months."
    Then the question box shows "Show insurance expenses by account for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-097"

  @EXP-098 @regression @chat
  Scenario: Ask the chat: Identify unusual increases in insurance expenses during the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify unusual increases in insurance expenses during the last 12 months."
    Then the question box shows "Identify unusual increases in insurance expenses during the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-098"

  @EXP-099 @regression @chat
  Scenario: Ask the chat: What percentage of total expenses was insurance expenses in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What percentage of total expenses was insurance expenses in the last 12 months?"
    Then the question box shows "What percentage of total expenses was insurance expenses in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-099"

  @EXP-100 @regression @chat
  Scenario: Ask the chat: Rank the months in the last 12 months by insurance expenses, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the months in the last 12 months by insurance expenses, highest to lowest."
    Then the question box shows "Rank the months in the last 12 months by insurance expenses, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as an expense analysis
    And the answer matches the database oracle for "EXP-100"

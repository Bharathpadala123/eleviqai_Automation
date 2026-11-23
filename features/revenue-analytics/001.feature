# Generated-by: Gherkin Generator Agent · 001 · 2026-11-18 · AI-generated, human review required
# Source: docs/normalizer/001.md (REV-001 to REV-100; REV-011 to REV-020, REV-021 to REV-050 and REV-051 to REV-100 added 2026-11-19). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/001.json (Stage 3.5, draft pending Gate O review).
# TBD: response wording; metric definitions D-A/D-B/D-C (see docs/oracle/spike_REV-001-003.md).
# REV-051 to REV-100: cases with oracle mode "none" (recurring revenue: no recurring marker in the data) run Checks 1-3 only.

@001
Feature: Revenue analytics questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @REV-001 @regression @chat
  Scenario: Ask the chat: Show total sales for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show total sales for this month."
    Then the question box shows "Show total sales for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-001"

  @REV-002 @regression @chat
  Scenario: Ask the chat: What was total sales during this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was total sales during this month?"
    Then the question box shows "What was total sales during this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-002"

  @REV-003 @regression @chat
  Scenario: Ask the chat: Break down total sales by month for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down total sales by month for this month."
    Then the question box shows "Break down total sales by month for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-003"

  @REV-004 @regression @chat
  Scenario: Ask the chat: Compare total sales across the months in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare total sales across the months in this month."
    Then the question box shows "Compare total sales across the months in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-004"

  @REV-005 @regression @chat
  Scenario: Ask the chat: Show the trend in total sales over this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in total sales over this month."
    Then the question box shows "Show the trend in total sales over this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-005"

  @REV-006 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to total sales in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to total sales in this month?"
    Then the question box shows "Which customers contributed the most to total sales in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-006"

  @REV-007 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest total sales in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest total sales in this month?"
    Then the question box shows "Which products or services generated the highest total sales in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-007"

  @REV-008 @regression @chat
  Scenario: Ask the chat: Show total sales by customer for this month, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show total sales by customer for this month, highest to lowest."
    Then the question box shows "Show total sales by customer for this month, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-008"

  @REV-009 @regression @chat
  Scenario: Ask the chat: How did total sales change during this month compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did total sales change during this month compared with the preceding period?"
    Then the question box shows "How did total sales change during this month compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-009"

  @REV-010 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to total sales for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to total sales for this month."
    Then the question box shows "Identify the top five contributors to total sales for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-010"

  @REV-011 @regression @chat
  Scenario: Ask the chat: Show gross revenue for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross revenue for last month."
    Then the question box shows "Show gross revenue for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-011"

  @REV-012 @regression @chat
  Scenario: Ask the chat: What was gross revenue during last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was gross revenue during last month?"
    Then the question box shows "What was gross revenue during last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-012"

  @REV-013 @regression @chat
  Scenario: Ask the chat: Break down gross revenue by month for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down gross revenue by month for last month."
    Then the question box shows "Break down gross revenue by month for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-013"

  @REV-014 @regression @chat
  Scenario: Ask the chat: Compare gross revenue across the months in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross revenue across the months in last month."
    Then the question box shows "Compare gross revenue across the months in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-014"

  @REV-015 @regression @chat
  Scenario: Ask the chat: Show the trend in gross revenue over last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in gross revenue over last month."
    Then the question box shows "Show the trend in gross revenue over last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-015"

  @REV-016 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to gross revenue in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to gross revenue in last month?"
    Then the question box shows "Which customers contributed the most to gross revenue in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-016"

  @REV-017 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest gross revenue in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest gross revenue in last month?"
    Then the question box shows "Which products or services generated the highest gross revenue in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-017"

  @REV-018 @regression @chat
  Scenario: Ask the chat: Show gross revenue by customer for last month, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show gross revenue by customer for last month, highest to lowest."
    Then the question box shows "Show gross revenue by customer for last month, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-018"

  @REV-019 @regression @chat
  Scenario: Ask the chat: How did gross revenue change during last month compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did gross revenue change during last month compared with the preceding period?"
    Then the question box shows "How did gross revenue change during last month compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-019"

  @REV-020 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to gross revenue for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to gross revenue for last month."
    Then the question box shows "Identify the top five contributors to gross revenue for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-020"

  @REV-021 @regression @chat
  Scenario: Ask the chat: Show invoiced revenue for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show invoiced revenue for this quarter."
    Then the question box shows "Show invoiced revenue for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-021"

  @REV-022 @regression @chat
  Scenario: Ask the chat: What was invoiced revenue during this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was invoiced revenue during this quarter?"
    Then the question box shows "What was invoiced revenue during this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-022"

  @REV-023 @regression @chat
  Scenario: Ask the chat: Break down invoiced revenue by month for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down invoiced revenue by month for this quarter."
    Then the question box shows "Break down invoiced revenue by month for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-023"

  @REV-024 @regression @chat
  Scenario: Ask the chat: Compare invoiced revenue across the months in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare invoiced revenue across the months in this quarter."
    Then the question box shows "Compare invoiced revenue across the months in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-024"

  @REV-025 @regression @chat
  Scenario: Ask the chat: Show the trend in invoiced revenue over this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in invoiced revenue over this quarter."
    Then the question box shows "Show the trend in invoiced revenue over this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-025"

  @REV-026 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to invoiced revenue in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to invoiced revenue in this quarter?"
    Then the question box shows "Which customers contributed the most to invoiced revenue in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-026"

  @REV-027 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest invoiced revenue in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest invoiced revenue in this quarter?"
    Then the question box shows "Which products or services generated the highest invoiced revenue in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-027"

  @REV-028 @regression @chat
  Scenario: Ask the chat: Show invoiced revenue by customer for this quarter, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show invoiced revenue by customer for this quarter, highest to lowest."
    Then the question box shows "Show invoiced revenue by customer for this quarter, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-028"

  @REV-029 @regression @chat
  Scenario: Ask the chat: How did invoiced revenue change during this quarter compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did invoiced revenue change during this quarter compared with the preceding period?"
    Then the question box shows "How did invoiced revenue change during this quarter compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-029"

  @REV-030 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to invoiced revenue for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to invoiced revenue for this quarter."
    Then the question box shows "Identify the top five contributors to invoiced revenue for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-030"

  @REV-031 @regression @chat
  Scenario: Ask the chat: Show recognised sales for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show recognised sales for last quarter."
    Then the question box shows "Show recognised sales for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-031"

  @REV-032 @regression @chat
  Scenario: Ask the chat: What was recognised sales during last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was recognised sales during last quarter?"
    Then the question box shows "What was recognised sales during last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-032"

  @REV-033 @regression @chat
  Scenario: Ask the chat: Break down recognised sales by month for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down recognised sales by month for last quarter."
    Then the question box shows "Break down recognised sales by month for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-033"

  @REV-034 @regression @chat
  Scenario: Ask the chat: Compare recognised sales across the months in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare recognised sales across the months in last quarter."
    Then the question box shows "Compare recognised sales across the months in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-034"

  @REV-035 @regression @chat
  Scenario: Ask the chat: Show the trend in recognised sales over last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in recognised sales over last quarter."
    Then the question box shows "Show the trend in recognised sales over last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-035"

  @REV-036 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to recognised sales in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to recognised sales in last quarter?"
    Then the question box shows "Which customers contributed the most to recognised sales in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-036"

  @REV-037 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest recognised sales in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest recognised sales in last quarter?"
    Then the question box shows "Which products or services generated the highest recognised sales in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-037"

  @REV-038 @regression @chat
  Scenario: Ask the chat: Show recognised sales by customer for last quarter, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show recognised sales by customer for last quarter, highest to lowest."
    Then the question box shows "Show recognised sales by customer for last quarter, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-038"

  @REV-039 @regression @chat
  Scenario: Ask the chat: How did recognised sales change during last quarter compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did recognised sales change during last quarter compared with the preceding period?"
    Then the question box shows "How did recognised sales change during last quarter compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-039"

  @REV-040 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to recognised sales for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to recognised sales for last quarter."
    Then the question box shows "Identify the top five contributors to recognised sales for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-040"

  @REV-041 @regression @chat
  Scenario: Ask the chat: Show sales before discounts for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show sales before discounts for this year."
    Then the question box shows "Show sales before discounts for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-041"

  @REV-042 @regression @chat
  Scenario: Ask the chat: What was sales before discounts during this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was sales before discounts during this year?"
    Then the question box shows "What was sales before discounts during this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-042"

  @REV-043 @regression @chat
  Scenario: Ask the chat: Break down sales before discounts by month for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down sales before discounts by month for this year."
    Then the question box shows "Break down sales before discounts by month for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-043"

  @REV-044 @regression @chat
  Scenario: Ask the chat: Compare sales before discounts across the months in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare sales before discounts across the months in this year."
    Then the question box shows "Compare sales before discounts across the months in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-044"

  @REV-045 @regression @chat
  Scenario: Ask the chat: Show the trend in sales before discounts over this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in sales before discounts over this year."
    Then the question box shows "Show the trend in sales before discounts over this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-045"

  @REV-046 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to sales before discounts in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to sales before discounts in this year?"
    Then the question box shows "Which customers contributed the most to sales before discounts in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-046"

  @REV-047 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest sales before discounts in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest sales before discounts in this year?"
    Then the question box shows "Which products or services generated the highest sales before discounts in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-047"

  @REV-048 @regression @chat
  Scenario: Ask the chat: Show sales before discounts by customer for this year, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show sales before discounts by customer for this year, highest to lowest."
    Then the question box shows "Show sales before discounts by customer for this year, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-048"

  @REV-049 @regression @chat
  Scenario: Ask the chat: How did sales before discounts change during this year compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did sales before discounts change during this year compared with the preceding period?"
    Then the question box shows "How did sales before discounts change during this year compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-049"

  @REV-050 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to sales before discounts for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to sales before discounts for this year."
    Then the question box shows "Identify the top five contributors to sales before discounts for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-050"

  @REV-051 @regression @chat
  Scenario: Ask the chat: Show sales after discounts for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show sales after discounts for last year."
    Then the question box shows "Show sales after discounts for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-051"

  @REV-052 @regression @chat
  Scenario: Ask the chat: What was sales after discounts during last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was sales after discounts during last year?"
    Then the question box shows "What was sales after discounts during last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-052"

  @REV-053 @regression @chat
  Scenario: Ask the chat: Break down sales after discounts by month for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down sales after discounts by month for last year."
    Then the question box shows "Break down sales after discounts by month for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-053"

  @REV-054 @regression @chat
  Scenario: Ask the chat: Compare sales after discounts across the months in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare sales after discounts across the months in last year."
    Then the question box shows "Compare sales after discounts across the months in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-054"

  @REV-055 @regression @chat
  Scenario: Ask the chat: Show the trend in sales after discounts over last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in sales after discounts over last year."
    Then the question box shows "Show the trend in sales after discounts over last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-055"

  @REV-056 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to sales after discounts in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to sales after discounts in last year?"
    Then the question box shows "Which customers contributed the most to sales after discounts in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-056"

  @REV-057 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest sales after discounts in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest sales after discounts in last year?"
    Then the question box shows "Which products or services generated the highest sales after discounts in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-057"

  @REV-058 @regression @chat
  Scenario: Ask the chat: Show sales after discounts by customer for last year, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show sales after discounts by customer for last year, highest to lowest."
    Then the question box shows "Show sales after discounts by customer for last year, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-058"

  @REV-059 @regression @chat
  Scenario: Ask the chat: How did sales after discounts change during last year compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did sales after discounts change during last year compared with the preceding period?"
    Then the question box shows "How did sales after discounts change during last year compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-059"

  @REV-060 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to sales after discounts for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to sales after discounts for last year."
    Then the question box shows "Identify the top five contributors to sales after discounts for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-060"

  @REV-061 @regression @chat
  Scenario: Ask the chat: Show service revenue for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show service revenue for the current fiscal year."
    Then the question box shows "Show service revenue for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-061"

  @REV-062 @regression @chat
  Scenario: Ask the chat: What was service revenue during the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was service revenue during the current fiscal year?"
    Then the question box shows "What was service revenue during the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-062"

  @REV-063 @regression @chat
  Scenario: Ask the chat: Break down service revenue by month for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down service revenue by month for the current fiscal year."
    Then the question box shows "Break down service revenue by month for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-063"

  @REV-064 @regression @chat
  Scenario: Ask the chat: Compare service revenue across the months in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare service revenue across the months in the current fiscal year."
    Then the question box shows "Compare service revenue across the months in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-064"

  @REV-065 @regression @chat
  Scenario: Ask the chat: Show the trend in service revenue over the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in service revenue over the current fiscal year."
    Then the question box shows "Show the trend in service revenue over the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-065"

  @REV-066 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to service revenue in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to service revenue in the current fiscal year?"
    Then the question box shows "Which customers contributed the most to service revenue in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-066"

  @REV-067 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest service revenue in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest service revenue in the current fiscal year?"
    Then the question box shows "Which products or services generated the highest service revenue in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-067"

  @REV-068 @regression @chat
  Scenario: Ask the chat: Show service revenue by customer for the current fiscal year, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show service revenue by customer for the current fiscal year, highest to lowest."
    Then the question box shows "Show service revenue by customer for the current fiscal year, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-068"

  @REV-069 @regression @chat
  Scenario: Ask the chat: How did service revenue change during the current fiscal year compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did service revenue change during the current fiscal year compared with the preceding period?"
    Then the question box shows "How did service revenue change during the current fiscal year compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-069"

  @REV-070 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to service revenue for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to service revenue for the current fiscal year."
    Then the question box shows "Identify the top five contributors to service revenue for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-070"

  @REV-071 @regression @chat
  Scenario: Ask the chat: Show product revenue for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show product revenue for the previous fiscal year."
    Then the question box shows "Show product revenue for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-071"

  @REV-072 @regression @chat
  Scenario: Ask the chat: What was product revenue during the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was product revenue during the previous fiscal year?"
    Then the question box shows "What was product revenue during the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-072"

  @REV-073 @regression @chat
  Scenario: Ask the chat: Break down product revenue by month for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down product revenue by month for the previous fiscal year."
    Then the question box shows "Break down product revenue by month for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-073"

  @REV-074 @regression @chat
  Scenario: Ask the chat: Compare product revenue across the months in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare product revenue across the months in the previous fiscal year."
    Then the question box shows "Compare product revenue across the months in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-074"

  @REV-075 @regression @chat
  Scenario: Ask the chat: Show the trend in product revenue over the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in product revenue over the previous fiscal year."
    Then the question box shows "Show the trend in product revenue over the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-075"

  @REV-076 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to product revenue in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to product revenue in the previous fiscal year?"
    Then the question box shows "Which customers contributed the most to product revenue in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-076"

  @REV-077 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest product revenue in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest product revenue in the previous fiscal year?"
    Then the question box shows "Which products or services generated the highest product revenue in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-077"

  @REV-078 @regression @chat
  Scenario: Ask the chat: Show product revenue by customer for the previous fiscal year, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show product revenue by customer for the previous fiscal year, highest to lowest."
    Then the question box shows "Show product revenue by customer for the previous fiscal year, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-078"

  @REV-079 @regression @chat
  Scenario: Ask the chat: How did product revenue change during the previous fiscal year compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did product revenue change during the previous fiscal year compared with the preceding period?"
    Then the question box shows "How did product revenue change during the previous fiscal year compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-079"

  @REV-080 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to product revenue for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to product revenue for the previous fiscal year."
    Then the question box shows "Identify the top five contributors to product revenue for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-080"

  @REV-081 @regression @chat
  Scenario: Ask the chat: Show recurring revenue for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show recurring revenue for the last 90 days."
    Then the question box shows "Show recurring revenue for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-081"

  @REV-082 @regression @chat
  Scenario: Ask the chat: What was recurring revenue during the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was recurring revenue during the last 90 days?"
    Then the question box shows "What was recurring revenue during the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-082"

  @REV-083 @regression @chat
  Scenario: Ask the chat: Break down recurring revenue by month for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down recurring revenue by month for the last 90 days."
    Then the question box shows "Break down recurring revenue by month for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-083"

  @REV-084 @regression @chat
  Scenario: Ask the chat: Compare recurring revenue across the months in the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare recurring revenue across the months in the last 90 days."
    Then the question box shows "Compare recurring revenue across the months in the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-084"

  @REV-085 @regression @chat
  Scenario: Ask the chat: Show the trend in recurring revenue over the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in recurring revenue over the last 90 days."
    Then the question box shows "Show the trend in recurring revenue over the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-085"

  @REV-086 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to recurring revenue in the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to recurring revenue in the last 90 days?"
    Then the question box shows "Which customers contributed the most to recurring revenue in the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-086"

  @REV-087 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest recurring revenue in the last 90 days?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest recurring revenue in the last 90 days?"
    Then the question box shows "Which products or services generated the highest recurring revenue in the last 90 days?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-087"

  @REV-088 @regression @chat
  Scenario: Ask the chat: Show recurring revenue by customer for the last 90 days, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show recurring revenue by customer for the last 90 days, highest to lowest."
    Then the question box shows "Show recurring revenue by customer for the last 90 days, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-088"

  @REV-089 @regression @chat
  Scenario: Ask the chat: How did recurring revenue change during the last 90 days compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did recurring revenue change during the last 90 days compared with the preceding period?"
    Then the question box shows "How did recurring revenue change during the last 90 days compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-089"

  @REV-090 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to recurring revenue for the last 90 days.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to recurring revenue for the last 90 days."
    Then the question box shows "Identify the top five contributors to recurring revenue for the last 90 days."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-090"

  @REV-091 @regression @chat
  Scenario: Ask the chat: Show revenue from customers for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show revenue from customers for the last 12 months."
    Then the question box shows "Show revenue from customers for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-091"

  @REV-092 @regression @chat
  Scenario: Ask the chat: What was revenue from customers during the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What was revenue from customers during the last 12 months?"
    Then the question box shows "What was revenue from customers during the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-092"

  @REV-093 @regression @chat
  Scenario: Ask the chat: Break down revenue from customers by month for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down revenue from customers by month for the last 12 months."
    Then the question box shows "Break down revenue from customers by month for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-093"

  @REV-094 @regression @chat
  Scenario: Ask the chat: Compare revenue from customers across the months in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare revenue from customers across the months in the last 12 months."
    Then the question box shows "Compare revenue from customers across the months in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-094"

  @REV-095 @regression @chat
  Scenario: Ask the chat: Show the trend in revenue from customers over the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend in revenue from customers over the last 12 months."
    Then the question box shows "Show the trend in revenue from customers over the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-095"

  @REV-096 @regression @chat
  Scenario: Ask the chat: Which customers contributed the most to revenue from customers in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers contributed the most to revenue from customers in the last 12 months?"
    Then the question box shows "Which customers contributed the most to revenue from customers in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-096"

  @REV-097 @regression @chat
  Scenario: Ask the chat: Which products or services generated the highest revenue from customers in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which products or services generated the highest revenue from customers in the last 12 months?"
    Then the question box shows "Which products or services generated the highest revenue from customers in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-097"

  @REV-098 @regression @chat
  Scenario: Ask the chat: Show revenue from customers by customer for the last 12 months, highest to lowest.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show revenue from customers by customer for the last 12 months, highest to lowest."
    Then the question box shows "Show revenue from customers by customer for the last 12 months, highest to lowest."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-098"

  @REV-099 @regression @chat
  Scenario: Ask the chat: How did revenue from customers change during the last 12 months compared with the preceding period?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How did revenue from customers change during the last 12 months compared with the preceding period?"
    Then the question box shows "How did revenue from customers change during the last 12 months compared with the preceding period?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-099"

  @REV-100 @regression @chat
  Scenario: Ask the chat: Identify the top five contributors to revenue from customers for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the top five contributors to revenue from customers for the last 12 months."
    Then the question box shows "Identify the top five contributors to revenue from customers for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a revenue analysis
    And the answer matches the database oracle for "REV-100"

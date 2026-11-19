# Generated-by: Gherkin Generator Agent · 001 · 2026-11-18 · AI-generated, human review required
# Source: docs/normalizer/001.md (REV-001 to REV-050; REV-011 to REV-020 and REV-021 to REV-050 added 2026-11-19). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/001.json (Stage 3.5, draft pending Gate O review).
# TBD: response wording; metric definitions D-A/D-B/D-C (see docs/oracle/spike_REV-001-003.md).

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

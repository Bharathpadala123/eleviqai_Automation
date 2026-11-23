# Generated-by: Gherkin Generator Agent · 005 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/005.md (BUD-001 to BUD-100). Req ID is TBD for every case, so no @RQ tag is written.
# Expected figures come from the SQL oracle in docs/oracle/005.json (Stage 3.5, draft pending Gate O review). Cases with oracle mode "none" run Checks 1-3 only; their oracle notes say why.
# TBD: response wording; metric definitions (docs/oracle/005.json "definitions").

@005
Feature: Budget variance questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @BUD-001 @regression @chat
  Scenario: Ask the chat: Compare actual revenue with budget for this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual revenue with budget for this month."
    Then the question box shows "Compare actual revenue with budget for this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-001"

  @BUD-002 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for revenue in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for revenue in this month."
    Then the question box shows "Show the dollar variance for revenue in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-002"

  @BUD-003 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for revenue in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for revenue in this month."
    Then the question box shows "Show the percentage variance for revenue in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-003"

  @BUD-004 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable revenue variance during this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable revenue variance during this month?"
    Then the question box shows "Which months had the largest unfavorable revenue variance during this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-004"

  @BUD-005 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for revenue by account in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for revenue by account in this month."
    Then the question box shows "Break down the actual-versus-budget variance for revenue by account in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-005"

  @BUD-006 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for revenue by month in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for revenue by month in this month."
    Then the question box shows "Show budget, actual and variance for revenue by month in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-006"

  @BUD-007 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest revenue variance in this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest revenue variance in this month?"
    Then the question box shows "Which departments or classes have the largest revenue variance in this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-007"

  @BUD-008 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable revenue variance in this month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable revenue variance in this month."
    Then the question box shows "Identify the main contributors to the unfavorable revenue variance in this month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-008"

  @BUD-009 @regression @chat
  Scenario: Ask the chat: Rank the periods in this month by favorable revenue variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in this month by favorable revenue variance."
    Then the question box shows "Rank the periods in this month by favorable revenue variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-009"

  @BUD-010 @regression @chat
  Scenario: Ask the chat: Did actual revenue exceed or fall below budget during this month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual revenue exceed or fall below budget during this month?"
    Then the question box shows "Did actual revenue exceed or fall below budget during this month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-010"

  @BUD-011 @regression @chat
  Scenario: Ask the chat: Compare actual gross profit with budget for last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual gross profit with budget for last month."
    Then the question box shows "Compare actual gross profit with budget for last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-011"

  @BUD-012 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for gross profit in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for gross profit in last month."
    Then the question box shows "Show the dollar variance for gross profit in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-012"

  @BUD-013 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for gross profit in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for gross profit in last month."
    Then the question box shows "Show the percentage variance for gross profit in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-013"

  @BUD-014 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable gross profit variance during last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable gross profit variance during last month?"
    Then the question box shows "Which months had the largest unfavorable gross profit variance during last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-014"

  @BUD-015 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for gross profit by account in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for gross profit by account in last month."
    Then the question box shows "Break down the actual-versus-budget variance for gross profit by account in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-015"

  @BUD-016 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for gross profit by month in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for gross profit by month in last month."
    Then the question box shows "Show budget, actual and variance for gross profit by month in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-016"

  @BUD-017 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest gross profit variance in last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest gross profit variance in last month?"
    Then the question box shows "Which departments or classes have the largest gross profit variance in last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-017"

  @BUD-018 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable gross profit variance in last month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable gross profit variance in last month."
    Then the question box shows "Identify the main contributors to the unfavorable gross profit variance in last month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-018"

  @BUD-019 @regression @chat
  Scenario: Ask the chat: Rank the periods in last month by favorable gross profit variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in last month by favorable gross profit variance."
    Then the question box shows "Rank the periods in last month by favorable gross profit variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-019"

  @BUD-020 @regression @chat
  Scenario: Ask the chat: Did actual gross profit exceed or fall below budget during last month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual gross profit exceed or fall below budget during last month?"
    Then the question box shows "Did actual gross profit exceed or fall below budget during last month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-020"

  @BUD-021 @regression @chat
  Scenario: Ask the chat: Compare actual payroll with budget for this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual payroll with budget for this quarter."
    Then the question box shows "Compare actual payroll with budget for this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-021"

  @BUD-022 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for payroll in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for payroll in this quarter."
    Then the question box shows "Show the dollar variance for payroll in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-022"

  @BUD-023 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for payroll in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for payroll in this quarter."
    Then the question box shows "Show the percentage variance for payroll in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-023"

  @BUD-024 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable payroll variance during this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable payroll variance during this quarter?"
    Then the question box shows "Which months had the largest unfavorable payroll variance during this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-024"

  @BUD-025 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for payroll by account in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for payroll by account in this quarter."
    Then the question box shows "Break down the actual-versus-budget variance for payroll by account in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-025"

  @BUD-026 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for payroll by month in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for payroll by month in this quarter."
    Then the question box shows "Show budget, actual and variance for payroll by month in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-026"

  @BUD-027 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest payroll variance in this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest payroll variance in this quarter?"
    Then the question box shows "Which departments or classes have the largest payroll variance in this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-027"

  @BUD-028 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable payroll variance in this quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable payroll variance in this quarter."
    Then the question box shows "Identify the main contributors to the unfavorable payroll variance in this quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-028"

  @BUD-029 @regression @chat
  Scenario: Ask the chat: Rank the periods in this quarter by favorable payroll variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in this quarter by favorable payroll variance."
    Then the question box shows "Rank the periods in this quarter by favorable payroll variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-029"

  @BUD-030 @regression @chat
  Scenario: Ask the chat: Did actual payroll exceed or fall below budget during this quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual payroll exceed or fall below budget during this quarter?"
    Then the question box shows "Did actual payroll exceed or fall below budget during this quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-030"

  @BUD-031 @regression @chat
  Scenario: Ask the chat: Compare actual marketing expenses with budget for last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual marketing expenses with budget for last quarter."
    Then the question box shows "Compare actual marketing expenses with budget for last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-031"

  @BUD-032 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for marketing expenses in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for marketing expenses in last quarter."
    Then the question box shows "Show the dollar variance for marketing expenses in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-032"

  @BUD-033 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for marketing expenses in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for marketing expenses in last quarter."
    Then the question box shows "Show the percentage variance for marketing expenses in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-033"

  @BUD-034 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable marketing expenses variance during last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable marketing expenses variance during last quarter?"
    Then the question box shows "Which months had the largest unfavorable marketing expenses variance during last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-034"

  @BUD-035 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for marketing expenses by account in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for marketing expenses by account in last quarter."
    Then the question box shows "Break down the actual-versus-budget variance for marketing expenses by account in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-035"

  @BUD-036 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for marketing expenses by month in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for marketing expenses by month in last quarter."
    Then the question box shows "Show budget, actual and variance for marketing expenses by month in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-036"

  @BUD-037 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest marketing expenses variance in last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest marketing expenses variance in last quarter?"
    Then the question box shows "Which departments or classes have the largest marketing expenses variance in last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-037"

  @BUD-038 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable marketing expenses variance in last quarter.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable marketing expenses variance in last quarter."
    Then the question box shows "Identify the main contributors to the unfavorable marketing expenses variance in last quarter."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-038"

  @BUD-039 @regression @chat
  Scenario: Ask the chat: Rank the periods in last quarter by favorable marketing expenses variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in last quarter by favorable marketing expenses variance."
    Then the question box shows "Rank the periods in last quarter by favorable marketing expenses variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-039"

  @BUD-040 @regression @chat
  Scenario: Ask the chat: Did actual marketing expenses exceed or fall below budget during last quarter?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual marketing expenses exceed or fall below budget during last quarter?"
    Then the question box shows "Did actual marketing expenses exceed or fall below budget during last quarter?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-040"

  @BUD-041 @regression @chat
  Scenario: Ask the chat: Compare actual travel expenses with budget for this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual travel expenses with budget for this year."
    Then the question box shows "Compare actual travel expenses with budget for this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-041"

  @BUD-042 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for travel expenses in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for travel expenses in this year."
    Then the question box shows "Show the dollar variance for travel expenses in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-042"

  @BUD-043 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for travel expenses in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for travel expenses in this year."
    Then the question box shows "Show the percentage variance for travel expenses in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-043"

  @BUD-044 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable travel expenses variance during this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable travel expenses variance during this year?"
    Then the question box shows "Which months had the largest unfavorable travel expenses variance during this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-044"

  @BUD-045 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for travel expenses by account in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for travel expenses by account in this year."
    Then the question box shows "Break down the actual-versus-budget variance for travel expenses by account in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-045"

  @BUD-046 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for travel expenses by month in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for travel expenses by month in this year."
    Then the question box shows "Show budget, actual and variance for travel expenses by month in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-046"

  @BUD-047 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest travel expenses variance in this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest travel expenses variance in this year?"
    Then the question box shows "Which departments or classes have the largest travel expenses variance in this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-047"

  @BUD-048 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable travel expenses variance in this year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable travel expenses variance in this year."
    Then the question box shows "Identify the main contributors to the unfavorable travel expenses variance in this year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-048"

  @BUD-049 @regression @chat
  Scenario: Ask the chat: Rank the periods in this year by favorable travel expenses variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in this year by favorable travel expenses variance."
    Then the question box shows "Rank the periods in this year by favorable travel expenses variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-049"

  @BUD-050 @regression @chat
  Scenario: Ask the chat: Did actual travel expenses exceed or fall below budget during this year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual travel expenses exceed or fall below budget during this year?"
    Then the question box shows "Did actual travel expenses exceed or fall below budget during this year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-050"

  @BUD-051 @regression @chat
  Scenario: Ask the chat: Compare actual rent with budget for last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual rent with budget for last year."
    Then the question box shows "Compare actual rent with budget for last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-051"

  @BUD-052 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for rent in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for rent in last year."
    Then the question box shows "Show the dollar variance for rent in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-052"

  @BUD-053 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for rent in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for rent in last year."
    Then the question box shows "Show the percentage variance for rent in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-053"

  @BUD-054 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable rent variance during last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable rent variance during last year?"
    Then the question box shows "Which months had the largest unfavorable rent variance during last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-054"

  @BUD-055 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for rent by account in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for rent by account in last year."
    Then the question box shows "Break down the actual-versus-budget variance for rent by account in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-055"

  @BUD-056 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for rent by month in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for rent by month in last year."
    Then the question box shows "Show budget, actual and variance for rent by month in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-056"

  @BUD-057 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest rent variance in last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest rent variance in last year?"
    Then the question box shows "Which departments or classes have the largest rent variance in last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-057"

  @BUD-058 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable rent variance in last year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable rent variance in last year."
    Then the question box shows "Identify the main contributors to the unfavorable rent variance in last year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-058"

  @BUD-059 @regression @chat
  Scenario: Ask the chat: Rank the periods in last year by favorable rent variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in last year by favorable rent variance."
    Then the question box shows "Rank the periods in last year by favorable rent variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-059"

  @BUD-060 @regression @chat
  Scenario: Ask the chat: Did actual rent exceed or fall below budget during last year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual rent exceed or fall below budget during last year?"
    Then the question box shows "Did actual rent exceed or fall below budget during last year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-060"

  @BUD-061 @regression @chat
  Scenario: Ask the chat: Compare actual software costs with budget for the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual software costs with budget for the current fiscal year."
    Then the question box shows "Compare actual software costs with budget for the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-061"

  @BUD-062 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for software costs in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for software costs in the current fiscal year."
    Then the question box shows "Show the dollar variance for software costs in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-062"

  @BUD-063 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for software costs in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for software costs in the current fiscal year."
    Then the question box shows "Show the percentage variance for software costs in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-063"

  @BUD-064 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable software costs variance during the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable software costs variance during the current fiscal year?"
    Then the question box shows "Which months had the largest unfavorable software costs variance during the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-064"

  @BUD-065 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for software costs by account in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for software costs by account in the current fiscal year."
    Then the question box shows "Break down the actual-versus-budget variance for software costs by account in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-065"

  @BUD-066 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for software costs by month in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for software costs by month in the current fiscal year."
    Then the question box shows "Show budget, actual and variance for software costs by month in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-066"

  @BUD-067 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest software costs variance in the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest software costs variance in the current fiscal year?"
    Then the question box shows "Which departments or classes have the largest software costs variance in the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-067"

  @BUD-068 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable software costs variance in the current fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable software costs variance in the current fiscal year."
    Then the question box shows "Identify the main contributors to the unfavorable software costs variance in the current fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-068"

  @BUD-069 @regression @chat
  Scenario: Ask the chat: Rank the periods in the current fiscal year by favorable software costs variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in the current fiscal year by favorable software costs variance."
    Then the question box shows "Rank the periods in the current fiscal year by favorable software costs variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-069"

  @BUD-070 @regression @chat
  Scenario: Ask the chat: Did actual software costs exceed or fall below budget during the current fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual software costs exceed or fall below budget during the current fiscal year?"
    Then the question box shows "Did actual software costs exceed or fall below budget during the current fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-070"

  @BUD-071 @regression @chat
  Scenario: Ask the chat: Compare actual operating expenses with budget for the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual operating expenses with budget for the previous fiscal year."
    Then the question box shows "Compare actual operating expenses with budget for the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-071"

  @BUD-072 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for operating expenses in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for operating expenses in the previous fiscal year."
    Then the question box shows "Show the dollar variance for operating expenses in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-072"

  @BUD-073 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for operating expenses in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for operating expenses in the previous fiscal year."
    Then the question box shows "Show the percentage variance for operating expenses in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-073"

  @BUD-074 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable operating expenses variance during the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable operating expenses variance during the previous fiscal year?"
    Then the question box shows "Which months had the largest unfavorable operating expenses variance during the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-074"

  @BUD-075 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for operating expenses by account in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for operating expenses by account in the previous fiscal year."
    Then the question box shows "Break down the actual-versus-budget variance for operating expenses by account in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-075"

  @BUD-076 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for operating expenses by month in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for operating expenses by month in the previous fiscal year."
    Then the question box shows "Show budget, actual and variance for operating expenses by month in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-076"

  @BUD-077 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest operating expenses variance in the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest operating expenses variance in the previous fiscal year?"
    Then the question box shows "Which departments or classes have the largest operating expenses variance in the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-077"

  @BUD-078 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable operating expenses variance in the previous fiscal year.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable operating expenses variance in the previous fiscal year."
    Then the question box shows "Identify the main contributors to the unfavorable operating expenses variance in the previous fiscal year."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-078"

  @BUD-079 @regression @chat
  Scenario: Ask the chat: Rank the periods in the previous fiscal year by favorable operating expenses variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in the previous fiscal year by favorable operating expenses variance."
    Then the question box shows "Rank the periods in the previous fiscal year by favorable operating expenses variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-079"

  @BUD-080 @regression @chat
  Scenario: Ask the chat: Did actual operating expenses exceed or fall below budget during the previous fiscal year?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual operating expenses exceed or fall below budget during the previous fiscal year?"
    Then the question box shows "Did actual operating expenses exceed or fall below budget during the previous fiscal year?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-080"

  @BUD-081 @regression @chat
  Scenario: Ask the chat: Compare actual cost of goods sold with budget for the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual cost of goods sold with budget for the last six months."
    Then the question box shows "Compare actual cost of goods sold with budget for the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-081"

  @BUD-082 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for cost of goods sold in the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for cost of goods sold in the last six months."
    Then the question box shows "Show the dollar variance for cost of goods sold in the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-082"

  @BUD-083 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for cost of goods sold in the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for cost of goods sold in the last six months."
    Then the question box shows "Show the percentage variance for cost of goods sold in the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-083"

  @BUD-084 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable cost of goods sold variance during the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable cost of goods sold variance during the last six months?"
    Then the question box shows "Which months had the largest unfavorable cost of goods sold variance during the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-084"

  @BUD-085 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for cost of goods sold by account in the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for cost of goods sold by account in the last six months."
    Then the question box shows "Break down the actual-versus-budget variance for cost of goods sold by account in the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-085"

  @BUD-086 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for cost of goods sold by month in the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for cost of goods sold by month in the last six months."
    Then the question box shows "Show budget, actual and variance for cost of goods sold by month in the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-086"

  @BUD-087 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest cost of goods sold variance in the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest cost of goods sold variance in the last six months?"
    Then the question box shows "Which departments or classes have the largest cost of goods sold variance in the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-087"

  @BUD-088 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable cost of goods sold variance in the last six months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable cost of goods sold variance in the last six months."
    Then the question box shows "Identify the main contributors to the unfavorable cost of goods sold variance in the last six months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-088"

  @BUD-089 @regression @chat
  Scenario: Ask the chat: Rank the periods in the last six months by favorable cost of goods sold variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in the last six months by favorable cost of goods sold variance."
    Then the question box shows "Rank the periods in the last six months by favorable cost of goods sold variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-089"

  @BUD-090 @regression @chat
  Scenario: Ask the chat: Did actual cost of goods sold exceed or fall below budget during the last six months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual cost of goods sold exceed or fall below budget during the last six months?"
    Then the question box shows "Did actual cost of goods sold exceed or fall below budget during the last six months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-090"

  @BUD-091 @regression @chat
  Scenario: Ask the chat: Compare actual net income with budget for the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare actual net income with budget for the last 12 months."
    Then the question box shows "Compare actual net income with budget for the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-091"

  @BUD-092 @regression @chat
  Scenario: Ask the chat: Show the dollar variance for net income in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the dollar variance for net income in the last 12 months."
    Then the question box shows "Show the dollar variance for net income in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-092"

  @BUD-093 @regression @chat
  Scenario: Ask the chat: Show the percentage variance for net income in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the percentage variance for net income in the last 12 months."
    Then the question box shows "Show the percentage variance for net income in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-093"

  @BUD-094 @regression @chat
  Scenario: Ask the chat: Which months had the largest unfavorable net income variance during the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which months had the largest unfavorable net income variance during the last 12 months?"
    Then the question box shows "Which months had the largest unfavorable net income variance during the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-094"

  @BUD-095 @regression @chat
  Scenario: Ask the chat: Break down the actual-versus-budget variance for net income by account in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Break down the actual-versus-budget variance for net income by account in the last 12 months."
    Then the question box shows "Break down the actual-versus-budget variance for net income by account in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-095"

  @BUD-096 @regression @chat
  Scenario: Ask the chat: Show budget, actual and variance for net income by month in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show budget, actual and variance for net income by month in the last 12 months."
    Then the question box shows "Show budget, actual and variance for net income by month in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-096"

  @BUD-097 @regression @chat
  Scenario: Ask the chat: Which departments or classes have the largest net income variance in the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which departments or classes have the largest net income variance in the last 12 months?"
    Then the question box shows "Which departments or classes have the largest net income variance in the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-097"

  @BUD-098 @regression @chat
  Scenario: Ask the chat: Identify the main contributors to the unfavorable net income variance in the last 12 months.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Identify the main contributors to the unfavorable net income variance in the last 12 months."
    Then the question box shows "Identify the main contributors to the unfavorable net income variance in the last 12 months."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-098"

  @BUD-099 @regression @chat
  Scenario: Ask the chat: Rank the periods in the last 12 months by favorable net income variance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Rank the periods in the last 12 months by favorable net income variance."
    Then the question box shows "Rank the periods in the last 12 months by favorable net income variance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-099"

  @BUD-100 @regression @chat
  Scenario: Ask the chat: Did actual net income exceed or fall below budget during the last 12 months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Did actual net income exceed or fall below budget during the last 12 months?"
    Then the question box shows "Did actual net income exceed or fall below budget during the last 12 months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a budget versus actual analysis
    And the answer matches the database oracle for "BUD-100"

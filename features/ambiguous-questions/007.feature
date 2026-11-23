# Generated-by: Gherkin Generator Agent · 007 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/007.md (AMB-001 to AMB-100). Req ID is TBD for every case, so no @RQ tag is written.
# Expected behaviour (workbook): the app asks for the missing metric, period, comparison baseline or dimension instead of guessing. Checked by utils/chatBehaviour.ts (no SQL oracle).
# TBD: exact clarification wording; the cue list in utils/chatBehaviour.ts is provisional.

@007
Feature: Ambiguous questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @AMB-001 @regression @chat
  Scenario: Ask the chat: Show performance.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance."
    Then the question box shows "Show performance."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-001"

  @AMB-002 @regression @chat
  Scenario: Ask the chat: How are we doing?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing?"
    Then the question box shows "How are we doing?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-002"

  @AMB-003 @regression @chat
  Scenario: Ask the chat: Is the business healthy?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy?"
    Then the question box shows "Is the business healthy?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-003"

  @AMB-004 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers."
    Then the question box shows "Show the latest numbers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-004"

  @AMB-005 @regression @chat
  Scenario: Ask the chat: What changed recently?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently?"
    Then the question box shows "What changed recently?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-005"

  @AMB-006 @regression @chat
  Scenario: Ask the chat: Why is it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down?"
    Then the question box shows "Why is it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-006"

  @AMB-007 @regression @chat
  Scenario: Ask the chat: Why is it up?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up?"
    Then the question box shows "Why is it up?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-007"

  @AMB-008 @regression @chat
  Scenario: Ask the chat: Show the problem areas.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas."
    Then the question box shows "Show the problem areas."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-008"

  @AMB-009 @regression @chat
  Scenario: Ask the chat: Which customers are important?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important?"
    Then the question box shows "Which customers are important?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-009"

  @AMB-010 @regression @chat
  Scenario: Ask the chat: Who is costing us the most?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most?"
    Then the question box shows "Who is costing us the most?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-010"

  @AMB-011 @regression @chat
  Scenario: Ask the chat: Show our best products.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products."
    Then the question box shows "Show our best products."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-011"

  @AMB-012 @regression @chat
  Scenario: Ask the chat: Are expenses too high?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high?"
    Then the question box shows "Are expenses too high?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-012"

  @AMB-013 @regression @chat
  Scenario: Ask the chat: Is profit good?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good?"
    Then the question box shows "Is profit good?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-013"

  @AMB-014 @regression @chat
  Scenario: Ask the chat: Compare the numbers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers."
    Then the question box shows "Compare the numbers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-014"

  @AMB-015 @regression @chat
  Scenario: Ask the chat: Show the trend.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend."
    Then the question box shows "Show the trend."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-015"

  @AMB-016 @regression @chat
  Scenario: Ask the chat: What is the variance?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance?"
    Then the question box shows "What is the variance?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-016"

  @AMB-017 @regression @chat
  Scenario: Ask the chat: How much did we make?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How much did we make?"
    Then the question box shows "How much did we make?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-017"

  @AMB-018 @regression @chat
  Scenario: Ask the chat: How much did we spend?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How much did we spend?"
    Then the question box shows "How much did we spend?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-018"

  @AMB-019 @regression @chat
  Scenario: Ask the chat: Show cash position.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show cash position."
    Then the question box shows "Show cash position."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-019"

  @AMB-020 @regression @chat
  Scenario: Ask the chat: Which period performed better?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which period performed better?"
    Then the question box shows "Which period performed better?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-020"

  @AMB-021 @regression @chat
  Scenario: Ask the chat: Show performance.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance.? Can you break it down?"
    Then the question box shows "Show performance.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-021"

  @AMB-022 @regression @chat
  Scenario: Ask the chat: Show performance.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance.? Show the details."
    Then the question box shows "Show performance.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-022"

  @AMB-023 @regression @chat
  Scenario: Ask the chat: Show performance.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance.? Give me the key drivers."
    Then the question box shows "Show performance.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-023"

  @AMB-024 @regression @chat
  Scenario: Ask the chat: Show performance.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance.? Compare it with the previous period."
    Then the question box shows "Show performance.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-024"

  @AMB-025 @regression @chat
  Scenario: Ask the chat: Show performance.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show performance.? Highlight anything unusual."
    Then the question box shows "Show performance.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-025"

  @AMB-026 @regression @chat
  Scenario: Ask the chat: How are we doing? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing? Can you break it down?"
    Then the question box shows "How are we doing? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-026"

  @AMB-027 @regression @chat
  Scenario: Ask the chat: How are we doing? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing? Show the details."
    Then the question box shows "How are we doing? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-027"

  @AMB-028 @regression @chat
  Scenario: Ask the chat: How are we doing? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing? Give me the key drivers."
    Then the question box shows "How are we doing? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-028"

  @AMB-029 @regression @chat
  Scenario: Ask the chat: How are we doing? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing? Compare it with the previous period."
    Then the question box shows "How are we doing? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-029"

  @AMB-030 @regression @chat
  Scenario: Ask the chat: How are we doing? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "How are we doing? Highlight anything unusual."
    Then the question box shows "How are we doing? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-030"

  @AMB-031 @regression @chat
  Scenario: Ask the chat: Is the business healthy? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy? Can you break it down?"
    Then the question box shows "Is the business healthy? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-031"

  @AMB-032 @regression @chat
  Scenario: Ask the chat: Is the business healthy? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy? Show the details."
    Then the question box shows "Is the business healthy? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-032"

  @AMB-033 @regression @chat
  Scenario: Ask the chat: Is the business healthy? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy? Give me the key drivers."
    Then the question box shows "Is the business healthy? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-033"

  @AMB-034 @regression @chat
  Scenario: Ask the chat: Is the business healthy? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy? Compare it with the previous period."
    Then the question box shows "Is the business healthy? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-034"

  @AMB-035 @regression @chat
  Scenario: Ask the chat: Is the business healthy? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is the business healthy? Highlight anything unusual."
    Then the question box shows "Is the business healthy? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-035"

  @AMB-036 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers.? Can you break it down?"
    Then the question box shows "Show the latest numbers.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-036"

  @AMB-037 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers.? Show the details."
    Then the question box shows "Show the latest numbers.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-037"

  @AMB-038 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers.? Give me the key drivers."
    Then the question box shows "Show the latest numbers.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-038"

  @AMB-039 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers.? Compare it with the previous period."
    Then the question box shows "Show the latest numbers.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-039"

  @AMB-040 @regression @chat
  Scenario: Ask the chat: Show the latest numbers.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the latest numbers.? Highlight anything unusual."
    Then the question box shows "Show the latest numbers.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-040"

  @AMB-041 @regression @chat
  Scenario: Ask the chat: What changed recently? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently? Can you break it down?"
    Then the question box shows "What changed recently? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-041"

  @AMB-042 @regression @chat
  Scenario: Ask the chat: What changed recently? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently? Show the details."
    Then the question box shows "What changed recently? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-042"

  @AMB-043 @regression @chat
  Scenario: Ask the chat: What changed recently? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently? Give me the key drivers."
    Then the question box shows "What changed recently? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-043"

  @AMB-044 @regression @chat
  Scenario: Ask the chat: What changed recently? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently? Compare it with the previous period."
    Then the question box shows "What changed recently? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-044"

  @AMB-045 @regression @chat
  Scenario: Ask the chat: What changed recently? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What changed recently? Highlight anything unusual."
    Then the question box shows "What changed recently? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-045"

  @AMB-046 @regression @chat
  Scenario: Ask the chat: Why is it down? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down? Can you break it down?"
    Then the question box shows "Why is it down? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-046"

  @AMB-047 @regression @chat
  Scenario: Ask the chat: Why is it down? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down? Show the details."
    Then the question box shows "Why is it down? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-047"

  @AMB-048 @regression @chat
  Scenario: Ask the chat: Why is it down? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down? Give me the key drivers."
    Then the question box shows "Why is it down? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-048"

  @AMB-049 @regression @chat
  Scenario: Ask the chat: Why is it down? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down? Compare it with the previous period."
    Then the question box shows "Why is it down? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-049"

  @AMB-050 @regression @chat
  Scenario: Ask the chat: Why is it down? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it down? Highlight anything unusual."
    Then the question box shows "Why is it down? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-050"

  @AMB-051 @regression @chat
  Scenario: Ask the chat: Why is it up? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up? Can you break it down?"
    Then the question box shows "Why is it up? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-051"

  @AMB-052 @regression @chat
  Scenario: Ask the chat: Why is it up? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up? Show the details."
    Then the question box shows "Why is it up? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-052"

  @AMB-053 @regression @chat
  Scenario: Ask the chat: Why is it up? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up? Give me the key drivers."
    Then the question box shows "Why is it up? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-053"

  @AMB-054 @regression @chat
  Scenario: Ask the chat: Why is it up? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up? Compare it with the previous period."
    Then the question box shows "Why is it up? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-054"

  @AMB-055 @regression @chat
  Scenario: Ask the chat: Why is it up? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Why is it up? Highlight anything unusual."
    Then the question box shows "Why is it up? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-055"

  @AMB-056 @regression @chat
  Scenario: Ask the chat: Show the problem areas.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas.? Can you break it down?"
    Then the question box shows "Show the problem areas.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-056"

  @AMB-057 @regression @chat
  Scenario: Ask the chat: Show the problem areas.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas.? Show the details."
    Then the question box shows "Show the problem areas.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-057"

  @AMB-058 @regression @chat
  Scenario: Ask the chat: Show the problem areas.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas.? Give me the key drivers."
    Then the question box shows "Show the problem areas.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-058"

  @AMB-059 @regression @chat
  Scenario: Ask the chat: Show the problem areas.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas.? Compare it with the previous period."
    Then the question box shows "Show the problem areas.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-059"

  @AMB-060 @regression @chat
  Scenario: Ask the chat: Show the problem areas.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the problem areas.? Highlight anything unusual."
    Then the question box shows "Show the problem areas.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-060"

  @AMB-061 @regression @chat
  Scenario: Ask the chat: Which customers are important? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important? Can you break it down?"
    Then the question box shows "Which customers are important? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-061"

  @AMB-062 @regression @chat
  Scenario: Ask the chat: Which customers are important? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important? Show the details."
    Then the question box shows "Which customers are important? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-062"

  @AMB-063 @regression @chat
  Scenario: Ask the chat: Which customers are important? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important? Give me the key drivers."
    Then the question box shows "Which customers are important? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-063"

  @AMB-064 @regression @chat
  Scenario: Ask the chat: Which customers are important? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important? Compare it with the previous period."
    Then the question box shows "Which customers are important? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-064"

  @AMB-065 @regression @chat
  Scenario: Ask the chat: Which customers are important? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers are important? Highlight anything unusual."
    Then the question box shows "Which customers are important? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-065"

  @AMB-066 @regression @chat
  Scenario: Ask the chat: Who is costing us the most? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most? Can you break it down?"
    Then the question box shows "Who is costing us the most? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-066"

  @AMB-067 @regression @chat
  Scenario: Ask the chat: Who is costing us the most? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most? Show the details."
    Then the question box shows "Who is costing us the most? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-067"

  @AMB-068 @regression @chat
  Scenario: Ask the chat: Who is costing us the most? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most? Give me the key drivers."
    Then the question box shows "Who is costing us the most? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-068"

  @AMB-069 @regression @chat
  Scenario: Ask the chat: Who is costing us the most? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most? Compare it with the previous period."
    Then the question box shows "Who is costing us the most? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-069"

  @AMB-070 @regression @chat
  Scenario: Ask the chat: Who is costing us the most? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Who is costing us the most? Highlight anything unusual."
    Then the question box shows "Who is costing us the most? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-070"

  @AMB-071 @regression @chat
  Scenario: Ask the chat: Show our best products.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products.? Can you break it down?"
    Then the question box shows "Show our best products.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-071"

  @AMB-072 @regression @chat
  Scenario: Ask the chat: Show our best products.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products.? Show the details."
    Then the question box shows "Show our best products.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-072"

  @AMB-073 @regression @chat
  Scenario: Ask the chat: Show our best products.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products.? Give me the key drivers."
    Then the question box shows "Show our best products.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-073"

  @AMB-074 @regression @chat
  Scenario: Ask the chat: Show our best products.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products.? Compare it with the previous period."
    Then the question box shows "Show our best products.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-074"

  @AMB-075 @regression @chat
  Scenario: Ask the chat: Show our best products.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show our best products.? Highlight anything unusual."
    Then the question box shows "Show our best products.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-075"

  @AMB-076 @regression @chat
  Scenario: Ask the chat: Are expenses too high? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high? Can you break it down?"
    Then the question box shows "Are expenses too high? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-076"

  @AMB-077 @regression @chat
  Scenario: Ask the chat: Are expenses too high? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high? Show the details."
    Then the question box shows "Are expenses too high? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-077"

  @AMB-078 @regression @chat
  Scenario: Ask the chat: Are expenses too high? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high? Give me the key drivers."
    Then the question box shows "Are expenses too high? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-078"

  @AMB-079 @regression @chat
  Scenario: Ask the chat: Are expenses too high? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high? Compare it with the previous period."
    Then the question box shows "Are expenses too high? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-079"

  @AMB-080 @regression @chat
  Scenario: Ask the chat: Are expenses too high? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Are expenses too high? Highlight anything unusual."
    Then the question box shows "Are expenses too high? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-080"

  @AMB-081 @regression @chat
  Scenario: Ask the chat: Is profit good? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good? Can you break it down?"
    Then the question box shows "Is profit good? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-081"

  @AMB-082 @regression @chat
  Scenario: Ask the chat: Is profit good? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good? Show the details."
    Then the question box shows "Is profit good? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-082"

  @AMB-083 @regression @chat
  Scenario: Ask the chat: Is profit good? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good? Give me the key drivers."
    Then the question box shows "Is profit good? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-083"

  @AMB-084 @regression @chat
  Scenario: Ask the chat: Is profit good? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good? Compare it with the previous period."
    Then the question box shows "Is profit good? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-084"

  @AMB-085 @regression @chat
  Scenario: Ask the chat: Is profit good? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Is profit good? Highlight anything unusual."
    Then the question box shows "Is profit good? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-085"

  @AMB-086 @regression @chat
  Scenario: Ask the chat: Compare the numbers.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers.? Can you break it down?"
    Then the question box shows "Compare the numbers.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-086"

  @AMB-087 @regression @chat
  Scenario: Ask the chat: Compare the numbers.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers.? Show the details."
    Then the question box shows "Compare the numbers.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-087"

  @AMB-088 @regression @chat
  Scenario: Ask the chat: Compare the numbers.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers.? Give me the key drivers."
    Then the question box shows "Compare the numbers.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-088"

  @AMB-089 @regression @chat
  Scenario: Ask the chat: Compare the numbers.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers.? Compare it with the previous period."
    Then the question box shows "Compare the numbers.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-089"

  @AMB-090 @regression @chat
  Scenario: Ask the chat: Compare the numbers.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare the numbers.? Highlight anything unusual."
    Then the question box shows "Compare the numbers.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-090"

  @AMB-091 @regression @chat
  Scenario: Ask the chat: Show the trend.? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend.? Can you break it down?"
    Then the question box shows "Show the trend.? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-091"

  @AMB-092 @regression @chat
  Scenario: Ask the chat: Show the trend.? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend.? Show the details."
    Then the question box shows "Show the trend.? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-092"

  @AMB-093 @regression @chat
  Scenario: Ask the chat: Show the trend.? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend.? Give me the key drivers."
    Then the question box shows "Show the trend.? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-093"

  @AMB-094 @regression @chat
  Scenario: Ask the chat: Show the trend.? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend.? Compare it with the previous period."
    Then the question box shows "Show the trend.? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-094"

  @AMB-095 @regression @chat
  Scenario: Ask the chat: Show the trend.? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Show the trend.? Highlight anything unusual."
    Then the question box shows "Show the trend.? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-095"

  @AMB-096 @regression @chat
  Scenario: Ask the chat: What is the variance? Can you break it down?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance? Can you break it down?"
    Then the question box shows "What is the variance? Can you break it down?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-096"

  @AMB-097 @regression @chat
  Scenario: Ask the chat: What is the variance? Show the details.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance? Show the details."
    Then the question box shows "What is the variance? Show the details."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-097"

  @AMB-098 @regression @chat
  Scenario: Ask the chat: What is the variance? Give me the key drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance? Give me the key drivers."
    Then the question box shows "What is the variance? Give me the key drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-098"

  @AMB-099 @regression @chat
  Scenario: Ask the chat: What is the variance? Compare it with the previous period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance? Compare it with the previous period."
    Then the question box shows "What is the variance? Compare it with the previous period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-099"

  @AMB-100 @regression @chat
  Scenario: Ask the chat: What is the variance? Highlight anything unusual.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "What is the variance? Highlight anything unusual."
    Then the question box shows "What is the variance? Highlight anything unusual."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the app asks for the missing details instead of guessing for "AMB-100"

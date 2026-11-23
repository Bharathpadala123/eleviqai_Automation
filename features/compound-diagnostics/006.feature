# Generated-by: Gherkin Generator Agent · 006 · 2026-11-19 · AI-generated, human review required
# Source: docs/normalizer/006.md (COM-001 to COM-100). Req ID is TBD for every case, so no @RQ tag is written.
# No figure oracle: every case in docs/oracle/006.json has mode "none" (multi-step diagnoses), so the oracle step runs Checks 1-3 only (data answer, chat SQL re-run, faithful $ amounts).
# TBD: response wording; how to score the explanation itself.

@006
Feature: Compound diagnostic questions in the EleviqAI chat

  Background:
    Given the user is signed in to EleviqAI with QuickBooks data connected and synced

  @COM-001 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?"
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-001"

  @COM-002 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?"
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-002"

  @COM-003 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-003"

  @COM-004 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?"
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-004"

  @COM-005 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-005"

  @COM-006 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-006"

  @COM-007 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?"
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-007"

  @COM-008 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-008"

  @COM-009 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-009"

  @COM-010 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?"
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-010"

  @COM-011 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-011"

  @COM-012 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-012"

  @COM-013 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?"
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-013"

  @COM-014 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-014"

  @COM-015 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?"
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-015"

  @COM-016 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-016"

  @COM-017 @regression @chat
  Scenario: Ask the chat: Revenue is above budget but gross profit is below budget. Determine whether product mix, discounts or cost of goods sold explain the gap using available data.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is above budget but gross profit is below budget. Determine whether product mix, discounts or cost of goods sold explain the gap using available data."
    Then the question box shows "Revenue is above budget but gross profit is below budget. Determine whether product mix, discounts or cost of goods sold explain the gap using available data."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-017"

  @COM-018 @regression @chat
  Scenario: Ask the chat: Which customers have both declining sales and increasing overdue receivables?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers have both declining sales and increasing overdue receivables?"
    Then the question box shows "Which customers have both declining sales and increasing overdue receivables?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-018"

  @COM-019 @regression @chat
  Scenario: Ask the chat: Compare this quarter with the same quarter last year and explain changes in revenue, gross profit, operating expenses and net income.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare this quarter with the same quarter last year and explain changes in revenue, gross profit, operating expenses and net income."
    Then the question box shows "Compare this quarter with the same quarter last year and explain changes in revenue, gross profit, operating expenses and net income."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-019"

  @COM-020 @regression @chat
  Scenario: Ask the chat: Which expense categories grew faster than revenue over the last 12 months, and how did that affect operating margin?
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which expense categories grew faster than revenue over the last 12 months, and how did that affect operating margin?"
    Then the question box shows "Which expense categories grew faster than revenue over the last 12 months, and how did that affect operating margin?"
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-020"

  @COM-021 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-021"

  @COM-022 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-022"

  @COM-023 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Compare the result with the preceding equivalent period."
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-023"

  @COM-024 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-024"

  @COM-025 @regression @chat
  Scenario: Ask the chat: Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Revenue is below budget this quarter. Which customers and products explain the shortfall, and how much did each contribute?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-025"

  @COM-026 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-026"

  @COM-027 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-027"

  @COM-028 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Compare the result with the preceding equivalent period."
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-028"

  @COM-029 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-029"

  @COM-030 @regression @chat
  Scenario: Ask the chat: Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Profit declined this month even though revenue increased. Which expense accounts drove the decline, and how did gross margin change?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-030"

  @COM-031 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Break the results down by month and rank the largest contributors."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-031"

  @COM-032 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-032"

  @COM-033 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Compare the result with the preceding equivalent period."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-033"

  @COM-034 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-034"

  @COM-035 @regression @chat
  Scenario: Ask the chat: Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Cash decreased while net income increased last month. Compare customer receipts, vendor payments and other cash movements to explain the difference. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-035"

  @COM-036 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-036"

  @COM-037 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-037"

  @COM-038 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Compare the result with the preceding equivalent period."
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-038"

  @COM-039 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-039"

  @COM-040 @regression @chat
  Scenario: Ask the chat: Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Payroll expense exceeded budget this quarter. Which accounts, vendors or classes contributed most, and was the increase concentrated in one month?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-040"

  @COM-041 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Break the results down by month and rank the largest contributors."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-041"

  @COM-042 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-042"

  @COM-043 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Compare the result with the preceding equivalent period."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-043"

  @COM-044 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-044"

  @COM-045 @regression @chat
  Scenario: Ask the chat: Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Gross margin fell over the last six months. Show the product-level revenue and cost changes that explain the decline. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-045"

  @COM-046 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Break the results down by month and rank the largest contributors."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-046"

  @COM-047 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-047"

  @COM-048 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Compare the result with the preceding equivalent period."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-048"

  @COM-049 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-049"

  @COM-050 @regression @chat
  Scenario: Ask the chat: Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Sales increased year over year, but net income fell. Compare revenue growth, cost of goods sold and operating expenses to identify the drivers. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-050"

  @COM-051 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-051"

  @COM-052 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-052"

  @COM-053 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Compare the result with the preceding equivalent period."
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-053"

  @COM-054 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-054"

  @COM-055 @regression @chat
  Scenario: Ask the chat: Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Accounts receivable increased while cash collections declined. Which customers have the largest outstanding balances and how old are the invoices?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-055"

  @COM-056 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Break the results down by month and rank the largest contributors."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-056"

  @COM-057 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-057"

  @COM-058 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Compare the result with the preceding equivalent period."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-058"

  @COM-059 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-059"

  @COM-060 @regression @chat
  Scenario: Ask the chat: Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Vendor payments increased this quarter. Identify the vendors responsible, compare their bills with the prior quarter and show the payment timing. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-060"

  @COM-061 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Break the results down by month and rank the largest contributors."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-061"

  @COM-062 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-062"

  @COM-063 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Compare the result with the preceding equivalent period."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-063"

  @COM-064 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-064"

  @COM-065 @regression @chat
  Scenario: Ask the chat: Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Marketing spend increased but revenue did not. Compare monthly marketing expenses with revenue and identify the periods with the weakest relationship. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-065"

  @COM-066 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-066"

  @COM-067 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-067"

  @COM-068 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Compare the result with the preceding equivalent period."
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-068"

  @COM-069 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-069"

  @COM-070 @regression @chat
  Scenario: Ask the chat: Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Actual expenses are under budget overall, but profit is also below budget. Which revenue and expense variances explain the result?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-070"

  @COM-071 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Break the results down by month and rank the largest contributors."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-071"

  @COM-072 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-072"

  @COM-073 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Compare the result with the preceding equivalent period."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-073"

  @COM-074 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-074"

  @COM-075 @regression @chat
  Scenario: Ask the chat: Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Revenue is growing but cash from customers is not keeping pace. Compare invoices, receipts and accounts receivable by month. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-075"

  @COM-076 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Break the results down by month and rank the largest contributors."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-076"

  @COM-077 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-077"

  @COM-078 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Compare the result with the preceding equivalent period."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-078"

  @COM-079 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-079"

  @COM-080 @regression @chat
  Scenario: Ask the chat: Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Net income is negative this quarter. Identify whether the largest contributors are lower revenue, higher cost of goods sold or operating expenses. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-080"

  @COM-081 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-081"

  @COM-082 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-082"

  @COM-083 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Compare the result with the preceding equivalent period."
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-083"

  @COM-084 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-084"

  @COM-085 @regression @chat
  Scenario: Ask the chat: Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Which customers explain most of the revenue decline, and did their payment behavior also worsen?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-085"

  @COM-086 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Break the results down by month and rank the largest contributors."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-086"

  @COM-087 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-087"

  @COM-088 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Compare the result with the preceding equivalent period."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-088"

  @COM-089 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-089"

  @COM-090 @regression @chat
  Scenario: Ask the chat: Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Compare gross profit by product with sales volume and cost of goods sold to identify products whose margins deteriorated. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-090"

  @COM-091 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Break the results down by month and rank the largest contributors."
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-091"

  @COM-092 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-092"

  @COM-093 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Compare the result with the preceding equivalent period."
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-093"

  @COM-094 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-094"

  @COM-095 @regression @chat
  Scenario: Ask the chat: Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Operating expenses are above budget. Which accounts have unfavorable variances in at least two consecutive months?. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-095"

  @COM-096 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Break the results down by month and rank the largest contributors.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Break the results down by month and rank the largest contributors."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Break the results down by month and rank the largest contributors."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-096"

  @COM-097 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Show the dollar contribution of each account, customer or vendor to the change.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Show the dollar contribution of each account, customer or vendor to the change."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Show the dollar contribution of each account, customer or vendor to the change."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-097"

  @COM-098 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Compare the result with the preceding equivalent period.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Compare the result with the preceding equivalent period."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Compare the result with the preceding equivalent period."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-098"

  @COM-099 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Identify whether the change is concentrated in one customer, vendor, account or month.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Identify whether the change is concentrated in one customer, vendor, account or month."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Identify whether the change is concentrated in one customer, vendor, account or month."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-099"

  @COM-100 @regression @chat
  Scenario: Ask the chat: Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Summarize the evidence using the available transactions and balances.
    When the user starts a new chat
    Then the new chat screen is displayed with the question box
    When the user types the question "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Summarize the evidence using the available transactions and balances."
    Then the question box shows "Cash outflows spiked last month. Identify the largest payments, vendors and expense accounts, and compare them with the previous month. Summarize the evidence using the available transactions and balances."
    When the user submits the question
    Then the question appears in the conversation
    When the user waits for the response to finish
    Then the response is answered as a multi-step financial diagnosis
    And the answer matches the database oracle for "COM-100"

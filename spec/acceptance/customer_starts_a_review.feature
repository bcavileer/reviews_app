Feature: Customer starts a new review

  Scenario: Customer starts an ADP CRM review
    Given ADP review parameters
    Then I should receive start_review
    When I start a review

  Scenario: Customer starts an Autobase CRM review
    Given Autobase review parameters
    Then I should receive start_review
    When I start a review

  Scenario: Customer restarts an existing review
    Given existing review parameters
    Then I should receive existing_review
    When I start a review

  Scenario: Customer starts an invalid review
    Given invalid review parameters
    Then I should receive invalid_review
    When I start a review


Feature: Feature flag must have a ticket
  As a product manager or developer
  In order to track features
  I want all feature flags to be linked to a ticket


Scenario: Ticket URL is missing
   Given I have feature flag called "testFlag" data without a ticket link
   And I run the linter
   Then I want so see the the following error:
   """
   The feature flag called "testFlag" does not have a ticket link
   """

Scenario: Ticket URL is available
   Given I have feature flag called "testFlag" data with a ticket link
   And I run the linter
   Then I don't see an error.

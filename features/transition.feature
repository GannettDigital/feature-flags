Feature: Automatic feature ticket transition
  As a configuration engineer or product manager
  When I enable or disable a feature flag in an environment
  I want to transition the feature ticket to the appropriate status


Scenario: Transition from code complete to staged
  Given I have a feature that is "code complete"
    And we are in the "stage" environment
  When I enable the feature flag for that feature in this environment
  Then the feature ticket should be marked "staged"


Scenario: Transition from staged to in production
  Given I have a feature that is "staged"
    And we are in the "production" environment
  When I enable the feature flag for that feature in this environment
  Then the feature ticket should be marked "in production"


Scenario: No change in stage
  Given I have a feature that is "staged"
    And we are in the "stage" environment
  When I enable the feature flag for that feature in this environment
  Then I want the feature ticket to remain unchanged


Scenario: No change in production
  Given I have a feature that is "in production"
    And we are in the "production" environment
  When I enable the feature flag for that feature in this environment
  Then I want the feature ticket to remain unchanged


Scenario: Stage disable
  Given I have a feature that is "staged"
    And we are in the "stage" environment
  When I disable the feature flag for that feature in this environment
  Then I want the feature ticket to remain unchanged


Scenario: Prod disable
  Given I have a feature that is "in production"
    And we are in the "production" environment
  When I disable the feature flag for that feature in this environment
  Then I want the feature ticket to remain unchanged



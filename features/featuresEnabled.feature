Feature: Enabled flags
  As a developer using feature flags
  I need to know which flags are enabled in my config

Scenario: Output enabled feature flags
    When I run the command: "cat ./features/data/flags.json | ./bin/features-enabled --format json-ld"
    Then I want the process to succeed
    And I want to see the following output
    """
    http://example.com/#featureFlag1
    http://example.com/#featureFlag2

    """
Feature: Feature flag must have a ticket
  As a product manager or developer
  In order to track features
  I want all feature flags to be linked to a ticket


Scenario Outline: Ticket URL is missing in turtle
   When I run the command: "<cmd>"
   Then the process should fail
   And I want to see the following error:
   """
   The feature flag called "testFlag" does not have a ticket link
   """

   Examples:
     |  cmd                                                                         |
     |  cat ./features/data/withoutLink.ttl \| feature-lint                          |
     |  cat ./features/data/withoutLink.jsonld.json \| feature-lint --format json-ld |

Scenario Outline: Ticket URL is available
   When I run the command: "<cmd>"
   Then I want the process to succeed

   Examples:
     |  cmd                                                                       |
     |  cat ./features/data/withLink.ttl \| feature-lint                          |
     |  cat ./features/data/withLink.jsonld.json \| feature-lint --format json-ld |


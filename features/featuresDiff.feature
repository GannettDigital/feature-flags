Feature: Flag diff
  As a developer using feature flags
  I need to know which flags are changed between config deployments

@dev
Scenario: Output enabled feature flags
    When I run the command: "./bin/features-diff --format json-ld ./features/data/diff/oldconfig.json ./features/data/diff/newconfig.json"
    Then I want the process to succeed
    And I want the JSON to match:
    """
    {
       "@context": {
          "feature": "http://services.gannettdigital.com/vocab/featureFlags#",
	  "example": "http://example.com/#",
	  "flags": "feature:flags"
       },
       "flags": {
          "example:featureFlag1": true,
	  "example:fearuteFlag2": false       
       },
       "flagProperties": [
          {
	     "@id": "example:featureFlag1",
	     "@type": "feature:Flag",
	     "feature:ticket": "http://tickets.example.com/feature1"
	  },
          {
	     "@id": "example:featureFlag1",
	     "@type": "feature:Flag",
	     "feature:ticket": "http://tickets.example.com/feature2"
	  }
       ]
    }    
    """
Feature: Feature flag diff
  As a developer
  I want to know when a flag's state changes

Scenario: flag state change
  When I run the command: "feature-diff --format json-ld ./features/data/before.jsonld.json ./features/data/after.jsonld.json"
  Then I want the process to succeed
  And I want to see the following output
  """
@prefix example: <http://example.com/> .
@prefix feature: <http://services.gannettdigital.com/vocab/featureFlags#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.com/#obj> feature:flags [ feature:flag1 true ;
              feature:flag2 false ] .



  """
  
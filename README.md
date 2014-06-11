Feature Flags
==============

A feature flag vocabulary and various utilities

Install
---------

```
	make install
```

Utilities
----------

feature-diff
==============

Allows you to compare one flag set to another and outputs the flags
that changed with their current state. 

```
$ feature-diff --format json-ld  features/data/before.jsonld.json features/data/after.jsonld.json 
@prefix example: <http://example.com/> .
@prefix feature: <http://services.gannettdigital.com/vocab/featureFlags#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.com/#obj> feature:flags [ feature:flag1 true ;
            feature:flag2 false ] .

```

feature-lint
=============

Enforces some rules on the feature flags. Currently this only requires that a ticket 
is associated with the flag.

```
$ cat features/data/withoutLink.ttl | feature-lint
The feature flag called "testFlag" does not have a ticket link

$ cat features/data/withLink.ttl | feature-lint
```

feature-transition
====================

This is a filter that changes the status of a ticket object based on your transition
rules.

```
@prefix feature: <http://services.gannettdigital.com/vocab/featureFlags#> .

<http://example.com/jira/rest/api/2/status/1> a feature:CodeCompleteStatus .
<http://example.com/jira/rest/api/2/status/2> a feature:StagedStatus .
<http://example.com/jira/rest/api/2/status/3> a feature:InProductionStatus .

feature:StageEnv feature:transitionRule [
   feature:from feature:CodeCompleteStatus ;
   feature:to feature:StagedStatus 
] .

feature:ProductionEnv feature:transitionRule [
   feature:from feature:StagedStatus ;
   feature:to feature:InProductionStatus 
] .
```

Here we've declared that our ticket system's different statuses are certain
status classes.

We have also declared how the each status should transisiton if the feature flag is
enabled in that environment.

If we have a ticket that has a code complete status and is enabled

```
@prefix feature: <http://services.gannettdigital.com/vocab/featureFlags#> .
@prefix example: <http://example.com/> .

example:flag1 feature:ticket <http://example.com/jira/browse/FEATURE-1> .

example:app feature:flags [
      example:flag1 true
] .

<http://example.com/jira/browse/FEATURE-1> feature:status <http://example.com/jira/rest/api/2/status/1> .
```

When we run `feature-transition` in stage, it will transition to our staged status:

```
$ cat features/data/transitions/config.ttl features/data/transitions/code-complete-enabled.ttl | feature-transition stage
@prefix example: <http://example.com/> .
@prefix feature: <http://services.gannettdigital.com/vocab/featureFlags#> .
@prefix rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#> .
@prefix rdfs: <http://www.w3.org/2000/01/rdf-schema#> .
@prefix xml: <http://www.w3.org/XML/1998/namespace> .
@prefix xsd: <http://www.w3.org/2001/XMLSchema#> .

<http://example.com/jira/browse/FEATURE-1> feature:status <http://example.com/jira/rest/api/2/status/2> .
```

Now, it should be farely trivial to write a sink script that takes this data and synchronizes your issue tracking system.
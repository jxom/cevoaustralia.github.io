---
layout: post
title:  The outage that stopped all development
description: A story of a mistake that stopped all development activities for days
date:   2017-08-30
categories:
    - culture
    - devops
    - config-as-code
tags:
    - devops
    - config-as-code
author: Trent Hornibrook
images: blog/failure.jpg


excerpt:
    As a CTO, how would you react when a mistake was made that caused 80 developers to stop working for two days?

---

I want to share my experience of when a major development outage occurred, and how the leadership responded.

We were aggressively using AWS. Like most workplaces that are familiar with a datacenter operating model, cost accounting becomes a focus given the pay-per-hour operating expenditure pricing model of AWS. Generally, the first solution of arresting cost is to implement a solution that would turn off EC2 instances out of hours. This was our in-house 'stopinator' tool.

We invested heavily on individual environments along with team specific CI's that were both deployed into AWS. This made up around 20 different complex environments which supported the work of 80 odd IT engineers.

A developer implemented a custom 'stopinator' solution, however they introduced two fundamental bugs that caused a critical outage:

* The time-period logic was incorrect - meaning that it ran during business hours
* The dry-run logic was incorrect - meaning when it ran, it destroyed everything

Just imagine the screams of "What happened to my environment?" or "Where did my Jenkins go?". Sure, minimising our AWS costs was in full swing, however at least 80 people were entirely impacted by this very destructive event. The resulting blast radius of damage was especially massive - the Continuous Integration (CI) servers in particular, due to the fact that pipeline build logic had been manually created and was subsequently lost following the event.

The outage lasted multiple days as teams rewrote their CI logic. I was one of the engineers who had the task of rebuilding CIs, all the while feeling completely annoyed and angry about the event that caused this outage and bulk of unplanned work.

The CTO responded to the event in a way that left me dismayed - he celebrated the person that made the mistake. I remember being completely bewildered by his response, although upon reflection as I now think back, it was a great response.

The problem was not that an engineer made a mistake. Our systems were built in a way that meant they were not resilient to failures, that was the real problem.

When you build anything, design it to be resilient to failure; as failure will always occur.

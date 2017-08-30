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

I want to share a story about a major development outage that occurred in 2012 and the leadership response.

My former workplace began aggressively using AWS. Like most workplaces that are familiar with a datacenter operating model, cost accounting becomes a focus given the pay-per-hour operating expenditure pricing model of AWS. Generally, the first solution to arresting cost is to implement a 'stopinator' type tool that will switch off all compute resources out-of-business hours.

My former workplace at the time invested heavily on individual local environments deployed into AWS along with team specific CI's also deployed into AWS. There were some 20 different complex environments supporting 80 odd IT engineers.

A developer implemented a custom 'stopinator' however they introduced two fundamental bugs that caused a critical outage.

* The time-period logic was incorrect - meaning that it ran during business hours
* The dry-run logic was incorrect - meaning when it ran, it destroyed everything

You can imagine the screams of "what happened to my environment?" or "where did my Jenkins go?". Sure, cost savings was in full swing, however some 80 people will fully impacted by this destructive event. The damage was massive - particularly for the Continuous Integration servers, as the pipeline build logic was manually created and was subsequently lost throughout the event.

The outage lasted multiple days as teams rewrote the CI logic. I was one of the engineers who rebuild CIs whilst completely annoyed and angry at the event that caused this outage.

The CTO at the time responded to the event that left me dismayed. He celebrated the person that made the mistake. I remember being completely bewildered of the response though now reflecting back, I think it was a great response.

The problem was not that an engineer made a mistake. The problem was that the systems were built in a way that were not resilient to failure.

When you build anything, design it for failure - as failure will occur.

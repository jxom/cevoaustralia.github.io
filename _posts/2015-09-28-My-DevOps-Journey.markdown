---
layout: post
title:  My devops Journey
description: One consultant's personal journey about what devops means & four key devops practices to get started with
date:   2015-09-28
categories:
  - devops
tags:
  - Learning
  - Continuous Integration
  - Continuous Delivery
author: Orlando Erazo
images: blog/my-devops-journey.png
excerpt: 
  One of the challenges we devops Consultants face is explaining what we do to customers, as there are so many definitions. I’m always thinking about new ways to share the incredible opportunities that a continuous delivery pipeline offers.
---
One of the challenges we devops Consultants face is explaining what we do to customers, as there are so many definitions. I’m always thinking about new ways to share the incredible opportunities that a continuous delivery pipeline offers. **So what is devops, and why does it matter?** The very definition of devops, as a portmanteau of Development and Operations suggests to us that this is a new role where we have to be fluent in both of these areas. But that’s a bit misleading. devops is not a role, a job description, or a single school of thought. Devops is a practice, a culture, and a movement. It is a different view of the Development Pipeline that involves much more than just Development and Operations. I like to think that devops as an extension of Agile. We have seen during the last 10 years or so a growing trend for companies to improve the way software is built by applying known and proven manufacturing concepts. Yes, manufacturing concepts! It seems an unlikely source but things like Lean Manufacturing have contributed a great deal to the software development space. With these progressive improvements in the development of software, organisations have started to face challenges also improving the delivery of software. This is the opportunity I see with devops; it compliments excellent software development with autonomous software delivery. **Where to Start?** I should start by mentioning that there are a lot of devops tools these days and the list keeps growing. Before you go into solution mode and try to automate software delivery, I strongly suggest that you take your time to evaluate your readiness to implement a devops approach, this is what it has worked for me.

*   **Evaluate your Agile maturity**

    If you haven’t considered Agile for your software development projects, then this is a great place to start. Even if you already have adopted Agile, take some time to evaluate if you still have opportunities to improve your Agile capability. As a minimum you should be committing code regularly, prioritizing tasks and doing demos to your stakeholders (at least every two weeks), performing unit testing, and communicating in a way that works for your company. Of course, Cevo has experienced consultants to help you with this assessment.

*   **Continuous Integration**

    You will be surprised with the amount of hidden gems you will find while adopting continuous integration (CI). CI is not about merely a quest for tools like Jenkins or Bamboo. It is also a quest for closer teams and a greater level of knowledge sharing. In a previous role, I witnessed first-hand the productivity gains that each team member could enjoy when useful automation scripts and neat tricks were shared openly. The funny thing is that many of us first thought it our tips and tricks weren’t relevant or worth sharing, but we all agreed that those ideas that were shared were very helpful. Finally, it is important that you work towards automated test cases and start triggering them with each commit. Having a plan for automating database changes is also extremely valuable. I can assure you that with this approach you will start getting a lot of buy-in from your team as they will be all helping to make CI a reality, which is will make their lives easier, too.

*   **Continuous Release**

    At this stage teams will be able to do continuous releases to a pre-production environment. If there is already a mechanism for creating release packages, you can actually deploy such packages in any environment. By matching continuous releases with infrastructure automation you can ensure the whole team has confidence that any changes - with application or infrastructure - will work in a production-like environment.

*   **Continuous Delivery**

    There is an important difference between continuous deployment and continuous delivery. CD allows teams to have a release button to press once they are confident with the previous stage, automatically moving validated code into live production environments. With the whole team involved from the very beginning, and participating actively, achieving this level of process maturity is extremely satisfying. It serves to create a sense of collaboration and ownership, and helps to deliver software more frequently and with higher quality.

**The next level of achievement** is the holy-grail of devops: Continuous Deployment. Here, releases to production can be triggered automatically after checking in changes. Sometimes this may not be possible (such as for legal reasons), but if achievable it enables organisations to move rapidly and bring new features and fixes to customers more often. Of course you can and should adapt any of the steps to suit your own unique needs. In terms of tools, if you are starting from scratch, use whatever works for you. For example, if your team is very strong using shell scripting and you have access to AWS then use the AWS CLI to automate your releases, it is a good starting point to get buy-in for more advanced tools. The good news is that once you do it the first time, even something simple like provisioning EC2 instances using the AWS APIs, you will become more confident when selecting the right tools from that big pool of options to help you with your Continuous Delivery pipeline. The work does not end here, this space is changing at a really fast pace, you have to be always looking for better ways to improve your Continuous Delivery pipeline. I’d like to finish this post by mentioning that one of the biggest challenges for devops is data analysis, that is why companies like [Atlassian](https://www.atlassian.com/), [IBM](http://www-03.ibm.com/software/products/en/category/SW88B#all) and [Rally](https://www.rallydev.com/), just to name a few, are putting a lot of effort in to delivering a set of tools under one big umbrella that will basically allow you to manage the 4 steps that I mentioned above with nice integration capabilities. Hopefully in the near future we could have some data mining around our devops practice in the same way we can analyse our logs with tools like [Sumologic](https://www.sumologic.com/) or [Splunk](http://www.splunk.com/). We still have a long road ahead of us, but it is an exciting one.

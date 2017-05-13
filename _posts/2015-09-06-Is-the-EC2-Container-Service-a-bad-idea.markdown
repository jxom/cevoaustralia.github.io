---
layout: post
title:  Is the EC2 Container Service a bad idea?
description: The reasons for and against Amazon's EC2 container service for deploying docker containers
date:   2015-09-06
categories:
  - DevOps
tags:
  - Docker
  - EC2
  - Container Service
  - ECS
author: Michael Richardson
images: blog/is-this-ec2-thing-a-bad-idea.png
thumbnail: blog/is-this-ec2-thing-a-bad-idea.png

excerpt: The container revolutionaries call upon you! Are you ready to beg forgiveness for your sins of monolithic architecture and pay homage at the Church of 12 Factors? // No doubt you – like so many others before you – have endured the experience of being cornered by a zealot of the new world order. He is determined to make you see the light, and understand that containerisation is the future, and all ye who resist shall suffer the perpetual horrors of vertical scaling and, gasp, eternal re-architecture for multiple platforms.// Okay, I might be being a wee bit dramatic here. But you see, I too am a convert. I too carry around a copy of the Mesos white paper and dream of the swarm.
---

_The container revolutionaries call upon you!_ Are you ready to beg forgiveness for your sins of **[monolithic architecture](http://www.thoughtworks.com/insights/blog/monoliths-are-bad-design-and-you-know-it)** and pay homage at the **[Church of 12 Factors](http://12factor.net/)**?

No doubt you - like so many others before you - have endured the experience of being cornered by a zealot of the new world order. He is determined to make you **see the light**, and understand that containerisation is the future, and all ye who resist shall suffer the **perpetual horrors of vertical scaling** and, _gasp_, **eternal re-architecture for multiple platforms**.

Okay, I might be being a wee bit dramatic here. But you see, I too am a convert. I too carry around a copy of the **[Mesos white paper](http://mesos.berkeley.edu/mesos_tech_report.pdf)** and dream of **[the swarm](https://www.docker.com/docker-swarm)**.

It is because of my love of containers that I was so very excited when Amazon’s EC2 Container Services (ECS) was released to the public [earlier this year](https://aws.amazon.com/blogs/compute/amazon-ec2-container-service-is-now-generally-available/). At long last, here comes a tool that would make easier still to convert the masses.

## Are you not a convert?

I’ll assume that you’re already familiar with containers so I won’t proselytise further. But if you aren’t yet a convert, I highly recommend my colleague Peter Viertel’s [excellent post](http://www.cevo.com.au/whats-this-docker-thing/) introducing Docker.

## What problem is ECS trying to solve?

As Spotify moved to [adopt containers](https://blog.docker.com/2014/06/dockercon-video-docket-at-spotify-by-rohan-singh/) in 2014, they quickly ran into a common problem: **How do we manage a large fleet of containers effectively?**

With hundreds or even thousands of live containers, orchestration and availability can becomes a serious challenge. For Spotify, the necessary orchestration tools weren’t readily available at the time, so they built (and open sourced) their own platform called [Helios](https://github.com/spotify/helios).

But our movement is a hive of activity and we already enjoy a range of choices for container orchestration and scheduling. Each of these tools aim to solve similar problems:

*   Easily deploy containers to a fleet of servers
*   Control the fleet from a single, authoritative source
*   Ensure running containers survive hardware and other faults
*   Control resource allocations and scale our fleet to meet increases or decreases in overall demand.

Amazon EC2 Container Services is just one of these orchestration platform. Although it’s methods are different, it’s goals are similar to other tools you may have heard of it, such as Google’s [Kubernetes](http://kubernetes.io/), Apache’s [Mesos](http://mesos.apache.org/).

Each of these tools, and many more like them, have advantages and disadvantages. Choosing the right tool is really about understanding these pros and cons and measuring those against your needs and expectations. For many of us, ECS is a good choice because of some unique advantages that competing solutions just can’t match.

## ECS Makes Life Easier

Many recent AWS product introductions have focused on orchestration and making it easier for us to use underlying Amazon infrastructure tools (such as EC2 and S3). Things like [CodeDeploy](https://aws.amazon.com/codedeploy), [OpsWorks](https://aws.amazon.com/opsworks/), and [CloudFormation](https://aws.amazon.com/cloudformation/) are, for the most part, abstractions that make it easier to use AWS’s infrastructure to perform common tasks.

EC2 Container Services simplifies the process of running a large container farm on your own EC2 instances. These _container instances_ are deployed using CloudFormation scripts, can be scaled using EC2 Auto Scaling, and incoming container traffic managed using Elastic Load Balancers.

With ECS, Amazon is using it’s huge array of tools to make container scheduling easy for you, especially if you’re already familiar with things like EC2.

## Heretic!

There is a catch. ECS comes into conflict with one of the key commandments of containerisation. A leading reason many of us convert and preach. That is, the ability to move applications across different platforms without having to change the application.

For example, a Docker container can run happily on EC2, OpenStack, Azure, or a laptop, all without any reconfiguration. It is the holy grail of infrastructure portability.

Similarly, tools like Mesos and Kubernetes can run Docker (among other containerisation frameworks) on any of these cloud platforms as well. A Docker container that runs on a Mesos fleet in AWS will run just the same in a Mesos fleet on OpenStack.

We converts love Docker because you can run Docker anywhere you want. You can run orchestration tools like Mesos anywhere you want. _But you can’t get ECS from anyone other than Amazon Web Services_.

## So is ECS a bad idea?

If the whole point of containers is portability, and ECS isn’t portable, does that make ECS a bad idea?

For many projects, the opportunity to more easily launch and scale container farms on ECS far outweighs the portability limitations. ECS can be set up for serious workloads in a fraction of the time setting up a Mesos or Kubernetes cluster might require.

And of course, welding your application into the world’s most powerful cloud platform isn’t necessarily bad for you. Just ask [Netflix](https://aws.amazon.com/solutions/case-studies/netflix/).

But if cross-platform operability is important to you, ECS might not be the right choice. Tools like Mesos, Docker Swarm, and Kubernetes will require a larger initial investment to get running, but they will undoubtedly pay dividends to your organisation in the long term.

As with all technology, the important thing is not to be too fanatical about the platforms you choose and to keep an open mind about alternatives.

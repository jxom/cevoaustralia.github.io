---
layout: post
title:  What's this docker thing?
description: An overview of docker, how the technology has grown and its readiness to be run in production
date:   2015-07-09
categories:
  - Devops
tags:
  - Docker
  - Cloud
author: Peter Viertel
images: blog/whats-this-docker-thing.png
thumbnail: blog/whats-this-docker-thing.png

excerpt:
  If there’s one thing industry news sources have been mentioning to you recently it would almost certainly be Docker. But is there too much hype? Should one wait before looking into it?. There’s certainly a large amount of hype out there in the industry of the likes we have not seen since for about 6 years, when you could not move for “Cloud Experts” crowding your doorstep offering cloud this and cloud that. We can see with the benefit of hindsight that “The Cloud” did not turn out to be complete fakery, in fact it’s turned out a lot of the promises came true, it’s even better than expected in that “The Cloud” is now a whole industry that enhances and supports your operations, and you really can run your IT operations more efficiently.
---

If there’s one thing industry news sources have been mentioning to you recently it would almost certainly be Docker. But is there too much hype? Should one wait before looking into it?. There’s certainly a large amount of hype out there in the industry of the likes we have not seen since for about 6 years, when you could not move for “Cloud Experts” crowding your doorstep offering cloud this and cloud that. We can see with the benefit of hindsight that “The Cloud” did not turn out to be complete fakery, in fact it’s turned out a lot of the promises came true, it’s even better than expected in that “The Cloud” is now a whole industry that enhances and supports your operations, and you really can run your IT operations more efficiently. Hindsight also shows us a road littered with the carcasses of ‘offerings’; hastily formulated packages, misguided use cases, overpriced and under-delivering cloud services. It’s still going on, but there’s now plenty of wisdom to be found, real-world success stories, long-term studies, but if you’d sat back and said “let’s wait until the hype dies down” then you did end up spending far too much money still, many of your competitors did very well out of taking measured steps to adopt the new technology.

## Building tools for mass innovation

So – Docker. Announced just two and a bit years ago, it’s hard to imagine a time before the whale logo, but it came along pretty early in the piece. It’s cute but how can a whale be cute? It must have been a baby whale! Using the whale to represent Docker has turned out to be a great analogy – it’s said a growing blue whale puts on around 90kg a day! What we are looking at here is an adolescent whale – there’s a lot of kg’s to come. One aspect of the growth is that what I imagined just a year ago for Docker has come and gone already, we’re all looking at astounding progress, so much of the necessary “plumbing” is in place now, some ideas that were no more than a wish list in January turned up in the April release:

*   the mystery of how two or more containers could be connected together whilst hosted on separate kernels / hosts / datacentres / continents is now the Docker Network, SDN.
*   The questions we had along the lines of “do I really have to use Ubuntu to host Docker” have now turned into “so you mean I can run native windows apps in Docker containers on windows servers?”.
*   “Gee the Docker images and registry are a bit homebrew, CoreOS appc might be better” morphed into “V2 registry is pretty slick hey!” in April - followed swiftly at DockerCon in June by “never mind having to bet on one or the other, here’s the OCF – Open Container Format”

The latest vision statements we heard at DockerCon were “_building tools for mass innovation_” and “_make the internet programmable_” – lofty goals indeed!

## Docker in Production

The biggest question that needed answering at this year’s DockerCon is “Can I use Docker in my production environment”. This question from a technical standpoint is YES. All the tools you need have now been delivered, but that’s only half of the answer – what enterprises need is support, warranty, stability, authentic packages. To provide for these requirements Docker has announced a subscription model that lets you pick and choose your own mix of supported or open source components, there are options for just using the Docker Hub online service, and there are affordable price points for using all the newly announced enterprise components in-house:

*   Docker Trusted Registry – an enterprise-grade registry package for organisations to host their images privately.
*   Docker Engine - for hosting Docker containers on a linux server.
*   Docker Swarm – for clustering Docker engines and scheduling containers to run across the cluster.
*   Docker Compose – for defining your multi-container applications and scalability of services.

## I want to try Docker!

There are many ways to try out Docker, some are dead easy to install but leave you looking at a blinking prompt, there are plenty of how-to guides out there for setting up the tools on a linux host if you do like blinking prompts– but if you have a windows or mac laptop the new cool way to try it out is [Kitematic](http://kitematic.com "Kitematic") from Docker. A neat GUI based package that’s free to download and will have you starting containers in no time.

If you want to learn more and become a Docker Ninja and have no budget to whip over to the US for training? Never fear! Recently I had the privilege of attending the inaugural Train-The-Trainer course in San Francisco – this produced the world’s first set of authorised trainers by Docker Inc. Selected from a fairly exclusive set of organisations from Japan, Europe, Russia, USA, and Australia. So I am pleased to announce that in August you will be able to attend an official Docker Fundamentals certification course in [Sydney](http://www.cevo.com.au/event/docker-training-sydney/ "Docker Training – Sydney") or [Melbourne](http://www.cevo.com.au/event/docker-training-melbourne/ "Docker Training – Melbourne"). Demand is expected to be heavy!]]>

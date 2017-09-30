---
title:  The Consul of Elders
description: An overview of how Consul software makes it easy to identify and find docker containers in large scale deployments
date: 2015-10-22
categories:
  - DevOps
tags:
  - docker
  - consul
author: Michael Richardson
images: blog/how-consul-and-docker-work-together.png
thumbnail: blog/how-consul-and-docker-work-together.png

excerpt: #
  Two weeks ago I had an opportunity to architect and deploy a cluster of self-provisioning Docker Swarm servers, which utilised Consul as their shared database. Thanks to Consul, we could immediately identify the address and services running on any container in the cluster. This technology was remarkably easy to deploy. In fact, the biggest challenge was getting an understanding of how all the different pieces fit together. What we really needed was an `educational-scifi-adventure` movie to help educate everyone on these amazing tools. After all, we all know how warp drive and death stars work, and it’s that kind of knowledge that can only be taught through movies.
url: devops/2015/10/22/The-Consul-of-Elders.html
---
<!--
Beer and pizza. Fish and chips. `Docker and Consul`. Sometimes perfect matches are discovered, and there’s no going back.
Two weeks ago I had an opportunity to architect and deploy a cluster of self-provisioning Docker Swarm servers, which utilised Consul as their shared database. Thanks to Consul, we could immediately identify the address and services running on any container in the cluster.
This technology was remarkably easy to deploy. In fact, the biggest challenge was getting an understanding of how all the different pieces fit together.
What we really needed was an `educational-scifi-adventure` movie to help educate everyone on these amazing tools. After all, we all know how warp drive and death stars work, and it’s that kind of knowledge that can only be taught through movies.

#### Act 1 – The Great Migration
This is the story about the `Republic of the Swarm`. A peaceful galactic empire of super-intelligent AI.
In the beginning, each AI lived in it’s own server. Nobody moved around, so each AI knew where all the other AIs lived, but this was expensive and the AIs couldn’t move easily to find new work.
So a `great migration` occurs, and all the AI pack up and move to Container City. A cluster of commoditised computers running functional, light-weight apartments. Just the kind that AIs like.
Rents fall, AIs move freely to balance their needs, and productivity goes through the roof.

#### Act 2 – Tragedy
Suddenly, an entirely-foreseeable tragedy befalls the Republic. Now that every AI is moving around at random, nobody can find anybody else and the city falls into chaos.
Upon hearing of this, the `nefarious` Bare Metal Alliance – a vast trade empire now facing ruin since the Republic doesn’t have to buy so much hardware – launch an all-out assault. Their goal is simple: force the Republic to abandon containerisation and return to the old, costly ways of single server environments.

#### Act 3 – War!
Enter our protagonist, Unit Ad9. This humble little AI knows that only the great Lord Redis, leader of the Swarm Armies, has the ability to defeat the Bare Metal Alliance and bring peace to the republic.

But alas! Ad9 has no way to find Lord Redis, as she may be living in any part of the city and it’s impossible tell where.

In a desperate bid to save the Republic, Ad9 travels to the Temple of Curl, to summon the ancient and long-forgotten Consul of Elders. The Consul of Elders is the only hope we have of finding Lord Redis.

In our epic climax, Ad9 calls upon the Consul of Elders to help him find Lord Redis and save the empire.

_Consuls, our city is in disarray. Our people are scattered across many small, functional apartments we all love, but we cannot find each other._

_The evil Bare Metal Alliance has dispatched a fleet of Chaos Monkey-class Warships in attempt to impose their archaic ways upon our once great Republic._

_Our only hope is to summon the great general of our armies, Lord Redis. But she is adrift in a sea of containers, we have…_

In this echoing Temple of Curl, the Consul Members all interrupt simultaneously, in a dull monotone that makes Ad9 very sleepy…

`Lord Redis is located at 10.10.97.225`

#### Roll credits.
Now I know what you’re thinking. Brilliant. Right? But interestingly, this `epic saga` is based on real events.

Sure, the spaceships and galaxy-spanning IPv4 network aren’t real, but DevOps teams really do face the challenge of finding services like Redis or Nginx in distributed clusters of Docker containers.

The benefit of containerisation is the ability to be careless about placement and locations. It’s a departure from the old ways, where each service was always in the same place, ready and waiting.

#### Don’t say ‘Consul of Elders’
The Consul of Elders is also real, but most people just call it Consul. It is a distributed database that helps to facilitate the discovery of networked services.

Consul doesn’t need Docker, and Docker doesn’t need Consul, but together they change the game for large-scale containerisation and service discovery.

Registrator, another very useful service for Docker, creates the link between Docker and Consul and populates the distributed Consul database with details of each container that runs on each host.

#### How Consul and Docker Work Together
The terminology can be a bit confusing to newcomers, which is why I hope this movie can help. In the mean time, you can think of it this way:

* Docker Swarm runs containers across any number of Docker hosts
* Registrator tells Consul about these containers
* Consul keeps a detailed database of everything

One of my favourite things about Consul is that it uses a gossip protocol so that any member of the cluster can be queried. There is no ‘master’.

We can easily see which clusters hosts are online with the <pre>consul members</pre> command:

<pre>
Node        Address             Status  Type    Build  Protocol  DC
i-bae58774  10.10.12.144:8301    alive   server  0.5.2 2         dc1
i-ace73562  10.10.11.149:8301    alive   server  0.5.2 2         dc1
i-12e4866c  10.10.10.138:8301    alive   server  0.5.2 2         dc1
</pre>

Consul exposes a Rest API service to aid discovery. In our blockbuster movie, we use The Temple of Curl to find Lord Redis. We can make this query against any member of the cluster.

<pre>
$ curl 127.0.0.1:8500/v1/catalog/service/lord-redis  
  {
    "Node": "swarm-republic-824hfah392",
    "Address": "10.10.12.144",
    "ServiceID": "swarm-empire-3abu89a4h2:sad_ptolemy:6379",
    "ServiceName": "lord-redis",
    "ServiceTags": null,
    "ServiceAddress": "10.10.97.225",
    "ServicePort": 6379
  },
</pre>

<br/>
Consul also exposes a simple DNS service, which can be more useful in certain deployments.

<pre>
$ dig @localhost -p 8600 lord-redis.service.consul ANY +short
10.10.97.225
</pre>
<br/>
Where to next?
If you’d like to learn more about Docker Swarm, Consul, or Registrator then please read on.
The Consul Documentation is extensive and easy to follow. There is great Intro guide, a breakdown of how Consul compares to similar solutions, and a straightforward Getting Started guide.
At the time of writing, Docker Swarm is still in beta so it’s docs aren’t finished, but the Swarm homepage provides a good introduction.
It’s worth noting that Cevo offers a two-day Docker Training course that shows you how to build a Swarm of your very own. There's a course coming up in <a href="http://www.cevo.com.au/event/docker-administration-operations-training-melbourne/" target="blank">Melbourne</a> and <a href="http://www.cevo.com.au/event/docker-administration-operations-training-sydney/" target="blank">Sydney</a> right now. Be sure to check out our <a href="http://www.cevo.com.au/events-trainings/" target="blank">Events &amp; Training</a> page to see if any training is scheduled near you.
The Registrator Quick Start guide is very helpful and worth looking at after you you have Swarm and Consul running together.
Finally, if you’re in the mood for a big technical walk-through, I recommend Mark van Holsteijn’s post on Docker, Consul, CoreOS, and Registrator over on xebia.com. -->


Beer _and_ pizza. Fish _and_ chips. **Docker _and_ Consul**. Sometimes perfect matches are discovered, and there’s no going back.

Two weeks ago I had an opportunity to architect and deploy a cluster of self-provisioning Docker Swarm servers, which utilised Consul as their shared database. Thanks to Consul, we could immediately identify the address and services running on any container in the cluster.

This technology was remarkably easy to deploy. In fact, the biggest challenge was getting an understanding of how all the different pieces fit together.

What we really needed was an **educational-scifi-adventure** movie to help educate everyone on these amazing tools. After all, we all know how _warp drive_ and _death stars_ work, and it’s that kind of knowledge that can only be taught through movies.

## Act 1 - The Great Migration

This is the story about the **Republic of the Swarm**. A peaceful galactic empire of super-intelligent AI.

In the beginning, each AI lived in it’s own server. Nobody moved around, so each AI knew where all the other AIs lived, but this was expensive and the AIs couldn’t move easily to find new work.

So a **great migration** occurs, and all the AI pack up and move to Container City. A cluster of commoditised computers running functional, light-weight apartments. Just the kind that AIs like.

Rents fall, AIs move freely to balance their needs, and productivity goes through the roof.

## Act 2 - Tragedy

Suddenly, an entirely-foreseeable tragedy befalls the Republic. Now that every AI is moving around at random, nobody can find anybody else and the city falls into chaos.

Upon hearing of this, the **nefarious** Bare Metal Alliance - a vast trade empire now facing ruin since the Republic doesn’t have to buy so much hardware - launch an all-out assault. Their goal is simple: force the Republic to abandon containerisation and return to the old, costly ways of single server environments.

## Act 3 - War!

Enter our protagonist, Unit Ad9\. This humble little AI knows that only the great **Lord Redis**, leader of the Swarm Armies, has the ability to defeat the Bare Metal Alliance and bring peace to the republic.

But alas! Ad9 has no way to find Lord Redis, as she may be living in any part of the city and it’s impossible tell where.

In a desperate bid to save the Republic, Ad9 travels to the _Temple of Curl_, to summon the ancient and long-forgotten Consul of Elders. The Consul of Elders is the only hope we have of finding Lord Redis.

In our epic climax, Ad9 calls upon the Consul of Elders to help him find Lord Redis and save the empire.

_Consuls, our city is in disarray. Our people are scattered across many small, functional apartments we all love, but we cannot find each other._

_The evil Bare Metal Alliance has dispatched a fleet of Chaos Monkey-class Warships in attempt to impose their archaic ways upon our once great Republic._

_Our only hope is to summon the great general of our armies, Lord Redis. But she is adrift in a sea of containers, we have…_

In this echoing Temple of Curl, the Consul Members all interrupt simultaneously, in a dull monotone that makes Ad9 very sleepy…

**Lord Redis is located at 10.10.97.225**

## Roll credits.

Now I know what you’re thinking. _Brilliant_. Right? But interestingly, this **epic saga** is based on real events.

Sure, the spaceships and galaxy-spanning IPv4 network aren’t real, but DevOps teams really do face the challenge of finding services like Redis or Nginx in distributed clusters of Docker containers.

The benefit of containerisation is the ability to be careless about placement and locations. It’s a departure from the old ways, where each service was always in the same place, ready and waiting.

## Don’t say ‘Consul of Elders’

The Consul of Elders is also real, but most people just call it Consul. It is a distributed database that helps to facilitate the discovery of networked services.

Consul doesn’t need Docker, and Docker doesn’t need Consul, but together they change the game for large-scale containerisation and service discovery.

Registrator, another very useful service for Docker, creates the link between Docker and Consul and populates the distributed Consul database with details of each container that runs on each host.

## How Consul and Docker Work Together

The terminology can be a bit confusing to newcomers, which is why I hope this movie can help. In the mean time, you can think of it this way:

*   **Docker Swarm** runs containers across any number of Docker hosts
*   **Registrator** tells Consul about these containers
*   **Consul** keeps a detailed database of everything

One of my favourite things about Consul is that it uses a gossip protocol so that any member of the cluster can be queried. There is no ‘master’.

We can easily see which clusters hosts are online with the `consul members` command:
```bash
Node        Address             Status  Type    Build  Protocol  DC
i-bae58774  10.10.12.144:8301  alive   server  0.5.2  2         dc1
i-ace73562  10.10.11.149:8301  alive   server  0.5.2  2         dc1
i-12e4866c  10.10.10.138:8301  alive   server  0.5.2  2         dc1
```
Consul exposes a Rest API service to aid discovery. In our blockbuster movie, we use _The Temple of Curl_ to find Lord Redis. We can make this query against any member of the cluster.

```bash
$ curl 127.0.0.1:8500/v1/catalog/service/lord-redis
  {
    "Node": "swarm-republic-824hfah392",
    "Address": "10.10.12.144",
    "ServiceID": "swarm-empire-3abu89a4h2:sad_ptolemy:6379",
    "ServiceName": "lord-redis",
    "ServiceTags": null,
    "ServiceAddress": "10.10.97.225",
    "ServicePort": 6379
  },
```
Consul also exposes a simple DNS service, which can be more useful in certain deployments.
```bash
$ dig @localhost -p 8600 lord-redis.service.consul ANY +short
10.10.97.225
```
## Where to next?

If you’d like to learn more about Docker Swarm, Consul, or Registrator then please read on.

The Consul Documentation is extensive and easy to follow. There is great [Intro guide](https://www.consul.io/intro/index.html), a breakdown of how [Consul compares](https://www.consul.io/intro/vs/index.html) to similar solutions, and a straightforward [Getting Started](https://www.consul.io/intro/getting-started/install.html) guide.

At the time of writing, Docker Swarm is still in beta so it’s docs aren’t finished, but the [Swarm homepage](https://docs.docker.com/swarm/) provides a good introduction.

The Registrator [Quick Start](http://gliderlabs.com/registrator/latest/user/quickstart/) guide is very helpful and worth looking at after you you have Swarm and Consul running together.

Finally, if you’re in the mood for a big technical walk-through, I recommend Mark van Holsteijn’s post on [Docker, Consul, CoreOS, and Registrator](http://blog.xebia.com/2015/03/24/a-high-available-docker-container-platform-using-coreos-and-consul/) over on xebia.com.

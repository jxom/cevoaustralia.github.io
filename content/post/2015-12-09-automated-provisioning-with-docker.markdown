---
title:  "Automated provisioning with Docker"
description: How Media Links deployed Docker clusters to easily provision & scale their infrastructure
date:   2015-12-09
categories:
  - devops
tags:
  - docker
  - automation
author: Eloise Skella
images: blog/automated-provisioning-with-docker.png
thumbnail: blog/automated-provisioning-with-docker.png
url: devops/2015/12/09/automated-provisioning-with-docker.html
---

#### Customer Overview
Founded in 1993, Media Links is a leading developer and manufacturer of broadcast network infrastructure solutions. Media Links provides broadcasters and network providers with the ability to convert and move broadcast signals – whether video, audio or data – onto their multi-service IP/Ethernet networks. Media Links solutions have been used to build some of the world’s largest video and media transport networks, including major installations in the USA, Europe, Japan, and Australia.

#### Business Situation
Media Links develop complex network technology that enables content providers and broadcasters to transmit massive amounts of uncompressed video across countries in real-time.
The Media Links Network Management Services (NMS) team in Melbourne develop real-time network monitoring and awareness technology that helps administrators analyse, plan, and troubleshoot these complex media networks. As a developer of network management solutions for high-traffic networks, Media Links faced the challenge of simulating such immense traffic volumes for testing and quality assurance purposes.

#### Solution
Docker containers enabled Media Links to easily create repeatable, light-weight infrastructure entirely through code. Through using Docker, containers can be launched and destroyed rapidly to match the evolving needs of the organisation and all changes to a container can be observed and reverted or repeated with ease.

Cevo worked closely with Media Links to architect and implement a highly-scalable solution that would scale to any number of container nodes, with the topology and design philosophy being easily transferable into customer enterprise networks. Cevo identified a number of interoperable Docker management and scaling tools to implement the solution.
Using AWS, Cevo provided Infrastructure-as-code templates to facilitate automatic deployments of an unlimited number of RedHat Enterprise Linux Docker host instances. Each instance was tagged with the name of the cluster it belonged to, and would automatically populate DNS and other configuration systems with a unique IP address, instance ID, and join the cluster as a member.

To facilitate cluster management with Docker, Cevo deployed Docker Swarm. Swarm, an extremely powerful native clustering service for Docker, enables developers to create and access a pool of Docker hosts using the full suite of Docker tools. By utilising Swarm, containers are able to launch instructions to a single node and have that node orchestrate container deployment across an entire cluster on their behalf.

To complete the implementation, Cevo employed Consul, a resilient and highly scalable distributed cluster database service to ensure a consistent view of which containers are running. Consul makes it easy for the multi-faceted Media Links network management product to query the database to identify peer services’ IP addresses and port numbers wherever they are in the cluster.

Working iteratively with the Media Links development and infrastructure teams, Cevo quickly established a prototype environment that both Cevo and the local team could build upon. This prototype delivered a single-node Docker cluster within just a few days, so that the tear-up/tear-down process of launching and destroying Docker containers could be tested alongside the development of a full, multi-node cluster environment. This made it easy to identify key challenges and resolve them quickly in a smaller environment, while incorporating those fixes into the larger cluster solution as it was built.

#### Benefits
Today, the Media Links development team can rapidly deploy multi-node Docker cluster environments on AWS in a single step. The cluster nodes provision themselves automatically, join their cluster, and are ready to manage incoming Docker requests in as little as 8 minutes. This process has enabled Media Links to test application functionality and performance in both low and high-scale environments with zero re-configuration.

Benefits include:

* Shorter testing time frames
* Faster development
* Improved customer satisfaction

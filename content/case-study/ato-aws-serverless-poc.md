---
title: "Doing a large transactional server : Without the server"
subtitle: A proof of concept in partnership with AWS
client: Amazon Web Services
cases: engineering
img: lambda.png
---

# Customer Overview

Amazon Web Services(AWS) If you are reading this and don't know who Amazon Web Services should allAmazon Web Services

# Business Challenge

AWS was working with a large Australian Government Body which currently processes XML requests with **traffic stat here**. This is currently done by large servers living on site. A serverless approach POC was adopted under the umbrella of a long term initiative to provide capability for dealing with the exponential growth stretching into 2018. AWS wanted to prove that there was a way of recreating the system with High Availability (HA) and Scalability, while also being efficient to implement, handling the large amounts of requests the system would receive, and being financially viable. AWS engaged Cevo to collaborate with them, building a solution in the tight deadline that was provided.

# Solution

In comes lambda - the serverless offering from AWS has High Availability and Scalability inbuilt, and removes the need to manage the servers, security and patching. However there is more to this system then simply processing the request. We need to ingest the request, validate it, encrypt and store it, queue it for processing, apply a bunch of business rules and then finally as storage will for now remain on-site we need to send the request off to the on-prem database. By making use of all the native AWS solutions available to us we were quickly able to setup a system that looks like this:


![serverless diagram](/img/case-study/serverless-poc.jpg)



# Benefits

**Some stats on transactions handled and cost**

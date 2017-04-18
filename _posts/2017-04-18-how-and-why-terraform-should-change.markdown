---
layout: post
title:  How and why terraform should change
description: An
date:   2017-03-12
categories:
    - technology
tags:
    - devops
author: Casey Leask
images:

excerpt:
    At a recent client site, I got the chance to use Terraform.
    These are my thoughts on my experience with Terraform and what could be improved.

---

[Terraform](https://terraform.io) is a tool for defining Infrastructure as Code.
Among the benefits described, are that Terraform is:
 - Simple and powerful
 - Reproducible
 - Automation Friendly
 - One Safe Workflow across cloud providers

Given a few years of experience with CloudFormation and my more recent usage of Terraform on a greeen fields project, I'll take a look at these points and give examples for where I think Terraform excels and falls short.

### Simple and powerful
Terraform is definitely powerful. To be able to map, connect and manage assets from different platform is a huge selling point. [Interpolation Syntax](https://www.terraform.io/docs/configuration/interpolation.html) also gives you an incredible number of options and capabilities straight away.
A downside to this power is that Terraform is not simple. It's just not.

Let's take a look at the second example from the homepage:

```
resource "aws_elb" "frontend" {
  name = "frontend-load-balancer"
  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  instances = ["${aws_instance.app.*.id}"]
}

resource "aws_instance" "app" {
  count = 5

  ami           = "ami-408c7f28"
  instance_type = "t1.micro"
}
```
<br />
Simple, right?

Let's take a closer look at this line:

```
instances = ["${aws_instance.app.*.id}"]
```
<br />
What's happening here?

The [docs](https://www.terraform.io/docs/providers/aws/r/elb.html) state:

```
instances - (Optional) A list of instance ids to place in the ELB pool.
```
<br />

Fair enough.
But we still don't really understand the next part

```
["${aws_instance.app.*.id}"]
```
<br />

It's an array with a single string value, `aws_instance.app.*.id`.

What is `*`? I can't find this in the [aws_instance reference](https://www.terraform.io/docs/providers/aws/r/instance.html).

Using a hunch, we can find a reference to `.*.` in the [interpolation doc](https://www.terraform.io/docs/configuration/interpolation.html#attributes-of-other-resources).

```
If the resource has a count attribute set, you can access individual attributes with a zero-based
index, such as ${aws_instance.web.0.id}.
You can also use the splat syntax to get a list of all the attributes: ${aws_instance.web.*.id}.
```
</br />

What does this list look like? I couldn't find a definitive answer.

The value returned becomes

```
["i-13461244, i-14214214, i-21536451, i-75346356, i-87136314"]
```
<br />

A little strange. We have an array that contains a single string, that contains a comma separated value.
What is the actual value passed to Amazon?

Terraform calls the [AWS Go API](http://docs.aws.amazon.com/cli/latest/reference/elb/register-instances-with-load-balancer.html) with options that look like:

```
[
  {
    "InstanceId": "i-97856745"
  },
  ...
]
```
<br />

Somewhere along to way, the array with a single value is split by ',' then flattened, then wrapped again.

Terraform also takes responsibility for the ordering of creation.
`register-instances-with-load-balancer` can't be called until the ELB and the instances exist.

That's another complication of Terraform's approach. [This example might be easy, but it's not simple](https://www.infoq.com/presentations/Simple-Made-Easy).

### Reproducible
In running the previous example, you quickly hit a scenario where Terraform cannot continue.

When you try to update the ELB, you'll be notified that the instances are not in the same VPC.
Fix that, and you'll get another, mentioning that the instances need to share the VPC with the Load Balancer.

Some context: Both the instances and the ELB are required to either be in EC2-Classic (deprecated), or EC2-VPC.
To quote the [Amazon documentation](http://docs.aws.amazon.com/AmazonVPC/latest/UserGuide/default-vpc.html#default-vpc-availability)

```
If you created your AWS account after 2013-12-04, it supports only EC2-VPC.
In this case, we create a default VPC for you in each AWS region.
Therefore, unless you create a nondefault VPC and specify it when you launch an instance, we launch your instances into your default VPC.
```
<br />

A large amount of terraform's documentation runs in EC2-Classic or launches instances into the default VPC.
Since I'm not in accounts with default VPCs, almost none of the examples in the documentation are reproducible without rework.

The documentation is also missing other crucial attributes, they are [easy pickings if you want to contribute](https://github.com/hashicorp/terraform/pull/13312).

### Automation Friendly and One Safe Workflow across cloud providers

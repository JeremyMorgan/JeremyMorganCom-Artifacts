---
comments: true
date: 2012-07-17 23:29:56
layout: post
slug: what-is-microsoft-azure
title: 'What is Microsoft Azure and Why Should You Care? '
wordpress_id: 1297
categories:
- Programming
permalink: /blog/programming/what-is-microsoft-azure/
sharing: true
author: Jeremy Morgan
---

There's a lot of talk flying around about Microsoft Azure, especially in the .Net programmer world. Azure has been around a couple years, but it's recently evolved into a service that could change computing as we know it. It's more than just hype as you'll see.

<!-- more -->

### **What is Microsoft Azure?**

If you have no idea what I'm talking about, here's a good definition [from Wikipedia](http://en.wikipedia.org/wiki/Azure_Services_Platform):

> Windows Azure is a Microsoft cloud computing platform used to build, host and scale web applications through Microsoft data centers. Windows Azure is classified as platform as a service and forms part of Microsoft's cloud computing strategy, along with its software as a service offering, Microsoft Online Services.

Basically, it's a full service and platform hosted by Microsoft for your products. This is much more than just web hosting, this is an all inclusive service hosted by them. But today we're going to use web hosting as an example of one of the things Microsoft Azure is going to revolutionize and why.

### **Web Hosting The Old Way**

{% img center http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/07/oldweb.jpg Web Hosting The Old Way %}

The diagram above illustrates the conventional method of web hosting, and in fact many sites are still hosted this way.  Your website is hosted on a computer at a datacenter (usually a web hosting company or internet service provider) and it resides on a single server, and maybe even a single hard drive. You had a separate database server (or not) and your data would live on that machine. Here are the common options for conventional web hosting:

**Standard Hosting** - Your site is hosted on a single hard drive, with many other websites. Web server software points requests to your domain name to a folder on the hard drive of that machine, as are other websites. You have a database that's either hosted on that machine or on a separate machine, and that is also shared with other websites, and other customers.
**Dedicated Server** - This is a machine that's all yours. Your site resides on this machine and it's sole purpose is serving up your website. You manage it, update it and reboot it when you need to. This may be an actual physical machine or a virtual machine on a larger server, but either way it acts as your own computer. More expensive and usually used on high traffic or websites with a lot of data.
**Multiple Server Hosting** - This is similar  to cloud hosting in that you have multiple machines dedicated to your site. When traffic gets high, there are multiple webservers or databases to choose from, and your site is duplicated across them. This is more expensive and usually only for high traffic sites that require this type of performance.

There are many variations on this, but these are the most common setups. You can also host a website in your house off a DSL line ( I did this with JeremyMorgan.com the first 2 years of it's existence) if you choose to, but most people would not want to deal with that. So those were the options we've had over the last couple of decades for hosting our sites, and it's served us well. But what are some of the problems we encounter with conventional web hosting.

{% img center http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/07/webserver.jpg Conventional Web Server %}
How a typical webserver operates

### **Problems with Conventional Hosting**

**Safety -** If you're running a cheap web hosting account, it's very likely your site lives on one hard drive, on one machine, and you may not even have a backup system in place. This is disaster if something happens to that machine, and hard drives  fail frequently and without much warning.  Even if they have a backup system in place, there could be a problem that affects the entire datacenter (fire, flood, etc) and then your backup is toast too. Or maybe they have a power outage or their internet connection drops, causing your site to be down. While most web hosting companies have pretty impressive uptime rates, it's no guarantee.
**Redundancy** - This ties into the safety part because having your website in two places is far better than one. But what if your website suddenly experiences a huge load? If your site gets "slashdotted" and you have a sudden surge of traffic, chances are that shared server or even a dedicated server is going to choke, giving a bunch of people 404s. So your 15 minutes of fame once your site hits the front page of Reddit could end up being a huge embarrassment, or worse yet expensive.
**Scalability - **So imagine your site suddenly becomes the next big thing. People are flooding in and it's time to upgrade your site, because it's going slow and people are getting 404s. It's a great problem to have, but what will it take to upgrade? You'll have to put in a work order with your hosting provider and they either have to move you to a bigger and faster machine, or build a bigger, faster server and migrate your data there. While some companies can do this really well there is still some lag time involved. It could be a day of moving things, but maybe a few days, or even a week. Plus there are always the unexpected things that inevitably come up when you do things like this.

**Speed based on location** - So the guy who lives down the street browses your site really fast, and those who live in the same state, or in the same country have a pretty good speed, but those visitors on the other side of the world? They're pretty frustrated with how slow your website is. Because it's hosted in one specific location the further you get from it, the slower it can be.

So how can we solve these problems? This is where cloud computing comes in.

### **New Cloud Hosting With Azure**

{% img center http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/07/cloud-microsoft-azure.jpg Cloud Hosting with Microsoft Azure %}

This is the new way of hosting, called "cloud hosting". Basically you have massive arrays of machines clustered together to serve your content. Your site does not live on any one server,  but rather a bit of it lives on many machines, spread out across the datacenter, and then there are multiple datacenters hosted in multiple geographical locations. These machines are shared between thousands of others of course, but they're available for you if you need it. Rather than just one single server you have an army of them at your command and everything is distributed evenly. How does this solve the problems we had above?

**Safety** - Since your data now resides on multiple machines, in multiple datacenters safety isn't as much of a concern as it once was. A hard drive failure isn't even noticeable. Even if an entire machine goes down the others pick up the slack. If an entire datacenter goes down, the others pick up.   Your data is copied all over the world now instead of one spot giving you extra reliability.

**Redundancy** - Since everything is  spread out into clusters, redundancy is a natural occurrence.  If you get slammed with traffic, it will be redirected to more pipes, and more servers start churning out your content, in multiple datacenters. Slowdowns will be a thing of the past once your site is spread out to all corners of the world on banks of fast servers.

**Scalability - **One of the primary reasons cloud computing was created was for scalability. Websites and companies can grow at the speed of light, and literally become overnight sensations. What was once a website that got a few hundred hits a month can the next day be getting thousands of people an hour on it. With Microsoft Azure you won't be calling your host and having techs scramble to build you a new machine. You simply click a slider and give yourself some more bandwidth, or space. You can go from zero to hero without missing a beat. You only pay for what you use so if things slow down, you aren't stuck maintaining a bunch of expensive servers you bought during a rush. In my opinion this is the most incredible and useful part of Microsoft Azure.

**Speed based on Location?** - Not a problem anymore. There are multiple world class datacenters all over with your content on it. While you may  be living in Oregon and hitting a server in California, the guy in Virginia visiting your site is hitting a  datacenter 50 miles from him, and you're both looking at the same website, and sharing the same data.  Pretty awesome huh?

### **Is there a Downside?**

{% img center http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/07/microsoft-azure-downside.jpg Microsoft Azure %}

Nothing good comes without risk, but luckily Microsoft is absorbing most of this risk. They've invested millions of dollars in state of the art datacenters, top notch hardware and the people to run it all. They've also invested heavily in the software development and R&D required for something of this magnitude. But is there any risk for you?

**Security** - This is always the number one question people ask about cloud computing and hosting. Is it secure? Theoretically there should be no difference in security than a conventionally hosted site, but there certainly are new risks. Is the clustering software secure? Are all the facilities physically secure? Is my data being transmitted securely? These are all valid questions and one of the downsides of having your data stored all over the place is.... well having your data all over the place. Only time will tell whether this ends up being a long term problem for cloud hosting and cloud computing in general.

**Privacy**  - This ties closely with your security, but do you trust Microsoft with all your data? Remember Azure is about more than hosting, it's also a service provider, meaning you can build software as a service and have it live in Azure. There are many advantages to this but you're also putting everything in the hands of Microsoft and there are many who are simply too paranoid for that.  There are advocates in the industry that are afraid of Microsoft using their data or usage patterns to their own advantage.

**Dependence** - So lets say your website takes off and becomes the next big thing or your service becomes ultra successful. You'll be putting all your eggs in the Microsoft Basket. If Azure is successful and Microsoft remains profitable there's no reason to expect it to go away, but what if there is a problem with that? What if Microsoft goes belly up (highly unlikely) or Azure doesn't turn a profit and they're forced to pull the plug (not as likely)? Your whole business could collapse. If you're hosting a site the conventional way you don't have to rely on any one single company or technology for survival.

### **Conclusion**

So I hope I've done a good job of showing you how Microsoft Azure intends to change the way we think about computing. I used web hosting as an example, but Azure is so much more than just hosting, it's actually several levels above that. It's a combination of:

  * Software as a service
  * Platform as a service
  * Infrastructure as a service

Microsoft has had the "software as a service" as a goal for a very long time, and they're finally reaching that. This is a major shift for computing as we go from running binary executables on our own personal machines to running distributed services from the internet to do the same thing. This is revolutionary and I'll cover this in my next article about Microsoft Azure as a software service.

If you have comments or questions, please feel free to leave them below.
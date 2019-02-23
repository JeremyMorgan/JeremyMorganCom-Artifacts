---
layout: post
title: "Load Testing Your IIS Web Server"
date: 2017-07-01 02:27
updated: 2018-03-25 12:22
comments: true
categories: 
- IIS
- Devops
- DotNet
- Tutorials

author: Jeremy Morgan
sharing: true
description: All the theory, calculations, and estimations in the world aren't going to tell you how your website will truly perform under a load.
ogimage: https://www.jeremymorgan.com/images/load-testing-iis-web-server/load-test-iis-web-server-og.jpg
permalink: /tutorials/IIS/how-to-load-test-iis-web-server/

---
All the theory, calculations, and estimations in the world aren't going to tell you how your website will truly perform under a load. If you're deploying a new server, or doing any kind of performance enhancements you don't want to test your results in production. It's always a good idea to see how your system behaves before your visitors do. To do that, you can use a load testing tool, and here are a few I use quite frequently.


**Update:** I've featured these tools is my latest IIS course on Pluralsight, <a href="http://pluralsight.pxf.io/c/1221983/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fiis-administration-in-depth" target="_blank">IIS Administration in Depth</a>, check it out!

<!-- more --> 
### Netling

![Load Testing IIS Web Server](/images/load-testing-iis-web-server/load-test-iis-web-server-01.jpg)

**[Download Netling Here ](https://github.com/hallatore/Netling)**

One of the "quick and dirty" applications I use is Netling. This is a super simple tester written in C#. You will need to compile this with Visual Studio, but you don't necessarily have to be a developer to do it. I've been able to load it up, and select build to create it with no modifications with many versions of Visual Studio. 

Netling is super simple to operate and about as easy as it gets. 

You select how many threads you want to run. This is entirely up to you, more threads will put more load on your machine, and depending on how many cores your CPU has, more may not necessarily be better. Experiment with it and see what works best for you. 

It has a feature for "Pipelining". This is when multiple requests go through a single socket without waiting for a response. Setting this higher will generate a higher load but again this something to adjust for best results.  There will be a physical limit to pipelining depending on your hardware and connection speed. 

This is a handy tool and is extremely simple to use. One issue I've had with Netling is it sends raw requests that aren't much like a real browser. To emulate real traffic more accurately I have another tool I like to use. 

### Netling Pros
- Free
- Open Source, can be easily modified
- Extremely Simple

### Netling Cons
- Doesn't simulate real transactions well
- Can't do authentication or other simulations
- Only tests one URL at a time


### Web Surge

![Load Testing IIS Web Server](/images/load-testing-iis-web-server/load-test-iis-web-server-02.jpg)

**[Download Web Surge Here](https://websurge.west-wind.com/)**


Web surge is by far one of my favorites. It's a great application that simulates a load on your server in a very realistic fashion. 


With this program you create sessions, which means you can use more than one URL for the test. Each of the URLs will be run in the session, which can make it more random and realistic. It has a ton of great options as well:

![Load Testing IIS Web Server](/images/load-testing-iis-web-server/load-test-iis-web-server-03.jpg)

It gives you quick results, and you can "drill down" to get more detailed data.

![Load Testing IIS Web Server](/images/load-testing-iis-web-server/load-test-iis-web-server-04.jpg)

You can also export these results in several formats. There's the Websurge proprietary format, as well as XML or JSON. You could parse these results for future analysis work. 

Overall Websurge is among my favorites for load testing because it's closer to real world traffic. If you put in a list of all your pages and randomize the test, it can provide some solid information. 

### Web Surge Pros
- Free (for personal use)
- Professional Version reasonably priced
- Fast and generates a large load
- Simple to use, yet powerful
- Simulates "real world" traffic very well
- Extremely configurable

### Web Surge Cons

- None than I can think of


## Apache JMeter 

![Load Testing IIS Web Server](/images/load-testing-iis-web-server/load-test-iis-web-server-05.jpg)

**[Download JMeter Here ](https://jmeter.apache.org/)**

The Next application we'll look at is Jmeter. This is an extremely powerful program and can do very thorough testing in addition to generating a load. In fact load testing with Jmeter is just a very small part of it's overall functionality. 

With JMeter you have scenarios to run out, because it's more of a testing oriented application you can run through a longer set of steps and processes as a part of your test. 

I would encourage you to really dig into this application and learn as much as you can about it to get the full benefits of it. 


### Apache JMeter Pros
- Free
- Very Powerful
- Detailed tests can be set up
- Minimal setup

### Apache JMeter Cons

- Steeper learning curve
- Can be fairly complicated
- May be overkill for what you need


## Conclusion

There are many tools out there for load generation, but these are the ones I use the most. I like to set up various different tests to accurately gauge performance of your website and it's reaction to a load. 

In fact, the reaction to a heavy load is the most important thing I'm looking for. When doing performance measurements it's difficult to really nail down all the variables and prove a change has increased performance. But sending a heavy load to your server and seeing how it reacts is pretty conclusive. 

I cover some performance and stability enhancements in my **[Pluralsight Course - IIS Administration Fundamentals](http://pluralsight.pxf.io/c/1221983/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fiis-administration-fundamentals)**. 

I cover load testing in detail in my new course **[IIS Administration In Depth](http://pluralsight.pxf.io/c/1221983/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Fiis-administration-in-depth)**.


Check it out if you want to learn more about administering IIS Servers. If you don't have a Pluralsight account yet, you can <a href="http://pluralsight.pxf.io/c/1221983/424552/7490">start a free trial by clicking here</a>!

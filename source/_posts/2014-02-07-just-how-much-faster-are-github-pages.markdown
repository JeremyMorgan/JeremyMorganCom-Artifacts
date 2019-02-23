---
layout: post
title: "Just How Fast Are GitHub Pages?"
date: 2014-02-07 19:30
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: Recently GitHub rolled out some improvements to their GitHub Pages static page hosting services. I decided to do a comparison and put them to the test.
permalink: /blog/programming/how-fast-are-github-pages/
ogimage: https://www.jeremymorgan.com/images/github-pages-ogimage.jpg

---
Recently GitHub rolled out some improvements to [GitHub Pages](https://github.com/blog/1715-faster-more-awesome-github-pages), their free static page hosting service. As this is a static site I've recently had a lot of interest in static hosts and seeing which ones might be the best. I decided to do a comparison and see how some major services, including GitHub pages serve up static content. I was a bit surprised.

<!-- more --> 
###My Current Hosting

Currently I'm hosted at [Arvixe Hosting](https://affiliates.arvixe.com/track.php?id=5348&tid1=homepage) and I couldn't be happier with it. The service is great, speed is great and it's an excellent package. One thing I've noticed about them, is they serve up static pages like this one surprisingly fast:

![GitHub Pages Speed Test](https://www.jeremymorgan.com/images/github-pages-speed-test-1.jpg)

Couple that with the fact they run ASP 4.5 and unlimited MSSQL databases, I'm not exactly looking around for a new host. However I am curious about other static site hosting options so I did some tests. 

###The Initial Test

Initially I ran some tests of my page's basic content. I generated the site in Octopress and uploaded it to the following sites:

- Arvixe (The site you're looking at)
- Windows Azure
- Amazon AWS
- GitHub Pages

I figured they'd all be pretty close. Since host all my CSS, JavaScript and Images on a CDN anyway, they don't factor in to the actual host speed.

These are tested with Webpagetest.org from Dulles, VA on a cable connection. 

![GitHub Pages Speed Test](https://www.jeremymorgan.com/images/github-pages-speed-test-3.jpg)

**Site Load Times (Standard Website, Dulles VA)**

- Arvixe - 2.866s
- Windows Azure - 3.962s
- Amazon AWS - 4.055s
- GitHub Pages - 2.658s

So in this test we have two clear winners. Arvixe and GitHub pages. Since these tests were run from the same site I decided to change it up a bit. 

**Site Load Times (Standard Website, Los Angeles CA)**

- Arvixe - 3.283s
- Windows Azure - 3.480s
- Amazon AWS - 3.483s
- GitHub Pages - 3.202s

The results here were a little different. The grouping is much more close, and clearly geography matters. So why not go overseas with a test? Since I have a large audience coming from India, I decided to test that:

**Site Load Times (Standard Website, Indore, India)**

- Arvixe - 8.140s
- Windows Azure - 7.347s
- Amazon AWS - 7.872s
- GitHub Pages - 5.915s

Here we see the sites load slower overall, but GitHub Pages are considerably faster. This is using my standard web page, so I decided to do an all text test. 

###Results with all text test page

I decided to create an all text page, so I set up a simple bootstrapped page with a ton of text on it.

[http://www.jeremymorgan.com/speedtest/](http://www.jeremymorgan.com/speedtest/)

<a href="https://github.com/JeremyMorgan/staticpagetest" rel="nofollow">Download this test page from GitHub</a>

I uploaded that test to the different hosts. This one loads considerably slower but with a large chunk of text, it should give us a pretty good idea of which host serves straight text the best. 

This test was so large that my India tests kept timing out. It's a good thing my articles are never quite that verbose. Here's the results of some tests from various geographic locations:

![GitHub Pages Speed Test](https://www.jeremymorgan.com/images/github-pages-speed-test-2.jpg)

**Site Load Times (All Text, Dulles, VA)**

- Arvixe - 30.239s
- Windows Azure - 22.178s
- Amazon AWS - 32.918s
- GitHub Pages - 14.673s

**Site Load Times (All Text, Los Angeles, CA)**

- Arvixe - 32.671s
- Windows Azure - 21.535s
- Amazon AWS - 39.045s
- GitHub Pages - 18.393s

**Site Load Times (All Text, Miami, FL)**

- Arvixe - 41.267s
- Windows Azure - 27.018s
- Amazon AWS - 57.933s
- GitHub Pages - 23.175s

**Site Load Times (All Text, Denver, CO)**

- Arvixe - 79.055s
- Windows Azure - 73.729s
- Amazon AWS - 93.335s
- GitHub Pages - 47.211s

**Site Load Times (All Text, Phoenix, AZ)**

- Arvixe - 27.164s
- Windows Azure - 26.16s
- Amazon AWS - 45.765s
- GitHub Pages - 11.263s

**Site Load Times (All Text, Montreal, CAN)**

- Arvixe - 67.208s
- Windows Azure - 45.301s
- Amazon AWS - 60.068s
- GitHub Pages - 44.022s


###Why these tests don't matter much

It's easy to draw a conclusion from these results, but they're not very scientific. The tests run are on people's machines all around the world with various different internet connections and other variables that can go wrong. A tester's connection could instantly slow on one site or another, or server loads can change. You never truly know your actual load time, and I cannot say "Github pages are ____% faster" with these tests. 

That being said with each set of tests if you compare the sites to each other it's pretty clear GitHub pages are faster overall. I don't know exactly what they're doing in the background other than what they share but it's pretty clear they have text compression and serving down very well. If you're building a static site it's a pretty good bet to host it on GitHub pages if you can.

###Run your own tests!

If you'd like to run a similar set of tests, head over to the <a href="https://github.com/JeremyMorgan/staticpagetest" rel="nofollow">GitHub page</a> for my static test page and upload it anywhere you want. I used <a href="http://www.webpagetest.org" rel="nofollow">webpagetest.org</a> for the tests, and used <a href="https://addons.mozilla.org/en-US/firefox/addon/imacros-for-firefox/" rel="nofollow">Imacros</a> to automate the process. Let me know in the comments or contact me if you come up with something different!

###Update!

After this article hit Twitter it started to gain traction and I found out GitHub pages are <a href="https://www.fastly.com/" target="_blank">hosted by Fastly</a>. If you're familiar with Fastly at all you're probably not surprised they have something to do with the high speed. They're a CDN that's setting speed records, check em out. 


{% include custom/asides/programming-footer.html %}
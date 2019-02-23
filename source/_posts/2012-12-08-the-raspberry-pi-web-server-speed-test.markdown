---
layout: post
title: "The Raspberry Pi Web Server Speed Test"
date: 2012-12-08 15:16
updated: 2018-03-25 12:22
comments: true
description: What's the fastest Web Server for the Raspberry Pi? In this article I aim to find out. 
categories:
 - Raspberry Pi
 - Programming
 - Linux
author: Jeremy Morgan
sharing: true
permalink: /blog/programming/raspberry-pi-web-server-comparison/
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
---


So last week I showed how to set up a web server on the Raspberry Pi. Many people pointed out that Apache probably isn't the best option for the Pi. So I decided to do a little speed test to see which server would be the fastest if you were going to build a Raspberry Pi Webserver. This is a good way to compare how each server will run on low powered hardware. 
<!-- more -->
<br />
{% include custom/asides/rpi-footer.html %}
###The Test

For the test environment, I setup my Pi on a private network connected only to laptop through a router. There is no other traffic on this network so I knew connection issues wouldn't play a part in it. I tried to eliminate as many variables as I could including rebooting the pi and letting it cool down between runs. 

Another thing to note: these are all **default installations** so we're testing it right out of the box.

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-01.png Raspberry Pi Web Server Speed Test %}

For the test I used <a href="http://www.joedog.org/siege-home/" target="_new">Siege 2.68</a> as it is a great tool for this type of testing. For my test I only wanted to focus on static content, such as text and images. I may do a test with PHP in the future but I didn't want to introduce that variable just yet and stick with what the web server is supposed to do, which is serve content. 
<br />
###Test Content

For this experiment I really wanted to swamp this thing. So I created 4 different pages for tests. 

* Small Text Test - html page 177 bytes (small, quick transactions)
* Large Text Test - html page 95,881 bytes (large, long transactions)
* Small Image Test  - Small PNG load (849 bytes)
* Large Image Test	- Large JPG load (179,000)

{% include custom/asides/raspberry-pi-2.html %}
I then ran these tests with 200 concurrent connections for two minutes at full blast using the following test:

>siege -b -t2m -c200 192.168.1.100 [filename]

I tested the following software:

* Apache
* Nginx
* Monkey HTTP
* Lighttpd

I ran all of them out of the box from the default settings, installed from apt-get, with the exception of <a href="http://monkey-project.com/">Monkey HTTP</a> which was compiled from source. 

Let's see which server is the fastest!

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-02.png Raspberry Pi Web Server Speed Test %}
<br />
###Small Text Transactions

The first test shows how many transactions took place during our 2 minute test. This is a good indicator of speed because if the server is struggling, it won't process requests. I ran both 100 concurrent connections and another set of tests at 200. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-04.png Raspberry Pi Web Server Speed Test %}
<br />
<table>
<tr><td width="100px">Apache</td><td width="100px">26724</td><td width="100px">26624</td></tr>
<tr><td>Lighttpd</td><td>32963</td><td>31807</td></tr>
<tr><td>Monkey</td><td>39423</td><td>39310</td></tr>
<tr><td>Nginx</td><td>40391</td><td>39449</td></tr>
</table>
<br /><br />

As you can see, Monkey and Nginx are pretty much neck and neck, and considerably above Apache. The ones that seem to handle the jump in connections best are Monkey and Apache. 

**Winner**: Nginx, but Monkey is very close and seems to scale better. 
<br />
###Large Text Transactions

Here we have a pretty large HTML file full of text, so the numbers change drastically. Here are our results:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-05.png Raspberry Pi Web Server Speed Test %}
 <br />
<table>
<tr><td width="100px">Apache</td><td width="100px">698</td><td width="100px">152</td></tr>
<tr><td>Lighttpd</td><td>625</td><td>563</td></tr>
<tr><td>Monkey</td><td>2060</td><td>2007</td></tr>
<tr><td>Nginx</td><td>3912</td><td>3886</td></tr>
</table>
<br /><br />
We expect these numbers to be a bit lower but what's most surprising is the hit that Apache and Lighttpd take. Nginx is the clear winner here, but Monkey at least makes a good effort. 

At 152 transactions, it's clear to see Apache is choking at this point. Some further configuration would change this, but out of the box it really struggles with this test. 

**Winner**: Nginx
<br />
###Small PNG Transfers

This test was created to see how each server would handle very tiny files. For this test we use a tiny PNG file (849 bytes). Here are the results:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-06.png Raspberry Pi Web Server Speed Test %}
<br />
<table>
<tr><td width="100px">Apache</td><td width="100px">32275</td><td width="100px">32840</td></tr>
<tr><td>Lighttpd</td><td>40838</td><td>41497</td></tr>
<tr><td>Monkey</td><td>51130</td><td>51065</td></tr>
<tr><td>Nginx</td><td>44461</td><td>45010</td></tr>
</table>
<br /><br />
Monkey is the clear winner here in both throughput and scalability. The difference between 100 and 200 concurrent connections is next to nothing. What does that tell you about how it's scaling? 

**Winner**: Monkey
<br />
{% include custom/asides/programming-footer.html %}
<br />
###Large JPG Transfers

This test uses a large JPG (178k) and these results show a drastic difference when more connections are added. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-07.png Raspberry Pi Web Server Speed Test %}

<br />
<table>
<tr><td width="100px">Apache</td><td width="100px">1467</td><td width="100px">1390</td></tr>
<tr><td>Lighttpd</td><td>1503</td><td>1357</td></tr>
<tr><td>Monkey</td><td>1442</td><td>1338</td></tr>
<tr><td>Nginx</td><td>1451</td><td>1396</td></tr>
</table>
<br /><br />
Here we see Apache starting to pull ahead more, but Lighttpd wins the round at 100 concurrent while Nginx ekes out a marginal victory at 200.

**Winner** - Lighttpd @ 100, Nginx @ 200 


<br />
###Availability

This test is a very good indicator of overall performance. If the web server is actively refusing connections it's a clear sign it's overloaded. 

At 100 concurrent connections, they all do fairly well:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-08.png Raspberry Pi Web Server Speed Test %}


<br />
<table>
<tr><th width="100"></th><th width="100">small text</th><th width="100">large text</th><th width="100">small png</th><th width="100">large jpg</th></tr>
<tr><td>Apache</td><td>100</td><td>100</td><td>100</td><td>98.39</td></tr>
<tr><td>Lighttpd</td><td>100</td><td>100</td><td>100</td><td>99.93</td></tr>
<tr><td>Monkey</td><td>100</td><td>99.95</td><td>100</td><td>99.65</td></tr>
<tr><td>Nginx</td><td>100</td><td>100</td><td>100</td><td>97.55</td></tr>
</table>
<br /><br />
The values here are percentages available. They all do fairly well though Nginx takes a noticeable drop when handling the large JPG file. 

That same test with 200 concurrent connections shows a bit more variance.

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-09.png Raspberry Pi Web Server Speed Test %}

<br />
<table>
<tr><th width="100">small text</th><th width="100">large text</th><th width="100">small png</th><th width="100">large jpg</th></tr>
<tr><td>Apache</td><td>99.98</td><td>21.53</td><td>100</td><td>98.39</td></tr>
<tr><td>Lighttpd</td><td>99.95</td><td>100</td><td>99.93</td><td>99.41</td></tr>
<tr><td>Monkey</td><td>99.88</td><td>98.87</td><td>99.97</td><td>98.60</td></tr>
<tr><td>Nginx</td><td>99.89</td><td>98.38</td><td>99.92</td><td>97.55</td></tr>
</table>
<br /><br />

It's a little hard to see the differences because Apache takes a nose dive with the large text. This isn't a fluke, I tried several different runs and Apache refused connections pretty frequently. I suspect a simple config change (more servers) will fix this. 

**Winner**: Lighttpd

<br />
###Data Transferred

As I stated earlier the chances of your site getting 200 connections all at once is pretty rare for most sites and if you were operating at that level you certainly wouldn't be using a Raspberry Pi as your server. This is merely a hacking exercise to show how these servers handle the load on this smaller hardware. 

This test will show how much data was transferred during our testing. These results are pretty interesting:


{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-10.png Raspberry Pi Web Server Speed Test %}

The winner in the small text arena is pretty close, but in the large text, you see Monkey really takes it away:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-11.png Raspberry Pi Web Server Speed Test %}

Monkey really shines when it comes to pushing out large amounts of text. Something to keep in mind.

Here we show large JPG transfer data. The small PNG throughput was not picked up by Siege, so we aren't able to find anything from that. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-12.png Raspberry Pi Web Server Speed Test %}

This one was a little surprising. At 100 concurrent connections Lighttpd takes it by a long shot, but at 200 concurrent connections Apache really pulls through. The reason this is surprising is because in past tests we've seen where Apache chokes, so the fact that it still delivers so much data when it is connected is a good sign. 

**Winner**: Monkey for Text, Apache for Images

<br />
###Response Time: Text

This is a very important test, because it shows how well the server is responding to requests. A slow response time means it's getting overloaded so this shows how well the servers perform under pressure. 


{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-13.png Raspberry Pi Web Server Speed Test %}

Here are results we've come to expect at this point. Nginx and Monkey do very well, especially at 100 concurrent users. But even under a heavy load they keep their times low while Apache chokes. 

Using some larger text, we confirm what we already know:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-14.png Raspberry Pi Web Server Speed Test %}

Nginx and Monkey both love large amounts of text. 

**Winner**: Nginx

<br />
###Response Time: Small Images

The response time in this test is pretty important because the servers were being bombarded with requests for small images. If this sounds like something that happens a lot, you'd be right. Usually when you're dealing with large images it's only a few, but many small image requests are an everyday thing for your site. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-15.png Raspberry Pi Web Server Speed Test %}

Here we see Monkey once again doing great, and Nginx not far behind. This is consistent with many of our other tests. But how about large images? 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-16.png Raspberry Pi Web Server Speed Test %}

This is the first time we really see all the servers so close to each other. Clearly they all struggle with fast responses with large images, but in this case lighttpd seems to do the best. 

**Winner**: I'm going to say Monkey, because smaller images are more frequently found and it does fairly well with large images anyway.

<br />
###Concurrency

This test shows how many concurrent users we were actually able to achieve. The results are not surprising:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-17.png Raspberry Pi Web Server Speed Test %}
 
They all seem to handle small amounts of text just fine, but at large amounts, once again Apache chokes. 

The same test for images tells a different story:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-18.png Raspberry Pi Web Server Speed Test %}

Here we see that overall Apache outperforms the others in both small and large images. It would seem that for stability and consistency Apache does well with images. 

**Winner**: Apache

<br />
###Failed Transactions

This is an important metric;we want to know how many times the server failed during our test. Here's a sample for our large HTML and JPG tests:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-19.png Raspberry Pi Web Server Speed Test %}

Ouch. I re-ran this test several times and it always came out like this. Simply put: Apache in it's default state does not like large chunks of text. The other servers do just fine. 

**Winner**: Lighttpd
<br />
{% img center https://www.jeremymorgan.com/images/raspberry-pi-web-server-03.png Raspberry Pi Web Server Speed Test %}
<br />
###Summary
**Winner**: Nginx

Overall I think the fastest and most reliable solution is Nginx. I only say this because it's more mature than Monkey and has some stability going for it. Monkey however is catching up fast. There seems to be a lot of enthusiasm for the project and as you can see by these tests it does very well especially with text. 

In the image arena Apache still seems to dominate. I'm not sure why that is, but it clearly handles this function very well. With some tuning you can make Apache handle text well too, but I still think it's a product that's past its prime. If I had to recommend anything it would be Nginx, but soon I may be changing that depending on how Monkey progresses. 

I would love to hear your feedback on these tests, and if you'd like to try tests of your own, grab a copy of siege and get going. For the next project like this I will likely be doing some tuning on each of these servers to see what kind of numbers we get then. If you have any ideas, send them my way!

###Update:

The folks at the BarracudaDrive Cloud Server Blog did a similar test and showed their BarracudaDrive product <a href="http://barracudadrive.com/blog/2013/03/Apache-Nginx-Lighttpd-Monkey-and-BarracudaDrive-Speed-Test" target="_new">outperformed all of these servers</a>. Definitely worth checking out.  

{% include custom/asides/rpi-footer.html %}


































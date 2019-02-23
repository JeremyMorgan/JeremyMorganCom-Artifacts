---
layout: post
title: "What is Heartbleed?"
date: 2014-04-13 19:34
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: On April 7th a security advisory was released titled "TLS heartbeat read overrun" (CVE-2014-0160) and it's received a lot of attention in the IT community and the general public. Here's a quick explanation of what Heartbleed is, and what it means for you.

permalink: /blog/programming/what-is-heartbleed/
ogimage: https://www.jeremymorgan.com/images/what-is-heartbleed.png
---

On April 7th a security advisory was released titled "TLS heartbeat read overrun" (CVE-2014-0160) and it's received a lot of attention in the IT community and the general public. Here's a quick explanation of what Heartbleed is, and what it means for you. 

<!-- more -->
###Why are so many people talking about this? 

{% img right https://www.jeremymorgan.com/images/what-is-heartbleed.png "What is Heartbleed?" %}
There are several reasons Heartbleed has received so much press. It's a security exploit with a very wide reach, which means a lot of people are affected. It was also given a cool but somewhat scary name and a logo. 

In other words it's an exploit with marketing. This is a good thing because it gets the non technical public involved and that's usually a great challenge. 

According to the OpenSSL security advisory, Heartbleed is:

>A missing bounds check in the handling of the TLS heartbeat extension can be
used to reveal up to 64k of memory to a connected client or server.

Which doesn't mean a lot to most people. Heartbleed is a bug with OpenSSL software, which is open source software used to secure communications on the internet. It allows an attacker to read chunks of memory on a web server they couldn't otherwise read. 

###The Heartbeat Process 

In short, here is how the heartbeat process works. A message is sent between the client (you) and a web server. It specifies the size and content of a message, and if the second server is functioning, it will return that same message back. This is done to make sure the connection is still present. 

Here is an illustration of that process and how it theoretically operates:

{% img center https://www.jeremymorgan.com/images/what-is-heartbleed-2.png "What is Heartbleed?"%}

In heartbeat process Server A prepares a message it expects to get in return and specifies the size of the message. If Server B does not respond, then the "heartbeat" is lost and it's assumed the server is down. If it does respond it will send back the same message so Server A knows everything is ok.

Under an ideal situation Server B would send back the original message and nothing else.

###The Heartbleed bug

Where the bug comes in is the size specification of the original message. If an attacker alters that size, they can send a message and receive back whatever size they asked for up to 65,536 bytes. This information is leaked from the Web Server's memory, so it can contain RSA keys, usernames passwords or any other sensitive information. 

Here's a diagram of an attack:

{% img center https://www.jeremymorgan.com/images/what-is-heartbleed-3.png "What is Heartbleed?"%}

It's not exactly this simple, but similar. If the attacker finds encrypted information they can also find the keys, and a well executed attack can garner large amounts of information. 

###Who is Affected? 

This affects any server using OpenSSL 1.0.1 and 1.0.2-beta. Since this exploit has been around for a couple years its unclear how many machines are truly affected. The safest bet is to change any password you can. 

Here's a list of <a href="http://mashable.com/2014/04/09/heartbleed-bug-websites-affected/" target="_blank">passwords you should change right now</a>.

###Should I Panic?

No. This bug is being patched quickly and as long as you change your passwords you should be fine. Your personal computer is unlikely to be affected by this. 

{% include custom/asides/programming-footer.html %}
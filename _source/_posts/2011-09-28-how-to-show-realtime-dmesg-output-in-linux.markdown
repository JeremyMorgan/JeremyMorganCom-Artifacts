---
comments: true
date: 2011-09-28 02:25:47
layout: post
slug: how-to-show-realtime-dmesg-output-in-linux
title: "Linux Tutorial: How to Show Realtime dmesg Output in Linux"
wordpress_id: 924
categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-show-realtime-dmesg-output-in-linux/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/linux-ogimage.png
description: How to show your dmesg output in Linux in realtime.
tags:
- how to linux
- linux
- linux help
- linux how to
- linux tips
- ubuntu how to
---

There are many times in Linux you want to watch your dmesg output, especially when working with hardware to see what's going on.



There is actually a really easy to way to do this, simply open another terminal and type:


> tail -f /var/log/messages


This will show you the last messages posted in realtime. This could go for any log you want actually, and works great.

Also some distrosl have "tailf" which does the same thing.


> tailf /var/log/messages


Also you can pipe your kernel output to another terminal. Open /etc/syslog.conf and add the following line:


> kern.*          /dev/tty10


This allows you to switch to that terminal to see the kernel output.

I hope this helps!

[![How to get realtime dmesg output in linux](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/09/linux-250x300.png)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/09/linux.png)



---
layout: post
title: "Remote Desktop with Raspberry Pi"
date: 2012-12-27 21:37
updated: 2018-03-25 12:22
comments: true
description: Do you want to remote into your Raspberry Pi and see a graphical desktop? It's actually really easy. If you don't want to dedicate a monitor or the TV to the pi but still want to use it, here's your solution. 
categories: 
 - Tutorials
 - Raspberry Pi
author: Jeremy Morgan
sharing: true
permalink: /tutorials/raspberry-pi/how-to-remote-desktop-raspberry-pi/
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
---
Do you want to remote into your Raspberry Pi and see a graphical desktop? It's actually really easy. If you don't want to dedicate a monitor or the TV to the pi but still want to use it, here's your solution. 
<!-- more -->

{% include custom/asides/rpi-footer.html %}

Ok, another Raspberry Pi article. Due to the overwhelming response I'm going to keep putting stuff up here as I hack and play around, and hopefully it gets people even more stoked about this awesome product. If these tutorials seem "too basic" remember they're not targeted at hardcore techies, they're geared towards kids and newbies, which all of us were at one time.

Anyway, so let's say you're like me and you have a bunch of computers around all the time. You have your Raspberry Pi that you want to play around with but you don't want to fiddle back and forth with cables or hook it to your TV, well this method will let you have a graphical desktop on your own desktop of your PC or Laptop like this:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi.png How to set up a remote desktop with Raspberry Pi %}

Pretty cool, right? Let's get started. 

###Configure the Pi

Make sure your Pi is connected to the Internet, and your local network containing the other machines you want to connect with. 

To set this up, you'll need the Pi to run a service that your other computers can connect to. I'm using <a href="http://www.raspberrypi.org/downloads" rel="nofollow">Raspian Wheezy</a> for this, as I do with most of my tutorials.

I chose <a href="http://www.xrdp.org/" rel="nofollow">xrdp</a> for this, as I've had good experiences with it in the past. To install it in Raspian, you simply type:

>sudo apt-get install xrdp

This will install everything you need on the Pi. It will start up every time you start up your Raspberry Pi. 

Now get your IP address

>ifconfig eth0 | grep inet | cut -c21-30

Remember this IP as you'll need to use it to find your Pi from another machine. 

###Connect to the Pi with Windows

You can connect to the machine from multiple environments; I suspect most beginners will be using a Windows system.

To start simply go to

Start -&gt; All Programs -&gt; Remote Desktop Connection

Put your IP address in the box:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-2.png How to set up a remote desktop with Raspberry Pi %}

And connect! You may see a message saying the remote computer cannot be verified like this:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-3.png How to set up a remote desktop with Raspberry Pi %}

You can safely ignore it. It comes up because your Raspberry Pi is running Linux, instead of Windows which is what remote desktop expects.

You should get the following screen next:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-4.png How to set up a remote desktop with Raspberry Pi %}

Log in, and you're ready to go!

###Connect to the Pi with Linux

If you want to connect to your Pi from Linux that's equally easy. 

I generally use <a href="http://www.rdesktop.org/" rel="nofollow">rdesktop</a> to connect. If you're using Ubuntu or another Debian based installation, type in 

>sudo apt-get install rdesktop

After that installs, type in the following:

>rdesktop &lt; the IP address of your Pi &gt;

You'll see the familiar xrdp screen again. 

If you are running a different distribution you can always build it from source, the latest version as of this writing is <a href="http://prdownloads.sourceforge.net/rdesktop/rdesktop-1.7.1.tar.gz?download" rel="nofollow">rdesktop 1.7.1</a> and it's a pretty easy setup. 

###Connect to the Pi with Mac OSX

I don't actually have a Mac to test this on, but you can find something like <a href="http://cord.sourceforge.net/" rel="nofollow">CoRD</a> that should work just fine. 

I will try to get my hands on an OSX machine soon and find a good solution for this. 

###Additional Options

One thing you may notice is the Pi can go really high with it's screen resolution, possibly higher than your monitor will allow. This will make it so you have to scroll around and end up with something like this:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-5.png How to set up a remote desktop with Raspberry Pi %}

Obviously not a great solution right? Well in Windows, you can adjust your resolution settings in Remote Desktop fairly easily. Click on the Options dropdown:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-6.png How to set up a remote desktop with Raspberry Pi %}

And select the "Display" tab:

{% img center https://www.jeremymorgan.com/images/how-to-remote-desktop-raspberry-pi-7.png How to set up a remote desktop with Raspberry Pi %}

You will see a slider with multiple options for resolution and color. Then go back to the General tab and click "save" to save your changes. 

In linux you can pass some parameters to the command:

>rdesktop -r 1024x768 &lt; the IP address of your Pi &gt;

and rdesktop will automatically resize to whatever resolution you want. 

###Why use RDP?

Someone may ask this, and it's a valid question. If you're running Linux and want to connect a Linux machine, why use a Microsoft protocol? The reason I suggest using xrdp is because it's fast, stable and works well with multiple operating systems. There are several other VNC options you can use but for simplicity I chose this one, and it works well on both Windows and Linux machines. 

###Summary

I hope this has helped answer your questions about running your Pi as a virtual desktop. If you're like me you might have your Pi stashed away somewhere and it's more convenient to make it headless. For me it sits in my "datacenter" (the closet in my office) amongst other equipment, so when I want to play with my Pi, I either SSH into it or use RDP and it works great. 

Till next time, keep sending me ideas and feedback! 

{% include custom/asides/rpi-footer.html %}

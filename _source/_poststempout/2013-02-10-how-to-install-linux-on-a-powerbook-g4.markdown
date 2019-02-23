---
layout: post
title: "How to install Linux on a PowerBook G4"
description: "A complete tutorial on how to Install Ubuntu Linux on a Powerbook G4 (PowerPC) machine"
date: 2013-02-10 15:43
comments: true
categories:
- "Tutorials"
author: Jeremy Morgan
permalink: /tutorials/linux/how-to-install-linux-ppc-powerbook-g4/
ogimage: https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-13.png

tags:
- How to
- linux
- linux how to
- linux tutorials
- ppc
- source build
- tarball
---
Do you want to breathe life back into your old PowerBook or PowerPC machine? Want some modern software on it? In this tutorial I'll show how you can put Ubuntu Linux on a PowerBook G4 and resurrect one of these durable old laptops from the dead. 

<!-- more -->
Running an old version of OSX leopard in 2013 just doesn't make sense. Even with everything updated simple things like checking Gmail or Facebook are nearly impossible. Every software package is ancient because  Using Linux will get you into a more modern environment. 

###What version of Linux am I using and why? 

For my machine I chose Ubuntu 10.04. As I have <a href="https://plus.google.com/u/0/+JeremyMorgan/posts/ZNyuKYWg3GX" target="_blank">opined in the past</a> I feel 10.04 is a very stable version of Ubuntu and not too bloated or buggy. I also despise the Unity interface no matter how much they improve it. I couldn't find any compelling advantages to the newer distributions but if you choose to install one of them the instructions should be the same. 

Other distributions of Linux/Unix are available for the PPC platform as well. Here are the ones I've tried:

**Debian PPC (<a href="http://www.debian.org/ports/powerpc/" target="_blank" rel="nofollow">Link</a>)** - This distro works very well but some software doesn't update, the system clock has problems and there is a screen flicker / blank out problem that drove me nuts. You could switch to a new terminal to fix it, but it's annoying. 

**Yellow Dog Linux (<a href="http://www.yellowdoglinux.com/" target="_blank" rel="nofollow">Link</a>)** - A very respectable Linux distribution but it isn't being updated much anymore. I found I could get a lot of newer software on it but it was a lot of configuration and compiling. 

**FreeBSD for PPC (<a href="http://www.freebsd.org/platforms/ppc.html" target="_blank" rel="nofollow">Link</a>)** - This is a well reviewed option for PPC machines, but I just couldn't get it working properly and didn't have the patience for it. If you have a lot of time it will probably get you a good setup, but I got frustrated cleaning up errors. 

**Gentoo for PPC (<a href="http://www.gentoo.org/doc/en/handbook/handbook-ppc.xml" target="_blank" rel="nofollow">Link</a>)** - Awesome distro but it takes forever and a week to set up. I got mine setup and dialed in after about 30 hours of work, used it for quite a while and the hard drive went out. I haven't had the time to redo this install and didn't back it up. Also had the screen flicker problem though not as frequent as Debian

Depending on how much time you invest you can get any of these distributions working well, but the fastest and easiest setup for mine is using Ubuntu 10.04. A few hours of work and it produces a nice stable machine you don't have to mess with. If that's your goal keep reading. 

###Install

Download <a href="http://cdimage.ubuntu.com/ports/releases/10.04/release/ubuntu-10.04-desktop-powerpc.iso" target="_blank" rel="nofollow">The Ubuntu 10.04 PPC iso</a> and burn it to a CD. USB installs are pretty tricky with the powerbook. 

Hold down the "C" button while booting to boot from the CD. 

At the prompt, press enter to boot.(Be patient the startup time is pretty long)

####1. Start Installer
Click on the "Install Ubuntu 10.04 LTS" link on the desktop.

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-1.png "how to install linux on PPC G4 Powerbook" %}

####2. Select Language
You should see a screen that looks like this:

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-2.png "how to install linux on PPC G4 Powerbook" %}

Select English and click Forward. 

####3. Time Zone
{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-3.png "how to install linux on PPC G4 Powerbook" %}

Select your timezone in the next window and click Forward.

####4. Keyboard Layout
In the next window you'll see a screen to test your keyboard layout. USA works great, so select that and click Forward

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-4.png "how to install linux on PPC G4 Powerbook" %}

####5. Partitioning
In the next screen you'll see something like this. My laptop did not have an OS, but yours might.

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-5.png "how to install linux on PPC G4 Powerbook" %}

The best option here is to Erase and use the entire disk. Click Forward.

####6. Set your Username Info
In this screen you will set your username. Type in your full name and the username you will use to log in. 

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-6.png "how to install linux on PPC G4 Powerbook" %}

Set the name of the computer, and select "Require my password to log in". Do not allow it to log in automatically, this is a big security risk. 

You may also choose to encrypt your home folder. This is a good idea, however it will slow your system down quite a bit. I opted not to do this, but if you do the procedure is nearly identical. 

###7. Ready to Install
You will see this screen, which allows you to verify the info you submitted. 

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-7.png "how to install linux on PPC G4 Powerbook" %}

Click advanced, and make sure "Install boot loader" is checked. 

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-8.png "how to install linux on PPC G4 Powerbook" %}

Click install.

####8. Installation Complete

Once the installation is completed you'll see the following screen:

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-9.png "how to install linux on PPC G4 Powerbook" %}

Reboot the machine. It will eject the CD and ask you to click enter. 

That's it! If you don't want to do any crazy partitioning or anything like that this is the easiest method to install it. If you want to dual boot operating systems that's possible too and I might write a tutorial about that in the future. There is also some configuration to be done, and I'll cover that in future tutorials as well. 

####9. Fresh Install Updates

The first thing you should do after installing is update everything. Run the following commands from the terminal (Applications - Accessories - Terminal)

<pre>
sudo apt-get update
sudo apt-get upgrade
</pre>

There aren't many updates but it's nice to get it started. 

####10. Speed up the system

There isn't a lot you can do to make this any faster, after all this is old hardware and a dead architecture. But a couple things have helped with my machine and might help yours as well. 

Go to system - preferences - startup applications

Here you can change which applications come up on startup. Whatever ones you don't need, remove them. 

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-10.png "how to install linux on PPC G4 Powerbook" %}

There is also a text based application you can use with a few more options:

<pre>
sudo apt-get install rcconf
</pre>

This allows even more options for turning off startup services.

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-11.png "how to install linux on PPC G4 Powerbook" %}

Common ones I disable are 

* bluetooth
* brltty
* cups
* ondemand
* pcmciautils
* ppd-dns

You can play around with these, and disable whatever you don't need. Since you're dealing with limited hardware it's always a good idea to trim the fat any way you can. 

####Set swappiness

The linux kernel has a setting called swappiness. This is a number from 0-100 that sets how much of your memory is left before going to swap. It is set at a default of 60, which means when 40% of your ram is in use it will start swapping. This can kill performance on your G4 pretty quick, as well as increase disk thrashing. 

You can check your current setting here:
<pre>
cat /proc/sys/vm/swappiness
</pre>

This will show what your current swappiness is. I generally like to set mine at 10. When I'm getting that close to full I need the swap, but I don't want it swapping all the time. 

To set it, open your sysctl.conf:

<pre>
sudo nano /etc/sysctl.conf
</pre>

and at the bottom of the file, add

<pre>
vm.swappiness = 10
</pre>

Your results may vary, but generally 10-15 does pretty well. A setting of zero will never hit the swap and a setting of 100 always will. Where you find in between that works best depends on what you're doing with it. 

###Summary

I hope this has been a good guide to setting up Ubuntu on a PPC machine. It's super easy, with comparison to other operating systems. It's a great way to recycle a computer for your kids, or even yourself rather than throwing it away. Besides it's efficient, how else can you get a desktop that only uses 116mb of memory?

{% img https://www.jeremymorgan.com/images/how-to-install-linux-ppc-powerbook-g4-12.png "how to install linux on PPC G4 Powerbook" %}

I am typing out this article on this very machine, I enjoy writing on it as it leaves me free of distractions and I can focus on what I'm doing. It's also neat to carry around and hack up stuff when I need to. 

If you have any questions, please leave them in the comments! I have done quite a few of these installs and there are some snags that come up occassionally. If you're using an old PPC linux system for something cool, let me know about that too! 

{% include custom/asides/tutorials-footer.html %}





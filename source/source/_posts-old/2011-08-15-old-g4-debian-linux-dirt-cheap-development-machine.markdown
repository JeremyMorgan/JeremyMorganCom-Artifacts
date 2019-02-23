---
comments: true
sharing: true
date: 2011-08-15 17:10:43
layout: post
slug: old-g4-debian-linux-dirt-cheap-development-machine
title: 'Old G4 + Debian Linux = Dirt cheap development machine'
wordpress_id: 160
categories:
- Programming

permalink: /blog/programming/old-g4-debian-linux-dirt-cheap-development-machine/

tags:
- apple
- debian
- featured
- g4
- laptop
- Linux
- mac
- old hardware
- old tech
- powerbook
- tech
---

So last week my laptop died on me. Motherboard took a dive, and unfortunately that was my "main machine".  I know it takes me quite some time to find and fix up a machine, and decided a quick interim machine needed to be built. So I hit craigslist.

I quickly found that if I wanted to spend 4-500 dollars on a laptop I'd have plenty to choose from. Most have Turion processors, or are some cheap knockoff. I just needed to finish up some PHP work, and these machines would work fine, but eventually I'm going to purchase a nice 17" laptop with all the bells and whistles and have a $500 machine that's going to collect dust.

I remembered using a G4 Powerbook for development just a few short years ago, and I loved it. So I thought "why not?" I knew I could get one pretty cheap. I ended up finding one for $200 that was quite a steal.

{% img right http://s3.amazonaws.com/images.jeremymorgan.com/powermac-g4.jpg Linux on my PowerBook G4 %}

I picked up this PowerBook G4 with the power adapter, manuals and everything for only $200. It was in really good shape, and a great deal. Even if I didnt get this one, I found several in the 2-300 dollar range all over the place. I took it home and set it up.

My ignorance of Mac operating systems showed pretty quick when I tried to do anything. It came pre installed with OSX "Panther" which I wasn't really familiar with. My old G4 had Leopard installed, and was pretty modern. Panther is a dinosaur. I quickly found out that Safari didn't render pages well at all, and it was the latest version you could install on Panther. I couldn't install a newer version of Java to run any tools and I didn't even bother putting Apache or anything on it. It was clear even if I could build things, I couldn't test them on such an ancient browser anyway. So I had to come up with something else.

You cannot develop websites effectively with Panther in 2011. Sad but true.

The cheapest version of Leopard I could find was $150, almost what I paid for the whole machine. $150 for a really outdated operating system? There has to be a better way.

**Linux saves the day again! **

I remember reading about people porting linux to PPC years ago, and figured I'd give it a shot. After some research I found that three good options existed for Linux on PPC machines:
	
  * [Debian Linux for PowerPC](http://www.debian.org/ports/powerpc/)
  * [YellowDog Linux](http://www.ydl.net/products/ydl/)
  * [FreeBSD](http://www.freebsd.org/platforms/ppc.html)

I decided to go with FreeBSD at first, and had some problems with partitioning. I got it installed, but it seemed like no matter what I did, I had drive seek and partition errors. I figured I'd go with something I'm more familiar with and downloaded the Debian ISO.

At first I downloaded the[ initial install CD](http://cdimage.debian.org/debian-cd/6.0.2.1/powerpc/iso-cd/debian-6.0.2.1-powerpc-CD-1.iso) and it installed without a hitch. I am not allowed to connect this machine to my company network, so I was doing an offline install and started putting debs on a flash drive and going back and forth. This got old really quick, so I downloaded and [burned the full DVD](http://cdimage.debian.org/debian-cd/6.0.2.1/powerpc/iso-dvd/) and reinstalled a full version with Gnome and the web server box checked.

The install process for this is identical to setting up linux on any other machine, with the exception of creating a small boot partition so the bootloader can work. It was much easier than I thought it would be. In no time I had a nice smooth Linux install with very few issues.

[![Debian on Mac Powerbook](https://s3.amazonaws.com/images.jeremymorgan.com/mac-linux-300x200.jpg)](https://s3.amazonaws.com/images.jeremymorgan.com/mac-linux.png)

It was a good way to make an old computer "modern". It comes with a good version of "IceWeasel" which is a rebranded FireFox and has decent updates to Java and other things. The webserver and PHP installed without a hitch, and MySQL needed a little configuring. Now I can use Gedit or Vim to write php and test them and GFTP to upload it. I have a nice smooth running web development system for $200.

If I want to use Photoshop I'm probably out of luck, but everything else this thing will work great. This is a nice solution if you need a rock bottom priced development machine, it would be hard to find comparable hardware in the $200 range, and this old mac actually runs really well. It only uses 180 megs of memory while I'm working, which is pretty impressive. I would recommend this setup to PHP or web developers not doing any kind of graphics, it's smooth as can be and dirt cheap!

{% include custom/asides/programming-footer.html %}
---
layout: post
title: "How to Watch Netflix in Ubuntu Linux"
date: 2013-03-15 20:29
updated: 2018-03-25 12:22
comments: true
description: Want to run Netflix on your Linux box? It's really easy, and free! Plus you don't need a virtual Windows install anymore.
categories:
- Linux
- Tutorials
- Ubuntu
permalink: /tutorials/linux/how-to-netflix-ubuntu-linux/
ogimage: https://www.jeremymorgan.com/images/how-to-netflix-linux-ogimage.jpg
author: Jeremy Morgan
---
One of the biggest hurdles to Linux adoption is getting stuff to work in Linux that works great in Windows. Microsoft has enjoyed a huge market share over the years, and because of that when companies develop commercial software they target Windows first, and maybe OSX. Linux is either an option for companies with a geekier application, or their product is either emulated or ported by dedicated Linux hackers. What this does is ensure you pretty much need a Windows box somewhere for some task. But this changes every day.
<!-- more -->
###Netflix in Linux - A long wait

Netflix is something that Linux hackers have wanted for years. Netflix is written in Silverlight / .Net and it looks like that isn't going to change anytime soon. The frequent requests for a Linux Native Netflix client have been ignored, as there would be a serious expenditure for them to build a different streaming system, and they'd have the problem of supporting two. 

So the solution most used was to create a Virtual machine with a Windows and watch it that way. Not the best option, but at least a working one. Then along comes someone like <a href="http://www.compholio.com/" target="_blank">Erich E. Hoover, Ph.D</a> to create a more elegant and easier solution. That's the solution I'll be outlining here. It's super easy, and doesn't take as much horsepower as a dedicated Windows virtual machine either. 

###How to Install The Tools to Watch Netflix in Linux 

Note that this is by no means an official Netflix solution, nor is it endorsed or encouraged by them. I'm using Ubuntu 13.04 Raring Ringtail for this installation, but it works in many Ubuntu versions and variants. 

First, update your system:

<pre>
sudo apt-get update
</pre>

Then, add the repository:

<pre>
sudo apt-add-repository ppa:ehoover/compholio
</pre>

Now run the following:

<pre>
sudo apt-get update && sudo apt-get install netflix-desktop
</pre>

This may take a while, especially if you're on a slow connection. You'll see the following screen:

{%img https://www.jeremymorgan.com/images/how-to-netflix-linux-0.jpg How to install Netflix in Linux %}

Agree to it (if you want to install this). After it installs a pile of stuff, you'll see the Netflix icon on your start bar under "Sound and Video" (I'm using LXDE but it's pretty easy to find with other Window managers). 

{%img https://www.jeremymorgan.com/images/how-to-netflix-linux-1.jpg How to install Netflix in Linux %}

The first time you run it, will get a window asking you to install Mono:

{%img https://www.jeremymorgan.com/images/how-to-netflix-linux-2.jpg How to install Netflix in Linux %}

Then it will need to install Gecko (Firefox for watching)

{%img https://www.jeremymorgan.com/images/how-to-netflix-linux-3.jpg How to install Netflix in Linux %}

Then you're ready to go. You may get a few errors that pop up here and there but it will still work.  

###The Final Result

That's it! This is all there is to installing Netflix in Linux. 

{%img https://www.jeremymorgan.com/images/how-to-netflix-linux-4.jpg How to install Netflix in Linux %}

My only complaint so far is not being able to put it into smaller window, but I'll figure out how to do that and update this article soon. I noticed the Video quality and Sound are the same as they are in Windows, and you can go full screen and it works great! Thanks Erich for creating this awesome solution. 

{% include custom/asides/tutorials-footer.html %}




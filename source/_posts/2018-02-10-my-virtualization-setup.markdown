---
layout: post
title: "My Latest Virtualization Setup"
date: 2018-02-10 13:28
updated: 2018-03-25 12:22
comments: true
categories: 
- Devops
- Programming
- Linux
- Tutorials

author: Jeremy Morgan
sharing: true
description: A quick look at my virtualization setup, remotely accessed headless VMs on a Linux Server.
ogimage: https://www.jeremymorgan.com/images/my-virtual-box-setup/home-virtualization-og.jpg
permalink: /tutorials/devops/virtualization-with-virtual-box/
---

Like many geeks of the time I spent the 90s and 2000s with at least 2 or 3 old computers in a closet, connected by a switch running various operating systems with various services running on them. Giant, loud, clunky machines whirring away.
<!-- more -->
<div style="float: right; padding: 15px;">

<img src= "https://www.jeremymorgan.com/images/my-virtual-box-setup/jeremy-old.jpg" alt="Jeremy Morgan, about 2003 or so" />

</div>

This very website was hosted for years on an old Pentium Machine running FreeBSD connected to my DSL line in my bedroom. It was just the way you did things then. 

I had stacks of hard drives with labels on them. Ebay specials I'd purchased for the sole purpose of putting different operating systems on them. Everything from Redhat, Gentoo, FreeBSD or various versions of Windows, I would just swap the drive and go. 

For years I lived in a condo that had a coat closet near the front door with an electrical outlet in it. I ran Ethernet through the ceiling and filled it to the top with machines. All for development, file servers, and web hosting purposes. It all seems a little silly now. 

### 2018 is a little different...

These days I have an Azure Account, AWS, and <a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4" target="_blank">Digital Ocean</a>. Virtualization has made progress even the most die hard geeks didn't expect. Even development itself is a bit abstracted from the bare metal these days, at least for most people. Things like Docker will make the OS and it's configuration almost irrelevant. 

Yet I still have a server in my house, and I want to show you guys the setup. 

![HP xv8600 Xeon Server](https://www.jeremymorgan.com/images/my-virtual-box-setup/intel-xw8400-server.jpg)

This is an old HP Xeon Workstation I picked up that was going to use for course production, but even with 2 Xeons and 32 gig of RAM it fails to outperform my Mac Mini for video and audio rendering. So I decided to use it for some remote virtualization stuff, and stuffed it in a corner of our daylight basement. 

### Why do I need this? 

Lately I've been doing a lot of random software development and building courses online. For those courses I need a fresh operating system and development environment. Obviously I could record some of these things on my desktop, but with the frequent configuration changes and software installs I could mess up the accuracy of my courses. So I want a machine with a dedicated operating system for each course. That motivated me to set this up. 


## Getting the server setup

To start this out, I originally had Windows 10 on this server. It ran well, <a href="http://browser.geekbench.com/v4/cpu/6882166" target="_blank">the performance was not too bad</a>. But if I were to use this as only a Virtualization machine, the overhead wasn't that great. 


![Window 10 Memory Usage ](https://www.jeremymorgan.com/images/my-virtual-box-setup/windows-memory.jpg)

This is with the machine "at an idle". I was using up 2 gigs of memory just loading up a desktop with nothing else. Surely I could do better than that. 

It should come as a surprise to nobody I decided to go with Linux base, and I installed Debian 9 on it. Why Debian? It's the same OS that powers jeremymorgan.com and I like it because it's lean, simple and well supported. It doesn't have the bleeding edge packages (I use Arch on the Desktop for that) but it's stable. Incredibly stable. I wanted something I could install and forget about. So Debian was my choice. 

I went with a barebones Linux installation, custom kernel and no window manager, and found that the idle was significantly better:

![Linux Memory Usage](https://www.jeremymorgan.com/images/my-virtual-box-setup/linux-memory-usage.jpg)

This gives me a little more headroom and CPU cycles to work with. 

I ended up installing LXDE because it's easier to configure and manage VMs with a window system. But I needed to set my server to boot to just a console, that way I can start and stop the windowing environment when I wanted to. 

To do that, I had to set my runlevel, which is a little different these days than in the past. If you want your server/desktop to boot to a prompt, do this:

```
systemctl get-default
```
In my case, it said 

> graphical.target

Which is not what I want. So I then type in:

```
systemctl set-default multi-user.target
```

that way I can just fire up the server at a prompt and not have to have the windowing system loaded in memory. Yep, it's that easy.

![Default Runlevel Target for Debian](https://www.jeremymorgan.com/images/my-virtual-box-setup/default-runlevel-target.jpg)

So now I had a nice lean and stable OS base to start with. 

Then I installed LXDE and then used <a href="http://networkstatic.net/xrdp-an-easy-remote-desktop-setup-for-your-ubuntu-servers/" target="_blank">xrdp to set up a remote desktop</a> so I never have to walk over to the server to do anything. I just remote in from my office. 

### Setting up virtual machines

For the Virtualization, I chose <a href="https://www.virtualbox.org/wiki/Downloads" target="_blank">Virtual Box</a>. I've worked with Hyper-V and VMWare in the past and they each have their merits, but for this application this works best for me. I originally attempted to setup Hyper-V server but my machine was too old and didn't support it fully. So this worked out. 

![Virtual Box Setup](https://www.jeremymorgan.com/images/my-virtual-box-setup/virtualbox.jpg)

Now one thing about Virtual Box that's awesome is you can virtual machines "headless" from the command line. This is a great feature if you want to spin up a bunch of them. I can run 3 to 4 servers at a time without a blip in performance (ok 32 gigs of RAM and Xeons help with that). 

Installing the machines is super easy. You can choose to allocate as much hardware as you'd like, or don't like to the mix:

![Virtual Box Memory](https://www.jeremymorgan.com/images/my-virtual-box-setup/virtual-box-memory.jpg)

And CPU usage is handled nicely:

![Virtual Box CPU Setup](https://www.jeremymorgan.com/images/my-virtual-box-setup/virtual-box-cpu.jpg)

For networking, I set up one bridged adapter to communicate with the outside world, and another adapter for an internal network to communicate with other servers:

![Bridged Network Adapter VirtualBox](https://www.jeremymorgan.com/images/my-virtual-box-setup/bridged.jpg)

It can't be beat. So now I have several VMs set up and ready to go. 

## Running the Virtual Machines

So now I have my server booted at just a prompt, and I can list all my available virtual machines:

```
VBoxManage list vms
```

![Virtual Box List VMs](https://www.jeremymorgan.com/images/my-virtual-box-setup/virtualbox-list-vms.jpg)

This is pretty handy. I can start them up here, then RDP into them from my office machine. Virtualbox uses VRDP to provide the headless interface to the outside world. I've used it extensively the last few weeks with zero problems. 

I can start up a VM with the following command: 

```
VBoxManage startvm "<VM NAME>" --type headless
```

I even have some shell scripts to start up clusters or sets of machines at once. 

Then, I can just check to see the machine are running: 

```
VBoxManage list runningvms
```
 ![Show running VMs in Virtual Box Command line headless](https://www.jeremymorgan.com/images/my-virtual-box-setup/show-running-vms.jpg)
 
And it's that easy! 
 
Here's one thing that's not so easy... finding an IP address. The only real reliable way to get it is by going into my router and looking for them. Some machines I have statically assigned an IP for ease of use. If you don't do that though, you can always just show the VM from the Windowing interface:
 
 ![Show Desktop Virtual Box](https://www.jeremymorgan.com/images/my-virtual-box-setup/show-desktop-ip.jpg)

And then type in ipconfig, ifconfig, ip a, etc to get the IP. 

I can RDP into any of these machines, do development, record courses, whatever I need. 

![RDP into Debian Virtual Machine](https://www.jeremymorgan.com/images/my-virtual-box-setup/desktop-view.jpg)

It works out great. Since it's on my local network it feels and performs like I'm on the desktop. 

## Conclusion


So I just wanted to show my setup and how I've been running things lately. This works really well for course production, because I can RDP in, full screen it on one window and record it as I go through the steps. I can also develop stuff and run/test it out. I've put in a replica of this website in, with the identical configuration for testing/development. 

It works great. I'll probably find a better way to do it, or you may know a better way, feel free to leave it in the comments or <a href="https://www.twitter.com/JeremyCMorgan">yell at me on Twitter</a>. If you have any questions, feel free to contact me about it. 

<br />
<br />
{% include custom/asides/programming-footer.html %}
<br />






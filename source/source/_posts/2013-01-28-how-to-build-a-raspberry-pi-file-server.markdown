---
layout: post
title: "How to Build a Raspberry Pi File Server"
date: 2013-01-28 19:49
description: A step by step guide to setting up your Raspberry Pi to share files to every computer on your network.
comments: true
categories:
 - Tutorials
 - Raspberry Pi
author: Jeremy Morgan
sharing: true
permalink: /tutorials/raspberry-pi/how-to-raspberry-pi-file-server/
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
comments: true
---
So I found yet another cool use for a Raspberry Pi. You can actually use it as a file server, or more accurately a controller for a file server. All you need is your Pi and a nice external drive and you can serve files to anyone on your network. It's pretty easy, I'll show you how. 

<!-- more --> 
{% include custom/asides/raspberry-pi-5.html %}
###What you'll need. 

You need the Raspberry Pi set up and connected to your network. You'll also need an external drive. I'm using a <a href="http://www.amazon.com/gp/product/B000XRK3LG/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B000XRK3LG&linkCode=as2&tag=webfootcentra-20">Western Digital My Book 500 GB</a><img src="http://www.assoc-amazon.com/e/ir?t=webfootcentra-20&l=as2&o=1&a=B000XRK3LG" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> drive.

But this drive is a few years old, so if you're going to buy one you can pick up a <a href="http://www.amazon.com/gp/product/B0042Z55RM/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=B0042Z55RM&linkCode=as2&tag=webfootcentra-20">3 Terabyte Model</a><img src="http://www.assoc-amazon.com/e/ir?t=webfootcentra-20&l=as2&o=1&a=B0042Z55RM" width="1" height="1" border="0" alt="" style="border:none !important; margin:0px !important;" /> for around $120. Since your SD card doesn't have a lot of space and doesn't handle frequent reading and writing you'll need to get an external USB drive. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server.png Raspberry Pi File Server %}

As with most of my tutorials, you'll need an install of <a href="http://www.raspberrypi.org/downloads" target="_new" rel="nofollow">Raspian Wheezy</a> to do this tutorial.

{% include custom/asides/rpi-footer.html %}

###Mount an external USB drive

The first thing you need to do is make sure your Raspberry Pi can see the external drive. Before you plug it in, open up an LXTerminal (or get to the prompt through SSH) and type in 

<pre>
tail -f /var/log/messages
</pre>

and watch the output. Now plug in the USB drive. You should see something like this come up:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-2.png Raspberry Pi File Server %}

You want to look for a string identifying your USB device, but the [sda] is the part you want to pay attention to. Another thing to note: Some drives like the WD My Book come with a built in CD-ROM emulator as well for software installation. You don't want to mount this, so look for the size of the device (in my case 499GB).  

To escape this screen, press CTRL+C.

So first we want to create a location for this drive on the Raspberry Pi. This is done with the following command:

<pre>
sudo mkdir /media/USBDRIVE
</pre>

Now, you want to mount the drive:

<pre>
sudo mount -t ntfs-3g -o uid=pi,gid=pi /dev/sda1 /media/USBDRIVE/
</pre>

If you get a message saying ntfs-3g isn't supported, install it:

<pre>
sudo apt-get install ntfs-3g
</pre>

This will enable you to mount it. 

**If your drive is not NTFS** 
Simply replace ntfs-3g with vfat
<pre>
sudo mount -t vfat -o uid=pi,gid=pi /dev/sda1 /media/USBDRIVE/
</pre>

Now, you can cd to /media/USBDRIVE and see it, and it should also pop up in your file manager:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-3.png Raspberry Pi File Server %}

###Mount the drive at startup

This step is optional but if you want your drive to mount automatically on startup, here's what you do:

Backup the fstab:

<pre>
sudo cp /etc/fstab /etc/fstab.backup
</pre>

Now open fstab:

<pre>
sudo nano /etc/fstab
</pre>

In the fstab file, add the mount information (yours may vary slightly)

<pre>
/dev/sda1    /media/USBDRIVE    ntfs-3g    rw,defaults    0    0
</pre>

Make sure you have write permissions to it:
<pre>
sudo chmod 775 /media/USBDRIVE
</pre>

Now, reboot your machine and make sure the drive automatically comes up. 

###Share the drive on your network

Next, we'll install SAMBA to share this drive on your network. 

<pre>
sudo apt-get update
sudo apt-get install samba
sudo apt-get install samba-common-bin
</pre>

Now that Samba is installed, let's add a user:

<pre>
sudo smbpasswd -a pi
</pre>

Enter the password you want to use to log on. 

Now, make a backup of the Samba config file

<pre>
sudo cp /etc/samba/smb.conf /etc/samba/smb.conf.backup
</pre>

and now we're going to open that file and make some changes:

<pre>
sudo nano /etc/samba/smb.conf
</pre>

The first thing to look for is workgroup.

For Windows XP or Vista:

<pre>
workgroup = WORKGROUP
</pre>
(or the name of your network workgroup)

For Windows 7 or 8

<pre>
workgroup = HOME
</pre>
(or the name of your network workgroup)

Next, we want to enable user security. Remove the hash tag (#) so the entry looks like this:

<pre>
security = user
</pre>

For better performance, do the same with TCP_NODELAY

<pre>
socket options = TCP_NODELAY
</pre>

Now, we want to create our share. Under the "Share Definitions" line, add something like this:

<pre>
[USB] 
path = /media/USBDRIVE
comment = My USB Drive 
valid users = pi 
writeable = yes 
browseable = yes
</pre>

Save and Quit Nano. (CTRL + X and answer Yes)

Run a check on the config file:

<pre>
testparm 
</pre>

You should see something like this:

<pre>
Load smb config files from /etc/samba/smb.conf
rlimit_max: increasing rlimit_max (1024) to minimum Windows limit (16384)
Processing section "[homes]"
Processing section "[USB]"
Processing section "[printers]"
Processing section "[print$]"
Loaded services file OK.
Server role: ROLE_STANDALONE
Press enter to see a dump of your service definitions
</pre>

As long as it says "Loaded services file OK." you won't have a problem. 

Now, restart the Samba Server:

<pre>
sudo /etc/init.d/samba restart
</pre>

You should see something like this:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-4.png Raspberry Pi File Server %}

Now you're on the network!

###Connect to your Pi from Windows

To connect to your Raspberry Pi from Windows, you'll need to know your hostname. Type in:

<pre>
hostname
</pre>

and check the output. For me my hostname is "raspberrypi" (I know, creative right?). 

On your Windows machine, type in Start -> Run and type in 

<pre>
\\raspberrypi
</pre>
(or whatever your hostname is)

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-5.png Raspberry Pi File Server %}

and you should see a screen like this:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-6.png Raspberry Pi File Server %}

Double click on the USB folder. It will ask you for your password:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-7.png Raspberry Pi File Server %}

Here you want to enter the username and password you set earlier with "smbpasswd".

You'll now see that you can browse the folder:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-8.png Raspberry Pi File Server %}

Congratulations!

###Add this as a drive on your computer

This step is also optional, but you can add this as a drive on your computer. Go to "My Computer" or Start -> computer and select the button at the top that says "Map Network Drive". 

In the next box, browse to your USB drive on your Raspberry Pi and add it:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-file-server-8.png Raspberry Pi File Server %}

Now it will be added automatically as a drive on your computer!

###Some Notes:

Make sure you have an additional power supply going to your USB drive. Don't rely on the Raspberry Pi to power it, as that is too much of a drain for it. The drive I used has its own power supply and I haven't had any problems with it. 

You may also need to <a href="http://www.sevenforums.com/network-sharing/6128-cant-connect-samba-share.html" target="_blank" rel="nofollow">Change 128bit to 40-56 bit encryption for file shares under Advanced Sharing Options</a> to make it work with certain versions of Windows.

###Summary

I hope this tutorial has shown you how to set up a file server on your network. I don't keep a lot of stuff on this drive, but I don't exactly want to lug it around and plug it in to every computer I want to pull the files on (first world problems, I know). So it's nice that I can now grab files off here from any computer in the house with ease. I could do this with any Linux or Windows machine, but the idea of a big loud machine to do the same task is wasteful and more expensive. 

{% include custom/asides/rpi-footer.html %}




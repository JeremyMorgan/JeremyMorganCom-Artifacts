---
layout: post
title: "How to Install A Wireless USB Network Card on Raspberry Pi"
date: 2013-07-30 19:28
comments: true
categories: 
- Tutorials
- Raspberry Pi
author: Jeremy Morgan
sharing: true
description: Today I'm going to show you how to install a wireless networking card on your Raspberry Pi. I'm using the ultra cheap Ralink wireless card, but the instructions are similar for any Wireless Device.

ogimage: https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-01.jpg
permalink: /tutorials/raspberry-pi/raspberry-pi-how-to-wireless-usb/

---
Today I'm going to show you how to install a wireless networking card on your Raspberry Pi. I'm using the ultra cheap Ralink wireless card, but the instructions are similar for any Wireless Device. 

<!-- more -->

###Update Your System

For this tutorial I'm using Raspian. This is a great beginner OS for the Pi and quite easy to use.

You'll want to make sure you're at least wired in so you can do an update:

<pre>
sudo apt-get update
sudo apt-get upgrade
sudo apt-get autoremove
</pre>

###Get Started

We're going to do this from SSH, though it's easier to do from the desktop. But you got a Raspberry Pi to learn didn't you? Many people use their pi strictly over SSH and don't run a desktop at all. I have decided to include those kinds of instructions rather than do it the graphical way. 

####1. Plug in your USB device and find it

Once plugged in, again we'll look at our USB devices:

<pre>
lsusb
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-07.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

It looks like in my case it's installed, so now we'll make a copy of the WPA supplicant file:

<pre>
sudo cp /etc/wpa_supplicant/wpa_supplicant.conf /etc/wpa_supplicant/wpa_supplicant.conf.bak
</pre>

Now open up the file:

<pre>
sudo nano /etc/wpa_supplicant/wpa_supplicant.conf
</pre>

And add the following:

<pre>
network={
	ssid="[YOUR NETWORK SSID]"
	psk="[YOUR NETWORK PASSWORD]"
}
</pre>

It should look like this:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-06.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

Now, save the file. CTRL + X - Save "Y"

####Start up Your Adapter

Now we need to stop the wlan service:

<pre>
sudo wpa_action wlan0 stop
</pre>

Then bring it back up:

<pre>
sudo ifup wlan0
</pre>

####Test Connectivity

<pre>
sudo wpa_cli status
</pre>

You should see something like this:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-05.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

If not, double check your network SSID and Password, that's the most common problem. You may have a card that isn't supported by the Raspberry Pi, if not get a new one! They're super cheap and well worth it.


### (Optional) - If You End up Needing a Driver

Sometimes there are issues that prevent you from loading the drivers for your card. Much of the firmware comes with raspian, but if not you'll have to find the drivers for it. You'll need a Windows machine to get the drivers you'll need (at least for Ralink). 

Insert the device and run the driver disk provided. Then after successfully installing it, open up your control panel, and select the properties of the device:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-04.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

Click on "driver details"

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-08.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

This will show you the location of the driver files to copy off the machine, you can put them on a USB stick and put them on your Pi from there. 


####Get The Drivers off the USB Stick The Hard Way

I put the driver files on a USB stick. Getting them from the desktop is really easy, but what if you only have SSH access? Don't fret. With Raspian it should automount just fine, you only need to find it.

Run the following command to list your USB devices:

<pre>
lsusb
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-03.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

Now, you want to see all the disks that are attached to your system:

<pre>
sudo fdisk -l
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-02.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

As you can see in my case, my USB stick is mounted at /dev/sda1 so the device is connected to my pi. But where is it? 

<pre>
mount
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-03.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

There it is! Under /media/MYLINUXLIVE but that probably won't be your folder, it will show the drive label you gave it when you formatted it. (I happen to use and love the LinuxLive program whenever I can).

Now I can just look for the drivers on the disk and copy them to a folder in my home directory:

<pre>
cd ~
mkdir usbdriver
cp -r /media/MYLINUXLIVE/driver/* usbdriver/
</pre>

Now the files are copied, safely unmount the drive:

<pre>
sudo udisks --unmount /dev/sda1
sudo udisks --detach /dev/sda
</pre>

Now you'll have the drivers you need, but keep in mind the device may not be supported at all. 


###Conclusion

I hope this has helped to show you how to install a wireless USB card on the Raspberry Pi. Raspian has a lot of firmware already built in and a lot of USB Wifi adapters are supported right out of the box. Wpa_supplicant makes things really easy. I decided to show how to do it from the prompt for those who want to learn more about the prompt, or install from SSH. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-how-to-wireless-usb-01.jpg How to Install A Wireless USB Network Card on Raspberry Pi %}

The Raspberry Pi is all about learning so I encourage you to experiment with this stuff as much as possible. The worst that will happen is you'll need to reinstall the OS. Remember, you're learning Linux at the same time which opens a lot of doors for your projects. Enjoy!

{% include custom/asides/rpi-footer.html %}








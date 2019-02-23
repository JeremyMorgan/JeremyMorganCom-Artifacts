---
layout: post
title: "How to Restore Arch Linux Boot after Installing Windows"
date: 2015-08-01 10:38
updated: 2018-03-28 12:34
comments: true
categories:

- Linux
- Tutorials

author: Jeremy Morgan
description: When you dual boot Windows and Arch Linux, any time you reinstall or upgrade Windows you lose the boot menu to get into Linux. In this tutorial I'll show you how to fix that.

ogimage: https://www.jeremymorgan.com/images/restore-grub-arch-linux/restore-grub-arch-linux-og.jpg

permalink: /blog/linux/how-to-restore-arch-linux-after-installing-windows/

---

This week they released the RTM Version of Windows 10, and I decided to install it on my laptop. Most of my development is done on my desktop Mac at home, but the laptop is good for collaborating, coffee shop coding, etc. I decided Windows 10 and Visual Studio 2015 would be good for this. There's only one issue: I also have Arch Linux on this laptop, and it's dialed in very nice and I definitely don't want to remove it.

<!-- more -->

I haven't upgraded Windows on this machine since I put Windows 8.1 on it over a year ago, so I never had to deal with the issue of fixing grub. It is slightly different from other distributions, and there is no "boot repair" yet. I decided to Google a few things and figure out how to restore it but didn't find a complete article on it, so I decided to write one. I installed Windows 10 on the machine without changing any of the partition data, and that's crucial. After doing that it would only boot into Windows 10, so here's what I did. 

### 1. Download an Arch Linux ISO

Download a [live ISO for Arch Linux here](https://www.archlinux.org/download/). If you're using Windows, [LiLi is a great free tool](http://www.linuxliveusb.com/) for creating bootable Linux USBs. 

boot to this USB drive and you'll be taken to a command prompt.

### 2. Restore Grub

This assumes of course that you were using GRUB to begin with, but here's how to restore it. 

Find the partition your Linux is installed on:

{% codeblock %}
cfdisk
{% endcodeblock %}

You'll see something like this:

![How to restore GRUB in Arch Linux](/images/restore-grub-arch-linux/restore-grub-arch-linux-01.jpg)

In my case my Linux installation is at /dev/sda4. Note where yours is, then exit this application.

So mount your Linux partition:

{% codeblock %}
mount -t ext4 /dev/sda4 /mnt
{% endcodeblock %}

Then, change root with this command (specific to Arch Linux)
{% codeblock %}
arch-chroot /mnt
{% endcodeblock %}

and restore GRUB:

{% codeblock %}
grub-install /dev/sda
{% endcodeblock %}

And yes, it does detect Windows 10 properly. 

After you reboot, you'll see your familiar boot screen again:

![How to restore GRUB in Arch Linux](/images/restore-grub-arch-linux/restore-grub-arch-linux-02.jpg)

And you can now boot into Linux (or Windows) again.

### Configure Grub

Now if you're like me (which you probably are if you're reading this blog) you will be bothered that it incorrectly says "Windows 8" or whatever your previous version was. This is easy to fix by editing some entries in your Grub configuration: 

Make a backup of your grub.cnf

{% codeblock %}
sudo cp /boot/grub/grub.cfg /boot/grub/grub.cfg.8.1
{% endcodeblock %}

Edit the file: 

{% codeblock %}
sudo nano /boot/grub/grub.cfg
{% endcodeblock %}

Look for the Windows 8 or Windows 7 entry in the file:

![How to restore GRUB in Arch Linux](/images/restore-grub-arch-linux/restore-grub-arch-linux-03.jpg)

and change it to whatever you want. Then reboot. Now it should look like this:

![How to restore GRUB in Arch Linux](/images/restore-grub-arch-linux/restore-grub-arch-linux-04.jpg)

This is how I have mine set up. If you'd like to learn more about <a href="https://wiki.archlinux.org/index.php/GRUB/Tips_and_tricks" target="_blank">GRUB menu options click here</a>.


### Summary

This is how you can restore your dual boot options if you reinstall or upgrade Windows on a dual boot Arch Linux system. I have heard of people just reinstalling Linux afterword, and it's a terrible idea unless you were going to change it anyway. It only takes a few minutes to fix. 

#### A note about Arch Linux:

As I said in the article I have Arch Linux installed and it's "dialed in" meaning I have a nice system compiled with only what I need, lean custom kernel, and my development environment is all set up. I wouldn't advise an Arch install to everyone, but it has been fantastic for me personally. It runs very fast and reliably and it's easy to update everything. 

If you're looking for a new Linux distribution or just want to escape the Ubuntu crowd, you should give it a try. It has a steep learning curve as you'll need to know Linux really well, or be able to follow the directions explicitly, but if you do you'll find a nice solid system that's fast and lean. 

<a href="https://www.archlinux.org/download/" target="_blank">**Get Arch Linux Now**</a>

-Jeremy

{% include custom/asides/programming-footer.html %}
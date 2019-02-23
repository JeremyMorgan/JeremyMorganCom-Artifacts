---
layout: post
title: "Windows to Go with the Spyrus USB Drive"
date: 2018-03-12 15:04
updated: 2018-03-25 12:22
comments: true
categories: 
- Devops

author: Jeremy Morgan
sharing: true
description: What we need is a good bootable live USB stick for Windows. I've said this many times over the years, and hacked together things to make that very thing happen, but nothing that worked really well. So when the folks at Spyrus sent me a Windows to Go USB to check out, I was pretty excited.
ogimage: https://www.jeremymorgan.com/images/windows-to-go-usb/windows-to-go-og.jpg
permalink: /blog/devops/windows-to-go-usb-drive/

---

What we need is a good bootable live USB stick for Windows. I've said this many times over the years, and hacked together things to make that very thing happen, but nothing that worked really well. So when the folks at Spyrus sent me a Windows to Go USB to check out, I was pretty excited.
<!-- more -->
<br />
<div style="display: block; margin-left: auto; margin-right: auto;">

<img src="/images/windows-to-go-usb/windows-to-go-01.jpg" alt="Windows to go live drives" />

</div>
*Spyrus Windows to Go Live Drive - [More details here](https://www.spyrus.com/windows-to-go-live-drives/)*

### What is a Live USB?

Live USB drives and DVDs have been around for years, they're simply an operating system stored on a device and you boot from that device instead of your hard drive. Usually when you turn your PC on, it seeks out different areas to grab an operating system, so if you direct it to a live device, the computer is being controlled from the USB drive. 

You don't even need a hard drive to run, and if you have a hard drive in the computer you can mount it as a secondary drive and perform work on it. This is the big advantage to this setup, you can retrieve files or work on files when:

- The computer has a virus
- The computer has malware
- The OS has failed
- The hard drive won't boot

Under these circumstances you can boot to a USB drive and use that to run the machine while you figure out what's wrong. You don't have to use the corrupted/broken/virus-ridden operating system on the computer. It's a great for fixing things. 

They've been doing this with Linux for years. It's an extremely simple concept but the execution is pretty difficult, especially with Windows. Traditionally Microsoft did not want you to do this, and there were several obstacles preventing it. The Spyrus drive takes care of making it happen, and their work has proven successful. 

### Other Advantages to a Live USB Drive

<div style="float:right; overflow: auto; margin: 5px;">
<img src="/images/windows-to-go-usb/windows-to-go-03.jpg" alt="Windows to go live drives" />
</div>

Fixing broken machines aren't the only use of a live drive. You can get a live drive setup with all the applications you need to work with, your files and configurations. Theoretically you could plug this into any machine and get to work.

There's also a good security use, you can work with files and keep them secure on your person rather than leaving them on a machine that may or may not be secured. With the built in hardware encryption the Spyrus drive performs this task well. 

## My Experience With the Spyrus Live USB

I took this drive and plugged it into everything in my house, the fire station, and other places to try it out. There were a few things that surprised me about the Spyrus Drive. I'll cover those, but here are some basic pros and cons that I found. 

#### Pros:

<div style="float:right; overflow: auto; margin: 5px;">
<img src="/images/windows-to-go-usb/windows-to-go-05.jpg" alt="Windows to go live drives" />
</div>

- This thing is really well built. Just holding on to it you can tell it's solid.
- It works great, on a ton of different machines
- The performance is spectacular
- I could set up a development workstation on it, and carry it around
- It's easy to set up
- Truly a portable workstation you can carry in your pocket
- Hardware security features a great plus

#### Cons

- I found one machine that wouldn't boot it (out of 9)
- There is some driver setup that has to be done
- On my Mac I had to get drivers to connect wirelessly, could have been "stranded"

It should be noted that the cons aren't the fault of this product, but rather Windows related issues. While you could potentially boot up to a machine and not be able to connect to the internet, it's not a problem inherent to the design of the Spyrus, but caused by lack of a particular driver in the Windows system. This will happen with any similar product. 

I did have one machine that it wouldn't boot on, and I'm not sure why. Since I have two identical laptops, I tried it on the other and it worked. I'm pretty sure this is hardware or configuration related, and not the fault of the product. 

I had to struggle to come up with cons here, because the device simply did what it's supposed to do. It just works.

I loaded up some development tools on it and built a couple applications. I went back and forth through machines and it worked flawlessly. I could see myself using this thing a lot in the future. 

### What Surprised Me

When I first unboxed this thing I immediately plugged it into a laptop. It went through a Windows install and it was good to go. Then I went to every machine in the house I could find. Here's what surprised me:

**It ran on my Mac**

The PCs were great, and it was expected that they'd boot to them, but then I plugged it into my Mac, and it actually worked really well. If you do this, you have to load up the same Bootcamp drivers you have to load to get Windows on your Mac in the first place. Once you do this, it runs great. I wasn't expecting that. 

**The transition between machines was quick**

With each new machine there was a driver install process, and some tweaks to the display. It was just a few minutes each time, then when I hopped from machine to machine later it seamlessly goes between them. You can't ask for much better than that. 

**It runs considerably faster than off the drive**

This one surprised me the most. I noticed it seemed really "snappy" on an older machine I was running, and I wondered if it truly was performing better. 

Theoretically it should be roughly the same speed because it should be running out of memory, either solid memory on the machine or from the stick. But it is faster running from the stick:

<img src="/images/windows-to-go-usb/windows-to-go-04.jpg" alt="Windows to go live drives" />

You can view the detailed GeekBench results here:

- <a href="http://browser.geekbench.com/v4/cpu/7302485" target="_blank">Windows Running on the Machine</a>
- <a href="http://browser.geekbench.com/v4/cpu/7201679" target="_blank">Windows Running from the Spyrus USB Drive</a>

I was surprised at the performance increase. Something to consider for high CPU activities. 

## My Overall Conclusion 

Overall I am very satisfied with this product, and I'm not being paid to say it. If you have a use for a product of this type, I would recommend this one. It's priced right for what you get.

<a href="https://www.spyrus.com/windows-to-go-live-drives/" target="_blank">Here's some more info on the drive I used</a>

It's well built, so you can carry it around with you everywhere. It works great, and reliably. It's certified by Microsoft. I decided to hammer on this thing for a couple weeks, and I couldn't get it to fail me. 

Personally, I'm going to set this up with some virus scanners and maybe some pentesting utilities, so if someone calls me up to fix their computer, I can just head over with the stick and try to fix it. I may even use it as a portable workstation, and set it up like my desktop, so I can head off somewhere and plug it in my laptop and get to work fast. 

There are a lot of viable use cases for this, and the product does it well. 

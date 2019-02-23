---
layout: post
title: "How to install ASP.Net 5 on Ubuntu Linux"
date: 2015-04-10 07:50
comments: true
categories: 
- Programming
description: One of the primary goals of the ASP.Net 5 (codenamed vNext) project is cross platform development, and it's become easier than ever to develop ASP.Net applications on Linux and OSX. Today we're going to take a look at how to do this with Ubuntu Linux server. 

permalink: /blog/programming/how-to-asp-5-linux/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: https://www.jeremymorgan.com/images/asp-5-linux/how-to-asp-5-linux-og.jpg
---
One of the primary goals of the ASP.Net 5 (codenamed vNext) project is cross platform development, and it's become easier than ever to develop ASP.Net applications on Linux and OSX. Today we're going to take a look at how to do this with Ubuntu Linux server. 
<!-- more -->

###1. Get Your System Ready

Let's get our system started. For this tutorial I'm using a Digital Ocean droplet. These are only $5 per month, and <a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4" target="_new">if you click this link to sign up</a> you'll get a $10 credit.

I installed a blank Ubuntu 14.04 64 bit server. First, run the following:

{% codeblock %}
sudo apt-get update&&sudo apt-get dist-upgrade
{% endcodeblock %}

This will make sure we have the newest package lists and upgrade packages if they are available. 

Next we'll need to install Mono. The current stable version for Ubuntu is 3.2.8, which won't run ASP.Net, so we will have to pull it directly from the Mono repositories:

{% codeblock %}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list
sudo apt-get update
sudo apt-get install mono-complete
{% endcodeblock %}

To make sure it installed correctly, type in

{% codeblock %}
mono -V
{% endcodeblock %}

{%img https://www.jeremymorgan.com/images/asp-5-linux/how-to-asp-5-linux-1.jpg how to install ASP.Net 5 on Docker %}

Next, we'll install some prerequisites that we'll need to fetch and build some items from source:

{% codeblock %}
sudo apt-get install -y autoconf build-essential git-core libtool unzip curl
{% endcodeblock %}

Also, to run web services we'll need to install libuv. We'll have to build it from source and link it: 

{% codeblock %}
cd /opt
sudo git clone https://github.com/libuv/libuv.git
cd libuv
sudo ./autogen.sh
sudo ./configure
sudo make
sudo make install
sudo ln -s /usr/local/lib/libuv.so /usr/lib/libuv.so.1
{% endcodeblock %}

Now our system should be ready for ASP.Net 5. 

###2. Set up ASP.Net 5

Now that we've got that set up, let's put ASP.Net 5 on here. First we'll install KVM: 

{% codeblock %}
curl -sSL https://raw.githubusercontent.com/aspnet/Home/master/kvminstall.sh | sh && source ~/.k/kvm/kvm.sh
{% endcodeblock %}

<b>Note:</b> if you want to go real bleeding edge, you can install DNVM instead, shich is the replacement for KVM:

{% codeblock %}
curl -sSL https://raw.githubusercontent.com/aspnet/Home/dev/dnvminstall.sh | DNX_BRANCH=dev sh && source ~/.dnx/dnvm/dnvm.sh
{% endcodeblock %}

Now, let's install DNX (the .Net execution environment)

{% codeblock %}
kvm upgrade
{% endcodeblock %}

If you downloaded DNVM above instead, run: 

{% codeblock %}
dnvm upgrade
{% endcodeblock %}

###3. Clone an ASP.Net Sample

Now we'll clone the sample repositories:

{% codeblock %}
mkdir ~/aspnet
cd ~/aspnet
git clone https://github.com/aspnet/Home.git
cd ~/aspnet/Home/samples/HelloMvc
{% endcodeblock %}

This is the sample we'll choose to build. Type in the following to build the packages for it:

{% codeblock %}
kpm restore
{% endcodeblock %}

Now we can start it up:

{% codeblock %}
k kestrel
{% endcodeblock %}

You should see a screen that looks like this:

{%img https://www.jeremymorgan.com/images/asp-5-linux/how-to-asp-5-linux-2.jpg how to install ASP.Net 5 on Docker %}

Congrats! You now have ASP.Net 5 running on Ubuntu Linux!

If you would like to run this as a background process, type in

{% codeblock %}
nohup k kestrel &
{% endcodeblock %}

Note that this should not yet be used for production servers!

###Conclusion

I have found several articles online about how to do this, but many of them seemed innaccurate, missing peices or out of date. This is common with bleeding edge stuff. I'll try to update this as much as possible. 

This is a good way to set up cheap instances of ASP.Net for your projects. At only $5 a month you could have several application servers running for your project for very little. As I stated before you can <a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4" target="_new">get a $10 credit from Digital Ocean by using this link</a> to sign up, or you can use some of the other low cost Linux hosts out there to set up some low cost, fast ASP.Net 5 servers. 

Enjoy!  

{% include custom/asides/programming-footer.html %}
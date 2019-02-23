---
layout: post
title: "Blink an LED on a Raspberry Pi 2 with ASP"
date: 2015-03-29 18:55
comments: true
categories: 
---
The blinking LED is the "hello world" of the maker community, and today we're going to do that in a bit of unconventional way. We're going to take the Linux based Raspberry Pi 2 and blink an LED, with ASP! 

###What you'll need

For this article I'm using a Raspberry Pi 2, but you can also use a Raspberry Pi Model B. You will also need:

{% img right /images/raspberry-pi-asp/raspberry-pi-asp-1.jpg "Blink an LED Raspberry Pi 2" %}

- A GPIO Adapter
- Breadboard
- Resistor
- LED

What I am using for this project is highly recommended the <a href="http://www.amazon.com/gp/offer-listing/B008XVAVAW/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B008XVAVAW&linkCode=am2&tag=webfootcentra-20&linkId=VF3GTBAGOAKMKG2S" target="_new">Canakit for Raspberry Pi</a> which contains everything in the list above. (This is an Amazon affiliate link).

Any decent breadboard or even a set of jumpers will work for this project. 

##The ASP.Net Way

What if you could light an LED (or trigger some other action) through the web? And even better using ASP? If you're like me you love C# and so the chance to use it here is pretty exciting. So we'll set up Mono, and vNext to put ASP 5 on the machine and run some things from there. We'll be taking some information from <a href="http://www.hanselman.com/blog/HowToRunASPNET5Beta3OrGoLangOnARaspberryPi2.aspx" target="_new">Scott Hanselman's blog post</a> about putting ASP 5 on the Raspberry Pi. 

###Getting Set Up with MONO

The first thing we need to do is set up Mono. As Scott mentions in his blog post apt-get in Raspian uses an older version of Mono so we'll want to install from the project's repositories:

{% codeblock %}
sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF 
echo "deb http://download.mono-project.com/repo/debian wheezy main" | sudo tee /etc/apt/sources.list.d/mono-xamarin.list 
sudo apt-get update && apt-get upgrade 
sudo apt-get install mono-complete
{% endcodeblock %}

This will take a few minutes to build. Go grab a glass of <a href="http://www.amazon.com/gp/offer-listing/B003QXM3U8/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B003QXM3U8&linkCode=am2&tag=webfootcentra-20&linkId=SCQNKT3GYQUZXOAR">Zero Water</a> and take a break. 

When it's done it should look like this:

{% img center /images/raspberry-pi-asp/raspberry-pi-asp-2.jpg "How to ASP 5 on Raspberry Pi" "How to ASP 5 on Raspberry Pi" %}

Run "mono -V" to get this output.

###Installing ASP.NET 5

Here we want to run the following commands (or use the shell script here) to get the samples from GitHub and install the ASP.Net runtime manager. 

{% codeblock %}
mkdir ~/sources
mkdir ~/sources/aspnet5 
cd ~/sources/aspnet5
git clone git://github.com/aspnet/home.git
sh ~/sources/aspnet5/kvminstall.sh
source ~/.k/kvm/kvm.sh
kvm upgrade{% endcodeblock %}

Then, <a href="https://github.com/aspnet/Home/issues/197#issuecomment-63196939" target="_blank">per this Github issue</a> (thanks again Scott) you need to tell your system about the SSL certs for NuGet to restore correctly. 

{% codeblock %}
CERTMGR=/usr/bin/certmgr
sudo $CERTMGR -ssl -m https://go.microsoft.com
sudo $CERTMGR -ssl -m https://nugetgallery.blob.core.windows.net
sudo $CERTMGR -ssl -m https://nuget.org

sudo mozroots --import --machine --sync 
{% endcodeblock %}

Now we'll want to go into one of the samples like ~/sources/aspnet5/home/samples/HelloMVC and run "**kpm restore**".

Also, again from Scott's post he points out the Kestrel Web Server uses the libuv http library. He found a way to install it on <a href="http://www.ganshani.com/blog/2014/12/shell-script-to-setup-net-on-linux/" target="_blank">Punit Gashani's blog</a> and we'll use those same instructions here:

{% codeblock %}
sudo apt-get install gyp
wget http://dist.libuv.org/dist/v1.0.0-rc1/libuv-v1.0.0-rc1.tar.gz 
tar -xvf libuv-v1.0.0-rc1.tar.gz
cd libuv-v1.0.0-rc1/
./gyp_uv.py -f make -Duv_library=shared_library
make -C out
sudo cp out/Debug/lib.target/libuv.so /usr/lib/libuv.so.1.0.0-rc1
sudo ln -s libuv.so.1.0.0-rc1 /usr/lib/libuv.so.1
{% endcodeblock %}

After this completes, you can run "K kestrel" and start the web server. You should see this:

{% img center /images/raspberry-pi-asp/raspberry-pi-asp-3.jpg "How to ASP 5 on Raspberry Pi" "How to ASP 5 on Raspberry Pi"%}

Congrats! You've got ASP 5 on your Raspberry Pi 2. 

###Making a Web API Application

Now we are going to make an ASP 5 Web API application. We're going to install a few things to get it set up. We're going to use a Yeoman generator to scaffold our app, which may be familiar to those in the JavaScript world, and Yeoman is pretty awesome. 

First we'll need to install NodeJS:

{% codeblock %}
cd ~/sources
wget http://node-arm.herokuapp.com/node_latest_armhf.deb
sudo dpkg -i node_latest_armhf.deb
{% endcodeblock %}

Now we will use a Yeoman generator to build a web application. 

{% codeblock %}
cd ~/
yo aspnet
{% endcodeblock %}

{% img center /images/raspberry-pi-asp/raspberry-pi-asp-6.jpg "How to ASP 5 on Raspberry Pi" "How to ASP 5 on Raspberry Pi" %}

I created an app called "Blinky" and in the blinky folder I run:

{% codeblock %}
kpm restore
kpm build
{% endcodeblock %}

After that completes, start the service:

{% codeblock %}
k kestrel
{% endcodeblock %}

You should see a screen that looks like this:

{% img center /images/raspberry-pi-asp/raspberry-pi-asp-7.jpg "How to ASP 5 on Raspberry Pi" "How to ASP 5 on Raspberry Pi" %}

If you click to access the Web API values, you'll see this:

{% img center /images/raspberry-pi-asp/raspberry-pi-asp-8.jpg "How to ASP 5 on Raspberry Pi" "How to ASP 5 on Raspberry Pi" %}

Now we have a good base for a web application. 

###Installing Raspberry.IO.GeneralPurpose










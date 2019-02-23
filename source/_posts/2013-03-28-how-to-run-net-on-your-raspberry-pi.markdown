---
layout: post
title: "How to Build C# apps on Your Raspberry Pi"
date: 2013-03-28 20:50
updated: 2018-03-25 12:22
comments: true
categories:
- Raspberry Pi
- Tutorials
- DotNet

author: Jeremy Morgan
sharing: true
description: Want to run and build C# .Net applications on your Raspberry Pi? In this article I'll show you how.
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
permalink: /tutorials/raspberry-pi/how-to-c-sharp-raspberry-pi/
---
{% include custom/asides/iot-newsletter-banner.html %}

Want to run and build .Net applications on your Raspberry Pi? In this article I'll show you how. With Mono you can develop and run .Net applications on your Raspberry Pi. I got a few emails about this, so I decided to create a quick tutorial.

<!-- more -->

###What's the Purpose here?

If you're thinking of running your favorite Windows .Net applications, or setup a fancy ASP.NET server, you may be disappointed. While Mono does a great job and the Raspberry Pi performs great for what it is, I wouldn't say this solution is ready for the big leagues, and definitely not something you want to do in a production or commercial environment.

If you want to tinker around and learn C#, and maybe build a few cool apps this is a great way to do it. The Raspberry Pi is a great tool for learning, and that's the purpose of this project. 

{%img center https://www.jeremymorgan.com/images/how-to-raspberry-pi-net-1.jpg How to run .Net on Raspberry Pi %}

There are tons of MONO applications available in Raspbian but we're only going to cover some basics. 

###Install Mono

Mono is an awesome project that brings .Net to Linux. It's available for the Raspian image, and super easy to set up. 

Update your repos:
<pre>sudo apt-get update</pre>

And install the Mono Runtime:

<pre>sudo apt-get install mono-runtime</pre>

This one could take a while. It updated a lot of stuff on my system. 

<pre>sudo apt-get install mono-mcs</pre>

Note about MonoDevelop: You can install this on a soft float install of Raspian or Arch but it's not the best performing application in these conditions. Mono still has a lot of problems with the Pi that need to be ironed out, and MonoDevelop is a long ways off.

{% include custom/asides/dotnet-newsletter-banner.html %}

###Build a quick application.

Load up LeafPad (or whatever your favorite text editor is) and create a file called monotest.cs and save it somewhere where you'll find it. 

Enter the following code:

{% codeblock %}

using System;

namespace Test
{
	class Program
	{
		public static void Main()
		{
			Console.WriteLine("Hello! This is a Mono app running on {0}", Environment.OSVersion);
		}
	}
}

{% endcodeblock %}

Now, open up an LX Terminal and go to where this file is located (I just put it in a folder called monotest as well). Type in the following:

<pre>
mcs monotest.cs
</pre>

This should only take a couple seconds. Then list the files in your directory (using the ls command) you will see a new file:

<pre>
monotest.cs
monotest.exe
</pre>
  
Now, you can run the monotest.exe by typing in:

<pre>
mono monotest.exe
</pre>

You will see something like this:

{%img center https://www.jeremymorgan.com/images/how-to-raspberry-pi-net-3.jpg How to run .Net on Raspberry Pi %}

And you're ready to go! If you see this, that means it worked. 

{% include custom/asides/iot-newsletter-banner.html %}

###So what can you do now? 

You can write basic C# console applications all day with this setup. You can build neat automation items, and even some GUI stuff if you really want to dig into it. You can write .Net 1.0 - 4.0 applications with varying success. The most valuable thing you do is learn some C# basics and experiment like crazy.

C# is one of my favorite languages, so it's awesome to see options for playing with it without being forced to use Windows and Visual Studio, which are great tools but expensive for hobbyists. As I said this is nowhere near something for production use, but excellent for tinkering and learning which is of course what the Raspberry Pi is all about! 

{% include custom/asides/rpi-footer.html %}


 



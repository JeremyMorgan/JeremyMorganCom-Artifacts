---
layout: post
title: "How to Install Octopress in Windows"
date: 2013-01-12 22:18
comments: true
categories: 
- "Tutorials"
keywords:
- "octopress,"
- "octopress install,"
- "how to install octopress,"
- "how to install octopress windows 7,"

permalink: /tutorials/how-to-install-octopress-windows/
description: A step by step tutorial showing you how to put Octopress on your Raspberry Pi
ogimage: "https://www.jeremymorgan.com/images/how-to-install-octopress-windows-10.png"
Author: Jeremy Morgan

---
Do you want to install Octopress on Windows? I tried it recently and found it to be a bit of a pain , but I documented it and decided to publish it. Funny thing, I write about a lot of Windows/.Net stuff on here, but I write all these articles on a Linux box. It's certainly more convenient to do it that way, but if you really must run it in Windows, here's your guide. 

<!-- more -->

###Why am I writing this?

I Googled this issue and found some instructions, but they aren't complete. There are things missing even from the Octopress site so I decided to create a barebones Windows 7 virtual machine and install Octopress as if I weren't a developer who already had all this stuff installed. I consider this to be a complete installation guide because it shows ALL the steps needed. 

###Getting Started

You should be fairly familiar with the command prompt, you're going to need it. To find it, click on the Start button, and in the search box type "cmd" and the console will come up. You'll also need to use Windows PowerShell as well, I'll show you how to get to it when we need it.

###Install Git

You will need Git to download some of the stuff you'll need, so go here:

<a href="http://git-scm.com/download/win" rel="nofollow">Git for Windows</a>

Install it with the default features. 

###Install Yari

<a href="https://github.com/scottmuc/yari" rel="nofollow">Yari</a> is a great tool for managing your Ruby environment and is reccommended for using Octopress in Windows. Run the following commands in your command prompt window:

<pre>
cd %USERPROFILE%
git clone git://github.com/scottmuc/yari.git .yari
</pre>

This will download Yari into your user profile. Now we need to set the path.

**WARNING** - Do not set the path in the manner that's described in the <a href="https://github.com/scottmuc/yari" rel="nofollow">Yari</a> instructions. This will overwrite your path, which is undesirable. 

###How to safely set up your path

Click on Start Button and then **right click** on Computer and select properties:

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-5.png "How to install Octopress in Windows" %}

Click "Advanced system settings"

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-6.png "How to install Octopress in Windows" %}

Click "Environment Variables"

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-7.png "How to install Octopress in Windows" %}

In this window select the "Path" section and click on edit. 

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-8.png "How to install Octopress in Windows" %}

This will bring up a dialog with your current path. This is what we'll change:

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-9.png "How to install Octopress in Windows" %}

**Warning** do not erase this information! We want to **add** the following to the end of this path:


<pre>
;%USERPROFILE%\.yari\bin;C:\Python27
</pre>

The semicolon is not a typo, this separates the path from the previous one. If there is already a semicolon at the end that's fine. 

Click OK 3 times or until all the windows close. 

Close your command prompt window and reopen it. 

###Install thru Windows PowerShell

There is another alternative and it doesn't hurt to run this as well.

To open a PowerShell, click the Start button and select

Start -&gt; All Programs -&gt; Accessories -&gt; Windows PowerShell (folder) -&gt; Windows PowerShell

Copy the following text and paste it in:

<pre>
(new-object Net.Webclient).DownloadString("https://github.com/scottmuc/yari/raw/master/installer.ps1") | iex
</pre>

Now go back to your command prompt window (black background) and type in 

<pre>
yari 1.9.2 
</pre>

The first time you run this it will take a while. This installs and sets up your Ruby environment.  

You may see something like this:

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-1.png "How to install Octopress in Windows" %}

This is because you need to install Ruby as an admin. To do that you'll need to run PowerShell as Administrator. When selecting the PowerShell icon 

Start -&gt; All Programs -&gt; Accessories -&gt; Windows PowerShell (folder) -&gt; Windows PowerShell 

You need to **right click** the icon and select properties:

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-2.png "How to install Octopress in Windows" %}

Select "run as Administrator" then run the following command

<pre>
cd %USERPROFILE%
</pre>

and then paste the following:

<pre>
(new-object Net.Webclient).DownloadString("https://github.com/scottmuc/yari/raw/master/installer.ps1") | iex
</pre>


Now, run Yari again:

<pre>
yari 1.9.2 
</pre>

This will successfully install it. 

Now type in 

<pre>
ruby -v
</pre>

and you should see something like this:

{% img https://www.jeremymorgan.com/images/how-to-install-octopress-windows-3.png "How to install Octopress in Windows" %}

Now you have Ruby set up and the battle's almost over!

###Install Octopress

Now we will follow the same instructions as on the Octopress site to install it:

Go to the folder you want to install Octopress in and type the following:

<pre>
git clone git://github.com/imathis/octopress.git octopress
</pre>

after this downloads, run the following:

<pre>
Gem install bundler
bundle install
</pre>

Now it's setup, and you have to install the default theme:

<pre>
rake install
</pre>

And it's ready to go! but there a few more steps.

###Install Python

Go to <a href="http://www.python.org/getit/releases/2.7.2/" rel="nofollow">Python.org</a> and get the version most appropriate for your machine. <a href="http://docs.python.org/2/using/windows.html" rel="nofollow">Install Python</a> with the defaults and have it install to C:\Python27

Note that even though the 64 bit release says AMD 64 you can still install it with a 64 bit Intel chip as well.

###Try it out

Now that you have everything set up, try it out. You want to edit the _config.yml file to adjust settings for your site. 

Create a new post:

<pre>
rake new_post["Hello World! I did it!"]
</pre>

and then edit the resulting file that's created in the _posts folder. Save it.

<pre>
rake generate
</pre>

Check your public folder and you should see new files there! You're up and running!

###Summary

I hope this has helped you install Octopress in Windows. As I said there are a few tutorials on the net for doing this, but they are incomplete or inaccurate. I hope this post is thorough enough that you get a good understanding of the process and get it set up.

I usually generate this site in Linux, because it's easier, faster and my Linux machine is connected to automated backups. But you can use this in Windows if you choose and it works pretty well. If you have any questions or comments, leave them below!

{% include custom/asides/programming-footer.html %}





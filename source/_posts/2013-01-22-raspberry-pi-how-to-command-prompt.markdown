---
layout: post
title: "Raspberry Pi How to: Learning Linux Commands"
date: 2013-01-22 17:59
updated: 2018-03-25 12:22
comments: true
categories: 
- Raspberry Pi
- Tutorials
- Linux
author: Jeremy Morgan
sharing: true
permalink: /tutorials/raspberry-pi/how-to-linux/
description: A step by step guide to Linux command line basics for using your Raspberry Pi
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
---
{% include custom/asides/iot-newsletter-banner.html %}

So you have a Raspberry Pi but you're not a Linux expert? Have no fear it's not as hard as you might think. You can do tons of stuff on the Raspberry Pi without ever using the Linux prompt, but if you do take the time to learn it you'll open a whole world of power. In this article I'll attempt to give you a crash course in the Linux prompt on the Raspberry Pi. 

<!-- more --> 
###What you'll need

For this tutorial I'm going to be using the Raspian image available here. This is a Raspberry Pi specific version of Debian and arguably the most robust and commonly used at this time. Since it's based off Debian it's more of a "pure Linux" type of environment anyway. 

For the tutorials, you'll either need to SSH into your Raspberry Pi or use the LXTerminal found here:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-1.png Raspberry Pi Linux Commands %}

Once you're there you'll be the **command prompt** or Linux shell. This is where we'll be spending our time today. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-2.png Raspberry Pi Linux Commands %}

Instead of screenshots of everything I will be just posting code, where you see something like this:

<pre>
$  (Some commands here) 
</pre>

This is what I'll ask you to type at the prompt. 

###Who this is for

This guide is going to be aimed at "newbies" who have a Raspberry Pi and want to dig deeper. I've been getting a lot of criticism lately for articles that are "too basic" but this is exactly what an aspiring tech needs. We were all there once, and I'm hoping this article will light a fire and maybe inspire some folks to shake their fears of the prompt. 

###Getting Started: Where am I?

So you've loaded up the terminal or SSH and you're starting at that screen that says:

<pre>
pi@raspberrypi ~ $
</pre>

What the heck does that mean? It's what's referred to as the prompt. It's roots go back to the days when computers took up entire rooms so you had a "console" which was just a mouse and keyboard to connect to it. (In many ways we're drifting towards a similar model today). It's simply waiting for you to give it a command. 

The "pi" is your username on the system. Since you logged in as pi (I assume) it's displayed there, then there is a @ sign and they hostname (raspberrypi). The hostname is a name for your machine that identifies you on a network. 

####Find your location. 

The file system is composed of many files and folders. But don't call them folders, generally in the Linux world they are called "directories". You have your main root directory, which is simply "/". The directories below that go after the slash, like /home or /home/pi. In fact you can see that structure in your file manager. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-3.png Raspberry Pi Linux Commands %}

See up in the location area where it says "/home/pi"? this means you're in the pi directory, which is in the home directory. So let's look around. 

When you open your console window you see the prompt, but how do you know where you are at? It's easy, simply type in

<pre>
pwd
</pre>

and press enter. This show what directory you are in. You should see it display "/home/pi". This is your home directory where you will store all your files. 

###Look Around

Now that you know where you're located in the file tree, let's see what is stored in /home/pi. 

<pre>
ls
</pre>

This will show you something like the following (I have added stuff):

<pre>
pi@raspberrypi:~$ ls
clearram.sh        cut        indiecity  python_games  RetroPie-Setup
config.txt.save    Desktop    octogen    RAMP          Scratch
config.txt.save.1  Documents  octopress  RetroPie      storage
</pre>

This shows a listing of all the files and folders on that system. But that isn't quite as useful as the next command:

<pre>
ls -la
</pre>

What this does is "list all" and shows a lot more information about the files. 

<pre>
drwxr-xr-x 33 pi   pi         4096 Jan 18 18:07 .
drwxr-xr-x  3 root root       4096 Dec 16 11:39 ..
-rw-------  1 pi   pi         7996 Jan 22 20:49 .bash_history
-rw-r--r--  1 pi   pi          220 Dec 15 09:40 .bash_logout
-rw-r--r--  1 pi   pi          238 Jan  1 01:48 .bash_profile
-rw-r--r--  1 pi   pi         3324 Jan  1 01:48 .bashrc
drwxr-xr-x  7 pi   pi         4096 Dec 30 12:00 .cache
-rwxr-xr-x  1 root root        982 Dec 24 03:18 clearram.sh
drwxr-xr-x  9 pi   pi         4096 Dec 26 21:15 .config
-rwxr-xr-x  1 pi   pi         1205 Dec 24 03:11 config.txt.save
-rwxr-xr-x  1 pi   pi         1205 Dec 24 03:11 config.txt.save.1
-rw-r--r--  1 pi   pi            0 Dec 27 22:57 cut
drwx------  3 pi   pi         4096 Dec 26 20:49 .dbus
drwxr-xr-x  2 pi   pi         4096 Dec 30 13:39 Desktop
drwxr-xr-x  2 pi   pi         4096 Dec 31 18:29 .dgen
drwx------  2 pi   pi         4096 Jan 18 18:07 .dillo
drwxr-xr-x  3 pi   pi         4096 Dec 26 21:07 Documents
drwxr-xr-x  3 pi   pi         4096 Dec 31 18:29 .emulationstation
-rw-------  1 pi   pi           16 Dec 26 20:49 .esd_auth
drwxr-xr-x  2 pi   pi         4096 Dec 30 13:39 .etracer
drwx------  3 pi   pi         4096 Jan 18 18:07 .fltk
drwxr-xr-x  2 pi   pi         4096 Dec 30 12:00 .fontconfig
drwxr-xr-x  3 pi   pi         4096 Jan  1 03:08 .gem
drwxr-xr-x 24 pi   pi         4096 Dec 30 12:48 .gimp-2.8
drwxr-xr-x  2 pi   indiecity  4096 Dec 26 21:43 .gstreamer-0.10
drwx------  2 pi   pi         4096 Dec 26 20:49 .gvfs
drwxr-xr-x  3 pi   indiecity  4096 Dec 26 21:13 indiecity
drwx------  3 pi   pi         4096 Dec 26 21:14 .local
-rw-------  1 pi   pi          176 Dec 29 20:42 .mysql_history
drwxr-xr-x  4 pi   pi         4096 Jan  1 12:54 octogen
drwxr-xr-x  8 pi   pi         4096 Jan  1 12:36 octopress
-rw-r--r--  1 pi   pi          675 Dec 15 09:40 .profile
drwx------  2 pi   pi         4096 Dec 29 00:56 .pulse
-rw-------  1 pi   pi          256 Dec 26 20:49 .pulse-cookie
drwxrwxr-x  2 pi   pi         4096 Jul 20  2012 python_games
drwxr-xr-x  2 pi   pi         4096 Dec 26 21:29 RAMP
drwxr-xr-x  3 pi   pi         4096 Jan  1 01:45 .rbenv
drwxr-xr-x  7 pi   pi         4096 Dec 31 18:29 RetroPie
drwxr-xr-x  6 pi   pi         4096 Dec 31 18:29 RetroPie-Setup
drwxr-xr-x 24 pi   pi         4096 Jan  1 01:53 .rvm
drwxr-xr-x  3 pi   pi         4096 Dec 26 21:07 .scratch
drwxr-xr-x  2 pi   pi         4096 Dec 26 21:07 Scratch
drwxr-xr-x  2 pi   pi         4096 Dec 26 20:25 storage
drwx------  5 pi   pi         4096 Dec 30 12:04 .thumbnails
drwx------  2 pi   pi         4096 Dec 26 21:07 .vnc
-rw-------  1 pi   pi          162 Dec 26 21:01 .Xauthority
-rw-------  1 pi   pi        27793 Jan 23 20:55 .xsession-errors
-rw-r--r--  1 pi   pi          118 Jan  1 01:48 .zprofile
-rw-r--r--  1 pi   pi           59 Jan  1 01:48 .zshrc
</pre>

Now, you're not crazy if you think the list got bigger. List all will show all the files, including hidden ones. See the ones with the dot in front of them? Those are hidden. You can hide files or folders by renaming them with the dot in front. This will make the files hidden, but don't rely on that for security. As you can see they're easily visible with the right parameters. 

{% include custom/asides/iot-newsletter-banner.html %}

###Basic Linux Navigation

So you see the file called "Desktop"? That's actually a folder where all the stuff from your desktop is located. Let's go there. 

<pre>
cd Desktop
</pre>

"cd" stands for change directory, and it's a great navigation tool. Now type in "ls -la" and enter, and you'll see all the files in the desktop. 

Want to go back to the /home/pi folder? 

<pre>
cd ..
</pre>

It's that easy! You can keep typing cd .. to get to the bottom of your directory tree, or root. Another way to do that is:

<pre>
cd /
</pre>

Now you are the root. Type "pwd" to confirm. 

<pre>
pi@raspberrypi:/$ pwd
/
</pre>

Now, what if you want to back to the desktop? There are two ways to do this. 

<pre>
cd home 
cd pi
cd Desktop
</pre>

Send these three commands and you'll get there. But there is a faster way:

<pre>
cd /home/pi/Desktop
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-4.png Raspberry Pi Linux Commands %}

You can travel anywhere your permissions allow you to. Here is another neat thing, you can press the "tab" button on your keyboard to autocomplete. 

Type in 

<pre>
cd /home/pi/D
</pre>

and instead of pressing enter, press "TAB". You will see that it shows "Desktop" and "Documents" as options, because they both start with "D". Press "TAB" again until you see Desktop shown. This can be handy when you forget the name of a file or directory. 

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-5.png Raspberry Pi Linux Commands %}

Want to go from /home/pi/Documents back to root? There are two ways to do this:

<pre>
cd ..
cd ..
</pre>

or you can simply type

<pre>
cd /
</pre>


####Advanced Linux Navigation

Now I'll show you some cool navigation tricks. Since you're now in "/home/pi/Desktop" you want to go to your Documents. There are three ways to do this:

<pre>
cd ..
cd Documents
</pre>

Or

<pre>
cd /home/pi/Documents
</pre>

or also

<pre>
cd ../Documents/
</pre>

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-6.png Raspberry Pi Linux Commands %}

The first option is just going down one directory and back up. The 2nd option takes you to the exact location. The third option combines with .. to bring you down one directory and back up in another. 

This is really useful for copying files, as you could copy a test file by typing the following:

<pre>
copy mytest.txt ../Documents
</pre>

This becomes really useful. You can even go into directories that aren't in that tree:

<pre>
cd ../../../var/
</pre>

This is the equivalent of typing "cd .." multiple times to get to /var. 


{% include custom/asides/in-article-wide.html %}


###How to create text files in Linux

You can create files from the prompt, and directories to put them in. Go to /home/pi and type in:

<pre>
mkdir mystuff
</pre>

This will create a directory called "mystuff". Go to it. 

<pre>
cd mystuff
</pre>

In this folder, we want to create just an empty file. That's done using the "touch" command.

<pre>
touch test.txt
</pre>

Now, look for this file:

<pre>
ls test.txt
</pre>

and you'll see it there. But this is just a plain text file with nothing inside it. Let's change that.

<pre>
nano test.txt
</pre>

You should see a window that looks like this:

{% img center https://www.jeremymorgan.com/images/raspberry-pi-linux-7.png Raspberry Pi Linux Commands %}

This is the nano text editor. It works great for creating and working with text files. In that window, type whatever you want, like

<pre>
The Raspberry Pi is awesome!
</pre>

Then press Control + x 

You will see a notification: 

>Save modified buffer (ANSWERING "No" WILL DESTROY CHANGES) ?

Type Y (for yes)

it will then show a filename (test.txt) which you can leave or change to anything you want. 

###How to move files in Linux

Now that you have the file there, let's move it around. You are currently in the /home/pi/mystuff directory, but what if you want to put the file on your desktop? It's a lot like the cd parameters you saw a while ago:

<pre>
mv test.txt ../Desktop/
</pre>

This will move the file to the desktop. But what if you want to copy it back? Since you're currently in the /home/pi/mystuff directory, you can't just type in "mv test.txt". You have to specify where the file is located and where you want it:

<pre>
mv /home/pi/Desktop/test.txt /home/pi/mystuff/
</pre>

But there is another, faster way:

<pre>
mv ../Desktop/test.txt .
</pre>

See the single dot? That means "here" wherever you're located. Two dots (..) means the directory below the one you're in. If you want to go two directories down, it's "../../" and so on. 

###How to copy files in Linux

What if you just want to make a copy of the file in another folder? This is a simple as changing two letters (mv to cp)

<pre>
cp test.txt ../Desktop/
</pre>

This creates a copy of the file. 

###How to delete files in Linux

To delete this file, type in 

<pre>
rm test.txt
</pre>

If you want to delete a directory,

<pre>
rmdir directoryname
</pre>

So let's try something different. Make sure you're in /home/pi/mystuff and create a few files:

<pre>
touch test2.txt
touch test.jpg
touch test3.png
</pre>

Now, go back into your /home/pi directory:

<pre>
cd ..
</pre>

And remove the "mystuff" directory:

<pre>
rmdir mystuff
</pre>

Did you get the following message?

>rmdir: failed to remove 'mystuff': Directory not empty

You can't delete directories that are not empty. This is a good safety measure. There are two things you can do here:

* Remove all the files then delete it
* delete recursively

The first thing we'll do is try to delete all the files. This is easy, just like DOS back in the day:

<pre>
rm mystuff/*
</pre>

See the * ? This means "everything". But what if you only want to delete the text files?

<pre>
rm mystuff/*.txt
</pre>

Or what if you want to delete everything starting with the letter "t"?

<pre>
rm mystuff/t*
</pre>

Now I mentioned another option, recursively deleting it. This means the rm command will travel through the directory when it works. To remove everything in mystuff and the files, type in 

<pre>
rm -rf mystuff
</pre>

This will force the command to wipe out everything. Very handy (and very dangerous). 

{% include custom/asides/iot-newsletter-banner.html %}

###Summary

I hope this has given you a basic tour of the command prompt. There's lots more to learn but this should be enough to get you started. As I said before, the command line is a very powerful tool. The more you learn about working with the command line, the more you'll be able to do. GUIs are great to make things easier, multitask and do certain tasks faster. But the command prompt allows you more power, and you can do many more complicated tasks faster. Once you get the hang of it you'll be able to do lot more in a shorter time. If this is helpful, I'll add a lot more of these. 

If you have any questions feel free to comment!

{% include custom/asides/rpi-footer.html %}

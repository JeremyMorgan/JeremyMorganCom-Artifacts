---
layout: post
title: "How To Install Octopress on Ubuntu Linux 12.10 (Quantal Quetzal)"
date: 2012-10-10 11:53
comments: true
sharing: true
description: A step by step guide to installing Octopress on Ubuntu Linux 12.10 (Quantal Quetzal)
categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-install-octopress-on-ubuntu-linux-quantal-quetzal/
ogimage: https://www.jeremymorgan.com/images/how-to-install-octopress-windows-10.png
author: Jeremy Morgan
---

So, you've discovered Octopress and want to set it up, welcome to the club! Octopress is an awesome system, I love it. 

Today's tutorial is going to show you how to set it up in Ubuntu Linux. The idea being if you're using Ubuntu for development you can build and generate your pages on your dev machine, and push them to your site. Let's get started. 
<!-- more -->

I'm using Ubuntu 12.10 Quantal Quetzal in this demo, but it should be relatively the same for most Ubuntu versions. 

###Step 1: Install Some Dependencies

First you need to install Git, and rbenv. You should already have Ruby installed but if not it will come up as a dependency. 

{% codeblock %}
$ sudo apt-get install build-essential git rbenv 
{% endcodeblock %}

Rbenv is a program that allows you to switch between versions. Start it up by typing:

{% codeblock %}
$ rbenv init
{% endcodeblock %}

If you want it to start automatically, add this line to your ~/.bashrc file

{% codeblock %}
eval "$(rbenv init -)"
{% endcodeblock %}

Now you can install Ruby: 

{% codeblock %}
$ rbenv install 1.9.3-p194
$ ruby -v
ruby 1.9.3p194 (2012-04-20 revision 35410) [i686-linux]
{% endcodeblock %}



You may also need to install Ruby Build (different from Ruby Builder) to get this working:

{% codeblock %}
$ mkdir -p ~/.rbenv/plugins
$ cd ~/.rbenv/plugins
$ git clone git://github.com/sstephenson/ruby-build.git
$ cd /ruby-build
$ ./install.sh
{% endcodeblock %}

###Step 2: Get Octopress

Now that you have your dependencies installed, you will want to clone Octopress into a folder. 

{% codeblock %}
$ mkdir octopress
$ git clone git://github.com/imathis/octopress.git octopress
$ cd octopress
{% endcodeblock %}

This gives you a fresh version of Octopress right from Github. 

###Step 3: Install Octopress

Now that your depencies are met and you're ready to go, you install it just as it shows on the Octopress site: 

{% codeblock %}
$ cd ~/octopress
$ sudo gem install bundler
$ rbenv rehash    # If you use rbenv, rehash to be able to run the bundle command
$ bundle install
{% endcodeblock %}

Build a test post, just to be sure there are no errors:

{% codeblock %}
$ rake new_post["hello world!"]
$ rake generate
{% endcodeblock %}

And that's it! Getting up and running in Ubuntu Linux is pretty simple if you follow the steps exactly. I will also be posting a tutorial on here for installing in Windows, including Windows 8, very soon. 


Enjoy it, and if you have any questions leave them in the comments!






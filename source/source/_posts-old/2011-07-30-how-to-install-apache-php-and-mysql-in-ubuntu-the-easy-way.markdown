---
comments: true
sharing: true
date: 2011-07-30 21:39:06
layout: post
slug: how-to-install-apache-php-and-mysql-in-ubuntu-the-easy-way
title: "Tutorial: How to install Apache, PHP and MySQL in Ubuntu the easy way"
wordpress_id: 149
categories:
- Tutorials
Author: Jeremy Morgan

permalink: /tutorials/linux/how-to-install-apache-php-and-mysql-in-ubuntu-the-easy-way/
---

Linux by nature attracts developers. It takes a good deal of knowledge and skill to install and run Linux on a daily basis, so this comes as no surprise. So many Linux users are also developers, either web, desktop or both. And when web developers want to develop in an environment that's close to a webserver, running Apache on their machine is a natural choice.

One way to set up a webserver on your local machine is to of course just install each manually. Installing Apache, PHP and MySQL from source isn't incredibly difficult, especially if you follow the directions. I've never tried using the ubuntu software center, but I'm assuming it's fairly simple as well. But if you want a really easy, simple way using XAMPP to configure everything is a good way to do it, and that's what we're doing today. I'm also going to show you how to configure things a little differently to make it a little easier.

**1. Download XAMPP for Linux**

Go to the [XAMPP For Linux download page](http://www.apachefriends.org/en/xampp-linux.html) and get the latest version of XAMPP and save it. In this case, I saved it to my desktop,at /home/jeremy/Desktop.

**2. Install XAMPP**

Go to the directory you saved the archive in and type:

{% codeblock %}
sudo tar xvzf xampp-linux-1.7.4.tar.gz -C /opt
{% endcodeblock %}

This will install XAMPP into the /opt/lampp directory.

**3. Start XAMPP**

Type in the following to start XAMPP:

{% codeblock %}
sudo /opt/lampp/lampp start
{% endcodeblock %}

This will start up the XAMPP services. Test them out by pointing your web browser to [http://localhost](http://localhost)

You should see a welcome screen showing you a list of options.

**Special Note:**

This is not what you want to do if you're setting up a production web server. Dont run apache as root if you don't have to, and also there are a few security problems with this installation. If you're just installing it on your local machine for development it's fine, but don't do this on a public facing server. If you want to use XAMPP on a public facing server, you at least want to run this command to fix some of the security issues:

{% codeblock %}
sudo /opt/lampp/lampp security
{% endcodeblock %}

Also note your MySQL server has a root password that's blank. Change that for obvious reasons.

**Changes I like to make**

Here are some of the changes I sometimes make to my XAMPP configuration.

{% codeblock %}
sudo vi /opt/lampp/etc/http.conf
{% endcodeblock %}

Look for the home directory:

{% codeblock %}
DocumentRoot "/opt/lampp/htdocs"
{% endcodeblock %}

I like to change this to a directory in my home folder, so I don't deal with navigating all over there and dealing with permissions issues, I usually change it something like /home/Jeremy/Desktop/Web

You will also need to change it here:

{% codeblock %}
<Directory "/opt/lampp/htdocs">
{% endcodeblock %}

Once this is changed, restart the XAMPP server.

This is probably the easiest way I know of to setup a webserver for desktop development. As I said if you want to install everything manually, it's not that difficult and can provide you with a bit more power and customization over your setup. But this is a good way to get started if you just want to get up and running quick. I hope it helps!

{% include custom/asides/tutorials-footer.html %}

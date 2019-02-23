---
comments: true
sharing: true
date: 2011-03-01 16:14:50
updated: 2018-03-25 12:22
layout: post
slug: how-to-make-curl-work-with-xampp-in-windows
title: How to make CURL work with XAMPP in Windows
wordpress_id: 139
categories:
- Tutorials
description: A short guide to getting curl to work with XAMPP in Windows. 
permalink: /tutorials/php-tutorials/how-to-make-curl-work-with-xampp-in-windows/
ogimage: https://www.jeremymorgan.com/images/tools-ogimage.png
---

Ok so this is a short one, but in the past if you were running Apache/PHP/MySQL on your windows computer there were a lot of steps to [get CURL working with PHP in Windows](http://www.tonyspencer.com/2003/10/22/curl-with-php-and-apache-on-windows/). Many developers, myself included, like to set up a web server on the desktop when doing development, and a project I'm working on I decided to add in Curl. I use [XAMPP](http://www.apachefriends.org/en/xampp.html) currently, so I wasn't sure if I should go through all the trouble of installing curl and configuring things if I didn't have to. And as it turns out, it's as simple as uncommenting it in your php.ini file.

### Step 1: Find your php.ini file

Find your php.ini file. You can do this by looking at your phpinfo page:

{% img center https://s3.amazonaws.com/images.jeremymorgan.com/phpinfo.jpg How to find your php.ini file %}

If you don't have one setup, you simply create a php file with the following code:

And bring it up in your web browser.

### Step 2: Uncomment "extension=php_curl.dll"

Search the php file for the following:

{% img center https://s3.amazonaws.com/images.jeremymorgan.com/how-to-php-curl.jpg How to make CURL work with XAMPP in Windows%}

And remove the ";" to enable it.

And you're done! I love [XAMPP](http://www.apachefriends.org/en/xampp.html) for it's simplicity. You get an easy install of Apache, PHP and MySQL but you can still go in and configure things as you want. It's a great product!

{% include custom/asides/tutorials-footer.html %}
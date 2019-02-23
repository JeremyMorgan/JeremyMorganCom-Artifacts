---
layout: post
title: "Tutorial: How to Install Apache PHP and MySQL on Ubuntu 12.10 Quantal Quetzal"
date: 2012-10-09 19:36
comments: true
sharing: true
categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-install-apache-php-and-mysql-on-ubuntu-12-dot-10-quantal-quetzal
ogimage: https://www.jeremymorgan.com/images/ubuntu-ogimage.png
author: Jeremy Morgan
description: How to install Apache, PHP and MySQL on Ubuntu 12.10 (Quantal Quetzal)
---

Due to be released October 18th, Ubuntu 12.10 ("<a href="https://wiki.ubuntu.com/QuantalQuetzal/ReleaseNotes/UbuntuDesktop">Quantal Quetzal</a>") looks like it's going to be a pretty decent operating system. 
Most of the changes are minor, but in testing it I've found it to be very stable. I've whipped up some tutorials in preparation of the release for those folks looking to get their machines going. 

Most web developers prefer a local webserver when doing development. If you can work this way it's more convienient especially when going solo. Today's tutorial will show you how to set up Apache, PHP and MySQL on your Quantal Quetzal machine so you can get rolling. 
<!-- more -->

###Install Apache

First you install Apache, and it's as easy as it ever was:

{% codeblock %}
sudo apt-get install apache2
{% endcodeblock %}

After a quick install it will come up automatically. Load up a browser and point it http://localhost and you should see this:

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/install-apache-php-mysql-quantal-quetzal-01.jpg How to install PHP Apache and MySQL in Ubuntu Quantal Quetzal %}

This is your bare Apache server. Next we'll add PHP. 

###Install PHP

You'll want to install the latest version of PHP 5, to do that type:

{% codeblock %}
sudo apt-get install libapache2-mod-php5 php5
{% endcodeblock %}

This will install PHP5 plus the libraries to interface with Apache. 

You'll want to restart the server

{% codeblock %}
sudo etc/init.d/apache2 restart
{% endcodeblock %}



To test it out, create a file called test.php:

{% codeblock %}
sudo nano /var/www/test.php
{% endcodeblock %}

Let's use the phpinfo() function so we can check out our installation:

{% codeblock /var/www/test.php lang:php http://www.php.net/manual/en/function.phpinfo.php phpInfo() Documentation %}
<?php phpinfo(); ?>
{% endcodeblock %}

It should look like this:

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/install-apache-php-mysql-quantal-quetzal-02.jpg How to install PHP Apache and MySQL in Ubuntu Quantal Quetzal %}

You can inspect your options and if you want to change anything, your php location is here:

{% codeblock %}
/etc/php5/apache2/php.ini
{% endcodeblock %}

###Install MySQL
Next you'll need to install the MySQL server. This is also super easy:

{% codeblock %}
sudo apt-get install mysql-server libapache2-mod-auth-mysql php5-mysql
{% endcodeblock %}

MySQL will ask you for a password. You really shouldn't leave this blank, even if it is just going to be on your local machine. It only takes a second to do and some applications will require a password of some type on the server. 

Test your server to make sure it's working properly. 

{% codeblock %}
mysql -u root -p
<Enter Password>
show databases;
{% endcodeblock %}

It should look something like this:

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/install-apache-php-mysql-quantal-quetzal-03.jpg How to install PHP Apache and MySQL in Ubuntu Quantal Quetzal %}

Now you're up and running! 

You may want something to manage your MySQL data, I realize not everyone is as crazy about the prompt as I am. PHPMyAdmin is great:

{% codeblock %}
sudo apt-get install phpmyadmin
{% endcodeblock %}

or you could download something like <a href="http://www.mysql.com/downloads/workbench/#downloads">MySQL Workbench</a> and work with your database that way. 

###Optional Publishing Method

Publishing can be kind of a pain because when you install Apache it makes the document root of the webserver /var/www that is owned by root. So this causes a problem. Here is one solution. 

{% codeblock %}
sudo mkdir /srv/www
sudo cp -r /var/www/* /srv/www/
{% endcodeblock %}

then, open up your config file: 

{% codeblock %}
sudo nano /etc/apache2/sites-available/default
{% endcodeblock %}

And change your DocumentRoot. There will be a section that says: 

{% codeblock %}
Change 
DocumentRoot /var/www
to 
DocumentRoot /srv/www
and 
<Directory /var/www>
to
<Directory /srv/www>
{% endcodeblock %}

then restart your server:

{% codeblock %}
sudo etc/init.d/apache2 restart
{% endcodeblock %}

I created a folder in my home directory called "web" and then created a symbolic link:

{% codeblock %}
sudo ln -s /srv/www/ /home/jeremy/web/
{% endcodeblock %}

so I can work in a folder in my home directory  ( I actually do most work in VIM ). Of course there's a little permissions issue still, so run the following commands, but be sure to subsitute your user name. 

{% codeblock %}
sudo usermod -g www-data jeremy
sudo chown -R jeremy:www-data /srv/www
sudo chmod -R 775 /srv/www/
{% endcodeblock %}

Now I can create files or entire an entire website in my own folder ( /home/jeremy/web ) and view it thru localhost. 

###Conclusion

So it turns out setting up Apache, PHP and MySQL is no different in Quantal Quetzal than in recent Ubuntu versions. Using apt-get for management takes a lot of hassle out of software management. I hope this helps you in setting up a local webserver, so you can start building some awesome stuff. 

I will whip out a few more Quantal Quetzal tutorials in the coming days for those early adopters who like to try out the newest stuff. Questions? Leave me a comment! 









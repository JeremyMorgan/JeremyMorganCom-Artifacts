---
layout: post
title: "How to set up a LEMP Server in Ubuntu 14.04"
date: 2014-06-16 21:07
comments: true
author: Jeremy Morgan
categories:
- Tutorials
- Linux
permalink: /tutorials/linux/how-to-setup-lemp-server-ubuntu/
description: Today I'm going to show you how to set up a LEMP server (Linux NginX MariaDB PHP) server on Ubuntu using a Digital Ocean droplet.
ogimage: https://www.jeremymorgan.com/images/og-how-to-lemp-ubuntu.jpg
---
Today I'm going to show you how to set up a LEMP server (Linux NginX MariaDB PHP)  on an Ubuntu 14.04. It's a relatively easy process once you've done it a few times, but there are some things that can trip you up, so I thought I'd document it and present it here. 

For this tutorial I used a <a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4" target="_new">Digital Ocean Droplet</a>, but any Ubuntu 14.04 server should work the same way. 

<!-- more -->

##Set up a privileged user

This assumes you're using a fresh install of Ubuntu 14.04, and it's not a crucial step in the process if your server is already set up. But we want to create an environment with a privileged user and prevent people from being able to login as root over SSH. This is just an extra precaution I like to do on servers I set up. 

Log in to your user as root, and type in the following: 

{% codeblock %}
adduser web
{% endcodeblock %}
It doesn't have to be "web" you can call it anything you want. 

{% img center https://www.jeremymorgan.com/images/how-to-lemp-ubuntu.jpg "How to set up a LEMP Server on Ubuntu 14.04" %}

Add a password and there will be some prompts where you can add as much or as little information as you want for the account. 

Then run the following command:

{% codeblock %}
visudo
{% endcodeblock %}

look for 
{% codeblock %}
User privilege specification
{% endcodeblock %}

and add the new account: 

{% codeblock %}
root    ALL=(ALL:ALL) ALL
web     ALL=(ALL:ALL) ALL
{% endcodeblock %}
It should look like this:

{% img center https://www.jeremymorgan.com/images/how-to-lemp-ubuntu-2.jpg "How to set up a LEMP Server on Ubuntu 14.04" %}

Ctrl + X to exit, Y to save the file

Now we want to edit the SSH settings: 

{% codeblock %}
sudo nano /etc/ssh/sshd_config
{% endcodeblock %}

Change the Port to something between  1025 and 65536. This just adds an extra step for attackers, and bots that scan for open port 22 won't find your connection immediately. 

Look for this line:

{% codeblock %}
PermitRootLogin yes
{% endcodeblock %}

and change it to

{% codeblock %}
PermitRootLogin no
{% endcodeblock %}

This prevents people from logging into SSH as root. 

As an additional step, let's add the line:

{% codeblock %}
AllowUsers web 
{% endcodeblock %}

so only the web user is allowed to log on to the server. 

Restart the ssh server:

{% codeblock %}
service ssh restart
{% endcodeblock %}

Now before we log out, we want to test and make sure we can get back in. 

{% codeblock %}
ssh -p 4400 web@YourIPADDRESS
{% endcodeblock %}

4400 is the port shown here, but it can be whatever you choose. 

If you can log in fine, then you'll be safe to exit out of your main session, and log back in as "web" (or whatever you used as a username). 

##Install the Web Server

first type in

{% codeblock %}
sudo apt-get update
{% endcodeblock %}

to update the system. 

To install NginX: 

{% codeblock %}
sudo apt-get install nginx
{% endcodeblock %}

In Ubuntu 14.04 it will automatically start up the service, and you should see this startup page:

{% img center https://www.jeremymorgan.com/images/how-to-lemp-ubuntu-3.jpg "How to set up a LEMP Server on Ubuntu 14.04" %}

Now your NginX server is set up so we'll move on and modify it later. 

##Install the Web Server

We're going to install MySQL on the server, but we'll be using the [MariaDB](https://mariadb.org/) fork instead of the MySQL distribution, because it's better in many ways. 

For our install we're using Ubuntu 14.04 and I want MariaDB 10, so here is how I set it up: 

{% codeblock %}
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver hkp://keyserver.ubuntu.com:80 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://sfo1.mirrors.digitalocean.com/mariadb/repo/10.0/ubuntu trusty main'
{% endcodeblock %}

If you want to use something different or are working with a different OS, <a href="https://downloads.mariadb.org/mariadb/repositories/#mirror=digitalocean-sfo" target="_new" ref="nofollow">check here to see which repo to use</a>. 

{% codeblock %}
sudo apt-get update
sudo apt-get install mariadb-server
{% endcodeblock %}

Now we want to secure up our install a bit:

{% codeblock %}
sudo mysql_secure_installation
{% endcodeblock %}

enter your root password and answer "Y" to all the things you want to remove for security purposes. 

Now you have a (MySQL compatible) MariaDB instance set up! 

##Install and configure PHP

Now we want to install PHP and get it set up with NginX. 

{% codeblock %}
sudo apt-get install php5-fpm php5-mysql php5-cli php5-mcrypt git
{% endcodeblock %}

Now, we need to configure PHP:

{% codeblock %}
sudo nano /etc/php5/fpm/php.ini
{% endcodeblock %}

Look for the following in the php.ini file:

{% codeblock %}
;cgi.fix_pathinfo=1
{% endcodeblock %}

remove the semicolon and set it to 0:

{% codeblock %}
cgi.fix_pathinfo=0
{% endcodeblock %}

Quit and save the file.

Now we need to make a small change to the PHP-FPM config:

{% codeblock %}
sudo nano /etc/php5/fpm/pool.d/www.conf
{% endcodeblock %}

look for the listen directive and make sure it says:
{% codeblock %}
listen = /var/run/php5-fpm.sock
{% endcodeblock %}

Quit and save the file, then restart PHP5-FPM:

{% codeblock %}
sudo service php5-fpm restart
{% endcodeblock %}

Now you're set up!

##Configure NginX

Create a folder where your web files will be stored. I generally set up something like this:

{% codeblock %}
sudo mkdir /var/www/yourdomain.com/public
{% endcodeblock %}

Now open up this file:

{% codeblock %}
sudo nano /etc/nginx/sites-available/default
{% endcodeblock %}

The default server setup looks like this:

{% codeblock %}
		server {
		    listen 80 default_server;
		    listen [::]:80 default_server ipv6only=on;

		    root /usr/share/nginx/html;
		    index index.html index.htm;

		    server_name localhost;

		    location / {
		        try_files $uri $uri/ =404;
		    }
		}
{% endcodeblock %}


Make the following changes to the config so it looks like this:
{% codeblock %}
		server {
		    listen 80 default_server;
		    listen [::]:80 default_server ipv6only=on;

		    root /var/www/yourdomain.com/public;
		    index index.php index.html index.htm;

		    server_name server_domain_name_or_IP;

		    location / {
		        try_files $uri $uri/ /index.php$is_args$args;
		    }

		    error_page 404 /404.html;
		    error_page 500 502 503 504 /50x.html;
		    
		    location = /50x.html {
		        root /var/www/yourdomain.com/public;
		    }

		    # pass the PHP scripts to FastCGI server listening on /var/run/php5-fpm.sock
        	location ~ \.php$ {
                try_files $uri /index.php =404;
                fastcgi_pass unix:/var/run/php5-fpm.sock;
                fastcgi_index index.php;
                fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
                include fastcgi_params;
        	}
		}
{% endcodeblock %}

Replace /var/www/yourdomain.com/public  with whatever folder you'd like to use for your website (what you created earlier), and replace *server_domain_name_or_IP* with your server domain name or IP. 

Now restart your web services:

{% codeblock %}
sudo service php5-fpm restart
sudo service nginx restart
{% endcodeblock %}

Now we can create a test file to check your PHP configuration:

{% codeblock %}
nano /var/www/yourdomain.com/public/phpinfo.php
{% endcodeblock %}

Add the following:

{% codeblock lang: php %}
<?php phpinfo();
{% endcodeblock %}


Now bring up the page in a browser and you should see this:

{% img center https://www.jeremymorgan.com/images/how-to-lemp-ubuntu-4.jpg "How to set up a LEMP Server on Ubuntu 14.04" %}

And you're done!! Now you can add in your files and start building websites or applications. In future articles I'll show some good deployment methods for your new website. 

{% include custom/asides/programming-footer.html %}
---
comments: true
sharing: true
date: 2009-02-07 15:47:42
layout: post
slug: how-to-install-wordpress
title: How to install WordPress
wordpress_id: 97
categories:
- Tutorials
permalink: /tutorials/wordpress-help/how-to-install-wordpress/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/wordpress-ogimage.png
tags:
- blog
- seo
- wordpress
description: A step by step guide for installing Wordpress
---

Want to know how to install WordPress on your website? It's super easy! First off, here is what you'll need:

A webserver running PHP 4.3 or greater
A webserver with mysql 4.0 or greater. 

That's it! While I would recommend using Apache under Linux, it's not required. I'm going to show how to install it on a godaddy hosted site, but it's pretty similar on any web host. 

First Step: Get WordPress

Go here to [download WordPress to your computer](http://wordpress.org/download/). Save the file somewhere on your hard drive, I chose my desktop. Open up the zip file:

[caption id="" align="alignnone" width="370" caption="The wordpress folder inside the zip file"][![The wordpress folder inside the zip file](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-01.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-01.jpg)[/caption]

Select **File -> Extract** Unzip the folder somewhere convenient, I chose "C:web" which is where I put my website files. 

[caption id="" align="alignnone" width="381" caption="Unzip files into a folder"][![Unzip files into a folder](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-02.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-02.jpg)[/caption]

Next Step: Upload files to your site

You want to upload all the files as they are to your server. Personally, I use [FileZilla](http://filezilla-project.org/download.php) to transfer FTP files to my server. Here is some more detail on [how to use FileZilla to upload files](http://help.banff.org/using_filezilla/index.html). 

You can also use a file manager if your webhost supports it. Godaddy has a file manager utility that works fairly well. 

**Select Hosting -> My Hosting Account -> Manage Account**
In the hosting center, select "Your Files":
[![](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-03.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-03.jpg)

This file manager will allow you to upload all the wordpress files into a folder. You can either upload everything into the root of the site, or create a special folder for it, such as /blog or /journal. If you install it in the main site, then your whole site will be a wordpress blog. If you create a folder, it will simply be an extension to your existing site. It's up to you. 

**Create a database **

The next step is pretty important. You need to create a database. There are many ways to do this, and I won't go into all of them here, but what you'll need for wordpress is:



	

  * Database Name


  * Database User Name


  * Database Password



For Godaddy, here are some instructions: [how to create a mysql database on godaddy](http://help.godaddy.com/article/36) or, here are some general instructions: [how to create a mysql database](http://www.webpronews.com/topnews/2005/06/06/mysql-for-beginners-how-to-create-a-mysql-database).

Once you have this information handy, open up your website where wordpress is located (either http://www.yoursite.com or http://www.yoursite.com/blog

You may get the Following Message:



> There doesn't seem to be a wp-config.php file. I need this before we can get started. Need more help? We got it. You can create a wp-config.php file through a web interface, but this doesn't work for all server setups. The safest way is to manually create the file.



Go ahead and click on "Create a Configuration File". On the next page click "Lets go". 

Enter your database information in the fields below:
[caption id="" align="alignnone" width="582" caption="Wordpress Configuration Information"][![Wordpress Configuration Information](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-04.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2009/02/how-to-install-wordpress-04.jpg)[/caption]

Then click "start install"

Enter the name of your blog "Ex: Jeremy's SEO Blog" and your email address, and click install. 

Make sure you put a checkbox where it says "Allow my blog to appear in search engines like Google and Technorati." (unless you don't of course). 

**You're done!!**

That's really all there is to it. Wordpress is famous for it's easy install process, and now you know why. You can do it in five minutes or less, and have a fully functioning blog. Be sure to check out other parts of my blog for WordPress plugins, tips and tricks. 

Happy Blogging!


{% include custom/asides/tutorials-footer.html %}






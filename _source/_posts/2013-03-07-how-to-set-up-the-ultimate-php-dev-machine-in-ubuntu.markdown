---
layout: post
title: "How to Set up the Ultimate PHP Dev Machine in Ubuntu 13.04"
date: 2013-03-07 19:55
comments: true
sharing: true
description: How To Set up the Ultimate PHP Development Machine in Ubuntu 13.04 (Raring Ringtail) and write better software.
categories:
- "Tutorials"
- "Ubuntu"
permalink: /tutorials/linux/ultimate-php-ubuntu-13-04-raring-ringtail/
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png
author: Jeremy Morgan
---
Today I'm going to tell you how to build the ultimate PHP development environment in Ubuntu 13.04 (Raring Ringtail). PHP has been getting a lot of flack lately, but there is still a lot of enterprise level professional development going on with this language. And hey, I love .Net programming but you can build solid, quality PHP applications with the right knowledge and the right tools. Today I'll tell you how set that up. 
<!-- more -->
###What we'll need

This is going to be a fairly long tutorial, but worth the trouble. In order to set up a this development environment, here is what we'll need:

- A PHP 5 Installation.
- A local instance of a Web Server.
- An IDE
- A debugger
- A unit tester

This is an enterprise class setup, and believe it or not the entire thing is free. That's what makes this so much cooler than developing .Net in Visual Studio. All you need is a computer. 

###Set up PHP and our Web Server

The first thing we'll want to do is set up our web server. What this will do is put a local server on your machine for development. You really don't want to be saving and uploading to a server over and over, especially for a big project. 

There are a few ways we can do this:

**Compile from Source** - The best option for custom stuff and the most performance. It's a great way to do it, but not how we're going to set it up today. 

**Install from apt-get or Software Center** - Also a great option, super easy and a good way to get the latest and greatest. Also not the way we're going to do it today. 

**Install Zend Server ** because of the extra tools and nice integration, we're going to be using the Zend Server Community edition. It's an easy setup, and free. 

Download [Zend Server Here](http://www.zend.com/en/products/server/ "Zend Server") and save it. 

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-1.png)

Now click on the home folder and go to downloads, and you'll see it:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-2.png)

Double click it and extract it somewhere. I just put it in the download folder. 

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-3.png)

Sorry if some of this seems kind of basic, but I want to make sure everyone gets a chance to do this. If you have any questions feel free to comment.

#### Install Zend Server

To install this, we will run a script in the terminal. Zend provides a script for Ubuntu that sets up your repositories and downloads a fresh version and saves you a lot of work. 

Click the launcher in the upper left corner of the screen, and type in "terminal". Then click the terminal icon. 

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-4.png)

In the terminal, type in

<pre>
sudo -s
</pre>

and hit enter. This will make you root. Then go to your download folder and type in 

<pre>
./install_zs.sh 5.4
</pre>

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-5.png)

And the script will start. After it updates everything if it's successful it will ask you:

<pre>
Need to get 101 MB of archives
After this operation, 340 MB of additional disk space will be used. 
Do you want to continue [Y/n]?
</pre>

Click Y to continue. If you have a slow connection or computer, go grab a soda. 

If it's successful, you'll see this screen:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-6.png)

Now, open FireFox and go to the following web address:

<pre>
http://localhost:10081/ZendServer
</pre>

Agree to the terms of service and click next. 

Select "Development" and click next.

Enter the password you want to use for the admin interface.

###How to make sure it's the free version

Once the web interface is open, you will see this is a "Zend Server Enterprise Trial". If you want to use the full version during the trial, or even purchase it that's great. But if you can't afford the price tag or just need the bare features, go up to the upper right hand corner to your messages:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-7.png)

And then click details

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-8.png)

And select "Use free edition". Don't worry, it will still have plenty of awesome stuff for us to use. 

###Set up your web folder

By default the website's files are published to /var/www. Usually people either set up virtual user directories or point the web root. The simplest way, is just to add permissions for your account to access the web folder:

<pre>
sudo chown -R [your username] /var/www
</pre>

That way you can write to the /var/www folder. You can even create a symbolic link to a folder in your home folder. One thing I usually do is:

<pre>
ln -s /var/www/ /home/jeremy/
</pre>

This makes it a little quicker to get to my web folder after logging in.

###Create your php info page

If you're a php dev, you've likely done this a million times. In your web directory, create a file called phpinfo.php (or whatever you want). Inside that file put the following code:

{% codeblock %}
<?php phpinfo(); ?>
{% endcodeblock %}

And load it up in your browser. You can use this page to see all your PHP settings. 

### Make your utilities usable system wide. 
  
Zend Server installs stuff like PEAR, PECL, etc but it's not installed in the usual locations and it isn't in your path. Run these commands to make them avaialable system wide. 
  
<pre>
sudo ln -s /usr/local/zend/bin/zendctl.sh /usr/sbin/zendctl
sudo ln -s /usr/local/zend/bin/pear /usr/sbin/pear
sudo ln -s /usr/local/zend/bin/pecl /usr/sbin/pecl
sudo ln -s /usr/local/zend/bin/php /usr/sbin/php
sudo ln -s /usr/local/zend/bin/phpize /usr/sbin/phpize
</pre>


###Install XDebug
  
We're going to set up some Debuggers you can use to get a better idea of what's going on with this program. Many PHP developers neglect debuggers for some reason, but they really are helpful and do save you a lot of time. The Zend Debugger is already installed with the Zend server, but we're going to add XDebug too, in case you prefer that. There are valid reasons to use both of them. 

<pre>
sudo apt-get install m4
sudo apt-get install autoconf
sudo pecl install xdebug
</pre>

After that completes, you'll need to add the xdebug.so to your extention

<pre>
sudo nano /usr/local/zend/etc/conf.d/debugger.ini 
</pre>

add the following line at the TOP of the file:

<pre>
zend_extension=/usr/local/zend/lib/php_extensions/xdebug.so
</pre>

CTRL+X they "Y" to save. Then restart the server:

<pre>
sudo /etc/init.d/zend-server restart
</pre>

Now, you can check to see if xdebug installed properly:

<pre>
php -i | grep xdebug
</pre>
 
You should see output similar to this:
  
<pre>
xdebug
xdebug support => enabled
xdebug.auto_trace => Off => Off
xdebug.cli_color => 0 => 0
xdebug.collect_assignments => Off => Off
xdebug.collect_includes => On => On
xdebug.collect_params => 0 => 0
xdebug.collect_return => Off => Off
xdebug.collect_vars => Off => Off
xdebug.coverage_enable => On => On
xdebug.default_enable => On => On
xdebug.dump.COOKIE => no value => no value
xdebug.dump.ENV => no value => no value
xdebug.dump.FILES => no value => no value
xdebug.dump.GET => no value => no value
xdebug.dump.POST => no value => no value
xdebug.dump.REQUEST => no value => no value
xdebug.dump.SERVER => no value => no value
xdebug.dump.SESSION => no value => no value
xdebug.dump_globals => On => On
xdebug.dump_once => On => On
xdebug.dump_undefined => Off => Off
xdebug.extended_info => On => On
xdebug.file_link_format => no value => no value
xdebug.idekey => no value => no value
xdebug.max_nesting_level => 100 => 100
xdebug.overload_var_dump => On => On
xdebug.profiler_aggregate => Off => Off
xdebug.profiler_append => Off => Off
xdebug.profiler_enable => Off => Off
xdebug.profiler_enable_trigger => Off => Off
xdebug.profiler_output_dir => /tmp => /tmp
xdebug.profiler_output_name => cachegrind.out.%p => cachegrind.out.%p
xdebug.remote_autostart => Off => Off
xdebug.remote_connect_back => Off => Off
xdebug.remote_cookie_expire_time => 3600 => 3600
xdebug.remote_enable => Off => Off
xdebug.remote_handler => dbgp => dbgp
xdebug.remote_host => localhost => localhost
xdebug.remote_log => no value => no value
xdebug.remote_mode => req => req
xdebug.remote_port => 9000 => 9000
xdebug.scream => Off => Off
xdebug.show_exception_trace => Off => Off
xdebug.show_local_vars => Off => Off
xdebug.show_mem_delta => Off => Off
xdebug.trace_enable_trigger => Off => Off
xdebug.trace_format => 0 => 0
xdebug.trace_options => 0 => 0
xdebug.trace_output_dir => /tmp => /tmp
xdebug.trace_output_name => trace.%c => trace.%c
xdebug.var_display_max_children => 128 => 128
xdebug.var_display_max_data => 512 => 512
xdebug.var_display_max_depth => 3 => 3
</pre>

This means it installed properly and you can now use it for debugging!


{% include custom/asides/in-article-wide.html %}


###Install Composer

Composer is one of the most awesome things to come to PHP. To install it, you will need curl to get the installer. If you don't already have it, type

<pre>
sudo apt-get install curl
</pre>

And to get the Composer installer:

<pre>
curl -sS https://getcomposer.org/installer | php
</pre>

You should see something that looks like this:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-9.png)

Note where it shows composer.phar is. We want to move that to our path so we can call composer from anywhere. 

<pre>
sudo mv composer.phar /usr/local/bin/composer
</pre>

That's it! 

###Install PHPUnit

Now we want to install PHPUnit so we can do unit testing in our environment. 

Here is how you do it: 

<pre>
sudo pear config-set auto_discover 1
sudo pear clear-cache
sudo Pear install pear.phpunit.de/PHPUnit
</pre>

This will use pear to install PHP unit for you. If you would like you can <a href="http://www.phpunit.de/manual/3.0/en/writing-tests-for-phpunit.html">Build a test case for PHPUnit</a> to make sure it's working properly. 

###Install JRE
  
You will need the JRE to run Eclipse, if you don't already have it installed, you'll need to download it from here: 
  
* <a href="http://download.oracle.com/otn-pub/java/jdk/7u17-b02/jre-7u17-linux-i586.tar.gz">JRE 32 bit</a> 
* <a href="http://download.oracle.com/otn-pub/java/jdk/7u17-b02/jre-7u17-linux-x64.tar.gz">JRE 64 bit</a>
  
Save the archive in your downloads folder. 

I like to install this one fresh, especially with the latest Java Security issues going around. Run the following to remove any old versions:

<pre>
sudo apt-get purge openjdk*
</pre>

Now, go to where you saved the file (for me it was /home/jeremy/Downloads) and extract it:

<pre>
tar -xvzf jre-7u17-linux-x64.tar.gz
sudo mkdir -p /usr/lib/jvm/jre1.7.0
sudo mv jre1.7.0_17/* /usr/lib/jvm/jre1.7.0/
sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jre1.7.0/bin/java 0
</pre>

While you're here, you may as well set it up for Firefox as well:

<pre>
mkdir ~/.mozilla/plugins 
ln -s /usr/lib/jvm/jre1.7.0/lib/i386/libnpjp2.so ~/.mozilla/plugins/
</pre>

###Install Eclipse

We're going to install the Eclipse PDT plugin by Zend. You might notice we're using a lot of Zend products: this is for consistency between the products but it's by no means a requirement. 

<a href="http://www.zend.com/en/community/pdt/downloads">Eclipse PDT download Page</a>

Click on your version (32 or 64 bit) and again, open with the archive manager. You might note that Eclipse is a standalone application, so it doesn't have an "Installer" and you can put it anywhere. 

I just extract mine into /home/jeremy and run it from there. Open the folder and click on the eclipse-php icon:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-10.png)
  
It will ask you to save a workspace. You will want to make this your web root. 
  
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-11.png)
  
And let's create a new project. Go to the New button and select new -&gt; PHP Project. 
  
I usually configure it something like this:
 
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-12.png)
  
Now we have an open project we can work with. Create an index.php file and open it up. Put in the following code:
 
{% codeblock %}
$somevar = "test";

echo "This is a " . $somevar;
{% endcodeblock %}

Now we'll set up Eclipse and play around with it a little. 

###Configuring Eclipse

The first thing we want to do is go to Project -&gt; Properties. 

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-13.png)

In the properties window, select <strong>PHP Debug</strong> and check "Enable project specific settings". 

You'll notice here you can choose your debugger:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-14.png)

Click on:
"Enable CLI Debug" 
"PHP Executables"
"Add"
  
In the next window, put the following information to point to your PHP executables. 
  
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-15.png)

Now you can do CLI debugging whenever you need to. 
  
Let's set up web debugging. Click on the little green bug and select "Debug Configurations".
  
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-16.png)
 
Set up this screen to look like this:
  
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-17.png)
 
Then click "configure" and make sure it's set up like this:
 
![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-18.png)

Save the settings. 

###Do a test run

Now you have it set up, so click on the green bug again and select "index". You'll see a screen that looks like this:

![Install PHP in Ubuntu 13.04 Raring Ringtail](https://www.jeremymorgan.com/images/php-development-in-ubuntu-13-04-raring-ringtail-19.png)

This, of course is your debug screen. This shows you all your variable data, and a lot more. 

With this you are now ready to rock!

###Conclusion

Ok so that was definitely a lot of setup, but I hope it at least gives an idea of what a professional level PHP development environment should look like. You should have debugging and Unit testing going with all of your PHP applications no matter what. Much of the bad reputation associated with PHP is from people "gluing" stuff together and hacking up nasty solutions and leaving them around for years. One way to improve the reputation of PHP is to start building better code, and I think this set up helps with that.

All the software in the world configured perfectly won't make you write better code. THat's up to you, and something I'll cover in future tutorials as well, and I'll show you some ways to make your PHP solutions solid, fast and enterprise ready. 

{% include custom/asides/tutorials-footer.html %}

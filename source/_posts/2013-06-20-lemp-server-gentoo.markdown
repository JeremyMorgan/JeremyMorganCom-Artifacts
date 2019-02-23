---
layout: post
title: "How to Setup a LEMP Server in Gentoo"
date: 2013-06-20 17:59
updated: 2018-03-25 12:22
comments: true
categories: 
- Linux
- Tutorials

description: In this tutorial I layout the steps to build a LEMP ( Linux NginX MariaDB PHP) server in Gentoo Linux. It's a long one, but you'll have a fast server at the end! 

permalink: /tutorials/linux/how-to-setup-lemp-server-gentoo/
ogimage: https://www.jeremymorgan.com/images/gentoo-lemp-server-og.jpg

---
{% include custom/asides/tutorials-footer.html %}
You reach a certain point as a developer when a plain old web hosting account just isn't enough. Whether you build a project that gets wildly popular or you just start finding custom stuff to do eventually want to run your own Web Server. Today I'm going to show you how to set up a screaming fast LEMP server you can use to host your projects or websites. 

<!-- more -->

To start this tutorial, I started with a fresh install of Gentoo Linux. You can get one too for about <a href="http://www.linode.com/?r=4ce22489efcec5edefb7af7e815c55675b59120c">$20 USD a month here</a>. I have nothing but praise for this company as they provide fast Virtual servers for a very reasonable price. Check em out!

###The Gameplan
{% img right https://www.jeremymorgan.com/images/gentoo-lemp-server-og.jpg "How to set up a LEMP server in Gentoo" %}
We're going to be setting up a nice fast web server. It's going to use:

* NginX
* Google PageSpeed Module
* SPDY
* PHP 5.4
* MariaDb

This combination will make for a smoking fast server, but it isn't easy. We'll be compiling Nginx by hand as well to include everything. Don't worry it's not as bad as it sounds. 

##1. Update Gentoo


Whether you're starting from scratch or working with an existing server you'll want to make sure your sources are all up to date. 

<pre>
emerge --sync
emerge portage
etc-update ( I usually choose -3 )
emerge --update --deep --with-bdeps=y world
</pre>

Go get a cold glass of Orange soda, because this will take a while.

<pre>
etc-update (again)
eselect profile set default/linux/amd64/13.0 (* optional - My linode server profile)
</pre>

Once that's done you're ready to start building. 

##2. Get our Software 


We're going to be doing some compiling here so we need to get some sources and put it together. 

<pre>
cd ~
mkdir build
cd build
</pre>

####Get Nginx

<pre>
cd ~
wget http://nginx.org/download/nginx-1.5.1.tar.gz
tar -xvzf nginx-1.5.1.tar.gz
</pre>

We are going to build this scratch, but not yet. 


####Get the PageSpeed Module

<pre>
cd ~
wget https://github.com/pagespeed/ngx_pagespeed/archive/release-1.5.27.3-beta.zip
unzip release-1.5.27.3-beta.zip
cd ngx_pagespeed-release-1.5.27.3-beta/
wget https://dl.google.com/dl/page-speed/psol/1.5.27.3.tar.gz
tar -xzvf 1.5.27.3.tar.gz
</pre>

####Install PHP + FPM

This is the best way to install PHP on your system. We're also going to add in GD and MySQLi, as well as the Geo-IP plugin. These are all optional depending on your needs. 

<pre>
echo "dev-lang/php ~amd64" >> /etc/package.keywords
echo "dev-lang/php" >> /etc/package.unmask
echo "dev-lang/php fpm" >> /etc/package.use
echo "dev-lang/php gd" >> /etc/package.use
echo "dev-lang/php mysqli" >> /etc/package.useemerge dev-lang/php
emerge Geo-IP
emerge media-libs/gd 
emerge -av php
</pre>

This will give you PHP with the options we'll need for our server. 


###Configure and Build Nginx

For the configuration we're going to add in the page speed model, as well as SPDY, GeoIP, gzip static and and an image filter module. This will give us a nice set of options for our web server. 

<pre>
./configure --with-http_ssl_module --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx_error.log \
  --http-log-path=/var/log/nginx_access.log \
  --pid-path=/usr/local/nginx/nginx.pid \
  --add-module=$HOME/build/ngx_pagespeed-release-1.5.27.3-beta \
  --with-http_spdy_module \
  --with-http_geoip_module \
  --with-http_gzip_static_module \
  --with-http_image_filter_module  \
  --user=nobody \
  --group=nobody \
  --prefix=/usr
</pre>

If you don't receive any errors, you're ready to make:

<pre>
make && make install
</pre>

Now comes the fun stuff!

##3.Configure NginX

Now we have to configure Nginx by editing the nginx.conf file. 

<pre>
sudo nano /etc/nginx/nginx.conf
</pre>

Note that you can create multiple configuration files and load nginx with them, like profiles but that's for another time. Just remember it is an option if you want to try different configs. You can load a file per server, or per website. 

For now we're going to do it globally throughout the server. 

####Tip: Download your Nginx conf file

This is optional, but it makes life easier. Download your nginx.conf on to your desktop so you can edit it in on your desktop. In OSX or Linux/Unix you can simply type the following at a command prompt:

<pre>
scp root@[your domain or ip address]:/etc/nginx/nginx.conf .
</pre>
 
This will copy it to whatever directory you're in, so you can edit it in GEdit or SublimeText or whatever. If you're using Windows you can use something like <a href="http://winscp.net/eng/index.php" rel="nofollow">WinSCP</a> to do same thing. 

When you're ready to send it back:

<pre>
scp nginx.conf root@[your domain or ip address]:/etc/nginx/nginx.conf
</pre>

**Note**
It's always good to match your processes to the amount of cores/CPUs your server has. A good way to find out is run this command:

<pre>
cat /proc/cpuinfo | grep processor | wc -l
</pre>

Note this as the amount of worker processes you should set in Nginx. 

 

####Start Configuring

You will want to create a folder /var/ngx_pagespeed_cache and make it writeable by nginx. 

<pre>
mkdir /var/ngx_pagespeed_cache
chown -R nobody:nobody /var/ngx_pagespeed_cache
</pre>

You will also want to create your web folder. For me I chose the /var/www convention:

<pre>
mkdir -p /var/www/innovatsiya.com/public_html
chown -R nobody /var/www/innovatsiya.com/
</pre>

<pre>
ulimit -n 200000

# add the following to keep on reboot:
vim /etc/security/limits.conf
*        -              nofile                  200000
</pre>


Add the following to your nginx.conf

<pre>
user  nobody;
</pre>

Change your worker processes to the number you get from the command below. For my linode it is:

<pre>
worker_processes  8;
</pre>

###nginx.conf

For my NginX config, I decided to borrow the <a href="http://www.6tech.org/2013/02/nginx-tuning-with-php-fpm-and-memcached/">optimized nginx.conf</a> found on 6tech and do some modifications. Here is what mine looks like:

<pre>
#----------------------------------------------------------------------
# Main Module - directives that cover basic functionality
#
#   http://wiki.nginx.org/NginxHttpMainModule
#
#----------------------------------------------------------------------
 
user nobody;
worker_processes  8;
worker_rlimit_nofile 200000;
 
error_log  /var/log/nginx_error.log;
#error_log  /var/log/nginx/error.log  notice;
#error_log  /var/log/nginx/error.log  info;
 
pid        /var/run/nginx.pid;
 
#----------------------------------------------------------------------
# Events Module
#
#   http://wiki.nginx.org/NginxHttpEventsModule
#
#----------------------------------------------------------------------
 
events {
      worker_connections  4000;
        use epoll;
        multi_accept on;
}

#----------------------------------------------------------------------
# HTTP Core Module
#
#   http://wiki.nginx.org/NginxHttpCoreModule
#
#----------------------------------------------------------------------
 
http {

#----------------------------------------------------------------------
# Google PageSpeed Module
#
#   https://github.com/pagespeed/ngx_pagespeed
#
#----------------------------------------------------------------------

    pagespeed on;
    pagespeed FileCachePath /var/ngx_pagespeed_cache;

    include         /etc/nginx/mime.types;
    include     /etc/nginx/sites-enabled/*;
    default_type  application/octet-stream;
 
    log_format  main  '$remote_addr - $remote_user [$time_local] "$request" '
                      '$status $body_bytes_sent "$http_referer" '
                      '"$http_user_agent" "$http_x_forwarded_for"';
 
    access_log  off;
 
    sendfile    on;
    open_file_cache max=200000 inactive=20s;
    open_file_cache_valid 30s;
    open_file_cache_min_uses 2;
    open_file_cache_errors on;
    tcp_nopush on;
    tcp_nodelay on;
    keepalive_timeout 30;
    keepalive_requests 100000;
    reset_timedout_connection on;
    client_body_timeout 10;
    send_timeout 2;
 
    # Load config files from the /etc/nginx/conf.d directory
    # The default server is in conf.d/default.conf
    include /etc/nginx/conf.d/*.conf;
 
    gzip on;
    gzip_min_length 10240;
    gzip_proxied expired no-cache no-store private auth;
    gzip_types text/plain text/css text/xml text/javascript application/x-javascript application/xml;
    gzip_disable "MSIE [1-6]\.";
 
}

</pre>

Notice we've added in some gzip stuff, set some file cache options and added in google PageSpeed. 

####Your Site Config

Create a folder in your /etc/nginx folder:

<pre>
mkdir /etc/nginx/sites-enabled
</pre>

and create a file in there for your server. I named mine innovatsiya.com but obviously you'll need to replace it with your own domain. 

Here is what mine looks like:

<pre>
server {

  listen *:80;
  server_name *.innovatsiya.com innovatsiya.com;

  #pagespeed stuff
  location ~ "\.pagespeed\.([a-z]\.)?[a-z]{2}\.[^.]{10}\.[^.]+" { add_header "" ""; }
  location ~ "^/ngx_pagespeed_static/" { }
  location ~ "^/ngx_pagespeed_beacon$" { }
  location /ngx_pagespeed_statistics { allow 127.0.0.1; deny all; }
  location /ngx_pagespeed_message { allow 127.0.0.1; deny all; }

  #root files
  $location / {
      autoindex  on;
      root   /var/www/innovatsiya.com/public_html/;
      index index.html index.php index.htm;
  }

  #PHP files
  location ~ \.php$ {
    include /etc/nginx/fastcgi_params;
    fastcgi_pass 127.0.0.1:9000;
    fastcgi_index index.php;
    fastcgi_param SCRIPT_FILENAME /var/www/innovatsiya.com/public_html$fastcgi_script_name;
  }
}
</pre>

You'll notice how I set up a listener, and added in the proper PageSpeed directives, and set up the fastCGI for PHP Scripts. 

You may also note that I do not have SPDY configured here. I was having some issues getting proper output, so I have saved that for another time. 

##4. Set up MariaDb


Now we're going to set up our database. You might be asking "Hey, isn't the M in LEMP supposed to be for MySQL?" and the answer is yes and no. 

MariaDB has been a better drop in replacement for MySQL for quite a while now. The reasons are outside the scope of this article. If you really want it you can install MySQL, but I wouldn't recommend it. 

<pre>
echo "dev-db/mariadb" >> /etc/portage/package.keywords
emerge -va dev-db/mariadb
dispatch-conf
./usr/share/mysql/scripts/mysql_install_db --basedir=/usr
/etc/init.d/mysql start
</pre>

You will need to set a password for the root user:

<pre>
/usr/bin/mysql_secure_installation
</pre>

Follow the prompts, and enter your root password. Remove the test and anonymous access stuff for security. 

Now type in:
<pre>
mysql -u root -p
</pre>

You should see a screen that looks like this:

{% img https://www.jeremymorgan.com/images/gentoo-lemp-server-2.jpg "Lemp server in Gentoo" %}

If so, you're ready to go!


##5. Startup the Server

Check your config file to make sure there aren't any errors:

<pre>
nginx -t
</pre>

If there aren't any, start it up:
<pre>
nginx
/etc/init.d/php-fpm start
</pre>

To test your server and make sure it's output is what you expect, run

<pre>
curl -i http://localhost
</pre>

and you should see something like this:

{% img https://www.jeremymorgan.com/images/gentoo-lemp-server.jpg "Lemp server in Gentoo" %}

Note the header **X-Page-Speed: 1.5.27.3-3005**. This will show the PageSpeed module installed correctly. 

Create some test files in your web root, and after that you should be ready to go!!

You now have a super fast server, dialed in to really handle traffic quickly. 

###Conclusion

Setting up a server this way is a long, tedious process. But you know you're getting the best software compiled exactly how you like it. You can make a lot of changes to this configuration and really nitpick every part till it's exactly how you want. 

Is it for everyone? Definitely not. You can just as easily build an Ubuntu machine and run a bunch of apt-get commands and get the same thing. The performance difference is pretty negligible. But, that being said if you're running a very high traffic site, having a bunch of "dialed in" Gentoo linodes will make a difference. The choice is up to you. 

This will be an ongoing document, so keep an eye out for changes, and I welcome any feedback you might have in the comments.  
{% include custom/asides/tutorials-footer.html %}





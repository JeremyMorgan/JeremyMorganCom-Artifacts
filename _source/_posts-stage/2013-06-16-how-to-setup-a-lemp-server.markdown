---
layout: post
title: "How to Setup a Linux Server"
date: 2013-06-16 17:59
comments: true
categories: Tutorials
permalink: /tutorials/linux/how-to-setup-lemp-server/

---
You reach a certain point as a developer when a plain old web hosting account just isn't enough. Whether you build a project that gets wildly popular or you just start finding custom stuff to do eventually want to run your own webhost. Today I'm going to show you how to set up a screaming fast LEMP server you can use to host your project. 

###Get your OS in Gear

For this project I decided on using Ubuntu 13.04 for various reasons, but mostly because it sets up in the shortest amount of time. These packages are built for Ubuntu but you can set them up with other distros it's just a lot more work. 

When I started the project I was using Gentoo, but after a few hours of compiling and making very little progress, I figured that time could be better spent actually developing stuff. 

So I have my server set up with a fresh install of Ubuntu 13.04. You might be asking: a dedicated server, just to play around with? Isn't that expensive? No, you can get one too for about <a href="http://www.linode.com/?r=4ce22489efcec5edefb7af7e815c55675b59120c">$20 USD a month here</a>. I have nothing but praise for this company as they provide fast Virtual servers for a very reasonable price. Check em out! 

####Get up to date

You want to make sure all your sources are up to date. 

<pre>
sudo apt-get update
sudo apt-get dist-upgrade
</pre>

Now set your hostname:

<pre>
hostname
(whatever host name you want)
/etc/init.d/hostname restart
</pre>

This shouldn't take too long as most of your system is updated and built, this just makes sure you're up to date. 

###How we're going to do this

We're going to be compiling Nginx from source. But first we're going to build some add ons: 

* Google PageSpeed Module
* SPDY
* Hip Hop

This combination will make for a smoking fast server, but it isn't easy. We'll be compiling Nginx by hand as well to include everything. Don't worry it's not as bad as it sounds. 

###Get our software

First we'll grab a copy of NginX. The latest version at this time is 1.5.1

<pre>
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

####Install Hip Hop


You'll need to build a lot of dependencies for this. 

<pre>
sudo apt-get install git-core cmake g++ libboost-dev libmysqlclient-dev \
  libxml2-dev libmcrypt-dev libicu-dev openssl build-essential binutils-dev \
  libcap-dev libgd2-xpm-dev zlib1g-dev libtbb-dev libonig-dev libpcre3-dev \
  autoconf libtool libcurl4-openssl-dev libboost-system-dev \
  libboost-program-options-dev libboost-filesystem-dev wget memcached \
  libreadline-dev libncurses-dev libmemcached-dev libbz2-dev \
  libc-client2007e-dev php5-mcrypt php5-imagick libgoogle-perftools-dev \
  libelf-dev libdwarf-dev libunwind8-dev subversion \
  libboost-regex-dev libcurl4-openssl-dev libgoogle-glog-dev libjemalloc-dev
</pre>

Once that's all installed you shouldn't get any errors, and should be able to start the install. 

Get the Hip Hop Source Code:

<pre>
mkdir dev
cd dev
export CMAKE_PREFIX_PATH=`pwd`
git clone git://github.com/facebook/hiphop-php.git
</pre>

We'll need some 3rd party libraries:

<pre>
git clone git://github.com/libevent/libevent.git
cd libevent
git checkout release-1.4.14b-stable
cat ../hiphop-php/hphp/third_party/libevent-1.4.14.fb-changes.diff | patch -p1
./autogen.sh
./configure --prefix=$CMAKE_PREFIX_PATH
make
make install
cd ..

</pre>

####Build Hip Hop

Next we're going to build the Hip Hop VM. 

<pre>
cd hiphop-php
export HPHP_HOME=`pwd`
cmake .
make
</pre>

Go get yourself an Orange soda, this compile takes a while. 

### Build Nginx

Now comes the moment of truth! 

<pre>
./configure --with-http_ssl_module --conf-path=/etc/nginx/nginx.conf \
  --error-log-path=/var/log/nginx_error.log --http-log-path=/var/log/nginx_access.log \
  --add-module=$HOME/ngx_pagespeed-release-1.5.27.3-beta --with-http_spdy_module --prefix=/usr
</pre>

This is the config string that will add in SPDY and the Google PageSpeed stuff. Then of course, make it:

<pre>
make && make install
</pre>

If you don't get any errors, you're ready to start configuring!


###Configuring Nginx

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

This is the amount of worker processes you should set in Nginx. 

Let's set up the NginX configuration. 

Change your worker processes to the number you get from the command below. For me it is 

<pre>
worker_processes  8;
</pre>

Also you want to create a folder /var/ngx_pagespeed_cache and make it writeable by nginx. 

<pre>
mkdir -p
</pre>

Within the http { } section add the following:

<pre>
server_tokens	off;
pagespeed on;
pagespeed FileCachePath /var/ngx_pagespeed_cache;

sendfile        on;
#tcp_nopush     on;

keepalive_timeout  10 10;

gzip  on;
gzip_comp_level 6;
gzip_proxied any;
gzip_types text/plain text/html text/css application/x-javascript text/xml application/xml application/xml+rss text/javascript image/png image/gif image/jpeg image/jpg;
gzip_disable     "MSIE [1-6]\.";
    
</pre>

Now make a new folder:

<pre>
mkdir -p /etc/nginx/sites-enabled/
</pre>

Create a file called /etc/nginx/sites-enabled/default and put in the following info:

<pre>
server {
        listen *:80 default;
        server_name _;
location / {

	      deny all;

	}

}
</pre>

This will setup a default vhost that denies all requests per the instructions on the hip hop page, to prevent people from pointing their domain at your server without your permission. 

Now we'll create a new file:

####/etc/nginx/sites-enabled/innovatsiya.com 

<pre>
server {
        listen *:80;
        server_name *.innovatsiya.com innovatsiya.com;

       location / {
           root   __SERVER_ROOT__;
           index  index.html index.php index.htm;
       }

       location ~ \.php$ {
        proxy_set_header   X-Real-IP        $remote_addr;
        proxy_set_header Host www.innovatsiya.com;
        proxy_pass   http://localhost:4247;
      }
}</pre>


Start the hip hop server
<pre>
nohup /usr/sbin/hhvm -m server &
</pre>
 

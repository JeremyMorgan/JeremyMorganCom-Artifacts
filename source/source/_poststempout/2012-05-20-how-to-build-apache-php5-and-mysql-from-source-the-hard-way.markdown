---
comments: true
date: 2012-05-20 15:49:56
layout: post
title: 'Linux Tutorial: How to Build Apache, PHP5 and MySQL from Source ( The Hard Way)'
wordpress_id: 1134
categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-build-apache-php5-and-mysql-from-source-the-hard-way/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png

description: A step by step guide for building a LAMP stack from source for ultimate customization.

tags:
- apache
- gcc
- How to
- linux
- linux how to
- linux tutorials
- mysql
- mysql tutorials
- mysql5
- PHP
- php from source
- php tutorials
- php5
- ppc
- source build
- tarball
- yellow dog linux
---

My last article on this subject was about building the trinity (Apache, PHP, MySQL) the easy way using XAMPP. Now I'm going to show you how to do it the hard way, building everything from source, the way Linus intended. Let's get started.




## Step 1: Determine if it's right for you.


This is not the only way to get a LAMP server going and not always the best way. You can get these files from your package manager in your favorite distribution or use something like XAMPP like I mentioned in previous articles. For most developers this a perfectly acceptable way to do it, and likely a better use of your time. Here are the reasons you would want to build from source:

**[![Gangsta Tux always builds from source.](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/tux-gangsta.png)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/tux-gangsta.png)You should only build from source if:**



	
  * You have a good idea of what you're doing.

	
  * You have time and patience.

	
  * You want the latest and greatest stuff and your package manager doesn't have it yet.

	
  * You want to do something really custom and need to change crucial options.

	
  * You want full control over the installation details.

	
  * You need the maximum performance and stability possible.

	
  * You want to learn something.


If those don't apply to you, then [head over to this site](http://www.apachefriends.org/en/xampp.html) and get XAMPP, it's an awesome project.


## Step 2: Get Sources.


Here is all the stuff you're going to need. I put asterisks next to the "maybe" stuff that you might not need depending on how updated your system is.

**Apache:**

[http://httpd.apache.org/download.cgi](http://httpd.apache.org/download.cgi)

**PHP:**

[http://php.net/downloads.php](http://php.net/downloads.php)

**MySQL:**

[http://dev.mysql.com/downloads/](http://dev.mysql.com/downloads/)

**Cmake: ***

[http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz](http://www.cmake.org/files/v2.8/cmake-2.8.8.tar.gz)

**Mcrypt: ***

[http://sourceforge.net/projects/mcrypt/files/Libmcrypt/](http://sourceforge.net/projects/mcrypt/files/Libmcrypt/)

**APR:**

[http://apr.apache.org/](http://apr.apache.org/)

**PCRE:**

[http://www.pcre.org/](http://www.pcre.org/)

Additional reading about setting up an Apache server can be found here:

[http://httpd.apache.org/docs/2.4/install.html](http://httpd.apache.org/docs/2.4/install.html)

**Verify your files!
**

Make sure and download the .asc file also and do a quick checksum on it. This extra few seconds is well worth the benefit. Here is how you do it with Apache:

[http://www.apache.org/info/verification.html](http://www.apache.org/info/verification.html)

You should verify all your files before building, just to make sure you didn't get a corrupt file.

Notes before you start:

You will see version numbers here, and those numbers are for the latest version of the software available when I wrote this. By the time you read this, they will have changed. If you want you can get these exact version numbers and build them exactly as in the article, but usually the newest version of the software is best.

I use "nice -20" before running make to ensure it gets priority. You don't have to do this, and usually its not even required as most kernels will prioritize it pretty well.

You do not have to be root to build this stuff, in fact you shouldn't be. You only need root privileges to install the software but you can build it with a regular user.


## Step 3: Start Building


**Install cmake:**


> ./configure --prefix=/usr --mandir=/usr/share/man
gmake


**Install MySql:**


> groupadd mysql
useradd -g mysql mysql

tar zxvf mysql-5.5.24.tar.gz (file name will differ)

cd mysql-5.5.24
./configure --prefix=/usr/local/mysql
make
make install
cd /usr/local/mysql
chown -R mysql .
chgrp -R mysql .
scripts/mysql_install_db --user=mysql
chown -R root .
chown -R mysql var
cp support-files/my-medium.cnf /etc/my.cnf

bin/mysqld_safe --user=mysql &


This will install your MySQL server. If you have issues getting it working, [consult this page](http://dev.mysql.com/doc/refman/5.5/en/installing-source-distribution.html) and follow those instructions.

**Install Mcrypt**


> bunzip2 libmcrypt-2.5.8.tar.bz2
tar xvf libmcrypt-2.5.8.tar
cd libmcrypt-2.5.8
./configure --prefix=/usr --mandir=/usr/share/man
nice -20 make
make install


**Install APR**


> tar xvzf apr-1.4.6.tar.gz /usr/src/http-2.4.2/srclib
cd apr-1.4.6
./configure
nice -20 make


**APR Utils:**


> tar xvzf apr-util-0.9.19.tar.gz
./buildconf --with-apr=/usr/src/apr-1.4.6/
./configure


**Install PCRE**


> tar xvzf pcre-8.30.tar.gz
./configure
nice -20 make
make install


**Install Apache**


> cd httpd-2.4.2
CFLAGS="-O2" ./buildconf --with-apr-util=/usr/src/httpd-2.4.2/srclib/apr-util-1.4.1 --with-apr=/usr/src/httpd-2.4.2/srclib/apr-1.4.6/ --enable-so --prefix=/usr/local/apache2
CFLAGS="-O2" ./configure
nice -20 make
make install


**Install PHP**

We are going to install PHP 5.4.3 which was the most current at the time of this writing.


> tar -xvzf php-5.4.3.tar.gz
cd php-5.4.3


**Note:** The configure paramaters are where you really customize your installation. The following is the one I used for my machine, but your needs may be different. I will show you two of them and if mine doesn't work, you can use a failsafe one.

My config:


> ./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql --with-curl=/usr/bin/curl --enable-bcmath --enable-calendar --with-curl=/usr/bin/curl --with-gdbm --enable-exif --enable-ftp --with-gd --with-freetype-dir=/usr --with-jpeg-dir=/usr --with-png-dir=/usr/bin/libpng-config --enable-gd-native-ttf --with-gettext --with-mcrypt=/usr/bin/libmcrypt-config --with-mhash --with-mysql=/usr/local/mysql/ --with-mysqli=/usr/bin/mysql_config --with-openssl --with-pdo-mysql=/usr --enable-soap --enable-wddx --with-xsl --with-zlib --enable-mbstring --enable-zip


Failsafe:


> ./configure --with-apxs2=/usr/local/apache2/bin/apxs --with-mysql


Make sure and get what you really need, but remember you can always recompile later. Now copy over a PHP.ini


> cp php.ini-development /usr/local/apache2/php/php.ini


NOTE: Here's an error you might run into:

configure: error: Cannot find MySQL header files under /usr.
Note that the MySQL client library is not bundled anymore!

If you do install the mysql client libraries:


> git clone git://github.com/Sannis/node-mysql-libmysqlclient.git
cd node-mysql-libmysqlclient
nice -20 make
make test
make clean
sudo make install


After it's built you'll need to do a couple things:


> vi /usr/local/apache2/conf/httpd.conf


Make sure this is here:


> LoadModule php5_module modules/libphp5.so


And add this to the file also:

<FilesMatch "\.ph(p[2-6]?|tml)$">
SetHandler application/x-httpd-php
</FilesMatch>

Then restart Apache:


> /usr/local/bin/apache2/apachectl restart


This will give you a nice running system! You will run into problems along the way, nothing that should be a showstopper. Good luck and if you have any questions, feel free to comment!

{% include custom/asides/tutorials-footer.html %}

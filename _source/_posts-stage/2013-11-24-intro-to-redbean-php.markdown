---
layout: post
title: "Intro to RedBean PHP"
date: 2013-11-24 00:35
comments: true
categories:
- Tutorials
permalink: /tutorials/php-tutorials/intro-to-redbean-php/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png
tags:
- how to php
- PHP
- php how to
- php tutorials
- php5
- tutorials
- upload
- redbean
---
##Intro to RedBean
So I was browsing through the usual news sites looking for something new and stumbled across this new ORM library for PHP. I know what you're thinking: "just what the PHP community needs, another ORM!" and I thought the same thing, but this one looks crazy simple and easy so I decided to try it out. I'm sharing my results with you here. 

This promises to be a dead simple ORM for PHP, so let's see how simple it really is. 

###Installing RedBean

This part is pretty easy. You can <a href="http://www.redbeanphp.com/downloadredbean.php" target="_blank">download the library here</a>, or install it with Composer. I was going to just that, until I saw this message:

>While installing RedBeanPHP using Composer is possible it's not the same as downloading the all-in-one pack. The all-in-one pack contains a file called rb.php which has been compiled using the Replica Build script. This means the R-class in the all-in-one pack contains some plugins that are not available in the aliased Facade Class of the composer package. 

So I thought I'd just install the archive of RedBean and go from there. I created a directory called "redbean", downloaded and unpacked the tarball. Imagine my surprise when I saw this:

{% img center http://localhost/jeremymorgan/images/redbean/how-to-redbean-php-01.jpg Intro to RedBean PHP %}

This is the whole library? Really? I like it so far.

Let's run the example and see what happens.

###Running the Example File

When you run the example.php, it displays a "Hello World" in the browser output. But if you open it up, you'll see it actually creates a dataset, inserts a row then displays to you. Here's how it works. 

First, you include the rb.php file:   

{% codeblock %}
require_once('rb.php');
{% endcodeblock %}

Then the setup is run:
{% codeblock %}
R::setup(); 
{% endcodeblock %}

This creates a temporty SQLite database in your /tmp folder. Now you are ready to insert a "bean" which is just a name for a dataset:

{% codeblock %}
$bean = R::dispense('leaflet');
$bean->title = 'Hello World';
{% endcodeblock %}

Then it is stored

{% codeblock %}
$id = R::store($bean);
{% endcodeblock %}

After that you can pull it from the database with ease:   

{% codeblock %}
$leaflet = R::load('leaflet',$id);
echo $leaflet->title;
{% endcodeblock %}


Seems pretty simple to me. But I don't want to use a SQLite database, so I'm going to plug into my MariaDB database and start playing around. 

###Connecting to MariaDB

This is also very easy, to connect to my MariaDB instance I simply changed the setup to look like this:

{% codeblock %}
R::setup('mysql:host=localhost; dbname=redbeanstest','jeremy','mypassword');
{% endcodeblock %}

Then, I created a database named "redbeanstest" and reran the file. Hello World shows up again! I take a look at my database and see the following:

{% img center http://localhost/jeremymorgan/images/redbean/how-to-redbean-php-02.jpg Intro to RedBean PHP %}

Pretty cool huh? So now that we know we can connect to MariaDB, let's create something. 

###Creating a simple link list

So what we want to do here is create a simple news system that shows a list of links with a title. Since this is an ORM, we will need to create objects (beans) for whatever we want to display. First let's create a schema generator, so we're not making a call to create a new bean every time. 





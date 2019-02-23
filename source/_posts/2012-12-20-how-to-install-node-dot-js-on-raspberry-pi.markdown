---
layout: post
title: "How to Install Node.js on Your Raspberry Pi"
date: 2012-12-20 01:24
updated: 2018-03-25 12:22
comments: true
description: A step tutorial for installing Node.js on your Raspberry Pi
categories: 
 - Tutorials
 - Raspberry Pi
author: Jeremy Morgan
sharing: true
permalink: /tutorials/raspberry-pi/how-to-install-node-js-raspberry-pi/
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
---

Do you want to install Node.js on your Raspberry Pi? It's actually quite a bit easier than it used to be. I just recently installed Node.js 0.8.16 on my Raspberry Pi and decided to document it. For this tutorial I'm using a setup with the latest Raspian image. 

<!-- more -->
{% include custom/asides/rpi-footer.html %}
### Installation of Node.Js 0.8.16

{% include custom/asides/raspberry-pi-4.html %}
To do this, you'll need to build Node.js from source. It's not as bad as it sounds, and actually pretty easy. We'll be getting the source from the <a href="http://www.nodejs.org/download/" rel="nofollow">downloads page at Nodejs.org</a> and compiling it from there.

For this tutorial I'm using the <a href="http://www.raspberrypi.org/downloads" rel="nofollow">Raspian "Wheezy" Image</a> but since we're compiling from source it shouldn't matter too much what version you're using. 

You'll want to go into your /usr/src directory (or some temporary directory) and use wget to download the file. 

{% codeblock %}
cd /usr/src
sudo wget http://nodejs.org/dist/v0.8.16/node-v0.8.16.tar.gz
{% endcodeblock %}

This will pull down the source tarball to your machine. You must have your Raspberry Pi connected to the internet, if you don't then <a href="http://nodejs.org/dist/v0.8.16/node-v0.8.16.tar.gz" rel="nofollow">download the file here</a> and put it on your Pi. 

{% codeblock %}
sudo tar xvzf node-v0.8.16.tar.gz
cd node-v0.8.16
{% endcodeblock %}

Next steps will build the program:

{% codeblock %}
sudo ./configure
sudo make
sudo make install
{% endcodeblock %}

><strong>Note:</strong> The make process can take quite a while, well over an hour in most cases. You may want to start the build and do something else, or if you're in a hurry you can overclock your Pi to make it build a little faster. 

###Testing your Node.js Install

Once it's built, if you don't see any errors, it should be ready to go. You can run some tests with the following command:

{% codeblock %}
sudo make test
{% endcodeblock %}

Not all of the tests will pass, but most of them should. For a quick web test, put the following code in a file called test.js:

{% codeblock lang:javascript %}
// Load the http module to create an http server.
var http = require('http');

// Configure our HTTP server to respond with Hello World to all requests.
	var server = http.createServer(function (request, response) {
	response.writeHead(200, { "Content-Type": "text/plain" });
	response.end("Hello World\n");
});

// Listen on port 8000, IP defaults to 127.0.0.1
server.listen(8000);

// Put a friendly message on the terminal
console.log("Server running at http://127.0.0.1:8000/");
{% endcodeblock %}

And save it. Then run the following command:

{% codeblock %}
sudo node test.js
{% endcodeblock %}

And then point your web browser to http://127.0.0.1:8000 and you will see a hello world! message. 

###Summary

I hope this helps folks wanting to try out node on their Raspberry Pi. In the past it was a bit tricky and for some people compiling from source can scary. But as you can see this is a pretty straightforward process. 

While it may not be the best node server to use it's great for a development environment, as most hosting companies do not offer Node.js yet. The Raspberry Pi is designed for learning and experimenting and provides a great easy platform to do that. 

So get out there and start building some node apps with non-blocking goodness! 

{% include custom/asides/rpi-footer.html %}





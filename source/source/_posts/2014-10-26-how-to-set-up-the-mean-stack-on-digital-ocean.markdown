---
layout: post
title: "How to set up the MEAN stack on Digital Ocean"
date: 2014-10-26 01:07
comments: true
author: Jeremy Morgan
categories: 
- Tutorials
description: How to set up a MEAN stack on a Digital Ocean droplet (or any Ubuntu machine for that matter)

permalink: /tutorials/angularjs/how-to-mean-stack/
ogimage: https://www.jeremymorgan.com/images/mean-stack-how-to-og.jpg
---
If you haven't heard of the MEAN stack, it's a combination of technologies for serving up fast websites, using a set of technologies paired very well together. They consist of MongoDB, Express.JS, Angular.JS, and Node.JS. For more information check out <a href="http://meanjs.org/" target="_blank">MeanJS website</a> for more details.
<!-- more -->
This is not to be confused with Mean.IO. This is also a MEAN stack, but the original creator forked it and started MeanJS instead. I find it to be less error prone and a bit more organized. 

###How to set up a MEAN stack on Digital Ocean. 

<a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4">Digital Ocean</a> is one of the greatest services for a developer. You can spin up virtualized Linux servers for as little as $5 a month, and it's a great cheap way to host your projects. 

{%img center https://www.jeremymorgan.com/images/mean-stack-how-to-1.jpg How to install MEAN Stack" %}

I know what some of you are thinking, "why not just press the MEAN app button on the console?". This is a great way to set up a MEAN stack, but I am a firm believer in doing stuff like this manually. It's important to know what you're installing and how to do it, rather than rely on GUI tools for everything. You don't really learn unless you do it.

That being said this article isn't really specific to Digital Ocean, you can follow these steps on any Ubuntu machine. <a href="https://www.digitalocean.com/?refcode=ca6f81fa42b4">Digital Ocean</a> just happens to be a good platform to try it on. 

###Get Started

To get started we're going to create a droplet. For this tutorial I created an Ubuntu 14.04 x64 version. 

The first thing you'll want to do once you log in, is update it:

{% codeblock %}
sudo apt-get update
{% endcodeblock %}

And we'll need to install Git, as it will be needed later.

{% codeblock %}
sudo apt-get install git
{% endcodeblock %}

###Install Node.JS

Before we can install Node we'll need some packages brought in:

{% codeblock %}
sudo apt-get install python-software-properties python g++ make
{% endcodeblock %}

Then we'll add a new repo:

{% codeblock %}
sudo add-apt-repository ppa:chris-lea/node.js
{% endcodeblock %}

And update again.

{% codeblock %}
sudo apt-get update
{% endcodeblock %}

{% codeblock %}
sudo apt-get install nodejs
{% endcodeblock %}

Then we should update NPM:

{% codeblock %}
npm install -g npm
{% endcodeblock %}

And once that's done we'll install Bower and Grunt:

{% codeblock %}
sudo npm i -g bower
sudo npm install -g grunt-cli
{% endcodeblock %}


###Install MongoDB

MongoDB will be the backend for the website. This is a relatively quick install, but must be done before the MEAN stack is installed.

First we need to import the public key:

{% codeblock %}
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
{% endcodeblock %}

Then we need to create a list file for Mongo:

{% codeblock %}
echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list
{% endcodeblock %}

Then run another update:

{% codeblock %}
sudo apt-get update
{% endcodeblock %}

And then we can install MongoDB:

{% codeblock %}
sudo apt-get install -y mongodb-org
{% endcodeblock %}

Now, check to see if MongoDB has started:

{% codeblock %}
tail /var/log/mongodb/mongod.log
{% endcodeblock %}

You should see this message:

{%img center https://www.jeremymorgan.com/images/mean-stack-how-to-2.jpg How to install MEAN Stack" %}

And your MongoDB is up and running!

###Install MEAN.JS stack

You're almost done! This part is quick and easy. Just clone the latest repo into a folder (I used meanjs) 

{% codeblock %}
git clone https://github.com/meanjs/mean.git meanjs
{% endcodeblock %}

install it: 

{% codeblock %}
sudo npm install
{% endcodeblock %}

and run it:
{% codeblock %}
grunt
{% endcodeblock %}

You're done! You should see the following screen:

{%img center https://www.jeremymorgan.com/images/mean-stack-how-to-3.jpg How to install MEAN Stack" %}

And just like that you're ready to go. 

###If you want to run it as a full time server

When you run Grunt it starts your server, but as soon as you exit SSH it drops. Also NodeJS is a single threaded application so a single failure can bring down the service. This is why we use forever to run the server:

{% codeblock %}
npm install forever
{% endcodeblock %}

Now start it up:

{% codeblock %}
forever start server.js
{% endcodeblock %}

and you've got a full time server running. 


###Conclusion

I hope this helps illustrated the steps for getting a MEAN stack set up. This is just the beginning, in future tutorials we'll build some stuff. 

This stack is pretty awesome, and really important. I can definitely see this replacing PHP as a go-to quick web development technology for open source platforms. It's advancing rapidly, offers incredible performance and reduced development time. 

{% include custom/asides/programming-footer.html %}
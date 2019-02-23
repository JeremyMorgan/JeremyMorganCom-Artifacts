---
layout: post
title: "Getting Started with Adafruit IO"
date: 2015-12-26 12:31:28 -0800
updated: 2018-03-25 12:22
comments: true
categories:
- Programming
- Tutorials
- IoT

author: Jeremy Morgan
sharing: true
description: Earlier this year Adafruit Industries put their IoT dashboard into Beta, and it looks pretty cool. I'll show you how to set up a dashboard using one of my mini weather station designs for data input.

ogimage: https://www.jeremymorgan.com/images/adafruit-io/adafruit-io-how-to-og.jpg
permalink: /internet-of-things/how-to-adafruit-io/

---
{% include custom/asides/iot-newsletter-banner.html %}

Earlier this year Adafruit Industries put their IoT dashboard [Adafruit.IO](http://www.adafruit.io) into Beta, and it looks pretty cool. I'll show you how to set up a dashboard using one of my mini weather station designs for data input. You may remember [this project](https://www.jeremymorgan.com/tutorials/raspberry-pi/how-to-weather-station-raspberry-pi/) from a few months ago. I'll be adding yet another endpoint to the project on Adafruit.IO. 

<!-- more -->

## Setting up the Feeds

Adafruit IO uses "feeds" for the data used in your dashboard. This feed contains the raw data you'll be looking at, such as a temperature reading. This data can be populated through a REST API, Python, Ruby, and NodeJS clients, or uploading a .csv. I'm going to be using the REST Api called from a Python script in [this project](https://github.com/JeremyMorgan/Raspberry_Pi_Weather_Station). 
 
The first step is to create a feed:

{% img center /images/adafruit-io/adafruit-io-how-to-01.jpg "Adafruit IO How To" %}

After creating it you'll be given a chance to edit some metadata: 

{% img center /images/adafruit-io/adafruit-io-how-to-02.jpg "Adafruit IO How To" %}

After your feed is created, you can edit attributes such as:

- Name
- Description
- License
- Public / Private setting

This is pretty neat because you can make your feeds public, and specify how you would like them used. If this service gains a big following this opens a ton of doors for us. 

In my case I set up feeds for each piece of data I want on my dashboard that will come from the Raspberry Pi with the corresponding sensors wired up: 

{% img center /images/adafruit-io/adafruit-io-how-to-03.jpg "Adafruit IO How To" %}

Next I'll show you how I populated them. 

{% include custom/asides/iot-newsletter-banner.html %}

##Working with the Feed API

For this project we're going to use the feed REST API. [You can find full documentation here](https://learn.adafruit.com/adafruit-io-basics-feeds/resources). I won't go into great detail with interacting with the API, but instead explain what I've done so far. I encourage you to dig into it and take a look. 

First, the base URL is:

>[https://io.adafruit.com/api](https://io.adafruit.com/api)

Let's send a few requests to it and see how it works. 

Note: You will need your AIO key for all requests, you can get this key in the upper right hand corner of your feed view with the "View AIO keys" button:

{% img center /images/adafruit-io/adafruit-io-how-to-04.jpg "Adafruit IO How To" %}

To send a simple request, I'll use CURL to test it out. I sent the following command:

{% codeblock %}
curl https://io.adafruit.com/api/feeds?x-aio-key=[MY AIO KEY]
{% endcodeblock %}

It shows the following response (showing a list of my feeds)

{% img center /images/adafruit-io/adafruit-io-how-to-05.jpg "Adafruit IO How To" %}

Using similar REST commands, we'll send data to the feeds. I'll use Postman for building and testing these commands.

Create a new request in Postman, using the following URL:

>https://io.adafruit.com/api/feeds/temperature/data

Set the x-aio-key header with your key:

{% img center /images/adafruit-io/adafruit-io-how-to-06.jpg "Adafruit IO How To" %}

and send a form value like so:  

{% img center /images/adafruit-io/adafruit-io-how-to-07.jpg "Adafruit IO How To" %}

After sending it you should see a result like this:

{% img center /images/adafruit-io/adafruit-io-how-to-08.jpg "Adafruit IO How To" %}

You've just sent a piece of data to your feed (I recommend deleting test entries of course). Now we'll integrate that into the script on the Raspberry Pi that's gathering data. 

##Integrating the REST Calls Into the Weather Station

For this part, I'm going to use the code from the [Raspberry Pi Mini Weather Station](https://github.com/JeremyMorgan/Raspberry_Pi_Weather_Station) I set up a few months ago. I've got this sitting in my garage collecting data (going to both an Azure site and a Python/Linux endpoint) and this will make a nice realtime monitor for it. 

If you want to use this code as a base to start, clone it:

{% codeblock %}
git clone https://github.com/JeremyMorgan/Raspberry_Pi_Weather_Station.git
{% endcodeblock %}

If you want to replicate my results exactly, you'll want to make sure it's set up as described in the [Raspberry Pi Mini Weather Station](https://www.jeremymorgan.com/tutorials/raspberry-pi/how-to-weather-station-raspberry-pi/) project. 

Here we'll open up readings.py, and add "import urllib" to the top, since we'll be using that in addition to the urllib2 we've been using. 

Then we'll add an additional call (for temperature). We start by adding a variable for my AIO key:

{% img center /images/adafruit-io/adafruit-io-how-to-09.jpg "Adafruit IO How To" %}

Next we'll go down add the additional call. Add the URL for the 3rd call here:

{% codeblock %}
url3 = 'https://io.adafruit.com/api/feeds/temperature/data'
{% endcodeblock %}

Next, let's create a 3rd request. The data object for this one will be a little different from the others in the file:

{% codeblock %}
ftemp = round((9.0 / 5.0  * avgTemp + 32), 2)
values3 = {'value' : ftemp }
{% endcodeblock %}

We have converted it to Farenhiet and created a small tuple called "values"

The request for this will be different from the others in the file as well. We're going to urlencode the value, then add a different content type header, and the aiokey. It will look like this: 

{% codeblock %}

data3 = urllib.urlencode(values3)
req3 = urllib2.Request(url3, data3)
req3.add_header('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')
req3.add_header('x-aio-key',aiokey)

response3 = urllib2.urlopen(req3)
{% endcodeblock %}

Now, after saving the file you should now be sending data to the endpoint. 

{% img center /images/adafruit-io/adafruit-io-how-to-10.jpg "Adafruit IO How To" %}

You should also see entries for when the data is sent:

{% img center /images/adafruit-io/adafruit-io-how-to-11.jpg "Adafruit IO How To" %}

Congratulations, you've got a feed going! Repeat this process for the other measurements you want to add to your dashboard. I added in the following:

{% img center /images/adafruit-io/adafruit-io-how-to-12.jpg "Adafruit IO How To" %}

Let's create a dashboard next to view the data. 

{% include custom/asides/iot-newsletter-banner.html %}

##Creating an Adafruit IO Dashboard

Now that you have some feeds gathering info, you can create a dashboard to view it. The dashboard is a customized window into your data, and you can use as many or as few of your feeds. Create a new dashboard and take a look at the options available:

{% img center /images/adafruit-io/adafruit-io-how-to-13.jpg "Adafruit IO How To" %}

- Edit your dashboard blocks and layout
- Create a new block
- View your secret AIO key
- Delete Dashboard
- Set privacy

When you create a new block, you're greeted with a list of options:

{% img center /images/adafruit-io/adafruit-io-how-to-14.jpg "Adafruit IO How To" %}

Once you choose one (for instance I chose the gauge) you can modify some of the options, and select the feed. 

{% img center /images/adafruit-io/adafruit-io-how-to-15.jpg "Adafruit IO How To" %}

It's that easy to set up. You create a set of blocks, and put together your dashboard. 

[Take a look at my Garage Dashboard](https://io.adafruit.com/JeremyMorgan/garage-weather)

{% img center /images/adafruit-io/adafruit-io-how-to-16.jpg "Adafruit IO How To" %}

##Conclusion: My Impressions

One key thing to keep in mind if you'll be using this service: it's still in beta. It's not yet ready for production use. That being said it does appear to be functioning quite well. I had a few issues sizing up boxes and rendering the dashboard in Chrome under Arch Linux, but opened it up in Firefox and it was fine. These were the only minor problems I ran into. I got set up pretty fast and it looks great, so I'd recommend checking it out. 

The good points:

- Several options to interface data
- REST API well structured and useful
- Great documentation
- Easy to use and set up
- Visually appealing

So if you'd like a cool dashboard to augment your project or want to share some data go check it out. It's well worth a couple hours of playing. 

<br />
<br />
{% include custom/asides/rpi-footer.html %}
<br />
{% include custom/asides/iot-newsletter-banner.html %}
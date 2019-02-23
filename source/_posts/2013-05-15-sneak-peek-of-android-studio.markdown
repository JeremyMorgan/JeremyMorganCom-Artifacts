---
layout: post
title: "Sneak Peek at Android Studio"
date: 2013-05-15 19:53
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: Today at the Google I/O conference they announced a bunch of new things, but one that caught my eye was Android Studio, a new development tool for Android Devices. I decided I had to download it and check it out.
permalink: /blog/programming/android-studio-sneak-peek/
ogimage: https://www.jeremymorgan.com/images/android-studio-og.jpg
---
Today at the Google I/O conference they announced a bunch of new things, but one that caught my eye was Android Studio, a new development tool for Android Devices. I decided I had to download it and check it out. 
<!-- more -->
###First Impressions

I'll start off by saying I'm not really an Android developer. I've toyed around with it, and built one app a couple years ago that's basically a web wrapper. But after looking through this program I'm becoming inspired to pick it up again. Google is clearly trying to pay attention to the developers, who are the lifeblood of the Android platform. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-01.jpg Android Studio %}

One thing I noticed right away is this is clearly based off Eclipse, as many IDE's are these days. That's not really a bad thing, as Eclipse works really well in many ways and there isn't any reason to reinvent the wheel. But if you don't like Eclipse, you may not like Android Studio. 

Here are some cool options right from the start:

{%img center https://www.jeremymorgan.com/images/android-studio-download-02.jpg Android Studio %}

This is the kind of stuff you'd expect for starting a project. There are some options here which version to compile with, and themes available. You also have your basic settings, minimum API, etc. Stuff that helps you so you don't get in trouble later down the line. Here you have to make your choice whether to support more features, or be compatible with older devices. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-03.jpg Android Studio %}

Here we have some options, that I don't really understand, other than it appears you can have a foreground image and adjust your padding. Probably something to play with later. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-04.jpg Android Studio %}

Here we have a set of templates, which is pretty awesome. Some of the more common ones you might run into are built for you. The options are

**Blank Activity** - Creates a new blank activity, with an action bar and optional navigational elements such as tabs and vertical swipes.
  
**Fullscreen Activity** - Creates a new activity that toggles the visibility of the system UI (status and navigation bars) and action bar upon user interaction

**Login Activity** - Creates a new login activity, allowing users to enter an email address and password to log in to or register with your application

**Master / Detail Flow** - Creates a new master/detail flow, allowing users to view a collection of objects as well as details for each object. This flow is presented using two columns on tablet-size screens and one column on handsets and smaller screens. This template creates two activities, a master fragment, and a detail fragment. 

**Settings Activity** - Creates a new application settings activity that presents alternative layouts on handset and tablet-sized screens. 

These give you a nice set of options to start. The most intriguing to me is the Master / Detail flow, which I definitely want to learn more about. 

###Note about Performance

I noticed it's a little sluggish loading and building, but I did run this on an older Centrino machine with 4 gigs of RAM. Keep in mind this is an early release, and it's an old machine. When actually coding in the IDE it seems to run really well, and I haven't had too many quirks.   

{%img center https://www.jeremymorgan.com/images/android-studio-download-05.jpg Android Studio %}

I can't say I'm thrilled with that memory usage though. 
  
###Inside the IDE

The IDE looks a bit familiar if you've ever used Eclipse, but it's got a lot of nice features, and is clearly tailored for Android development. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-06.jpg Android Studio %}

It has everything where you'd expect it to be, and the syntax highlighting is pretty nice. Code collapsing and most of the features you'd expect are here. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-07.jpg Android Studio %}

One thing I noted that's pretty awesome is the Version Control integration. 

There are a lot of awesome tools in this IDE, too many to describe in one article, but the code analysis ones really stand out:

{%img center https://www.jeremymorgan.com/images/android-studio-download-08.jpg Android Studio %}
  
I ran some tests on my basic project and found a lot of things worth looking at:

{%img center https://www.jeremymorgan.com/images/android-studio-download-09.jpg Android Studio %}

Lots of refactoring options. This kind of stuff saves you a lot of time and can even help improve your coding. 

{%img center https://www.jeremymorgan.com/images/android-studio-download-10.jpg Android Studio %}

Overall I think hardcore Android developers are really going to like what's included here. 

###A few issues

I mentioned it's a little sluggish, but that's to be expected with bleeding edge software on old hardware. It's only a little slower than Eclipse runs on this machine. But I noticed that I couldn't get it to find my phone or my Kindle Fire when I tried:

{%img center https://www.jeremymorgan.com/images/android-studio-download-11.jpg Android Studio %}

And it wouldn't let me run anything in the AVD:

{%img center https://www.jeremymorgan.com/images/android-studio-download-12.jpg Android Studio %}

Though this could be a configuration error. I couldn't find where to change it and gave up, but I'll come back to it soon.   
  
###Conclusion

I'm sure in the coming days you'll hear some complaints and talk of it just being a "reskinned Eclipse" but I think Google is going in the right direction with this. There are tons of features I haven't even dug into yet, and many I don't know as I'm not really an Android developer at this time. But I did use the ADT environment for Eclipse and I do see some obvious improvments.   
  
Google is showing that the see the value in their developers and are giving them some pretty awesome tools to succeed. There were also some great gaming APIs released today and what we're seeing is Google preparing developers to take their popular platform to the next level. It's an exciting time to be a programmer indeed.   
  
Download it and try it out!

<a href="http://developer.android.com/sdk/installing/studio.html" target="_new"><h3>Download Android Studio Here</h3></a>

{% include custom/asides/programming-footer.html %}









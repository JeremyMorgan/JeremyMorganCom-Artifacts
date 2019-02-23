---
layout: post
title: "How I improved the speed of my mobile app by over 1000%"
date: 2013-04-03 20:34
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: In this article I describe how I drastically increased the load time of my Android app and made it 10 times faster.
permalink: /blog/programming/making-firecom-faster/
ogimage: https://www.jeremymorgan.com/images/firecom-android-app-7.jpg

---
A couple years ago I wrote an app called "FireCom" for the Android phone that's basically just a listing of active Fire and EMS calls in Washington County, Oregon. I never expected too many people to use it and gave it away so I didn't put a lot of time into it. As it turned out a lot of people started using it, so lately I decided to put a little more effort into it. 

<!-- more -->
###What is FireCom? 

{% img right https://www.jeremymorgan.com/images/firecom-android-app-5.jpg FireCom Android App %} I created the application in February 2011, and it spawned from being a volunteer firefighter and looking up calls on our [Joint CAD Incident Tracking System](http://www.wccca.com/PITS/) which a listing of calls in our local county plotted out on a Google map. 

There is also a [link to audio](http://www.broadcastify.com/listen/feed/1102/web/?rl=rr) there as well, and when I was in the Fire Academy I listened a lot to learn everything from radio etiquette to fireground strategy. Turns out there's a lot you can learn by listening to this stuff. 

But if you tried to look up any of this data on your phone, it was less than great. Sometimes curiosity takes over as well, when you see a speeding ambulance or fire truck you want to know where they are going or what's going on. 

This is why I created the [FireCom app](https://play.google.com/store/apps/details?id=com.jeremymorgan.wccca&hl=en), I wanted to make something quick and easy someone could bring up on their phone that would show that information. After some research and digging around I found a script written by [Gary Kee](http://gary.moonrize.com/) that scraped the calls from an RSS feed to post on Twitter. It was the perfect missing link. 

###How the first FireCom worked. 

The first iteration of the FireCom app parsed the XML feed and displayed the results on the screen using Java. I found it to be pretty slow and really unreliable, so it didn't last very long. I'm not an expert Java or Android programmer and didn't want to mess with it very much. So instead I decided to stick with what I was good at, and created a PHP page on this site that scraped the data and formatted it into nice little page. Then I created a WebView wrapper that simply brought up the page. 

It worked great for a couple years. As I said I didn't expect many people to use it and I used it myself for quite a while. But after a while I would started getting emails from people about it, and talking to fellow firefighters who were using it all the time. The two complaints I kept hearing were how slow it was sometimes, and how the map function didn't work well. It took a few seconds to load because it was basically set up like this:

![FireCom Android App](https://www.jeremymorgan.com/images/firecom-android-app-1.jpg)

Basically the WebView loaded up a PHP page on my server. The PHP page pulled the data from the output XML in realtime from the WCCCA server. It parsed it and created some HTML for the page formatted for the phone and did some cleanup of the text and station names. I decided using a WebView would be the best way so I could make updates and changes without making someone download the updates constantly.

The biggest problem was it was accessing this XML file every time someone loaded up the app, and sometimes it was quite slow. It's a large XML file that's dynamically generated and it puts out a lot of data that had to be parsed, and only a small portion is actually used. There were times when it really took a long time to load, and on a phone that can be even worse. Here was the average load time the night I upgraded the app:

![FireCom Android App](https://www.jeremymorgan.com/images/firecom-android-app-2.jpg)

As you can see the time isn't that great. There are a few reasons, the slow XML process I described, plus the repeat view isn't going to be any different. I turned off caching on this script because it's live data that shouldn't be cached. 4 seconds may not seem like much, but it's really pretty sluggish and I think folks using the app just got accustomed to pressing the icon and waiting for the results. Could I fix that? I came up with a new way to solve that very problem. 

###The new, improved FireCom

For the second iteration, I decided to do a few things to speed it up. 

- **Remove excess HTML** - Anything that wasn't absolutely required was removed. Should have done this a long time ago. 
- **Compressed HTML** - I removed all returns and whitespace from the file. Just a single line of html was pushed out.
- **Optimized the WCCCA image** - This is a small thing, but on a mobile connection it can make a difference. I also set caching for this image. 
- **Refactored the application** - This is the process I'll detail below.

I refactored the application by changing the way I pulled the data. Instead of accessing the XML file every time a user brought up the app, I created a script to pull the data, and generate the feed.php file. 

![Firecom Android App](https://www.jeremymorgan.com/images/firecom-android-app-3.jpg)

The feed.php file is now actually only a single line of HTML. But since there are already about 2000 people pointing to that file, it wouldn't be wise to change it. So now I have a feedloader that reads the xml and generates a static PHP file to read, so the load time is considerably faster:

![FireCom Android App](https://www.jeremymorgan.com/images/firecom-android-app-4.jpg)

Over 10 times faster in fact. The repeat view is a little faster as well due to the image caching. So now the app is way faster, and my job is done right? Not exactly. 

###Now we have a new problem

So if you've looked at the new system you've figured out that the feedloader does the heavy lifting and just generates a static PHP file for the app. This is where the majority of the speed improvements have come from. But this file has to be run pretty frequently, because with the old system feed.php was in realtime, now it is a static file. If I don't update it then the users are stuck with old information. 

Since I'm hosted on a Windows server, I can't just whip up a quick CRON job for this. I set up Windows Scheduler to run this file every 2 minutes or so. After watching it very closely and doing some testing I found that it is very spotty. Sometimes it will run every two minutes consistently, and sometimes it will run every 5, or even ten minutes. Since I am not the admin of this server there isn't much I can do. 

###Let's crowd source it!
{% img right https://www.jeremymorgan.com/images/firecom-android-app-6.jpg FireCom Android App %}
I was thinking of having it randomly run the feedloader when someone loads the app. Maybe one out of every 100 people visiting would trigger the feedloader and that would refresh the feed.php for everyone. But this seemed like a terrible solution because I'm picking users at random to have a slow experience. While 99 people get a snappy page, that one person is stuck loading the file for the feed. Not a great solution. 

I decided to let the scheduled task continue to run in it's spotty fashion, and I put a "last updated" timestamp into the page. Then I put a "refresh data" button in that runs the feed loader. This also takes 4-5 seconds but at least the user is *choosing* to take that time in order to see the newest version of the page. I'm not springing it on people expecting people do it without their permission. 

In the future I'm likely going to migrate this to a Linux server and set up a cron job. I've never really seen those fail, but Windows scheduler is a different story. I may even set up something on my Raspberry Pi to do the job who knows. 

###Lessons Learned

What I learned from this, is the value of making a WebView app when you can. This way you can do all kinds of stuff behind the scenes without bothering the user with updates all the time. Naturally not every app can be made into a WebView but if you can, it's worth trying. 

I also learned every little bit counts, and while moving feed.php to a static file was the big performance improvement, the little stuff like html compression helps too. When it comes to page speed, every tiny thing counts. When you're dealing with mobile devices and varying amounts of bandwidth it does a lot of good to cut down the amount of data you're transferring. For some people it's even saving them on their bill. 

Overall I'm glad people are using this app, and I hope the faster version works better for them. 

{% include custom/asides/tutorials-footer.html %}

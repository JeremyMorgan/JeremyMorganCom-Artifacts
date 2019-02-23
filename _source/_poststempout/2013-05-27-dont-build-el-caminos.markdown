---
layout: post
title: "Dont Build El Caminos"
date: 2013-05-29 19:32
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: The quickest way to disappoint everyone is by trying to please everyone and software is no different. Sometimes trying to make a one size fits all solution can get you into trouble.
permalink: /blog/programming/dont-build-el-caminos/
ogimage: https://www.jeremymorgan.com/images/el-camino-og.jpg

---
The quickest way to disappoint everyone is by trying to please everyone and software is no different. Sometimes trying to make a "one size fits all" solution can get you into trouble. 

<!-- more -->

###Remember the El Camino? 

Back in the late 60s GM made the El Camino, which was part car and part truck. While they were wildly popular with some, the fact is it wasn't a car or a truck and didn't do either very well. 

{%img center https://www.jeremymorgan.com/images/el-camino-1.jpg El Camino %}

This isn't an article to rag on the El Camino but instead talk about quality of "all in one" products, especially when it comes to software. One of the biggest problems a programmer creates for themselves is the one size fits all solution. 

>The more features you add to a product the lower quality each feature has to be to meet your deadline. 

###Where the El Camino Disappoints

Ok, so you have an idea for this vehicle, and it's part car and part truck. The idea is simple, it drives like a car, is low comfortable and you can put a couple dirt bikes in the back of it. Everyone should be happy in reality it's quite different. 

Those who want it as a car find:

* It's only a two seater.
* It doesn't have much room. 
* The bed makes road noise like a pickup
* The fuel economy is close to a pickup
* The rear of the vehicle is too light for ice and snow

Those who want it as a pickup find:

* You can't haul as much weight as a pickup
* You can't use campers (very popular in the 60s and 70s)
* You can't tow very much. 
* It rides low to the ground so it's not as safe as a pickup. 

So as you see, nobody's truly happy here. It's no big surprise that cars and trucks were still outselling the El Camino. People want something that's built for the job. 

###How Can This Apply to Software? 

There are a few areas this can apply to software. First is interfaces and features. I'm no UI expert but I do know that cluttered interfaces are a big mistake. If you're selling commercial software it will impact sales, and if you're developing internally it will slow down your coworkers. I'll give an example. 

####Commercial Software

You're building a product that is an HTML editor for building web pages. You have a nice little WYSIWYG interface, file handling and version control. It also has an FTP client interface. These features please the web developers who purchase your software.

But your software is also an optimizing suite that compacts your registry and cleans out old files from your hard drive. It also has a TCP/IP optimizer to speed up your internet, and an image optimizer to make your images smaller and load faster on the web.  

#####Your software features:

* HTML Editor
* Registry Cleaner / Compactor
* TCP/IP Optimizer
* FTP Client
* Version Control
* Image Optimizer

Fancy stuff, right? The software is great for people who want to build websites, and great for people who want a faster computer. Wherever these two intersect you've got some happy customers. But what if they don't overlap? 

{%img center https://www.jeremymorgan.com/images/el-camino-2.jpg El Camino %}

#####Problem 1:

* You'll have users who only want to edit websites, not tinker with their computer. 

* You'll have users who want to optimize their computer, not build websites. 

What happens is you have a bunch of features getting in the way for these two groups. Someone optimizing their computer couldn't care less about all this web development stuff and won't want to stumble through it to get to their registry cleaner. The opposite is true for the web developer.

#####Problem 2:

Because you tried to cram so many features into this one product you're faced with a longer development cycle, or reduced quality. This is especially true if you're one person. You have to make a choice to either spend 2 years developing a package with everything, or cut some corners. 

This has existed in traditional manufacturing for ages. There's a reason handcrafted furniture is more expensive than Ikea.

#####Problem 3:

Your focus has to be divided, not only in development but maintenance and updates as well. You're either going to have to focus on the web developers or the system optimizers because they're both going to want more features for their tasks. 

#####Problem 4: 

Your competition will likely focus on one group or the other to "out feature" your product as quick as they can. They'll develop a web editor with a better WYSIWYG, macros and automatic file versioning and uploading. When a web developer does a direct comparison you'll lose out. 


Your best bet here is to narrow your focus. Photoshop has been around since 1990 and it's the industry standard for a reason. You can't compact your registry with it but when working with images there's no close competitor. This is because they put all their eggs in one basket and focus on the basket.

####Internal Software

If you write software for internal use at a company it's no different. The purchasing agent is likely going to have needs and features that are far different from a sales rep or the CEO. So why should they all be using one interface?

The problem with building a one size fits all for a company is the fact that your company is full of people who aren't very computer literate. It's not that they're stupid, they likely know their field far better than you do. Your job is to make their job easier. Your tool may make perfect sense to you, especially since you built it but it may be a huge cluttered mess for the person using it. 

{%img center https://www.jeremymorgan.com/images/el-camino-3.jpg El Camino %}

It's always best to have your software run from a common database, and even a common core behind the scenes. But the best thing you can do is extract "views" for each person to use. While the CEO and Purchasing agent are using the same database or even the same data, their presentation is much different and tailored to their job. 

* internalsite.com/purchasing
* internalsite.com/inventory
* internalsite.com/shipping

If you're really good you can have a core that manages everything, but each person only sees and deals with the features they use for their job. 


###Behind the Scenes

When you're writing code behind the application the same rules apply. You should always be using the <a href="/blog/programming/single-responsibility-principle/">Single Responsibility Principle</a> wherever it best applies. Instead of making huge objects that try to do everything break down your tasks as much as possible. Bytes are cheap, and since this post has gone on long enough I'll cover that in more detail later. 


###Conclusion

Focus is everything. There's a reason marketing and software development are always so intertwined. Most of the basic rules of marketing apply to software just as well and focus matters. When you take one problem and solve it in the most elegant way possible and put time into it you have happy users. 

When you try to solve too many problems with small effort you end up with an El Camino. Always create the right tool for the job and organize your efforts. Your boss or customers will thank you for it. 








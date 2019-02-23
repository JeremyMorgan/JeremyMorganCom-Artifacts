---
comments: true
date: 2011-03-31 17:18:08
layout: post
slug: 7-ways-to-make-your-website-faster
title: 7 Ways to Make your Website Faster
wordpress_id: 457
categories:
- "SEO"
permalink: /blog/seo/7-ways-to-make-your-website-faster/
author: Jeremy Morgan

tags:
- CSS
- google
- HTML
- javascript
- "SEO"
- seo
- seo tips
- server
- tips
- tutorial
---

Having a fast website has tons of advantages. Besides being better for SEO and getting crawled by search engines, it's without a doubt better for your visitors. So here I will give a list that will explore some free ways to make your website faster.


### ![How to make your Website Faster](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/03/racecar.jpg)1. Image Optimization


Undoubtedly one of the most important areas to focus on when optimizing is images. They're considerably larger than text files, and small image optimizations can go a long way towards making a site faster. Some ways you can do this:



	
  * Use "lossy" compression such as .jpg for photographs and images with a lot of color.

	
  * Use "lossless" compression (.gif, .png) for logos, line art, or images with few colors.

	
  * Size your images in true dimension, do not use html to size images.

	
  * Smush your images using [Smush.it ](http://www.smushit.com/ysmush.it/)to further optimize them.

	
  * Consider scaling down anything that might be less noticeable if you lose some image quality.




### 2. Get Good Hosting


Good hosting is worth every penny. Jimmy's discount hosting might be cheap, but can it handle a huge traffic influx? Is it slow delivering large  files? Hosting with a good service or  on a cloud is important, especially for high traffic sites. Also consider:



	
  * Hosting images on a separate domain, such as Amazon S3

	
  * Host large files on a separate server

	
  * Host databases on a separate server


Good hosting is a crucial part of speed. Also see the item on server optimization if you're hosting your own site.


### 3. Improve your code


If you are using a CMS or any other web software to generate your pages, make sure the code is optimized. There are many different ways of doing the same thing when it comes to software, so take the extra time to make sure it's optimized. If it's beyond your programming skill level, hire someone to take a look at it.

Also:



	
  * Ensure HTML is clean and light as possible

	
  * Use CSS to style, not html. Also use DIVs, not tables.

	
  * Don't make unnecessary database calls

	
  * Dont generate useless code, or find ways to consolidate.


While it may not seem like much, shaving off a few tenths of a second here and there can really add up when your site is really busy, and combined can make page loads seem much faster.

Static code can be just as important, yet often overlooked. Make sure:

	
  * Write clean html with no unneeded code and make sure CSS is used for presentation.

	
  * Break up your CSS into multiple files. Load only the CSS attributes you need for that page.

	
  * Break up your JavaScript in the same way. Don't load JavaScript you aren't going to use.

	
  * Put your CSS and JavaScript in separate files rather than inline in your pages


Make sure your code is W3C valid or at least close. This helps a lot with optimization and SEO.


### 4. Minify Everything!


This one is a rather small change, but can be significant over time. To "minify" a file you're basically removing all the white space and cramming everything into one line of a text file.  This reduces the file size considerably. Things you can minify:



	
  * HTML

	
  * CSS

	
  * JavaScript


Anything text based can be minified, but make a note** always keep the original file for editing**! You don't want to try and edit a minified file, it can be quite a chore. There are many tools such as [Yahoo! online minifiers](http://refresh-sf.com/yui/) that do a great job of quickly slimming them down.


### 5. Get rid of the slow stuff.


Anything slow has to go, or be used sparingly. Just a few slow objects can make a page move like a slug. Don't use it unless you have to, such as:



	
  * Flash - Replace it with some Ajax if you can.

	
  * SSL (don't make the whole site run under https. Only use it when you are protecting information in trasnsit.)

	
  * External Javascript - Cool widgets from other sites are great, but if they are slow remove them.

	
  * Hi Res Images

	
  * Videos that load and play instantly on the page.




### 6. Optimize your Database


If possible, host your database on a separate server. Some web hosts offer this by default. This separates web operations from database, and can make things much faster. Also:



	
  * Optimize your data model

	
  * Use indexes properly and to your advantage.

	
  * Optimize your queries - lots of joins

	
  * Stored Procedures are your friend. Learn how you can utilize them to your advantage.

	
  * Don't store things in the database that never change. Make it static.

	
  * Run the OPTIMIZE command on MySQL frequently.




### 7. Configure your server properly.


This isn't an option for everyone, because most people have a hosting account where they cant change things, and also many people don't know how. Very few webmasters are also server admins but if you are this is a place you can really squeeze some extra performance.

Some things to really pay attention to:



	
  * Memory Allocation

	
  * Open processes

	
  * Caching settings

	
  * External Image hosting

	
  * Gzip (turn it on)

	
  * Remove unnecessary Apache/IIS modules.

	
  * Use a profiler (IIS has it's own built in) to check changes.

	
  * Check out some server accelerators.


Going into great detail is not within the scope of this article, but the more you can learn about this stuff the better. If you end up with a successful site and have thousands of visitors hourly, you will need to have all these "small details" worked out to maintain good performance.


### Conclusion


If you notice a theme here, it's "little things count". Each thing will only help a tiny bit, but combined they make a significant difference. I preach the same theory with SEO, any change by itself doesn't help but combined they'll push you farther than you were before. So before breaking out your wallet try some of these things!





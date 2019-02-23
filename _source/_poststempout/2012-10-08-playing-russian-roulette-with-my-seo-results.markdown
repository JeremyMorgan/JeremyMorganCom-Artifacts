---
layout: post
title: "Playing Russian Roulette With My SEO Results"
date: 2012-10-07 22:29
comments: true
sharing: true
Author: Jeremy Morgan
categories:
- "SEO"
permalink: /blog/seo/playing-russian-roulette-with-my-seo-results/
---

As an SEO blog I always feel this site is under a microscope and I have to practice what I preach or be outed as a fraud. Occasionally I stray from my own advice and do what I tell others not to, as I did recently. I changed the CMS, site structure and most of my urls and redirected them all in the same week.

<!-- more --> 
This was a huge risk and I'm fairly certain it was the right choice, but it's too early to know. I gambled, and that's something I never advise others to do and avoid with client sites.

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/russian-roulette-seo-blog.jpg "Playing Russian Roulette With My SEO Blog" %}

###Shaking it Up

First I gutted the entire CMS (Content Management System) after five years of using WordPress. I replaced it with <a href="http://octopress.org/" target="_blank">Octopress</a> which is similar but the underlying code is quite different. I have no idea how "SEO friendly" Octopress is yet but I did notice a few things that may hurt SEO. 

- The code does not validate as W3C compliant
- The meta tags are similar 
- Titles are handled differently
- The design is now "responsive" and HTML 5

These are all what I would consider very minor changes. Thankfully Octopress gives you the ability to specify permalinks, so I was able to migrate all my posts and retain the URLs. This is where I discovered my problem. I had crazy folders all over the place.

{% codeblock %}
	/seo-blog/search-engine-optimization/
	/seo-blog/webmaster-help/
	/programming-blog/tutorials/python/
	/tutorials/programming/
	/programming-blog/microsoft/
	/linux-how-to/tutorials/
	/blog/seo-tips/
	/blog/
	/programming/tutorials/
	/webmaster-help/
	
{% endcodeblock %}
 
These are just a few of the folders I had but you get the idea. It was a huge mess that I knew I had to fix. I had a */programming/tutorials/* folder and a */tutorials/programming* folder. I had way too many duplicated categories and an overall structure that made no sense. 

Over the last 5 years I became quite negligent by changing and adjusting categories in Wordpress recklessly without giving much thought to structure. After years of advising people against it, I should know better. 



In Wordpress these are virtual redirects, but in Octopress they're actual folders and files and they looked like crap. I also had two Wordpress installations, one on the root and one in /blog/ because I didn't want to mix personal posts with the SEO and Marketing stuff. So it was a colossal mess. I had to merge the content of both sites into one and reorganize it. 

<b>Here is the new structure:</b>

{% codeblock %}

/blog/
	|
	|--- /seo/
	|
	|--- /programming/
	|
	|--- /marketing/
	|
	|--- /social-media/
	|
	|--- /general/

/tutorials/
	|
	|--- /php-tutorials/
	|
	|--- /python-tutorials/
	|
	|--- /c-sharp/
	|
	|--- /linux/
	|
	|--- /c-programming/
	|
	|--- /photoshop/
	|
	|--- /java/
	|
	|--- /wordpress/

{% endcodeblock %}

You can notice a difference right away. I separated the categories logically, no more than 3 levels deep. Since the site is split between tutorials and blog articles, I made those the primary folders and divided further past that point. Then I dropped in a couple hundred 301 redirects and pushed it live.  

###Why Is This Move So Risky? 

This took a lot of thought, and I was very nervous about doing it. I have some really good positions on some great terms that I could lose, and I am a little worried. 

Here's why I should be: 

- I created a ton of 404s all at once
- I then redirected of course to 301s, then had a bunch of 301s at once 
- There are thousands of links out in the wild that are now invalid
- The root site and blog are now combined, mixing up the content 
- I got rid of some outdated crappy pages as well, increasing 404s
- Google has to re index 96% of my pages. Will it reindex them all?
- I risk a duplicate content penalty during the transition phase

I had to contemplate this decision and question whether the benefits of better organization were worth throwing away all my SERPS. I decided it was but I would have to try and minimize the risk I would take. 

###Damage Control: What I did to minimize risk

The biggest gamble was the fact that now 95% of my links are now pointing to pages that don't exist. Hyperlinks are still weighted heavily in the PageRank algorithms. Pushing all these links to a 404 page and asking people to use a search function would be absurd, so I did a 301 redirect to them. This solved one problem while creating another. 

Initially I noticed a huge slowdown in my site's performance. The reason was my .htaccess was loaded with a large amount of 301s. Every request to the entire site would be checked to see if it was in this gargantuan list of redirects before moving on. 

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/russian-roulette-seo-blog-3.jpg "Playing Russian Roulette With My SEO Blog" %}

The solution was to create folders for the old permalinks and put the 301s there so now the only time the list is being parsed is if someone is going to an old URL. Anyone going to the front page would pass through as usual. This saved 3 seconds of load time that I had added on, which is quite a difference.

So now I had a drastic change to my website, and I followed some simple steps to minimize the impact. 

- Reorganized my content in a sensible, logical way
- Created 301 redirect for every single page
- Rebuilt my sitemap
- Resubmitted the sitemap
- Notified Google of the changes

You might be reading this and wondering about that last one. How did I notify Google that I did all these redirects? There is actually a simple tool to do so. 

>1. Go to <a href="http://www.google.com/webmasters/" target="_blank">Google Webmaster Tools </a>
>2. Select "Health"
>3. Select "Fetch as Google"
>4. Leave the URL blank and click "fetch".
>5. After a successful fetch click "submit to index"
>6. In the next window select "URL and all linked pages" and click OK. 

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/russian-roulette-seo-blog-2.jpg "Playing Russian Roulette With My SEO Blog" %}

<b>Note</b>: This should be done only if your site has changed drastically. There is a limit on how many times you can do this .

###What I think Will Happen Next

It's been a month with no difference in my search traffic, but it's too early to draw conclusions. I expect a minor hit to my results, although Google is already acknowledging the changes. I feel all the links pointing the wrong pages will have an effect eventually but it will be temporary.

{% img right http://s3.amazonaws.com/images.jeremymorgan.com/russian-roulette-seo-blog-4.jpg "Playing Russian Roulette With My SEO Blog" %}

I predict an improvement in the long run. The signals in my URL should improve, tutorials, blog posts and categories are clearly defined and separated. The layout is very logical now and that will improve how Google categorizes my content in the future. 

Every new post will be categorized and spidered appropriately. The URL matches the content more closely and the categories are more sensible. Google prefers that you present your content in an honest and open way. 

In the long run better organization helps me, helps my visitors and helps Google. I think I've taken very serious gamble, but one that will pay off later. We shall see! 




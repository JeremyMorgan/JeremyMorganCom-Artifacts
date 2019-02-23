---
layout: post
title: "Open Graph Tags Are Terribly Important"
date: 2015-03-21 22:19
comments: true
sharing: true
categories:
- "SEO"
permalink: /blog/seo/open-graph-tags-for-seo/
description: Today I want to talk about something that's pretty important for your blog, even if it's a tech blog. It's Open Graph tags, and it's a fairly easy way to get more people to your site, and get it noticed.
ogimage: "https://www.jeremymorgan.com/images/seo/open-graph-seo-og.jpg"
Author: Jeremy Morgan

---
Today I want to talk about something that's pretty important for your blog, even if it's a tech blog. It's Open Graph tags, and it's a fairly easy way to get more people to your site, and get it noticed. I haven't done an SEO or Marketing type article on this site in two years, but I think this is pretty fitting for anyone working on websites. Is your company doing this? They should be. 
<!-- more -->
###What are Open Graph Tags?

The [Open Graph Protocol](http://ogp.me/) was originally developed for representation on social sites. There has been a lot of shuffling around standards, but for the most part you can easily set up something that will work well with 3 major social media sites:

- Facebook (<a href="https://developers.facebook.com/docs/sharing/opengraph" target="_blank">Get Info</a>)
- Google+ (<a href="https://developers.google.com/+/web/snippet/" target="_blank">Get Info</a>)
- Twitter (<a href="https://dev.twitter.com/cards/getting-started" target="_blank">Get Info</a>)

There are many uses with these tags when it comes to applications and mobile use, but we're going to focus on another benefit: making your links on these sites more informative. Here is the basic information needed:

- Title (usually the title tag of your page)
- Image (This is what will display in your link)
- Description (This is a description)

This is what I would consider the bare minimum for a decent webpage. Here is what one of my links looks like from this site: 

{%img /images/seo/open-graph-seo-1.jpg  "Open Graph Tags for SEO" "Open Graph Tags for SEO"%}

Chances are you've seen tons of these types of links and thought nothing of it. Facebook and Google both try to make a best effort to find a large image, your title and description on it's own. Most of the time it's ok, even the space jam site has something showing up and it hasn't been updated since the 90s. 

{%img /images/seo/open-graph-seo-4.jpg  "Open Graph Tags for SEO" "Open Graph Tags for SEO"%}

But you've also probably seen ones like this:

{%img /images/seo/open-graph-seo-3.jpg  "Open Graph Tags for SEO" "Open Graph Tags for SEO"%}

This is what happens when there is no Open Graph data and the site can't be crawled properly. It makes for an unattractive link with little or no information. Not just on Facebook, but all the major social media sites. 

>The Open Graph tags are essential to getting you more clicks, and more shares. Your site needs them. Period. 

Even if your site isn't one that gets shared socially much it still provides a more professional appearance. Not to mention sites like LinkedIn are now using them as well. 

###Implementing Open Graph Tags

There are a myriad of ways to implement these, depending on your CMS. WordPress has several plugins and other ways to get them into your pages. Any CMS should be able to implement them because they're only meta tags. How smoothly you can get the data to dynamically populate it might be trickier. Since that's out of the scope of this article instead I'll show you what tags you should have on all your pages: 

{% codeblock lang:html %}
<meta itemprop="name" content="[ TITLE ]" />
<meta itemprop="image" content="[ LISTING IMAGE ]" />
<meta itemprop="description" content="[ ARTICLE DESCRIPTION ]" />
 
<meta name="description" content="[ ARTICLE DESCRIPTION ]" />
<meta name="author" content="[ AUTHOR FULL NAME ]" />
 
<meta property="article:author" content="[ GOOGLE+ AUTHOR URL ]" />
<meta property="article:published_time" content="[ PUBLISHED TIMESTAMP ]" />
<meta property="article:section" content="[ CATEGORY ]" />
 
<meta property="og:title" content="[ TITLE ]" />
<meta property="og:type" content="article" />
<meta property="og:description" content="[ ARTICLE DESCRIPTION ]" />
<meta property="og:image" content="[ LISTING IMAGE ]" />
<meta property="og:url" content="[ CANONICAL URL OF ITEM ]" />
<meta property="og:site_name" content="[ WEBSITE NAME ]" />
 
<meta name="twitter:card" content="summary">
<meta name="twitter:title" content="[ TITLE ]">
<meta name="twitter:description" content="[ ARTICLE DESCRIPTION ]">
<meta name="twitter:image" content="[ LISTING IMAGE ]">
<meta name="twitter:url" content="[ CANONICAL URL OF ITEM ]">
{% endcodeblock %}

These are the tags I have implemented on my site. You may notice this violates DRY (Don't Repeat Yourself) but the reason we repeat the information is because each service has their own name for the tags. These tags cover what's needed for great presentation on Facebook, Google+, Twitter and LinkedIn.

If you can edit HTML in your CMS and put in dynamic values this should be fairly easy. In Octopress (what I use for this site) it only took a few minutes to implement. If you have a self built CMS I would highly reccomend putting it in. 

###Summary

Open Graph tags are definitely a "quick win". They're quickly implemented with a large benefit. Your links when posted on social media will be more attractive and professional. People will be much more likely to share the link because it will look good on their timeline. 

It's not something programmers generally think about, but it could give your blog a great boost, or get some extra traffic and customers for your company, for a small investment. 


{% include custom/asides/programming-footer.html %}





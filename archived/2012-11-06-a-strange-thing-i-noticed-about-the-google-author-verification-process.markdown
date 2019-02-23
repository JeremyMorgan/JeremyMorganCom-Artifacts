---
layout: post
title: "The Google Authorship Process: Clear As Mud"
date: 2012-11-06 00:41
comments: true
sharing: true
categories:
- SEO
permalink: /blog/seo/google-authorship-markup-clear-as-mud/
Author: Jeremy Morgan
---

Surely most SEOs have at least heard of the Google Authorship craze, and most of you have probably already set up your <a href="http://searchengineland.com/the-definitive-guide-to-google-authorship-markup-123218">Google Authorship Markup</a>.

Establishing authorship is definitely an important part of the game now, and crucial to your success. But the process right now is pretty flawed. 
<!-- more --> 

I set up my authorship markup quite a while ago, and here's what I noticed about the process: it stinks. I'll explain.

{% img center https://www.jeremymorgan.com/images/google-authorship-markup.jpg Google Authorship Markup %}

When I run site:jeremymorgan.com I get the following results. As you can see, my photo and author information are on the index, but not the following pages. But as I look through my indexed pages, I can't help but notice some of them have my authorship info attached, and some of them don't.

Being curious about why that would happen, I started to closely examine the pages. I assumed that "pages" like my about and contact page would not have it, while articles should. The articles that have authorship information attached seem to be completely random. 

Checking the obvious stuff I found:

* All pages have the same markup information embedded

* All pages are using the same template

* Pages had no other errors I am aware of

* Age of the article doesn't appear to be a factor

* Turning personalization on and off doesn't appear to be a factor

* logging out of my account didn't matter

* All pages link to the same "about" page as per Google's instructions

* link popularity of the pages doesn't appear to be a factor


Inconsistency with Google's crawling and indexing is nothing new to any of us. Given the billions of pages this kind of thing is expected to happen. But why is it after all this time more pages don't show my authorship info?

It seems strange so I decided to dig into the process a little and see if I missed something. 


### The Google Authorship Verifcation Process 

To set up your authorship markup, there's a process you have to go through:

{% img center https://www.jeremymorgan.com/images/google-authorship-markup-1.jpg Google Authorship Markup %}

* Setup an "about page" on your domain.

* Put a link to your Google+ profile on that page using rel="me"

* Link your content pages to the about page with rel="author"

* Link your Google+ profile to your website

* Link your Google+ profile to your about page as a "contributor to"

* Verify you have an email address from the domain in question.

You can do any combination of these things, or all of them, it's up to you. Most people do a setup where you set up an about page, add it to your Google+ under "contributor to" and then link back their Google+ profile page with rel="me" and then every content page links back to the about page with rel="author". Simple, right?

The process is simply too complicated, and somewhat shaky. There are other problems with the rel parameter also, as WordPress strips them out. But hardly any bloggers use WordPress, right? It's not difficult, but overly complicated however most of us end up doing it.

### Other Peculiar Stuff

I noticed some other oddities while using the <a href="http://www.google.com/webmasters/tools/richsnippets">Rich Snippets Testing Tool</a> as I was trying to find out if I'd made a mistake. The markup came up just fine but I noticed an error came up. 

{% img center https://www.jeremymorgan.com/images/google-authorship-markup-2.jpg Google Authorship Markup %}

Oops! It shows the author profile I'm linking to redirects to another URL. As you can see it's the same url, it just has a parameter added on the end. A parameter Google told me to put on there to verify my authorship.

{% img center https://www.jeremymorgan.com/images/google-authorship-markup-5.jpg Google Authorship Markup %}

It's as if the tool doesn't recognize that it's not a redirect it's a parameter. Not only should the tool recognize this, but it's actually a parameter the tool itself is supposed to be looking for!

>If you do what Google tells you to do, you'll end up setting off an error in the tool. 

I've also run into some other strange errors on the page, such as this one:

{% img center https://www.jeremymorgan.com/images/google-authorship-markup-3.jpg Google Authorship Markup %}

I put in my url and submitted it, and the box was populated with what you see above. This prevented the tool from working, though it did appear to resolve itself the next day when I tried it. The tool seems incomplete right now. 

### Conclusion

I appreciate the opportunity to do something like this, I really do. When this extra information is displayed, it increases your CTR big time. It attracts attention and lends credibility to your site. But if Google wants to encourage webmaster/author participation in this program I think some major problems should be resolved. This process is complicated for new webmasters and inconsistent for others. 

Here's a simple idea: how about you set up the process similar to the Google Webmaster verification? Have us verify who we are in our Google+ accounts, let us verify ownership of the domain or the fact that we've posted there and go from there? And how about updating all of our results to reflect it, not just random ones? 

Any of us who are legitimate webmasters would be glad to follow the process as long as it's a good one. This program has been around long enough they shouldn't be having problems like this. Fix some of this stuff and it will be win for everyone. 




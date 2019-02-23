---
comments: true
date: 2007-12-23 04:26:36
layout: post
slug: how-to-avoid-duplicate-content-issues-with-wordpress
title: How to avoid duplicate content issues with wordpress
wordpress_id: 30
categories:
- "SEO"
permalink: /blog/seo/how-to-avoid-duplicate-content-issues-with-wordpress/
Author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/wordpress-ogimage.png

tags:
- "SEO"
- seo
- themes
- wordpress
- wordpress seo
---

Wordpress is an excellent tool for blogging. It's what I use on this site, for ease of use, and all the nifty plugins. But one problem wordpress has, is duplicate content issues. In this article I will tell you how to resolve these issues so you don't get punished by search engines for something you're not consciously doing.

**What is duplicate content and why is it bad?   **

Back in the day, certain unscrupulous webmasters came up with the idea of [doorway pages](http://en.wikipedia.org/wiki/Doorway_pages). The idea behind these pages is creating hundreds or even thousands of pages with the same content on it, and maybe changing a thing or two on each page so the search engines would spider them all and give you more traffic. Google responded accordingly.

So now, if you have duplicated content on your site, you will be punished for it in the rankings. Wordpress has a few problems with duplicating content through archives, trackbacks and comments, so here is our solution.

**Step one: Fix your page header.**

Go to Presentation -> Theme Editor. From there select "header.php". Put the following code before the closing of the <head> tag:

<?php

if((is_home() && ($paged < 2 )) || is_single() || is_page() || is_category()){
echo '<meta name="robots" content="index,follow" />';
}else {

echo '<meta name="robots" content="noindex,follow" />';

}

?>  

This will will tell the search engines to spider the index page and follow all the links, but it will not follow the links to archives or "next page" links which are duplicated.

**Edit Robots.txt **

Put the following in your robots.txt to exclude the appropriate pages:

_User-agent: *
Disallow: /wp-
Disallow: /search
Disallow: /feed
Disallow: /comments/feed
Disallow: /feed/$
Disallow: /*/feed/$
Disallow: /*/feed/rss/$
Disallow: /*/trackback/$
Disallow: /*/*/feed/$
Disallow: /*/*/feed/rss/$
Disallow: /*/*/trackback/$
Disallow: /*/*/*/feed/$
Disallow: /*/*/*/feed/rss/$
Disallow: /*/*/*/trackback/$_

If you need help editing your robots.txt [use a plugin to do it for you](http://adambrown.info/b/widgets/kb-robots-txt/)!

**Redirect to a canonical URL**.

This is a good tip for any site, not just a wordpress site. You want to make sure www.jeremymorgan.com/page.htm and jeremymorgan.com/page.htm don't get spidered and indexed seperately. Edit your .htaccess file, and add the following (remove jeremymorgan.com and replace it with your domain)

_ RewriteEngine On
RewriteCond %{HTTP_HOST} !^www\.jeremymorgan\.com$ [NC]
RewriteRule ^(.*)$ http://www.jeremymorgan.com/$1 [R,L]
RewriteBase /
RewriteCond %{REQUEST_FILENAME} !-f
RewriteCond %{REQUEST_FILENAME} !-d
RewriteRule . /index.php [L]_ 

If you are using [permalinks](http://codex.wordpress.org/Using_Permalinks) most of this code will already be there. You only have to add the following two lines to the top:

_ RewriteCond %{HTTP_HOST} !^www\.jeremymorgan\.com$ [NC]
__ RewriteRule ^(.*)$ http://www.jeremymorgan.com/$1 [R,L]_

Again, replace jeremymorgan.com with your own site, otherwise you'll be sending me all your traffic, and I think your readers might get a little angry.

Using the tips above, you can reduce the chance of being penalized for having duplicate content. Of course you don't want to use doorway pages or spammy content, but it will look as if you do, so make these changes as soon as you can. This is not a huge traffic boost type of tip, but more like insurance for the future.

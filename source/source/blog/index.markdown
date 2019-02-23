---
layout: page
title: "Jeremy Morgan's Blog"
date: 2012-09-25 23:11
comments: false
sharing: false
footer: true
---
I have moved a lot of stuff around, and the blog was merged with the rest of the site. Check out <a href="http://www.jeremymorgan.com">The main page</a> and you can probably find what you're looking for. 


<ul class="posts">
{% for post in site.posts limit: 15 Category: Tutorials %}
  <div class="post_info">
    <li>
            <a href="{{ post.url }}">{{ post.title }}</a>
            <span>({{ post.date | date:"%Y-%m-%d" }})</span>
    </li>
    </br> <em>{{ post.excerpt }} </em>
    </div>
  {% endfor %}
</ul>

Also, here are the categories:

<ul>
<li><a href="/categories/seo/">Search Engine Optimization</a></li>
<li><a href="/categories/programming/">Programming</a></li>
<li><a href="/categories/tutorials/">Tutorials</a></li>
<li><a href="/categories/marketing/">Marketing</a></li>
<li><a href="/categories/social-media/">Social Media</a></li>
<li><a href="/categories/general/">General</a></li>
</ul>


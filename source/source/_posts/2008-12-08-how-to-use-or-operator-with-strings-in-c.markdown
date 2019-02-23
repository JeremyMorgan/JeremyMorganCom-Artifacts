---
comments: true
date: 2008-12-08 00:07:57
layout: post
slug: how-to-use-or-operator-with-strings-in-c
title: How to use OR operator with Strings in C#
wordpress_id: 17
categories:
- Programming
permalink: /blog/programming/how-to-use-or-operator-with-strings-in-c/

tags:
- .net
- c
- C# .net
- C# code
---

I just had this problem tonight, so I thought I'd share the solution. In many languages you can do a string comparison in the following way:

    
    if ($city == "Portland" || $city == "Seattle") {
    // stuff goes here
    }


And this works just fine. But in C#, strings are treated as objects, so you have to do the same comparison as such:

    
    if ((city == "Portland") || (city == "Seattle")) {
    // stuff goes here
    }


In the above example, if the city is Portland, it will evaluate as true, making it a boolean. This is a simple step and an easy fix, but I couldn't readily find anything on google about it, so I thought I'd post it here.

If you want to use the || or operator in C#, this is how you do it.

{% include custom/asides/programming-footer.html %}
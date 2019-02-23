---
layout: post
title: "The Book Every PHP Developer Should Read"
date: 2014-06-12 21:07
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: It's time to stop releasing insecure PHP code into the wild. A book I read recently helps programmers write smarter, more secure PHP.

permalink: /blog/programming/the-book-every-php-dev-should-read/
ogimage: https://www.jeremymorgan.com/images/php-security-howto-og.jpg
---

PHP has gotten a bad rap over the years. There is plenty of discussion around it's "Fractal of Bad Design" and syntactical inconsistencies but the chief complaint is generally security. Lots of PHP sites get hacked by the minute, and even some experienced and knowledgeable programmers will say that the language is inherently insecure.
<!-- more -->

I have always argued against this because there is a common sense reason there are so many security breaches of PHP. 

<a href="http://buildingsecurephpapps.com/?coupon=jmorgan" target="_new">{% img right https://www.jeremymorgan.com/images/php-security-howto-1.jpg "PHP Security how to" %}</a>
PHP applications are hacked frequently because:

1. There are so many PHP applications. 
2. It's very easy to learn and write PHP.
3. It's easy to write bad PHP. 

It’s that simple. PHP is popular and has been for many years. The more PHP out in the wild the more it will it's exploited. Few of these hacks exploit flaws in the PHP processing engine itself, and are usually vulnerabilities of the scripts themselves.

This means, of course that it's mostly the programmer's fault when a PHP application is hacked. Sorry folks, but that's the truth. 

You can write PHP that's just as secure (or more so) than other web languages out there. It's time we started really striving towards that. 

###Your Best Defense against PHP Hacks

Writing secure PHP code is not a secret black art hidden away from PHP developers. But the information is so scattered it would take you weeks or months (or longer) to gather good PHP security practices into some sort of checklist or formula. Even then only true experience would tell you how much of it is true. 

Thankfully Ben Edmunds has already done that for you. He recently released "[Building Secure PHP Apps - a Practical Guide](http://buildingsecurephpapps.com/?coupon=jmorgan)" and it's one of the best security related books I've ever read, and certainly the best covering PHP. In this review I'll go over why I think every PHP developer should be reading this. 

The book is a very concise guide that will bring to the next level as a developer and have you building better, more secure scripts. 

####Introduction

The book quickly jumps right in with a common sense rule about web development: Never Trust Your Users and Sanitize ALL Input. It starts by painting a small scenario and and jumps right into the technical ways that users can enter your system. In the first chapter it jumps right into topics like:

- SQL Injection
- Mass Assignable Fields
- Typecasting
- Sanitizing Input / Output

These are items that new PHP programmers (and some experienced ones) neglect all the time. Sanitizing input is seen as an optional step by many, and this chapter talks a lot about. 

In reading it I was reminded of my first day on a job many years ago when I was digging into the existing code and found the following in the new user creation script:

{% codeblock lang:php %}
if ($_POST["isadmin"] == 1) {  
// code to set to admin in database 
}
{% endcodeblock %}

I panicked when seeing this as it was a VERY active script and there was much to be gained by a malicious user who could have guessed this and inserted a simple form variable and accessed around 5,000 credit card numbers and other personal info. 

Digging deeper I found stuff like:

{% codeblock lang:php %}$sql = "INSERT INTO database (id,name,...) VALUES (" . $_POST["Name"] . ");"{% endcodeblock %}

I almost walked out of that job on the first day because of this terrible stuff they were relying on. This stuff is out there and it's up to you to change it, and definitely avoid creating more of it. 

This chapter talks about why code like this is a terrible risk and how you can fix it. 

####HTTPS and Certificates

This is another area Ben covers with scenarios, stories and a little humor but also clearly explains some concepts of HTTPS that can be unclear. He explains it in a way that even your boss can understand it. 

The book is very thorough in describing how certificates work, types of certificates and how they're implemented, and even how to set them up in Apache or Nginx. 

####Passwords

In this book some careful explanation of passwords, hashes, lookup tables and salts is included that is incredibly helpful for developers creating a user login system. 

Folks, this is one area that is extremely lacking even in 2014. I still run across applications that store plain text passwords or something silly like a [ROT13](http://en.wikipedia.org/wiki/ROT13) cipher to protect them. Please, for the sake of the people using your app and your good reputation don’t do this.

Passwords and other sensitive should be very difficult to obtain even if someone has full access to the database. This is covered pretty thoroughly here and will give you great direction for designing better systems. 

####Authentication and Access Control

The book covers this topic very thoroughly. When you’re building a new PHP application some of the first considerations are:

- Who can access what resources?
- Who can control other users access?

These are crucial things to think about for applications, especially ones handling sensitive data. A good portion of development in the enterprise world is devoted to this. If you set up authentication and access control improperly the best that can happen is you annoy your users and create more work. The worst than can happen is a severe data breach and / or data destruction. 
 
In this book the basics are covered well, then it deep dives a little more into things like controlling access to files and individual pages of an application, and has plenty of code samples to look at. 

####Specific Exploits

The book covers some common exploits that are used to breach systems and goes into very good detail about Cross Site Scripting, arguably the most common way attackers exploit applications. It explains different types of attacks and how to protect yourself. 

<a href="http://buildingsecurephpapps.com/?coupon=jmorgan"><h3>Sound Good? You can get this book at a discount using this link!</h3></a>

###What I liked the most about this book

In reading this book I really enjoyed how information is presented in a way that's useful for both beginners and experienced programmers. There is a set of concepts presented, what they are and how to protect yourself against it. There are plenty of code samples without "filler code" that some technical books suffer from. 

You can go through this book fairly quickly because there isn't a lot of fluff. Newer developers can go through this book and examine each topic and start looking at their code and making revisions to how they do things. Remember in this business you need to constantly change. If you look back and are ashamed of code you wrote 6 months ago you're doing it right. 

More advanced and experienced programmers can use this guide to fill in their weak spots (admit it no matter how long you've been in the game, you have them) and learn more about systems they've been using in their work. For instance I have used certificates like crazy over the years but never thought about things down to the level presented in this book.

No matter who you are, you'll learn something. So stop reading this post and pick up a copy already! Use this link to purchase it for a discount!!

###Disclaimer

I don't do many reviews on my blog so you may have a few questions. To be clear, I am not being paid or compensated for this review. The coupon code above is to give my blog readers $4 off the price of the book, and I receive none of that. I did receive a promotional copy of the book for reviewing purposes of course. 

Also I know the author personally and that's one of the reasons I trust the information in this book and have full faith in it's guidance. [Ben Edmunds](http://benedmunds.com/) has been a huge influence in the PHP community over the years, he has over 10 years experience with PHP is one of the leaders of the Portland area PHP users group, and has made significant [contributions to open source PHP projects](http://benedmunds.com/code.html) over the years. It's pretty safe to say he knows his stuff and you can trust the information presented here.
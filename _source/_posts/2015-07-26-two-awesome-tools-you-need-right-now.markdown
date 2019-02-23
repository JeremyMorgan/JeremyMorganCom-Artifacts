---
layout: post
title: "Two Awesome Tools You Need Right Now"
date: 2015-07-19 11:49
comments: true

categories: 
- Programming

description: I have recently been using a couple of tools every day, in both my professional and and personal work and feel like sharing them here today. These tools will help you tremendously as a developer and they just happen to be free.

permalink: /blog/programming/nimbletext-and-postman-two-great-tools/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: https://www.jeremymorgan.com/images/nimbletext-postman/postman-02.jpg
---
I have recently been using a couple of tools every day, in both my professional and and personal work and feel like sharing them here today. These tools will help you tremendously as a developer and they just happen to be free. 
<!-- more -->
###NimbleText and Postman: A Must have for Developers

The standard disclaimer: I am not being compensated in any way for this review, and have not been approached by the creators of these applications, in fact I have purchased the premium versions of both of them and they are unaware I'm writing this. 

Here's where to get them:

- **[NimbleText Download](http://nimbletext.com/ "Nimble Text")**
- **[Postman Download](https://www.getpostman.com/ "Get Postman")**

NimbleText only runs in Windows, but Postman is a Chrome App that's kind of evolved to a standalone. Let's dig in and check them out. 

##NimbleText

![NimbleText download](/images/nimbletext-postman/nimbletext-01.jpg)

When you first open NimbleText it shows you a sample usage that shows how it works at a high level. It's simply variable replacement from a CSV and should be instantly intuitive for any programmer. You load in a CSV and then use the columns as a variable wherever you want them, and it works very well. But that's just the beginning. Here's one way I have used it. 

Scenario: you have a list of fields you will be working with in C#/.Net. It is a long list and you want to build a type to store it:

- firstname
- middlename
- lastname
- prefix
- suffix
- gender
- address1
- address2
- city
- state
- zip
- phone
- socialsecurity
- notes

Given this list, you can of course create your object by hand but dump this list into NimbleText and within a couple steps you can have a nice list of properties. Use the string:

{%codeblock%}
public string $0 { get; set; }
{%endcodeblock%}

and you get this output: 

![NimbleText download](/images/nimbletext-postman/nimbletext-02.jpg)

There's a nice set of properties. But we can do more. What if we want to change the formatting of the fields? You can change the casing very easily:

{%codeblock%}
public string <% $0.toPascalCase() %> { get; set; }
{%endcodeblock%}

Now it looks like this:

![NimbleText download](/images/nimbletext-postman/nimbletext-03.jpg)

Want to assign fields to those properties later?

![NimbleText download](/images/nimbletext-postman/nimbletext-05.jpg)

You can use it to create SQL parameters:

![NimbleText download](/images/nimbletext-postman/nimbletext-04.jpg)

Speaking of SQL, you can simplify your CREATE statements:

![NimbleText download](/images/nimbletext-postman/nimbletext-06.jpg)

{%codeblock%}
cmd.Parameters.AddWithValue("@<% $0.toPascalCase() %>", <% $0.toPascalCase() %>);
{%endcodeblock%}


This is just using the zero index, you can also use a CSV for creating other SQL statements with ease. Let's create an INSERT statement:

{%codeblock%}
$ONCE
INSERT INTO Person ($0, $1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11, $12, $13) 
VALUES
$EACH+ ('$0', '$1', '$2', '$3', '$4', '$5', '$6', '$7', '$8', '$9', '$10', '$11', '$12', '$13')<% if ($rownumOne != $numrows) {','} %>
{%endcodeblock%}

after dumping in our CSV:

![NimbleText download](/images/nimbletext-postman/nimbletext-07.jpg)

There are a variety of scripting options that really make this a powerful tool for anyone working with large amounts of text. 

This can save you hours of time over the course of a large project. 

**[Get NimbleText Here](http://nimbletext.com/ "Nimble Text")**

It's free, but you can unlock a ton of "pro" features for only $19.95. It has been well worth it for me. 

##POSTMan - Awesome tool for developing APIs

Another awesome tool I've been using a lot is [Postman](https://www.getpostman.com/ "Get Postman"). It's a must have for API developers. One thing it does well is send a variety of commands to your API, from common GET,POST,PUT,DELETE and many others:

 ![Postman download](/images/nimbletext-postman/postman-01.jpg)

There are other tools for sending REST commands, but this one stands out mostly because of the organization. There are sets of "collections" so you can build sets of REST commands for a project:

 ![Postman download](/images/nimbletext-postman/postman-02.jpg)

This has been useful for me for organizing multiple projects (My work related ones are hidden here) and keeping track of URLS for different purposes. 

Another awesome feature is "environments". You may have URLs like this:

- http://dev.yoursite.com/api/person/1
- http://stage.yoursite.com/api/person/1
- http://uat.yoursite.com/api/person/1
- http://prod.yoursite.com/api/person/1

(if you don't you really should). Rather than duplicating each of those urls you can create environments and use placeholders for the URL:

{% raw %}
{{server}}/api/person/1
{% endraw %}
and switch easily between them:

![Postman download](/images/nimbletext-postman/postman-03.jpg)

![Postman download](/images/nimbletext-postman/postman-04.jpg)

This has been great for moving between environments.

Also the ability to fully customize requests in Postman is unmatched:

![Postman download](/images/nimbletext-postman/postman-05.jpg)

No matter what kind of API/REST service you're working with Postman will help you out and save you time tremendously.

This is another free utility, but with a premium version you can save collections and run tests, as well as other features. Well worth it. 

[Get Postman Here](https://www.getpostman.com/ "Get Postman")

##Summary

These two tools have recently been added to my toolbox and I've used them like crazy so I thought I'd share them with you. They are huge time savers, and decrease iteration time as well as save you from performing mundane activities, giving you more time to innovate. I'll be sharing more utilities like this in the future. 

{% include custom/asides/programming-footer.html %}
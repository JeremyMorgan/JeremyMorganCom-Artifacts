---
layout: post
title: "Brief Introduction to REST"
date: 2015-05-21 21:25
comments: true

categories: 
- Programming

description: Perhaps you've seen the term REST being thrown around lately and have been a little curious what it's all about. If that's the case, or you know a little about it but never used it, this article is for you. Today I'm going to give a small overview of what REST services are, and why it's awesome.

permalink: /blog/programming/intro-restful-web-services/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: https://www.jeremymorgan.com/images/rest-services/intro-rest-services-og.jpg

---
Perhaps you've seen the term REST being thrown around lately and have been a little curious what it's all about. If that's the case, or you know a little about it but never used it, this article is for you. Today I'm going to give a small overview of what REST services are, and why it's awesome. 

<!-- more -->

##So long RPC, hello REST 

If you've been in the web game a while, you may remember when RPC took over the web about 10 years ago. I myself remember it being one of the most exciting things of it's time. Although the pattern has been around since the 80s it started popping up on the web in the early 2000s, and for it's time RPC was a great solution. In fact it's still in use all over the place. 

RPC stands for Remote Procedure Call, and it is a way to execute a method on a separate address space such as a server, and consume the output if needed. Here's a rough diagram of what that looks like:

{%img /images/rest-services/intro-rest-services-1.jpg "Intro to REST Services" %}

As you can see the web server at www.yoursite.com submits and retrieves information from other servers, and uses that data to assemble a web page. RPC calls can provide services for just about anything, from messaging protocols, to stock quotes, weather reports, etc. WordPress uses it extensively for pinging other blogs and a multitude of communication services. 

###XML RPC and SOAP

There are generally two ways to perform RPC calls, with XML and SOAP. There are advantages to each, but back when I was building a lot of this stuff I preferred the XML-RPC methods which was an RPC call made to a server that returned XML. It's very simple and straightforward, and didn't require a lot of ceremony. 

[How XML-RPC Works](http://tldp.org/HOWTO/XML-RPC-HOWTO/xmlrpc-howto-intro.html)

SOAP (Simple Object Access Protocol) also uses XML for messaging, but provides an extensible and powerful messaging system. It requires a bit more work in exchange for more powerful features.

[How SOAP-RPC works](https://msdn.microsoft.com/en-us/library/ms995800.aspx)

Neither of these systems were inherently bad and provided great solutions for the time. It's still prevalent all over the web and doing well. In 2008 Leonard Richardson introduced a model that's much more useful today. 

If you want a more detailed explanation, check out this <a href="https://technet.microsoft.com/en-us/library/cc738291(v=ws.10).aspx" target="_new">Microsoft TechNet article on RPC.</a>

##Key REST Principles

In short, Rest is a set of principles to be adhered to when communicating from point to point. Here are some of those guidelines 

- Deals with objects (resources) that have IDs
- Links servers together
- Provides an interface between spaces
- Uses standard methods
- is stateless

These are some of the basic things that a make a service RESTful in nature. One of the important principles is that they are to be objects with an ID. These IDs will used in a URI to identify which resource we're reading or modifying.  

>http://www.yoursite.com/api/products/1234

Next we'll look at the model for determining if an API is "RESTful" and what level it conforms to. 

##REST Maturity Model

Richardson created the REST Maturity model which specifies whether an API is "fully RESTful". Most are not, and don't necessarily have to be. But here is a rundown:

###Level 0 - XML-RPC / SOAP

- One URI
- One HTTP Method

Level 0 is a very basic model where you simply sent an RPI (Remote Procedure Invocation) at a web site and it returns some data. It can be in XML, JSON, or any format with key-value pairs. 

###Level 1 - Add URIs

- Many URIs / Resources
- One HTTP Method

Level 1 is similar except now there are multiple resources in use: 

>http://www.yoursite.com/api/products/1234

>http://www.yoursite.com/api/customers/0037

###Level 2 - Add HTTP

- Many URIs/Resources
- Use of HTTP Verbs

In level 2 we add HTTP verbs: GET,POST,PUT,DELETE. There are others, but these four I will describe later. 


###Level 3 - Add HATEOAS

- Many URIs/Resources
- Use of HTTP verbs
- Hypermedia

In this level we add HATEOAS: Hypertext As The Engine Of Application State. This is how we send objects, but also some instructions in the reply describing what we can do next. For example, it may return something like this:

    <?xml version="1.0"?>
    <account>
       <account_number>12345</account_number>
       <balance currency="usd">100.00</balance>
       <link rel="deposit" href="/account/12345/deposit" />
       <link rel="withdraw" href="/account/12345/withdraw" /> 
       <link rel="transfer" href="/account/12345/transfer" />
       <link rel="close" href="/account/12345/close" />
     </account>

(from Wikipedia)

These hypermedia controls mean the REST client does not need to know how to use the service and instead can be guided by the responses. This is what is considered a "fully RESTful" service. 

##HTTP Verbs

The HTTP verbs are a standard interface for communicating via a REST service. There is "createobject" verb, or "modifyobject" so these actions are completed with a set of verbs:

- GET
- POST
- PUT
- DELETE

I'll try to explain these in the simplest way possible. Here we are working with "resources" that are similar to records in SQL (or may directly correlate with a record).

**GET** - This retrieves a list of resources, and does not modify them. Equivalent to an SQL SELECT

**POST** - Generally used to create a new resource. Equivalent to an SQL INSERT

**PUT** - Replaces a resource with updated information. Equivalent to an SQL UPDATE

**DELETE** - Removes a resource. Equivalent to an SQL DELETE


All of this is done through HTTP. There are more HTTP Verbs in use, but I mention these as they are the most commonly used for REST. In fact, some engineers only use GET and POST for all operations. Theoretically you can do everything with GET if you overload requests in the URIs, but generally it's good practice to use these verbs for your actions. 

###Everything needs an ID

All of these resources need to have an ID. This is especially true with PUT and DELETE as we need to know which resources to modify behind the scenes. The ID is generally passed in the URI: 

>http://www.yoursite.com/api/customers/0037

If we send a PUT to this URI, it will update the customer resource with an ID of 0037. If we send a DELETE to this URI, it will remove it. 

###Verbs that must be Idempotent

In theory the GET, PUT, and DELETE verbs should be idempotent, meaning you can call them over an over without any additional side effect. For example, you should be able to send a delete to a URI over and over without breaking the system. Even if the resource has been deleted you should send back a code, but not throw an exception or crash. 

Often times when designing REST interfaces, I will send a 200(OK) when a resource is deleted. Then on subsequent deletes I will send a 204 or 404 so the caller knows the resource is no longer present. I don't do this with a PUT, however. Even if the caller sends a PUT with the same information over and over they'll get the same response because I'm not going to be checking if the data submitted is actually different. Instead I'll just blindly update the resource with whatever information is sent. We don't really care if the data is truly different and don't want to waste cycles checking for it unless we are doing some form of auditing.

##REST API Example

Here's an example of a simple REST API using the information we've learned about above. We want to create an API to modify our customer information. 

{%img /images/rest-services/intro-rest-services-2.png "Intro to REST Services" %}

As you can see sometimes the URI is the same but the verb being sent is different. This is crucial to know when building your application, because getting your verbs mixed up can give unexpected results. You may intend to update a resource and instead delete it. 

###Communication between endpoints

There are several ways you can communicate over REST and there is no right answer. The most common ways are XML and JSON. Here is a light comparison between the two. 

**XML:**

Pros:

- Generalized markup, so you can create multiple formats and styles for custom purposes.
- You can define Schema for custom datatypes and perform structure validation.
- can use XPATH to extract information much easier than JSON

Cons:

- Much more verbose than JSON, more data is being transferred and can be slower

**JSON**

Pros:

- Easy integration with JavaScript (which is commonly used to interface with REST services)
- Simple, easy to understand syntax
- Less overhead, smaller sizes and better performance


Cons:

- Less powerful and flexible, especially with different data types



##Summary

I hope this has provided a good overview of what REST services are and how they're structured. The trends in web technology have moved away from the common middleware web services that generate HTML for browsers and today people access the web from a variety of different devices, including phones, tablets and watches. REST is well suited for this as it gives a common interface to your data, giving you the freedom to use that data on a variety of platforms. 

The same REST service can power a web page, mobile application or anything you can imagine. You can have synchronization between a web page and mobile device (think of Spotify) with ease. REST is the future of the web and something you should be using for your next project, if you aren't already. 

I'd like to give a shout out to <a href="https://www.getpostman.com/" target="_blank">POSTman</a> which is an awesome interface for testing REST services. You can use it while designing your REST backend or your front end application. It's indispensable. 

{% include custom/asides/programming-footer.html %}
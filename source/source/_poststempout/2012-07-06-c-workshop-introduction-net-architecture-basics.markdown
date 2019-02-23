---
comments: true
date: 2012-07-06 23:29:01
layout: post
slug: c-workshop-introduction-net-architecture-basics
title: 'C# Tutorials - Introduction: .Net Architecture Basics'
wordpress_id: 858
categories:
- Tutorials
permalink: /tutorials/c-sharp/c-workshop-introduction-net-architecture-basics/
description: A nice introduction to C# and the .Net Architecture. I explain the basics and show you how to get started. 
author: Jeremy Morgan
sharing: true
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---

In the next few months I'm going to be creating some tutorials on learning C#.Net, from the very beginning. Because of the close integration the first part of this workshop will be about the .Net framework, so you can get a general familiarity with developing in this environment. This is just a basic introduction to the .Net Framework and we'll drill down more in coming tutorials.

<!-- more -->
### .Net Framework Basics

{% img right http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/07/how-to-learn-c-sharp.png How to learn C# Programming %}

Topics we'll cover here:

  * What is the .Net Framework?
  * Some Benefits of the .Net Framework
  * What is C#?
  * Design Goals of C#
  * Some Benefits of C#
So let's get started!

### What is the .Net Framework?


The .Net Framework is a set of software libraries provided by Microsoft for developing applications for Microsoft Windows (mostly). It is a library of abstracted code written to do common functions to help windows developers. It is also a virtual machine that runs the software in a virtual environment, optimizing the code for the host's hardware. Microsoft's main motivation is to create an easy, powerful system to help develop software for their product, Microsoft Windows. In my opinion, they've succeeded in that effort.

The basic idea is just a large collection of commonly used code that makes programs run faster, more consistent at drastically reduced development time. The .Net framework is offered free for Microsoft, though it is closed source (that's changing in some ways).

You can download the latest .Net framework by [clicking here](http://www.microsoft.com/net/download) and installing it.


### Some benefits of the .Net framework:


**Large, robust class library** - The class library is a huge collection of pre-written code that is useful and extensible. You don't need to reinvent the wheel, many functions have been simplified for you.

**Rapid Development ** - Especially when developing Windows desktop applications, the .Net framework provides a great rapid development solution. It is integrated tightly with Windows as Microsoft makes them both, and many common Windows elements like forms, buttons etc are already built.

**Excellent Support** - The support for .Net is amazing. Not only can get you paid support through Microsoft, but they also have tremendous amounts of documentation available for free, and there are countless developers on the web on sites like Stack Overflow and Programming Forums who can help you as well.

**Excellent Performance -** The framework contains tons of pre written code that's optimized and standardized for the environment, but the framework also provides JIT or ["Just in Time" compilation](http://en.wikipedia.org/wiki/Just-in-time_compilation) which ensures that only the code that is needed is compiled, and it's also compiled for the platform it's running on.

**Language Interop -** Does your application contain multiple languages? That's ok because with the language interop capabilities you can write your code in C++, C#, Visual Basic, Delphi and more. Since they all share the same black box they work together fairly well.

As a programmer, I really love the .Net framework and I could go on and on about it, but this isn't a commercial for Microsoft's (free) product, so I'll let you investigate whether the .Net framework is the right choice of you and your company.


### What is C#?


C# ( "See Sharp" ) is a programming language created by Microsoft for the .Net iniative by a team led by Anders Hejlsberg. It was originally called "Cool" or "C like Object Oriented Language". The project started in 1999 and was publicly announced in July of 2000. It is maintained and standards are developed by Microsoft.


### Some Design Goals of C#

  * C# language is intended to be a simple, modern, general-purpose, object-oriented programming language.

	
  * The language, and implementations thereof, should provide support for software engineering principles such as strong type checking, array bounds checking, detection of attempts to use uninitialized variables, and automatic garbage collection. Software

	
  * Robustness, durability, and programmer productivity are important.

	
  * The language is intended for use in developing software components suitable for deployment in distributed environments.

	
  * Source code portability is very important, as is programmer portability, especially for those programmers already familiar with C and C++.

	
  * Support for internationalization is very important.

	
  * C# is intended to be suitable for writing applications for both hosted and embedded systems, ranging from the very large that use sophisticated operating systems, down to the very small having dedicated functions.

	
  * Although C# applications are intended to be economical with regard to memory and processing power requirements, the language was not intended to compete directly on performance and size with C or assembly language.

Source: C# Language Reference ECMA: <a href="http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf">http://www.ecma-international.org/publications/files/ECMA-ST/Ecma-334.pdf</a>

It should be noted that the lead designer and archictect Anders Hejlsberg was also involved in building Turbo Pascal and Embarcadero Delphi, so he had considerable experience with RAD Environments and there are some similarities.


### Advantages of C#

  * Familiar syntax
	
  * Automatic garbage collection
	
  * Type safety
	
  * Compiled code - performance
	
  * Linq and collections
	
  * Works with object models well
	
  * Supports functional programming

  * Close integration with the .Net framework. (specifically designed for it)

The idea behind C# is pretty simple: They want something that's easy to develop in like Visual Basic, where you can build programs very rapidly, and have the performance of compiled code like C or C++.
Before C# came along you could develop applications quick and easy with Visual Basic but if you wanted real speed you had to use C or C++. Now you get the best of both worlds and there's nothing quite like it.

In our next tutorial we're going to start diving in to the C# language itself.


### Where can I get the tools to build C# apps?

The best news here is you can develop C# without spending a dime. Here's the tools you'll need.

[Microsoft .Net Framework](http://www.microsoft.com/net/download)<br />
[Visual Studio C# Express 2010](http://www.microsoft.com/visualstudio/en-us/products/2010-editions/visual-csharp-express)<br />

Optionally you may want to install the following:

<a href="http://www.microsoft.com/sqlserver/en/us/editions/2012-editions/express.aspx">SQL Server Express 2012</a><br />
<a href="http://www.microsoft.com/web/">Microsoft Web Matrix 2</a>

 ( if you plan on doing web development )<br />

Join me on my next tutorial where I start digging in to the C# language itself. It's something I really get excited about because it's one of my favorites and you'll soon see why. See you then!

{% include custom/asides/tutorials-footer.html %}

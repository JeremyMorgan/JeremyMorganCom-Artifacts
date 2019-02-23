---
layout: post
title: "What is MVC?"
date: 2013-04-10 18:04
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: The MVC or Model View Controller architecture is a software pattern that's become very popular over the last few years. With this article we'll take a look at MVC, how it works and how it's used. 
permalink: /blog/programming/what-is-mvc/
ogimage: https://www.jeremymorgan.com/images/what-is-mvc-3.jpg
---
The MVC or Model View Controller architecture is a software pattern that's become very popular over the last few years. With this article we'll take a look at MVC, how it works and how it's used. 
<!-- more -->

###What is MVC?

MVC is not really a package or a tangible object but more of an idea or methodology. Microsoft has a software package for ASP.Net called [Microsoft MVC](http://www.asp.net/mvc "Microsoft MVC") but it's not really a product as much as an implementation of the pattern. There are other projects out there similar to this, but you can build a Model, View and Controller in any language. 

It's simply a way of building software that has many benefits, here's a rough idea of how it works:

{% img center https://www.jeremymorgan.com/images/what-is-mvc-1.jpg What is MVC? %}

The MVC Model consists of three parts:

**Model** - Usually tied to a database or other data source, this section only deals with raw data in the application. 

**View** - This is the display functionality of the application. Usually a web page or User Interface.

**Controller** - This is what ties the other two together. It takes commands from the user, retrieves or updates data in the model and communicates information back through the view.

When these three parts work together you get a separation of concerns in your code. You have a model which only cares about itself, it merely processes requests and manipulates or sends data. The View is concerned only with displaying the data and providing a way for the user to communicate their next move. The controller merely coordinates the two.  

###MVC on the Web

So how is this applied in real life? Here's a diagram of a web site using MVC:

{% img center https://www.jeremymorgan.com/images/what-is-mvc-2.jpg What is MVC? %}

First the visitor opens a web browser, and a command is sent to the controller to show a web page. The controller then contacts the model, which pulls raw data from the database and passes it back to the controller. The controller then passes it to the view which formats the data and mixes it with html to create a web page you can view.

###Advantages of MVC

MVC frameworks do not offer any additional performance or features to your application, they exist primarily to help the programmer(s).

**Separation of Concerns:** - This is a tenet of good design and encapsulates your functions and creates a defined interface. For example someone working on a model only has to worry about interfacing with a database and getting the right information, but doesn't have to worry about browser compatibility at the same time. 

**Code Reuse:** - Because of the separation of concerns with MVC you can reuse your code easily. If you have a great view object that displays pages well on a phone for example, you can reuse that same code easily as a view in another application. 

**Decoupling:** - Another tenet of good design, keeping your software decoupled means easier changes down the road. For instance if you're changing database servers from one vendor to another do you want to rewrite or modify your model, or the whole piece of software? With a well implemented MVC framework you can do it in a fraction of the time. 

**Testability** - While having your software decoupled and separated is good for programming, it's great for testing. You can take a section of code and easily run various tests on specific parts of the program as you go along and those tests can be very focused. Are you looking for data integrity? Expected display? When functions are clearly grouped testing becomes far simpler and more organized. 

###Disadvantages of MVC

So if MVC is the greatest thing since sliced bread then why isn't everyone doing it all the time? It's a mistake to think MVC is a magic bullet that will cure all your software problems. 

**Complexity** - MVC adds a layer of complexity to any project. This is a cost that's acceptable with a huge payoff and that usually comes from large projects that would be complex anyway. But a small app or widget is better off without such complexity. Sometimes MVC just adds more work to a task that would otherwise be simple. 

**Can affect performance** - If you have a simple widget that uses 20 lines of code and a simple task it could very well be slower when done in an MVC environment. Again it comes down to cost vs benefit, and MVC doesn't always win. 

**You may be using non MVC code in your project** - You could be stuck with code that is already built with model and view functionality tightly integrated. Trying to mix and match in an MVC model can cause more problems than it solves. 

**Additional Resource Usage** - MVC frameworks are avoided in low resource environments such as embedded software and programs designed to run very lean. When you're building a web app on a big server the fractional increase in memory usage is well worth the benefits but if you're counting bytes or squeezing something onto a chip it's best to avoid them. 


###Summary

I hope I've given you a general idea of what MVC is and you may even be considering it for your next project. Generally the following projects are best suited for MVC frameworks or design:

- Large web applications
- Large projects
- Projects with multiple programmers
- Projects with separate designers and programmers
- Anything that may scale larger in the future
- Projects that will have an API

In future articles I will go over how MVC is changing and being implemented in today's application. It's been around since the 80s and the classic MVC model is changing and adapting to new trends. I'll also do a tutorial showing how to do a basic MVC design with PHP. Till then send me your comments and questions if you have them! 

{% include custom/asides/programming-footer.html %}






---
layout: post
title: "The Road To Technical Debt is Paved With Good Intentions"
date: 2013-11-12 19:40
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: Technical Debt is one of the most expensive and problematic issues your company can have when it comes to development. I explain what it is, and how to avoid it.
permalink: /blog/programming/what-is-technical-debt/
ogimage: https://www.jeremymorgan.com/images/technical-debt-og.jpg
---
Technical Debt is one of the most expensive and problematic issues your company can have when it comes to development. Here I will explain what it is, and how to avoid it.

<!-- more -->
##What is Technical Debt? 

Technical debt is a metaphor for the result of taking shortcuts in your development that you'll have to fix later, creating "debt" that has to be paid off. In keeping with that metaphor you often have "interest" that must be paid on that debt whenever extra time is added to work around the bad implementation in the first place. It usually starts with the phrase "we'll fix that later" and often goes unresolved.

Technical debt usually takes some time to manifest, but once it does you'll find yourself spending an exponentially larger amount of time creating workarounds. 

Here's an example:

{% img center https://www.jeremymorgan.com/images/technical-debt-1.jpg Technical Debt %}

In this diagram we can see a couple of applications. As you can see we have a common database class that has abstracted methods to connect to the database. This is good practice, as these functions are often repeated across applications. 
  
##How Technical Debt Happens

Technical debt is a long and slow process that rarely happens overnight. But a few bad decisions up front can lead to larger problems later. 

###The beginnings

As application 1 is being developed, the programmer takes the wise choice of creating an abstract database connector he or she can reuse later. The class is developed to accept parameters defining each connection. Then the programmer moves on and creates the rest of application 1.   
  
During testing it's found that the database returns some strange results under certain circumstances. The programmer evaluates the problem and determines they can do one of two things:  
  
- Fix the problem by altering the database schema and reworking the code to properly handle this case. This may take a few days. 
  
- Hack up a quick fix that works around the issue and only takes an hour. 

About this time the project manager says the CEO is waiting for this application and it needs to be finished promptly. The developer remembers that there are still 5 more features that need to be added and the design needs to be finished. "I'll do the workaround then fix it later". We've all been there, including me. The programmer has saved 3 days of valuable development time, but the application gets completed and we move on. 

###Piling it up

So now a few months later we start to develop application 2. Remembering we have our database class already completed, we simply extend and develop application 2. We layout a model, and build our framework and start testing our application. Suddenly we notice that there is some strange output again from that same database query method. What should we do? 

- Fix the problem by altering two database schemas and reworking the code on both projects to properly handle this case. We must coordinate our change so that there are no unexpected side effects from this refactoring. This may take a week.  
  
- Hack up a quick fix that works around the issue and only takes an hour. 

Again the programmer feels the pressure from a looming deadline. We don't want to explain to the boss why there is a delay, and that it's our fault. So it gets hacked and duct taped again. 

###Now we're underwater

A year later, we have 6 applications that are all sharing different abstracted parts of code. We have attempted to refactor the database class a couple times and it ended up breaking parts of the other applications. So we put workarounds on top of our workarounds. We make small changes for one application and the others go down. The CEO sees it and is rightly furious. How can we fix it? Wipe it out and start over? 

At this point you're looking at weeks or possibly months of work. During this time no new projects will be completed. It's dead time that's impossible to justify to your management. Yet project number 7 is an application that ostensibly should take 2 weeks, and instead it's taken 6. The project manager is furious, the developers are unhappy and the software is a mess. So who is at fault? Everyone involved. Poor planning, unrealistic expectations and shortcuts is what got us to this point.

##So how do we avoid this?

If you ask ten programmers how to avoid and fix this you'll probably get ten different answers. There have been debates for decades about it, but one thing most can agree on is the fact that shortcuts are bad. Here are a few ways to avoid this problem.   


1. **Create a programmer utopia** - All programmers are given as much time as they need to develop perfect code that applies all the best practices and teachings of the last 50 years of academic research on software development. It might take months for a simple CRUD app, but rest assured it will be the most beautiful and perfect CRUD app you've ever laid eyes on.

2. **Silo development for everything** - Create software on an ad-hoc basis and reuse nothing. Abstract nothing, and build every application as a self standing independent application. Each application is developed by a single person for a single purpose. Don't ever try to change platforms, databases or languages used and avoid any broad changes. 

3. **Do it right the first time** - Plan your software as much as you can. Establish requirements and stick to them. Build with future scaling and reuse in mind. Decouple as much as possible, reuse what you can and test accordingly. If you have a problem, refactor and fix it as soon as possible, and don't stop working on it until it is right. Test everything and retest it every single time a change is made. 

So which one do you think you should choose? I have over simplified it here for the sake of brevity but these are all good ways to avoid the technical debt sinkhole that so many companies end up in. 

Here are some hard fast rules:

- Establish realistic expectations
- Gather requirements and get them in writing.
- Set priorities and stick to them.
- Plan for the worst, it might happen.
- Plan for change, it will happen.
- Don't rely on workarounds
- Test. Use structured, measurable testing techniques
- Don't wait to refactor
- Don't patch it to push it out the door
- Don't overlook fixes because features were added

###Who is at fault for technical debt again? 
  
  Technical debt is usually the fault of nearly everyone involved in a project. It starts with unrealistic expectations from management, increased pressure from project managers, and programmers who are either under the gun, lazy, inexperienced, or some combination of those factors. 
  
  But these things all stem from the good intentions of everyone involved. The CEO wants to ensure the survival and growth of the company. Management wants to make sure goals are met at a reasonable expense for the company. Project managers want to produce lots of work to show management they're making it happen. Programmers want to create cool stuff. Everyone wants to produce things (if they don't they shouldn't be working there) but experience teaches us how to collaborate to make it work. 

##Summary

Technical debt is a killer. It wastes your company resources, angers your boss, confuses your project managers. It causes programmers to become frustrated and lose pride in their work. It causes projects to take longer and longer to develop. 
  
The power is in your hands as a programmer to push back and try to avoid this pitfall. A simple investment of time up front can prevent massive problems later on. If you inherit technical debt (at some point in your career you will) you absolutely need to make the case to freeze development and fix problems, even if it's just one small problem at a time. In fact, that may be the only way you'll ever get it done. One method at a time.   
  
I'll expand on this more soon and expand on some of these points. Be sure to subscribe to my feed to get more articles like this. 

{% include custom/asides/programming-footer.html %}
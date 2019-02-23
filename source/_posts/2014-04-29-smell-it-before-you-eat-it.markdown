---
layout: post
title: "Smell it Before You Eat it"
date: 2014-04-29 20:51
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: Whether you're developing for a personal project, small business or Fortune 100, you should take the time to make sure your changes aren't going to break things. In times past this usually meant spending lots of money. These days the only thing you'll need to spend for quality is time, and not much of it.

permalink: /blog/programming/smell-it-before-you-eat-it/
ogimage: https://www.jeremymorgan.com/images/software-integration.jpg
---

Whether you're developing for a personal project, small business or Fortune 100, you should take the time to make sure your changes aren't going to break things. In times past this usually meant spending lots of money. These days the only thing you'll need to spend for quality is time, and not much of it. 
<!-- more --> 

###How the web commando publishes a web page

We all know how the web commando works. You have a website with files on it, and you download them  via FTP (gotta have that latest copy!) edit it in a text editor and push it back up. .Net folks: edit and quick publish. You open up the browser and check it to make sure it looks good, and move on. 

When I first started developing websites I did this too. At one time it was a reasonable thing to do, though still not a good practice. If you were on a small budget you couldn't afford multiple servers, testing was pretty much unheard of and continuous integration was years away. So we did it, and we got away with it. 

###How a professional publishes a web page

In 2014, there is no excuse for being a web commando. Shooting from the hip is the product of laziness or sloppiness. These days a professional has the following things set up:

- Development Environment
- Staging Environment
- Production Environment

Some even have a preview environment for managers. Here are a few things these environments must have:

- The same operating system
- The same version of engine (PHP, Python, Ruby, .Net, etc)
- The same version of database back end
- The same database schemas 
- The same configuration (sans Development)

I mention development should have a different configuration, that's because you should turn error reporting on in development, but have it turned off in staging and live. This way you can catch your errors quickly in development, and see what it will "really look like" on stage. 

>Staging and Live environment should be identical. There should be no differences in configuration. 

If you don't want your staging accessing live data in the database, make a reasonable copy of sample data. The schema should be exactly the same however. You want completely predictable behavior from Staging so a push to to the live environment is seamless and worry free. 

>Note: I am not including continuous integration (CI) in this setup. That's better tackled with it's own article. 

Here's a diagram of an optimal setup for web development:

{% img https://www.jeremymorgan.com/images/dev-stage-live.jpg "Development Environment" %} 

This is optimal, but not always possible. 

###The Workflow

So here is how the workflow goes in the diagram set up above. 

1. Developers create code and made changes. 
2. They push (with git or something similar) changes to dev. 
3. They run tests
4. After they like the results, they push to the staging branch. 
5. Manager is notified "check this"
6. Manager either approves or does not approve changes. 
7. If approved, Manager pushes to live (through git or other custom mechanism)
8. Once live, the public or users can see the changes. 

In an optimal situation the developers can pull down code to their local machine and connect to the development database. Some business rules don't allow that, so we'll assume they're using a development server exclusively. 

This is a great setup for small or large businesses as a baseline, to make sure you can see if how changes will affect the site, before your customers or users do (smell it before you eat it). While it seems simple, many organizations avoid this model entirely. 

This model can be set up for little expense. You can actually have all three of these environments on the same server if you wish. You don't have to have three physical servers to do this, due to virtualization. 

###Advantages to This Model

By using this model you have the following advantages:

- Developers are able to "go wild" with changes, knowing that the live site will not be broken. 
- Managers can view the changes as if they were live, even though they arent.
- If something breaks, you'll see it before the customer does. 
- Management is given a good chance to evaluate everything. If they don't like, they can cancel it and the end user will never know the difference. 

There are some downsides however, but well worth it:

- This setup will add to development time.
- Multiple servers will have to be set up.

For most companies, a little extra time is a small price to pay to not have egg on your face when a live site goes down. 

###What do I Need? 

At a minimum you'll need a production server with two Virtual Machines. Whether you're developing in a Linux Environment or Windows, virtualization is the way to go here. With Linux environments you don't have the licensing hurdles so separate physical machines may be a better option. 

You also need a deployment solution. I would recommend git for deployment, but SVN could work. Also using rysnc between stage and live isn't a terrible idea. The reason you want to use these systems over FTP is simply for version control. If you don't like something you can roll it back, also you can track changes much better. If you use Git from development to staging you can see exactly what was pushed when, and what changes were made. Using something like Rsync between staging and live ensures fast deployment of changes. 

###What Kind of Testing Should I Do?

In the next article I will describe methods of testing. At a minimum you need integration testing, and some kind of acceptance testing but optimally you should use:

- Unit Testing
- Integration Testing
- Smoke Testing
- Regression Testing
- Acceptance Testing

I will describe these in full in a future article and show you some good software to use for this. I will also show some great tools to use for this. 


###Summary 

In over a decade of development I have seen a lot of changes, and one of the least sexiest seems to be testing and deployment, yet they are the most important. Good quality software is a must for your organization. Most of the time you can't reach the "ivory tower" level of testing and integration for your projects but the closer you can get the better. We live in a time where you don't have to spend a lot of money and a little time invested has huge payoffs when your software works correctly as expected.

<a href="https://affiliates.arvixe.com/track.php?id=5348&tid3=frontpage" target="_blank">
<img style="border:0px" src="https://affiliates.arvixe.com/media/banners/All.486.60.gif" width="486" height="60" alt="Cheap ASP Hosting"></a>
<br>

####<a href="https://affiliates.arvixe.com/track.php?id=5348&tid3=frontpage">Want Extreme ASP.Net hosting for only $4 a month? Click here to see this deal!!</a>

{% include custom/asides/programming-footer.html %}
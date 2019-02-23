---
layout: post
title: "Using DISM to Create a Repeatable IIS Installation"
date: 2018-09-28 23:20
comments: true
categories: 
- IIS
- Devops

author: Jeremy Morgan
sharing: true
description: Repeatable installs are all the rage in Devops these days. As developers we have this "automate everything" mentality, and for good reason. In this article I'll show you how you can do that with IIS installation as well.

ogimage: https://www.jeremymorgan.com/images/repeatable-iis-devops/repeatable-iis-devops-og.jpg
permalink: /blog/iis-devops/how-to-dism-repeatable-iis-install/
---
Repeatable installs are all the rage in Devops these days. As developers we have this "automate everything" mentality, and for good reason. In this article I'll show you how you can do that with IIS installation as well. There's no reason to go hunting and pecking around the GUI every time you need to do this. This is the just one of many ways to automate IIS installs, which I'll be covering in the next few weeks.

I also cover this in depth in <a href="https://pluralsight.pxf.io/c/1221983/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Finstalling-configuring-iis" target="_blank">my latest Pluralsight course</a> on Installing IIS. 

###Why would I ever need to do this? 

{% img right /images/repeatable-iis-devops/repeatable-iis-devops.jpg "How To Create Repeatable Installs in IIS" %}

Most of the time administrators probably have a task like "throw IIS on the server and make sure the application works" and they do just that. That's how I used to do it too. I was working on a project many years ago that required us to spin up VM servers on a virtual network as a "stack".

This stack was a small snapshot of our production network, so to make sure our software worked with everyone's updates, we had to build a new stack a few times a week. 

A few times a week, we'd have to click through the GUI install and remember each box to check. Yeah, you can get good at it but it's a waste of time. 

Naturally I had to find a way to automate it, and break out some PowerShell. You do this, because you save time that can be spent doing fun stuff. So let's learn how to create automated, repeatable IIS installations. 


###Getting Started

So you're an administrator for ACME Widgets and you want to create a custom install of IIS and make it automated. You create a new server and are ready to go. 

To find out if IIS is installed, we'll run a command called <a href="https://docs.microsoft.com/en-us/windows-hardware/manufacture/desktop/what-is-dism" target="_blank">DISM</a>. DISM is a tool to build and service Windows images, it's mostly used to create and maintain images for Virtual Machines, it's extremely powerful, but we'll cover that in a future article. For now we'll use it to check features on the machine. 

Open up a command prompt, and run the following command:

```
dism /online /get-featureinfo /featurename:IIS-WebServer 
```

As I run it on my virtual machine, I can see that IIS is not yet installed.

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-01.jpg)

You can also find a list of everything that's enabled with this command:

```
DISM /online /get-features /format:table | find "Enabled"
```

And you'll see something like this:

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-02.jpg)

by piping the output into find and searching for enabled we can get a full list of features that are already enabled on the server. 

We can also quickly see if a single feature is enabled like we did before, but piping the results into find and checking the state:

```
dism /online /get-featureinfo /featurename:IIS-WebServer | find "State"
```

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-03.jpg)

Here we can quickly and clearly see IIS is not installed. 

###Creating a Batch File

So now that we know we can get this type of output, we're going to build a little batch file to do it, and we'll run the command a little different this time. This is pretty light programming, but it will be a set of tests to see if particular items are installed. 

Type in notepad webinstall.bat and let's create a batch file. Add the following:

```
@ECHO OFF
dism /online /get-featureinfo /featurename:IIS-WebServer | find "State : Disabled" > nul
```

We're typing in dism, online, get-featureinfo, featurename, then piping that to find. We'll look for state saying disabled, and if that phrase is found, that means IIS is disabled, or not installed. That will change our error level, which we'll add next. 

```
if %ERRORLEVEL% == 0 (
echo "IIS Web Server is not installed"
)
```
If our error level is set to zero, that means the phrase state enabled was found in our output. Let's test it out. 

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-04.jpg)


Now in our batch file we can see that IIS is not installed, and we have a block inside the statement to install IIS. 

We could do that with a block of code like this:

```
if %ERRORLEVEL% == 0 (
echo "IIS Web Server is not installed"
dism /online /enable-feature /featurename:IIS-WebServer /all
)
```

This is the first basic IIS install script. At the end we can put a check to see if it's installed:

```
dism /online /get-featureinfo /featurename:IIS-WebServer | find "State"
```

The finished batch file <a href="https://gist.github.com/JeremyMorgan/5f5ca70db82bd645d891c1aedd4e1d2b" target="_blank">is available here</a>. 

###Running the Script

Now after we run the file, it should do the following set of steps:

- Check to see if IIS is installed
- If it's not installed, install it
- Check again to see if it's installed. 

So the end result is, if IIS is installed it does nothing, if it's not installed then adds it, and looks like this:

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-05.jpg)

This small, simple script can make sure IIS is installed on the machine. And it's repeatable. 

###Customizing the Install

Of course as you're building your script, you may need to install other IIS modules, chances are it won't be just a plain IIS install.

If you run the following command, you can see everything related to IIS that can be installed here:

```
dism /online /get-features | find "IIS"
```

This is a good way to get a list of IIS features available: 

![Repeatable Installs in IIS](/images/repeatable-iis-devops/repeatable-iis-devops-06.jpg)

So, if you'd like to add more IIS features, it's as easy as making more loops to check for them:

ASP.NET:

```
dism /online /get-featureinfo /featurename:IIS-ASPNET45 | find "State : Disabled" > nul

if %ERRORLEVEL% == 0 (
echo "ASPNET is not installed. We should install it."
dism /online /enable-feature /featurename:IIS-ASPNET45 /all
)
```

HTTP Redirect:

```
dism /online /get-featureinfo /featurename:IIS-HttpRedirect | find "State : Disabled" > nul

if %ERRORLEVEL% == 0 (
echo "HTTP Redirect is not installed . We should install it."
dism /online /enable-feature /featurename:IIS-HttpRedirect /all
)
```

HTTP Logging:

```
dism /online /get-featureinfo /featurename:IIS-HttpLogging | find "State : Disabled" > nul

if %ERRORLEVEL% == 0 (
echo "HTTP Logging is not installed . We should install it."
dism /online /enable-feature /featurename:IIS-HttpLogging /all
)
```

You get the idea. You can build a custom installation that can be run from a batch file, quickly and easily. 

###Conclusion

So now you're set to create a neat little batch file you can run on any machine to install IIS to 100 different VMs if you want to. You can put this on an Azure stack, or run it on a development machine. As I stated I cover this and many other repeatable installations in <a href="https://pluralsight.pxf.io/c/1221983/424552/7490?u=https%3A%2F%2Fwww.pluralsight.com%2Fcourses%2Finstalling-configuring-iis" target="_blank">my latest course on Pluralsight</a>. It covers ways to effectively install IIS at a large scale. 

You can even run DISM remotely or on VM Images that aren't even booted. It's a great tool to get to know. 





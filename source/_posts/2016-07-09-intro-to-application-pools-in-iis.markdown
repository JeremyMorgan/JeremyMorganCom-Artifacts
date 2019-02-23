---
layout: post
title: "Intro to Application Pools in IIS"
date: 2016-07-09 02:56
updated: 2018-03-25 12:22
comments: true

categories: 
- Programming
- DotNet
- DevOps
- IIS

description: Application Pools in IIS can be somewhat of a mystery. Since they're created for you automatically many times Administrators don't give them a second thought. But understanding application pools is crucial to having a good running IIS server. 

permalink: /blog/iis-devops/what-is-an-application-pool/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: /images/what-is-iis-app-pool/what-is-iis-app-pool-og.jpg
---

Application Pools in IIS can be somewhat of a mystery. Since they're created for you automatically many times Administrators don't give them a second thought. But understanding application pools is crucial to having a good running IIS server. 

I cover this and other IIS Administration topics in my [IIS Administration Fundamentals](http://www.pluralsight.com/courses/iis-administration-fundamentals) course at Pluralsight. Check it out!

<!-- more -->

###What Is an Application Pool?
To understand Application Pools, we must first understand applications, as far as IIS is concerned. 

An **application** is a set of files and folders that deliver content. Any website will have a default application assigned to it, even if it's just HTML and images. The diagram below shows the web server / web site / application relationship: 

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-01.jpg)

An **Application Pool** is a container for your applications. It serves to isolate your application from other applications on the server. Each application in an application pool shares a worker process (w3wp.exe). You can have several applications share the same worker process, or have one for each application. 

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-00.jpg)

When setting up Application Pools, you have a few options. Let's compare a couple patterns. 


####Multiple Applications in Single Pool
![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-02.jpg)

With this setup every application shares the same pool/process. Some reasons you may want to do this:

- Simpler Design
- When making changes you only have to do it once. 
- Caching is improved, code can be shared and cached between applications

Some reasons you may not want to:

- One crash takes down every application
- An application with high load will slow the others
- All applications share the same security profile
- One applications required setting may break another application. 

####Each application has its own application pool

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-03.jpg)

With this setup each application has it's own unique process.

Some reasons you may want to do this:

- Isolated operations - if one application fails it doesn't affect the others.
- Isolated performance - a higher load application (most likely) will not slow the other applications down.
- Security can be configured for each application individually.

Some reasons you may not want to do this:

- Settings cannot be changed globally, must do one by one. 
- Common code caching advantage not present.
- Could create more overhead than a single pool. 

There is no "magic bullet" for this, it will depend on your website and the needs of your organization. It's definitely something you want to experiment with for best results. 

###Application Pool Settings

There are some important settings to consider with Application Pools. If you choose the basic settings you don't get much:

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-04.jpg)

This only allows you to change your CLR version and Managed pipeline mode. But choose advanced settings and you get far more options:

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-05.jpg)

Here are some ones I've often seen changed:

- **.Net CLR**- Although there isn't a great reason to run a lower version of .Net it does happen. Usually I find myself setting this when the default app pool framework is 2.0. 

- **Enable 32 Bit applications** - This is a common one for backwards compatibility. For instance the last application I worked on that required this used 32 bit DLLs written in C++, and the application would not function without this setting. 

- **Managed Pipeline Mode** - This is another one used for backwards compatibility. You may need classic mode for some older ASP applications. 

- **Queue Length** - this is a throttling setting and it's pretty rough but useful. What we're saying here is we can have 1000 requests in the queue, and above that visitors will get a 503 error. 

- **Limit** - This is another throttling measure that controls the maximum percentage of CPU time you want this application pool to consume. 

- **Limit Action** specifies what to do when that limit is hit. You can kill the process, throttle it, or do nothing. 

- **Limit interval** is for fine tuning throttling. After the limit above is hit, this setting controls how many minutes we can stay in that state until recycling. If it's too long you may have throttling on after it's no longer needed. Too short and of an interval will just keep it throttling. 

- **Identity** - This is important because this is the user your application pool is impersonating. Most of the time application pool identity is your best choice, but there are times when you will need a specific user to run a process. In that case you can have this app pool run under that user's account and it's given their permissions. Don't do this unless you absolutely need to. It's something I've seen a lot in the field especially in high security applications. 

As I've said before, there is no silver bullet for tuning either. It really depends on your organization and how your website is used. A great tune on one website could be bad for another. 

###How to Create an Application Pool

Creating Application Pools in IIS is easy. You can go into IIS Manager in the **Application Pools** feature pane, right click and create a new one:

![What is an Application Pool](/images/what-is-iis-app-pool/what-is-iis-app-pool-06.jpg)

Or you could create one with PowerShell (my preferred option):

```
$appPoolName = 'jeremyscoolapp'

if(!(Test-Path IIS:\AppPools\$appPoolName))
{
    $appPool = New-Item $appPoolName
    $appPool | Set-ItemProperty -Name "managedRuntimeVersion" -Value 'v4.0'
}

Set-ItemProperty iis:\Sites\WebsiteName -Name applicationpool -Value $appPoolName
```

In this script you can see that I define a name for my Application Pool. Then, I test to see if it already exists. If it doesn't I create a new Application pool. Then I use Set-ItemProperty to change my runtime version to 4.0. You can set any of the application pool settings this way. 

To see the options you can change type the following at a PowerShell prompt:

```
Get-Item IIS:\AppPools\DefaultAppPool  | Select-Object *
```
Replace DefaultAppPool with the name of your application pool if it's different. 


###Conclusion

I hope this has given you a good introduction to application pools in IIS. Because these are created automatically often times administrators don't give a lot of thought to setting them up. Many websites run just fine with default settings. If you find yourself needing a custom configuration or you have some load issues, you now have a good understand of application pools and where to look to change them. 

I cover this and many more IIS topics in my new Pluralsight Course [IIS Administration Fundamentals](http://www.pluralsight.com/courses/iis-administration-fundamentals). Check it out if you're interested in learning more about IIS Administration.

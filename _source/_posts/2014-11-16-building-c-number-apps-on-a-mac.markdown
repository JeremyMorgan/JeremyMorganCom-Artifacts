---
layout: post
title: "Building C#/ASP.NET apps on a Mac with vNext"
date: 2014-11-16 13:39
comments: true
categories:
- Tutorials
- Programming
description: A step by step tutorial to get you started building C#/ASP.NET applications on your Mac using vNext.
permalink: /tutorials/vnext/how-to-build-c-sharp-on-mac-osx/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-og.jpg
---
In case you've been away from the internet for the last week, you've probably heard the big news from the ASP.Net team. They're embracing open source in a major way. Scott Hanselman wrote [a fantastic post about the news](http://www.hanselman.com/blog/) that nearly broke the internet (and certainly tested his hosting provider). Microsoft is really backing up their claims that they are committed to Open Source in a major way.

<!-- more -->

Up until now the only ASP/C# development I do on my Mac is under a Virtual Machine. I have a couple "bleeding edge" VMs I use for CTP versions of the framework and Visual Studio. But I never truly develop things on the platform and thought I'd give it a try.

###You need Sublime Text

Ok, so this one goes without saying but you probably already have [Sublime Text](http://www.sublimetext.com/) on your machine. It's a fantastic editor that works well on all three platforms, and well worth $70. Having the same interface on Mac, Windows and Linux was what first attracted me to Sublime, and after using it a while I do nearly everything in it. I naturally decided to use it for this experiment. It's not [a true IDE like WebStorm](https://www.jetbrains.com/webstorm/) (which also runs on all three) but it will work great for what we're doing here.

###1. Getting Started
First we need to get Mono and the K version manager set up. We can install this with Homebrew:

``` plain
brew tap aspnet/k
brew install kvm
```

This will install K and pull down Mono if you don't have it installed. You will want to add a line to your .bashrc file:

``` plain
nano ~/.bashrc
```

and add

``` plain
source kvm.sh
```

and save it the file.

Next you'll want to install the K Runtime environment (KRE). To do that, you type in

``` plain
kvm upgrade
```

You're now ready to start running ASP.NET vNext on your machine.

###2. Running a Sample App

Just to try it out, let's run a sample application from the vNext GitHub.

create a project folder, and from the command line run

``` plain
git clone https://github.com/aspnet/Home.git
```

Now let's go to /Home/samples/HelloWeb. You'll see a file in there called Startup.cs, let's open that up in Sublime.

It looks like this:

``` csharp
using Microsoft.AspNet.Builder;

namespace KWebStartup
{
	public class Startup
	{
		public void Configure(IApplicationBuilder app)
		{
			app.UseStaticFiles();
			app.UseWelcomePage();
		}
	}
}
```

As you can see, this is extremely simple file. It uses the IApplicationBuilder interface to build a simple app, and build a Welcome page.

Also we have a project.json file that's pretty important. You use this to configure the application and load in dependencies:

``` json
{
	"dependencies": {
		"Kestrel": "1.0.0-beta1",
		"Microsoft.AspNet.Diagnostics": "1.0.0-beta1",
		"Microsoft.AspNet.Hosting": "1.0.0-beta1",
		"Microsoft.AspNet.Server.WebListener": "1.0.0-beta1",
		"Microsoft.AspNet.StaticFiles": "1.0.0-beta1"
	},
	"commands": {
		"web": "Microsoft.AspNet.Hosting --server Microsoft.AspNet.Server.WebListener --server.urls http://localhost:5001",
		"kestrel": "Microsoft.AspNet.Hosting --server Kestrel --server.urls http://localhost:5004"
	},
	"frameworks": {
	"aspnet50": {},
		"aspnetcore50": {}
	}
}
```

Pretty straightforward stuff. To run our application we're going to need to pull in these packages, to do that run

``` plain
kpm restore
```

Once you do that you'll see it start to pull down packages from NuGet for your application. Let's run the application. Since this a web app we'll use Kestrel to serve it,

``` plain
k kestrel
```

You should see this:

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-1.jpg)

This means you have a server running. Load up a web browser and point it to: http://localhost:5004/

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-2.jpg)

ASP.NET vNext on your Mac Desktop! Pretty sweet, right? Actually you've been able to do this for about 6 months now, and it's not first class yet, but they're working on it every day.

###3. Set up Sublime Text for C# Coding.

Now we're going to get Sublime Text set up for C#/ASP.Net development. First we'll install [Kulture](https://github.com/ligershark/Kulture), a Sublime extention for ASP.Net vNext.

- Bring up the Command Palette (Cmd + Shift + P)
- Select Package Control: Install Package
- Select Kulture when the list appears.

With Kulture we'll be able to run K commands from within Sublime.

We're also going to install [OmniSharp](https://github.com/OmniSharp/omnisharp-sublime) for Sublime.

- Bring up the Command Palette (Cmd + Shift + P)
- Select Package Control: Install Package
- Select OmniSharp when the list appears.

With OmniSharp you can build, run and refactor C# code with vNext, within sublime. Check the [Readme](https://github.com/OmniSharp/omnisharp-sublime) for more details.

Let's set our C# language-specific settings. (This is also outlined in the Readme)

Go to Sublime Text -> Preferences -> Settings - More -> Syntax Specific - User

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-3.jpg)

And paste in the following:

``` json

 {
	"auto_complete": true,
	"auto_complete_selector": "source - comment",
	"auto_complete_triggers": [ {"selector": "source.cs", "characters": ".<"} ],
 }

```

Now, lets open up that startup.cs file we opened earlier (The sample web app)

Now open the command pallette (Cmd + Shift + P)

Type a "K" and you'll see "run k commands" come up.

You now see a list of selections:

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-4.jpg)

After a while, this will save you save you some time. 

To get Intellisense working, you need to create a project file (again this is from the Readme)

To get intellisense with ASP.Net vNext projects you need to create a project file in Sublime. Go to Project - Save Project As and enter in a name for your project. OmniSharpSublime will use this to know what files and assemblies it needs to provide intellisense for (TIP : Close & Re-Open Sublime if you do not see intellisense, it may take 10 secs for the intellisense server OmniSharpServer to start once Sublime has loaded all the plugins)

Once OmniSharpSublime is installed and you have a project file you should be able to see intellisense.

Hint: There's also a [C# Snippets Extension](https://sublime.wbond.net/packages/C%23%20Snippets) worth looking at. 

###4. Let's build a console app

Here I will show you how to do a console application, and we'll do it a little differently. We're going to use the fantastic [Yeoman generator](http://yeoman.io/) for this. If you've never used Yeoman you should try it out, it's pretty awesome. 

This assumes you have Node.JS and NPM installed. If you don't, [You can follow these quick steps here](http://howtonode.org/how-to-install-nodejs).

So first we'll install the generator:

```
npm install -g generator-aspnet
```
If you don't have Yeoman it will install it for you. 

Then, we create a folder we want the project in, and type

```
yo aspnet
```

You'll be greeted with a screen like this:

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-5.png)

You can select between the types of application it can generate. Let's select Console Application. I named mine "HelloWorld" because I lack creativity today. 

After it generates, you'll see it has created some files:

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-6.jpg)

These files should look pretty familiar, but we now have a global JSON config as well as our project config. 

Modify this file a little if you want, and bring up the command pallete, type k to run K commands and select K run:

![image](https://www.jeremymorgan.com/images/dotnet-on-mac/dotnet-on-mac-osx-7.jpg)

Pretty cool huh? For some reason I've always been a huge fan of Console applications. I'm also a huge fan of C#. For years throughout my career I've built tons of awesome console apps, and the idea that soon I'll be able to build first class C# console apps in Linux is pretty exciting to me. 

###Conclusion

This is pretty exciting stuff for so many reasons. I am a fanboy of all three operating environments (Windows, OSX, Linux) depending on what I'm doing. When I'm working with Python, PHP, or JS stuff I really like working in Linux. When I'm building graphic intense web pages / CSS or video editing I use OSX. When I build .Net stuff I use Windows. My Mac is the most powerful machine I own, so the idea that I can soon build anything I want in that environment is pretty awesome to me. As I said C# is one of my favorite languages to work in, and the ASP.Net architecture is awesome for building larger websites. The idea that it's all coming together is awesome. 

I'm just scratching the surface here, and this article focused on Web/Command Line stuff. But the Mobile development world is also being disrupted right now with work from the Xamarin Team, and vNext. The potential to develop great software has never been better, and it's a great time to be a developer. 

I think it's great that Microsoft is "putting their money where their mouth is". There has been a lot of talk the last couple years about the ASP.NET team embracing open source, and they're taking a very serious approach to it. This is not a half hearted attempt at lip service, they're opening all of it, and they're working with everyone. In the end we as developers will be reaping the benefits from this latest push. 

I'll create some more vNext stuff in the future and write about some of the "gotchas" I've already run into building stuff. The vNext stuff is not "first class" yet, but it will be soon. Stay tuned, and be sure to comment if you're working on any of this cutting edge stuff. 

{% include custom/asides/programming-footer.html %}









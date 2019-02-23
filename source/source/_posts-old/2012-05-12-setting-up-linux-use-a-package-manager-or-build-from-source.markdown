---
comments: true
date: 2012-05-12 09:35:18
layout: post
slug: setting-up-linux-use-a-package-manager-or-build-from-source
title: "Setting up Linux: Use a Package Manager or Build From Source?"
wordpress_id: 1106

categories:
- "Programming"
permalink: /blog/programming/setting-up-linux-use-a-package-manager-or-build-from-source/
author: Jeremy Morgan

tags:
- apple
- c
- Fedora
- G4
- gcc
- Gentoo
- How to
- how to linux
- linux
- mac
- Red Hat
- Redhat
- Ubuntu
- Ubuntu Linux
---

[![How to get realtime dmesg output in linux](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/09/linux-250x300.png)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/09/linux.png)

There are a few different ways to do things in the Linux world and if you ask for the best way, you'll get several different answers. Linux folk tend to be pretty opinionated and become polarized about issues, which creates difficulties and makes for one more thing to add to the list of reasons the masses don't publicly adopt Linux.

How you build your software is one of those dividing issues. People who favor package managers talk of ease of upgrading, not thinking about dependencies and stability. People who favor building from source talk of control and peak performance. The purpose of this article is to help you figure out which camp you should be in.

Personally, I've been a Linux user since the mid 90s and also a software developer by trade so I'm pretty confident in building from source so that's my preference. Plus I'm a bit of a control freak which is one of the big reasons I use Linux in the first place. Do I always recommend it for others? No, of course not.

This task can be pretty daunting for a beginner, and possibly not worth the trouble. Plus there are some really great package managers for Linux out there: rpm, yum, aptitude and dpkg to name a few, and they are pretty great.

## Using a package manager and/or precompiled binaries.

So you just burned that cool new Ubuntu CD and can't wait to install it. You fire it up and notice all kinds of cool stuff you gotta download so you get crackin. You install a bunch of software and get everything where you want and have your system set up.

Do you have a good system set up? Yes.
Do you have what you're looking for? Yes.
Did you spend a lot of time on it? No.
Is it still better than a Windows box? Yes.


So is there anything wrong with doing things this way? Of course not. If you're a casual or new user this is likely the best way to do it. You install everything without worrying too much about dependencies, libraries or compilers. Someone else has done the work for you and that's fine with you. You're just going to browse the web and maybe learn some PHP or Python, so the system is ready.

### Advantages:

> **You save yourself time compiling stuff** - Most is pre compiled for you so hours become minutes.
> **Easy Installation** - You don't spend a bunch of time editing text files and chasing down libraries.
> **Dependencies?** - They are of little concern to you.
> **Super simple** - Installation was as easy as pushing a button.
> **Peace of Mind-** You probably installed stable and secure software. Generally package managers recommend stable, tested stuff.
> **Didn't have to use VI** - You don't know a lick of coding so it's a good thing you didn't have to do any.

You're probably ok doing it this way especially as a casual user, however there are some downsides. If this were the only and best way to do it, we wouldn't have this article.

### Disadvantages:

> **You have old stuff** - You may not have the newest software. You have what the distribution or package manager decided to give you.
> **You have Slow Stuff** - You have precompiled binaries that may not be fully optimized for your processor.
> **Too much fat** - You have a lot of stuff on your hard drive, and a lot of it you will never need.
> **Memory Hogs** - The programs have a lot of extra stuff compiled in, so you may be using more memory than you need to.
> **Toaster Effect **- You have things set up with all the default options, which may not be exactly what you want.

## Compiling from Source.

So, let's say you take another route and decide to compile everything from source. So what you do in this case is go out and hit each website and get the newest (or newest stable) versions of the source, download it and compile it for your system. At the end of this you also have a great running system but what are the pros and cons of this method?

### Advantages:

> **You have the newest stuff - **You can go with the latest stable or the very bleeding edge which can be good or bad. You could have untested (but really new) stuff that's full of bugs or you could have the best product the programmers can offer. Your mileage may vary.
> **You have software that's optimized for your processor** - Since this was compiled on your system for your system it's running as fast as it can. With some programs it's useless with others the added performance is quite noticeable.
> **You have only what you need -** Unless you went and got software for the hell of it, you only have what you needed to successfully build the software. This saves on hard drive space and eases organization.
> **You have configured it your way, and eliminated a lot of fat.** You're using less hard drive space and memory and you sleep well at night knowing you're using your system in the most efficient way possible. For some of us this is very important.
> **You probably learned something** - As I mentioned I have been using Linux since the mid 90s, and a couple days ago I updated my GCC to the latest version and I learned something about MPFR and how it ties in with other libraries. You never stop learning, and by compiling stuff by hand you'll learn a lot about how your computer works, and how software is set up.


Of course compiling from source isn't the silver bullet, end all solution either. There are some key complaints to compiling from source that are very valid.

### Disadvantages:

> **Time** - Wow! You spent 4 hours setting up a new version of GCC? Really? Yes, I did just that yesterday and if you compile stuff from source you will spend a ton of time babysitting it. Expect to spend a lot of time watching lines go by, and restarting it when something fails. Yes you can do other stuff during compiling but your computer is (or should be) off limits while you compile all this code. You can spend 40 working hours setting up a decent system easily by building from source, It's more common than you'd think.
> **Frustration** - You've had to hunt down libraries, chase dependencies and hack config files right and left. Nothing is ever as simple as running ./configure, make and make install. You had a frustrating speed bump every step of the way and had to hit Google 20 times to make this thing work. (Don't worry I still have to hit Google sometimes to make stuff work and I do this for a living).
> **Dependencies** - You'll discover them after waiting 40 minutes for a package to compile and see an Error 2 at the last minute.
> **Updating software** - Sure it's all neat and dandy once you get everything built and running, but once you need to upgrade one of those pieces of software you'll find out that you're in for lots more time than you imagined. There is no apt-get updates for you buddy! Start recompiling everything.
> **Bleeding edge** - There's a chance that latest and greatest software you just put on the production server runs like garbage and has some serious security issues. You're pretty much stuck with it until you've got the time to roll stuff back.

## Conclusion

OK, so which method is better? It depends on your application. I've been known to install an OS and use all the vanilla stuff and do just fine. I even use XAMPP for personal dev machines sometimes because it's just so easy and quick. There's nothing wrong with this if your goal is to use the machine as a simple tool to get a job done.

I've also been known to do things like I have recently, where I spent HOURS working on my PowerBook G4 updating everything from source. Since I'm running a version of Yellow Dog Linux from 2008 there was tons of old stuff on there, but I had to redo it all and squeeze some performance out of it. I hand crafted every configure parameter and compiled and recompiled binaries making sure everything was pristine and perfect. I have a very optimized machine, especially considering it's 9 years old, but I paid for it with time.

If I were to factor in the amount of time I spent and apply the amount my employer pays me per hour to work, I could have easily bought a brand new laptop with Windows 7 on it that would outperform this machine by leaps. But what fun would that be?

In conclusion you have to do what's best for you. If your operating system and machine are merely tools to do a task that you don't really care about, just install your favorite Linux distro with all the defaults and get to work. You're still getting a great system (if you choose Linux or Unix). If you are working with old hardware, need the maximum performance or are just a perfectionist like me, build it from source and enjoy squeezing every drop of performance out of it. Public facing production servers should always be running stuff compiled from source in my opinion.

In the end you have a choice, which is what Linux is really all about.

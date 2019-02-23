---
layout: post
title: "Why Should You Use MySQL?"
date: 2013-01-27 11:34
updated: 2018-03-25 12:22
comments: true
sharing: true
description: While it may be cool to hate on MySQL, people aren't turning their backs on it in droves, and here's why.
author: Jeremy Morgan
categories:
- Programming
- Linux
permalink: /blog/programming/why-use-mysql/
ogimage: https://www.jeremymorgan.com/images/why-use-mysql.png
---
The programming industry was dropped another bombshell blog post the other day, <a href="http://grimoire.ca/mysql/choose-something-else">Considering MySQL? Choose something else</a> and as expected it sparked discussion, rants and raves. I love posts like this because they foster discussion and get us talking and thinking about things we otherwise ignore or put out of our minds. But should we all turn our backs on MySQL and kill it? I don't think we should. 

<!-- more -->
###Were the accusations against MySQL unfounded?

Let me be clear in saying I'm not going to try to counterpoint the article on a fact by fact basis, I read through it pretty carefully and it's accurate. Much like the <a href="http://me.veekun.com/blog/2012/04/09/php-a-fractal-of-bad-design/">PHP: a fractal of bad design</a> article the person writing it did manage to point out some serious flaws in the design, but kept it very one sided. It's still a decent tool for some jobs, and it really depends on what you're using it for. 

###The best doesn't always win

{% img right https://www.jeremymorgan.com/images/why-use-mysql.png Why use MySQL %}
If there's one thing most of us already know about tech, it's that the superior technology is not always adopted by the industry. In fact more often than not the better technologies fall to the wayside in favor of something that's easier and cheaper to produce. We make money with software, and people often forget that. 

Remember Betamax vs VHS? Betamax was in many ways superior because of higher resolution and better sound quality. Purists at the time absolutely loved the quality of Betamax over VHS.

Though it's still debated decades later, most people acknowledge the lesser "VHS" format won because of longer recording time, and cheaper devices. Consumers didn't care about higher quality when the price was so high, and movie studios didn't want to split their movies between multiple tapes. 

Simply put: VHS was lower quality but it solved the problem better, for cheaper. That's the reason MySQL is still so ubiquitous today. It's not about the programmers, its about the consumers. MySQL's closest competitor is PostGreSQL which is far superior in many ways, but it's struggling to fill a niche that's already being filled, even if it's filled poorly. 

###10 reasons to use MySQL

So here's the reasons why someone would use MySQL and why we shouldn't be making funeral plans for it just yet. 

####1. It's ubiquitous

Go to any Linux or Windows based web host, and there it is. Download an open source project and most of time that's what it's connected to. If you're in a shared hosting environment you can't just go an install something else, but you can stick with MySQL and download just about any open source software and use it. That's an advantage, especially for new folks. 

####2. It's easy to find help

If you get stuck on something, there are countless places to find your solution. There are tens of thousands of tutorials, help docs and discussions about it. Chances are the problem you're having isn't anything new and someone has already solved it. 

####3. It's easy to learn

Pretty much anyone can learn the basics and get up and running very quickly with MySQL. If you're building something small and simple it's very easy, and quite forgiving. While this builds poor programming practices it also gives people training wheels until they learn more and decide to get a real database. 

####4. MySQL is considered proven

While it may not be perfect, it is considered a proven technology in the industry. Vendors strive to have their applications and tools compatible with MySQL because it's so frequently used successfully. There are plenty of applications that use MySQL in a smart way to solve their problems, and they work just fine.

####5. Less features mean less maintenance

You don't need to hire a group of certified DBAs to run a MySQL database. An ordinary programmer can learn enough to maintain their database servers for most applications. There are many features enterprise database vendors offer that you can't find in MySQL, but you also don't need. Most of the time those extra features mean more points of failure, and more education needed to keep the server running, which is wasteful if you aren't actively using said features anyway. MySQL is very much "set it and forget it" in many applications. 

####6. Total Cost of Ownership (TCO)

How many startups out there want to fork out thousands of dollars for a Microsoft or Oracle solution? They're operating on a shoestring so a free database solution is a no brainer. MySQL can be installed on as many servers as you need and it doesn't require much in the way of hardware. And as I mentioned before the labor costs for maintaining it are far lower. Even large established companies love saving money, and MySQL saves money. 

If you don't need the extra features you aren't going to pay through the nose for it, pure and simple. 

####7. MySQL is scalable

You and your brother in law decide to start a company in your garage. You choose MySQL based on price and build your application. Fast forward a year from now and things are growing good. You've added a couple more servers and things are fine. Another year goes by and you have some breakthrough and your business is 10 times larger overnight. You can use that money to build as much of an infrastructure as you need, and rather quickly. MySQL can handle everything from a megabyte of data to terabytes just fine. With good education about the system you can scale it up. 

####8. Native support for the new stuff

If you really want to be hip and cutting edge you wouldn't consider using that stale and uncool MySQL right? Well actually you might considering how well it interfaces with things like Ruby and Python. It's well supported out of the box, and ready for the latest and greatest technologies coming out, as well as great support for PHP. 

####9. Great transactional support

While MySQL may not be the greatest for data warehousing it's hard to argue it's bad as a transactional database. The web itself is highly transactional and MySQL meets that need well. It features ACID (atomic, consistent, isolated, durable) support, distributed transactions and server enforced referential integrity checks on transactions.

####10. RDBMS support for smaller businesses isn't bad

For small to medium sized businesses the reporting and analysis functionality is quite sufficient. It could use a lot of improvement but it works great for smaller applications. The same type of companies that benefit from cost savings are the same ones that won't likely need complex analysis and in depth BI reporting offered in other databases. If you're using it to run your company blog or a few shopping carts do you really need much more than MySQL offers? Probably not. 


###When you're ready to lose the training wheels

Ok so if you're a growing business or your blog gets huge you will probably want to shake MySQL at some point. There are many cases in which you don't want to use it:

* If you have big data
* Business Intelligence is more important than cost
* You have a competent and highly technical staff
* Data accuracy is extremely important
* Your infrastructure is dependent on Microsoft or Java
* You are a small business but have someone who can run PostGreSQL (chuckle)

I have detailed the reasons you should consider MySQL for your solution, and why many people use it. If your objectives are to drop in an easy solution and save some money it's great. But what about the exceptions? I'll be writing an article about that soon, because there are plenty of reasons not to use it as well. 

Personally I prefer <a href="http://www.postgresql.org/" rel="nofollow" target="_blank">PostGreSQL</a> over MySQL for a drop in replacement on Linux based systems. It's far superior in many ways, and something you should consider if you're able to. Personally if I were to start a new business or had a Linux based environment and was in the planning phase I would choose PostGreSQL from the start. But it's not always the best option for most people. 

###Conclusion

I hope this helps shed some light on the fact that MySQL is ubiquitous and present for a reason. It's not the best solution out there, but it's the best solution for many people. As I said personally I prefer PostGreSQL or MS-SQL far above MySQL but I understand the reasoning behind choosing MySQL and I hope you'll consider that too. 

Should you use MySQL? The answer depends on what you're using it for, and what your goals are. It's not as simple as some are trying to make it.

I invite active discussion on this in the comments, as long as it doesn't turn into a flamewar. Here are a couple other places where folks are discussing it:

<a href="https://plus.google.com/u/0/110987122726818254657/posts/4VnWmmWGikH">Great thoughts from Kelvin Williams on the subject</a>

<a href="https://plus.google.com/u/0/+JeremyMorgan/posts/5SS9Ezmy7Vr">Google + discussion I posted</a>

<a href="http://news.ycombinator.com/item?id=5122299">Hacker News Discussion</a>

It will be interesting to see what comes out of this latest discussion. 

{% include custom/asides/programming-footer.html %}



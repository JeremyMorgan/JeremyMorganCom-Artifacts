---
layout: post
title: "Common Code Smells"
date: 2013-08-28 19:21
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: Code Smells are becoming the new hotness again. You may have heard the term, here's what it means and a few to look out for.
permalink: /blog/programming/common-code-smells/
ogimage: https://www.jeremymorgan.com/images/code-smell-1.jpg

---

You may have heard the term "code smells" lately, it seems its being talked about frequently again. In this short post I'll explain what they are, and a few of them you may run across. 

<!-- more -->
##What is a Code Smell? 

A Code Smell is just a fancy word for an indicator of a bigger problem with your code. It's language agnostic because you can have code smells in any application. It's just a sign of bad construction that you can spot fairly quickly. 

The biggest problem with code smells is not that programmers are ignorant about them, it's that they choose to ignore them. They'll jump into someone's code, or their own code and see the problems and make the application work, with the intention of fixing it later. This rarely happens. 

###Checking for code smells

Generally you find code smells when examining code, or doing refactoring. Small cycle refactoring is something you should be doing quite frequently. Often you can take a small method and make it a little better, build some better tests and make it more solid. Eventually you'll get through enough of the application to make it solid, or decide on a full rewrite. 

{%img right https://www.jeremymorgan.com/images/code-smell-1.jpg "Code Smells" %}The best ways to find code smells are:

* Casual code inspection
* Refactoring
* Heuristics analysis
* Tools such as PMD, CheckStyle or ReSharper


###Common code smells

So what can you expect to find that might indicate a bigger problem? The list is very long and depends on how deep you choose to inspect your software. But here are some very common ones:
<br />
**Repetition** - Easily one of the most common ones. Do you have sections of code repeated all over the place? This is a sure sign of amateur work, and deserves a deeper look. 

When refactoring repeated code, you have to effectively search for all instances of that code to get the results you want. While abstracting it into a method is a good fix, it doesn't mean you're in the clear. 

<br />
**Needless Complexity** - This is somewhat subjective but most of the time you know it when you see it. Its more complex than it needs to be to solve a given problem and is difficult to comprehend. Needless complexity stems from only a few things: 

* A beginning programmer who is making copy and pasted code work to solve a solution. 

* A show off who enjoys creating complex solutions to simple problems in order to appear smarter. 
 
* A programmer seeking job security - if they are the only ones who understand it, you can't get rid of them (or so they think).
 
* A programmer who has inherited some nasty code and was forced to build in place. (Arguably the worst case scenario).

<br />
**Rigidity** - While usually considered a good thing, the wrong kind of rigidity can turn your software into a house of cards. When you have methods with too many dependencies that are strictly enforced by breakage, you have a system that can't be touched or modified. Two solutions to this are loose coupling and high cohesion. 

Make the methods as independent as they can be, yet closely tied to the objects that objects that use them. Break up your objects if they get too big, or have too many dependencies on other unrelated objects. 
<br />
**Configuration scattered within the code** - This is a basic design flaw that is shown frequently in the wild. The most common one is keeping the database credentials in a database class. This can be a disaster when it gets out of control. 

Keep all configurable data (anything anyone can change) at a very high level in a centralized location. This is one of the reasons you see huge config.php or similar files. By having them all in one place you make changes simple and easy. By scattering your data through multiple files and locations you end up creating more time (and technical debt) for the next programmer. 
<br />
**Immobile code** - Everyone has seen this one. Classes or methods that are marked "don't touch" are bad and a sign of a much larger problem. If you have something that cannot be modified without taking down the whole system, you've found your weakest link. Fix it immediately. 

These are just a few of the basic code smells you'll see. There are far more out there but these are pretty high level and common. 

{%img center https://www.jeremymorgan.com/images/code-smell-2.jpg "Code Smells" %}

###Where do code smells come from?

As I stated earlier, it's not always programmer ignorance that causes code smells. It usually comes from a rushed design and a disregard for technical debt. They're created by a programmer who knows better but wants to just "get the job done". This is a false approach for many reasons. 

Technical debt is simply the term for the amount of future work you create when you try to save time up front. You have two choices:
<br />
**Do it the right way** - Use best practices and develop a design that is the best of your ability and something you know can scale and grow appropriately. This is your boss' least favorite method because it takes longer. 
<br />
**Do it the fast way** - Ignore crucial design decisions that will take too much time to implement. Create a "hacked together" design that you keep as clean as you can, but you know it's not right. You convince yourself you can always come back later and fix it. This is your boss' favorite way because it takes much less time. 

The problem with the second approach is very simple:
> The time you save up front making a bad design will come back to haunt you exponentially during maintenance. 

No matter how good you are or how much you think you can break this rule, it will always prove itself true. You need to educate your boss on the studies done on this, because he/she will not be very happy when maintenance takes considerably more time for "simple fixes".

###Conclusion

I hope I've outlined what code smells are and some of the common ones you'll see. The message I really want to get across here is do it right the first time. If you don't know how to do it right, stop "winging it" and start learning more about software design. 

Software development is heavily dependent on time. Given enough time developers can make solid gold perfect software, but by the time it's finished it's no longer needed or the company is questioning where all their money is going to. It's a constant battle. 

Take a little more time up front to save loads of time in the future, and you'll see many of these code smells start to go away. 


{% include custom/asides/programming-footer.html %}






























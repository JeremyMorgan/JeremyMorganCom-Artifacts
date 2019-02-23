---
comments: true
date: 2012-05-21 10:58:15
updated: 2018-03-25 12:22
layout: post
slug: python-for-beginners
title: Python For The Absolute Beginner
wordpress_id: 1057
categories:
- Tutorials
- Programming
- Python

permalink: /tutorials/python-tutorials/python-for-beginners/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/python-ogimage.png
tags:
- How to
- linux
- programming
- programming help
- python
- python how to
- python programming
- python tutorials
- tutorials
description: Want to try out some Python? Here's a primer on getting started with this awesome language. 
---

If you're a Programmer / Developer, chances are you've at least heard of this neat little program called Python. Those who know it sing it's praises, and it can be found in some very powerful applications. If you've been curious about how to get started with Python I have built this tutorial to help you on your way to becoming a text manipulating ninja.

Ok, that sounded a little corny but Python is really, really good at parsing and manipulating text. It's one of the duties you'll see it doing often. Let's get started.

**Step 1:Get Python**

I'm not going to go into great detail about installation, but you can get python for any of the big three (PC, Mac Linux) operating environments and the setup is pretty similar. In many versions of OSX and Linux Python is installed by default. One way to see if it's installed is by opening up a command window, and simply typing "python" or "py". If it's installed you'll see something like this:

```
> [jeremy@localhost ~]$ python
Python 2.4.3 (#1, Jul 27 2009, 11:32:33)
[GCC 4.1.2 20080704 (Red Hat 4.1.2-44)] on linux2
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

If not, the best place to get the latest version is from[ Python.org](http://www.python.org/download/).

**Step 2: Start Coding**
[![Python Tutorials](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/python-tutorials.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/python-tutorials.jpg)
Here is how you should start building Python scripts:



    
  * Plain Text Editor

    
  * Running Python at the prompt


The editor I use the most is [Kate](http://kate-editor.org/) in Linux. This is because Kate manages your files, and you have a command terminal below, allowing you to enter stuff. If I'm on a windowless machine Vim works very well too. For Windows machines I would recommend [Notepad++](http://notepad-plus-plus.org/) to edit. Both are free and there are tons of free text editors out there, especially in Linux.

Your first step is the obligatory "Hello world". You'll find it's nearly as simple as it could possibly be in Python.

Create a file called test.py and put the following line in it:

```   
    print "hello world"
```

and save it. Now type:


> python test.py


Amazing right? Now do something silly, to make it spit out an error, and remove the last quote. Type this exactly as you see it:

``` 
    print "hello world
```

You should see the following message:


> File "test.py", line 1
print "hello world
^
SyntaxError: EOL while scanning string literal


Like every programming language you have to close everything you open. (With the exception of tags in PHP, but let's not get into that).

So to clarify, our steps are:



    
  1. Put python code into a text file.

    
  2. run that text file with python ( python + filename )

    
  3. look at the results.


Seems simple enough, so let's do some more stuff.

**Comments**

A quick note about comments: use them. When you become a better programmer you can decide whether "good code comments itself" but for now, let's use comments to explain what's going on. Basically a comment is any text that YOU can see as a programmer, but the computer can't. This is so you can leave yourself notes, or notes for other programmers.

In Python, you use the # pound sign for commenting, like so:

```  
    # This is a comment
    print "hello world"
```

But usually they're explaining something a little more important:

```    
    # classroom.py
    
    boys = 5 # Boys in the class
    girls = 8 # Girls in the class
    total = boys + girls # Add up the total
    
    # print our message
    print "There are", boys, "boys in the class and", girls, "girls in the class"
    
    # print the total
    print "There are a total of", total, "students in this class"

```

When you run classroom.py the computer (python interpreter to be exact) will ignore all the comments you insert, but they remain in the file for the next person to look at (which could be you).

Speaking of math, let's do some!

As you saw above it doesn't take much to do basic arithmatic in Python. Here is one way of performing mathmatic expressions:

```  
    # weeksinyear.py
    
    print "How many weeks are in a year?", 365 / 7
    
    See how easy that was? But this prints the answer at the end of the line. What if we want it in the middle of the sentence?
    
    # weeksinyear.py
    
    # figure out the total
    weeksinyear = 365 / 7
    
    print "There are", weeksinyear, "weeks in a year"
```

Notice how easy it was to insert the text into the sentence? That was done with a variable.

Here is what you should see:


> There are 52 weeks in a year


You can do all kinds of things with the output, you can output just answers:

```    
    print 3+2
```

But why stop there?

```    
    print 3 + (2 + 4) / 2 * 34
```

You can group expressions and output the answer however you like, or feed it into a variable and use the variable.

Python also outputs boolean (true / false) as well:

```   
    print 3 + 3 < 10
```

Since 6 obviously less than 10 it will output true. This statement isn't exactly useful, but once you start using variables and inputs it will.

### Variables

Variables are simply containers to put data in. Think of a set of mailboxes for an apartment building. Each mailbox contains someone's mail (data) and each mailbox is labeled with a number (variable name). The variable is the mailbox, and the number on the mailbox is the variable name.

So let's create some variables.

```   
    # aboutme.py
    name = "Jeremy"
    age = 34
    currentyear = 2012
    drivingyears = age - 16
    alcyears = age - 21
    
    print "Some facts about",name
    print "Jeremy was born sometime around", currentyear - age
    print "He's",age,"years
    print "He has been driving around", drivingyears, "years"
    print "He could has been able to drink alcohol for about", alcyears, "years"
```

Here you can see we've created some variables here to hold my name, age, and the current year. We also added in a couple of formulas to figure out how long I've been driving, and (legally) drinking alchohol. If you copy this script exactly (don't!) you will get the following output:

```
> Some facts about Jeremy
Jeremy was born sometime around 1978
He's 34 years old
He has been driving around 18 years
He has been able to legally drink alcohol for about 13 years
```

OK, so this script makes me feel pretty old. Create a similar script for yourself and feel free to modify it. Add in how many years you've been married or how long you've been in school. I encourage you to take these examples and run with them, modify and go crazy, because that's the best way to learn. Experiment and don't worry about breaking things.

Now it's time to change it up a little.

```    
    radius = 2
    pi = 3.14
    
    print "The area of our circle is", pi * (radius * radius)
```

Notice something different? We're now using a floating point number, which Python detected and used, then output another float. Python supports many different datatypes including integers, long, floats and complex.

In the next tutorial we're going to get a little more in depth and start exploring some more math, and loops.

{% include custom/asides/tutorials-footer.html %}

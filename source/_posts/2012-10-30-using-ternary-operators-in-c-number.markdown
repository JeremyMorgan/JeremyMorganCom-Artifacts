---
layout: post
title: "Using Ternary Operators in C#"
date: 2012-10-30 22:26
updated: 2018-03-25 12:22
comments: true
sharing: true
categories:
- Programming
- Tutorials
- DotNet
- CSharp
permalink: /tutorials/c-sharp/using-ternary-operators-in-c-sharp/
description: A step by step guide for using ternary operators in C#. These operators can simplify and clean up your code.
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---

Most people don't use ternary operators enough, or at all. I think it's a better way of handling such expressions most of the time. For example:
<!-- more --> 
We have a small console app:
{% codeblock lang:c %}
using System;
class Program
{
	static void Main()
	{
		for (int i = 1; i <= 10; i++)
		{
			Console.WriteLine(i);
		}
	}
}
{% endcodeblock %}

This predictably outputs the numbers 1 through 10. But we'll add some logic in here to identify even vs odd numbers:
{% codeblock lang:c %}
using System;
class Program
{
	static void Main()
	{    
		for (int i = 1; i <= 10; i++)
		{
		string oddoreven;
		
			if (i % 2 == 0) {
			
				oddoreven = " even";
				
			}else {
			
				oddoreven = " odd";
				
			}
			Console.WriteLine(i + oddoreven);		
		}
	}
{% endcodeblock %}

Ok, not terribly complicated, but if we use a ternary operator, we can turn 6 lines into one:

Instead of this:
{% codeblock lang:c %}
string oddoreven;
	if (i % 2 == 0) {
		oddoreven = " even";
	}else {
		oddoreven = " odd";
	}
{% endcodeblock %}
	
We now have this:
{% codeblock lang:c %}
string oddoreven = (i % 2 == 0) ? " even " : " odd";
{% endcodeblock %}

And the whole program looks like this: 

{% codeblock lang:c %}
using System;
class Program
{
	static void Main()
	{
		for (int i = 1; i <= 10; i++)
		{
			string oddoreven = (i % 2 == 0) ? " even " : " odd";
			Console.WriteLine(i + oddoreven);		
		}
	}
}
{% endcodeblock %}

See how much cleaner that is? If you have a file with tons of if-else statements you can save a ton of space by using ternary operators. Many folks say they're harder to read but I just don't see it. I think it's much cleaner.

If you have more complicated conditional branching it doesn't quite work as well but for many operations it does. 



### Note for the Newbies

This is a simple code optimization, but it doesn't make your program any faster. Many new programmers automatically assume less code is faster running code, but that's not always the case. 

In this case the compiler will build the exact same IL, however the optimization is for the programmers. This is how you should be optimizing your code anyway. Let the compiler figure out how to save cycles and you make the code more readable and easy to understand.

{% include custom/asides/tutorials-footer.html %}


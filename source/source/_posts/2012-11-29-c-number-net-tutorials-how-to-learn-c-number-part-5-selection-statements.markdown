---
layout: post
title: "C# .Net Tutorials - How to Learn C# Part 5 - Selection Statements"
date: 2012-11-29 11:06
comments: true
categories:
- Tutorials

description: In part 5 of my learning C# tutorial series we're going to talk about selection statements. This is a crucial part of your foundation as a C# .NET coder
permalink: /tutorials/c-sharp/how-to-learn-c-sharp-5-selection-statements/
author: Jeremy Morgan
sharing: true
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---

In part 5 of my learning C# tutorial series we're going to talk about selection statements. This is a crucial part of your foundation as a C# .NET coder, and it's pretty important to know how and when to use selection statements.

<!-- more -->
###What is a statement?

Statements are explicit instructions to the compiler. They're executed in sequence from top to bottom just as they appear in your source code. 

{% codeblock lang:c %}
Console.WriteLine("Hello, ");
Console.WriteLine("is it me you're looking for?");
{% endcodeblock %}

{% include custom/asides/csharp-sidebar-5.html %}
This will print out the following:

>Hello, is it me you're looking for?

This is how all statements are evaluated in C#. There are several types of statements you use, which we'll examine individually. Today's tutorial will cover selection statements. 

###Selection statements

Selection statements control program flow through the result of evaluating boolean (true and false) values. An if statement only executes if the conditions are true. Here are some examples:

**If Statements**

{% codeblock lang:c %}
if ( something is true) 
{
	// do this
}
{% endcodeblock %}

This statement simply checks that the conditions are true and does something based on that. A real world example looks like this:

{% codeblock lang:c %}
int ourValue = 10;

	if (ourValue == 10)
	{
		Console.WriteLine("Our value is 10!");
	}
{% endcodeblock %}

If you set the integer ourValue to 10, you'll see some output. If ourValue is not equal to 10, it will exit the section and move on to do nothing. 

**If-Else Statements**

A more common use is the if-else statement. This will check the conditions you present and do one thing if it's true, and another if it's false. Both code paths lead to an action of some kind. 

{% codeblock lang:c %}
int ourValue = 10;

	if (ourValue == 10)
	{
		Console.WriteLine("Our value is 10!");
	}
	else
	{
		Console.WriteLine("Our value is not 10!);
	}
{% endcodeblock %}

This is very useful because you can nest "if" statements to control program flow in powerful ways. Let's build a silly little program that tries to guess the number you're thinking of in a few steps. 

{% codeblock lang:c %}

namespace NumberGuesser
{
	class Program
	{
		static void Main()
		{
			Console.WriteLine("Please enter a number from 1 to 5");

			int ourNumber = Convert.ToInt16(Console.ReadLine());

			if (ourNumber < 5)
			{
				Console.WriteLine("is it 5?");

				if (Console.ReadLine()== "n")
				{
					Console.WriteLine("Is it 4?");

					if (Console.ReadLine() == "y")
					{
						Console.WriteLine("Yeah! The answer is 4");
					}
					else
					{
						Console.WriteLine("Is it 3?");

						if (Console.ReadLine() == "y")
						{
							Console.WriteLine("Yeah! The answer is 3!");
						}
						else
						{
							Console.WriteLine("Is it 2?");

							if (Console.ReadLine() == "y")
							{
								Console.WriteLine("Yeah! The answer is 2!");
							}
							else
							{
								Console.WriteLine("Yeah the answer is either 1 or you've answered no every time.");
							}
						}
					}
				}else 
				{
					Console.WriteLine("Yeah! The answer is 5!");
				}
			}
			else
			{
			Console.WriteLine("You must give me a number from 1-10!");
			}
		}
	}
}
{% endcodeblock %}

Take a good look at the program and see if you can follow the flow. If it looks like a jumbled mess, that's because we're using a lot of nested if statements, which in the future will be something you'll only want to do if you absolutely have to. It does however show how if statements work to check conditions and direct the program to the next spot. 

If your number is 5, you will see the following output:

{% img center https://www.jeremymorgan.com/images/c-sharp-dotnet-tutorials-1.jpg %}

But if you pick the number 1, you'll get this:

{% img center https://www.jeremymorgan.com/images/c-sharp-dotnet-tutorials-2.jpg %}

This is because the program uses a top down method to find the number, it basically asks what the number is until you answer yes. 

- Is it 5?		no
- Is it 4?		no
- Is it 3?		no
- Is it 2?		no

It must be 1 as there are no other options.

If you answer yes to any of the numbers, the statement will evaluate to true and break out of the code block. But is there an better way? 

>If you're looking for a challenge, rewrite the program above. It's a horrible algorithm and could be cut down pretty drastically. Just make sure it takes the same input and outputs the same result. This is called _refactoring_ and it's something you'll be doing a lot in the future. 

####Else-If Statements

Another form of if statement is the if-else-elseif structure. 

Let's say we want to figure out what college someone is attending from a list of 3 colleges and tell them what their mascot is going to be. Since two of them are in Oregon, this means the branching will be a little different. Here is our list:

- Oregon State University
- University of Oregon 
- University of Washington

Create the following program and run it from your console window:

{% codeblock lang:c %}
namespace MascotFinder 
{

	class Program
		{
			static void Main()
			{
				Console.WriteLine("Mascot Finder - Find your Mascot Now");
				Console.WriteLine("Please Choose which university you plan to attend:");

				Console.WriteLine("(1) Oregon State University");
				Console.WriteLine("(2) University of Oregon");
				Console.WriteLine("(3) University of Washington");

				string ourState = Console.ReadLine();

				if ((string.Compare("1", ourState) == 0) || (string.Compare("2", ourState) == 0) || (string.Compare("3", ourState) == 0))
				{
					if (string.Compare("1", ourState) == 0)
					{
						Console.WriteLine("You're going to be a Beaver!");
					}
					else if (string.Compare("2", ourState) == 0)
					{
						Console.WriteLine("You're going to be a Duck!");
					}
					else if (string.Compare("3", ourState) == 0)
					{
						Console.WriteLine("You're going to be a Huskie!");
					}
				}
				else
				{
					Console.WriteLine("You must select options 1-3 only");
				}
			}
		}
}

{% endcodeblock %}

Take a look at the code above and observe the structure. We display a menu with the options 1-3 and then read in the answer to evaluate. In line 17 we are asking what what user typed in: if it's 1, 2, or 3 we'll move forward, if it's not we are dropped into the else statement which displays the message that only 1-3 can be selected. 

If it is one of the numbers we allow, we check to see if the user typed "1". If so we announce they will be a Beaver and exit the code block. The new statement "elseif" performs another check immediately after that to see if it's a 2, and the same for 3. Once a condition is met we will display the right message. If statements, as well as if-else and else-if are valuable tools to control your program flow. 

But is there a better way to do this? Naturally there is, and we'll take a look at that next .

####Switch Statements

There is a better way to write this. Switch is a control statement that works with multiple options and tries to make a match, then executes the code with that "case". Here's what it looks like:

{% codeblock lang:c %}
namespace MascotFinder
{
	class Program
	{
		static void Main()
		{
			Console.WriteLine("Mascot Finder - Find your Mascot Now");
			Console.WriteLine("Please Choose which university you plan to attend:");

			Console.WriteLine("(1) Oregon State University");
			Console.WriteLine("(2) University of Oregon");
			Console.WriteLine("(3) University of Washington");

			string ourState = Console.ReadLine();

			switch (ourState)
			{
				case "1":
					Console.WriteLine("You're going to be a Beaver!");
				break;

				case "2":
					Console.WriteLine("You're going to be a Duck");
					break;

				case "3":
					Console.WriteLine("You're going to be a Huskie!");
					break;

				default:
					Console.WriteLine("You must select options 1-3 only");
					break;
			}
		}
	}
}
{% endcodeblock %}

In this example you can see what code we've changed. We now have this to control our flow:

{% codeblock lang:c %}
switch (ourState)
	{
		case "1":
			Console.WriteLine("You're going to be a Beaver!");
			break;

		case "2":
			Console.WriteLine("You're going to be a Duck");
			break;

		case "3":
			Console.WriteLine("You're going to be a Huskie!");
			break;

		default:
			Console.WriteLine("You must select options 1-3 only");
			break;
	}
{% endcodeblock %}

The switch statement takes ourState as a parameter and matches it against each case. If there is a match it runs the code within that case then breaks out of it. If there are no matches, it goes to a "default" case that lets you know none of the options were selected.

A couple of things to remember about switch statements:

- You can optionally set a "default" case to run if none of the cases match. This is cleaner than a bunch of if statements like our previous example.
- You cannot have two cases with the same value.
- Unlike C++ and other languages, there is no "fall through" to the next case. Meaning you can't leave out the break and have it automatically go to the next one.

###Summary

We've taken a good look at selection statements, and examined how they're used. Next we'll be taking a look at iteration statements, another crucial part of core C# programming. 

Each of my tutorials in this series build on the previous ones, and we'll build on this one as well as we expand into operators and more flow control stuff. I hope you'll stick with me through these and <a href="http://feeds.feedburner.com/JeremyMorganTutorials">subscribe</a> to my tutorial feed. 

 
If you have any questions or comments, leave them below I'll be checking them frequently. In the next tutorial we're going to cover some iteration statements. 

{% include custom/asides/tutorials-footer.html %}


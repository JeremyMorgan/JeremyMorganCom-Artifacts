---
layout: post
title: "C# .Net Tutorials - How to Learn C# Part 4 - Variables and Types"
date: 2012-11-26 16:34
updated: 2018-03-25 12:22
comments: true
categories:
- Tutorials
- Programming
- DotNet
- CSharp

description: Part 4 of my Tutorial series on learning C# .Net which takes a look at variables and types in C#
permalink: /tutorials/c-sharp/how-to-learn-c-sharp-part-4-variables-and-types/
author: Jeremy Morgan
sharing: true
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---
{% include custom/asides/dotnet-newsletter-banner.html %}
In part 4 of my learning C# tutorial series we're going to talk about variables and types in C#. I hope to give you a general idea of how variables work in C#, and introduce you to types which are a core part of the language. If you've done some programming in other languages this will probably be a quick skim, but if you're a beginner it's one you won't want to miss. 

<!-- more -->
### What is a variable? 

A variable is a storage place for data. Think of it like a mailbox. You have a wall of mailboxes in an apartment building the mail carrier puts mail into the box for later retrieval by you. 

{% include custom/asides/csharp-sidebar-4.html %}
But how do does he or she know the mail will go to the right people? Each box is given a unique identifier such as an apartment number and possibly your name on the box so each letter that's addressed to you, will reach you. When you go to retrieve it, you know which box is yours because of those same labels. 

That's how variables work as well. Variables are given unique names so you can identify them later, when storing or retrieving information. You can then store, reuse and manipulate data in program. Each of those variables has a unique name, and a type assigned to it. 

{% codeblock lang:c %}
int apples = 0;       // integer
string myname = "Jeremy"  // string
double pivalue = 3.14     // double
{% endcodeblock %}

### What is a type? 

Every variable and expression (we'll get to those) in C# has a type. This is the type of data that's stored in the variable which could be numbers, letters, or objects. There are several built in types that are mostly for numbers, and there are complex types that you will create such as objects, collections, and more. To find a good analogy for types, look in your kitchen. In one cupboard you have plates, in another bowls, and a drawer for silverware. The cupboards are variables and bowl is a type.

Your kitchen is a loosely typed scenario, because you can put cups with the plates, and move the silverware with the bowls if you really want to. If you're like me you have a significant other that won't tolerate such disorganization and will insist everything is kept separate, or "strongly typed". Bowls go with bowls, and silverware goes in a drawer.

She has a good point: if everything were mixed up we would never be able to find anything when we need it. When I put the dishes away it would be a lot easier and faster to stuff them wherever they fit, but would cause some problems down the road. Programming languages are the same way. I'll elaborate on that in a bit. 

Here are the built in types for C&#35; that we'll be talking about:

<table border="1">
<tr><th width="100"><strong>C&#35; Type</strong></th><th width="200"><strong>.NET Framework Type</strong></th><th width="325"><strong>Description</strong></th></tr>
<tr><td>bool</td><td>System.Boolean</td><td>Stores Boolean values true and false</td></tr>
<tr><td>byte</td><td>System.Byte</td><td>Unsigned Integer from 0 to 255</td></tr>
<tr><td>sbyte</td><td>System.SByte</td><td>Signed 8-bit integer from -128 to 127</td></tr>
<tr><td>char</td><td>System.Char</td><td>Unicode 16-bit Character from U+0000 to U+ffff</td></tr>
<tr><td>decimal</td><td>System.Decimal</td><td>128-bit &#177;1.0 x 10-28 to &#177;7.9 x 1028 (approximate) </td></tr>
<tr><td>double</td><td>System.Double</td><td>64-bit floating point from &#177;5.0 x 10-324 to &#177;1.7 x 10308 (approximate)</td></tr>
<tr><td>float</td><td>System.Single</td><td>32-bit floating point from &#177;1.5 x 10-45 to &#177;3.4 x 1038(approximate)</td></tr>
<tr><td>int</td><td>System.Int32</td><td>Signed 32-bit integer from -2,147,483,648 to 2,147,483,647</td></tr>
<tr><td>uint</td><td>System.UInt32</td><td>Unsigned 32-bit integer from 0 to 4,294,967,295</td></tr>
<tr><td>long</td><td>System.Int64</td><td>Signed 64-bit integer from -9,223,372,036,854,775,808 to 9,223,372,036,854,775,807</td></tr>
<tr><td>ulong</td><td>System.UInt64</td><td>Unsigned 64-bit integer from 0 to 18,446,744,073,709,551,615</td></tr>
<tr><td>object</td><td>System.Object</td><td>Alias for a .NET Framework object</td></tr>
<tr><td>short</td><td>System.Int16</td><td>Signed 16-bit integer from -32,768 to 32,767</td></tr>
<tr><td>ushort</td><td>System.UInt16</td><td>Unsigned 16-bit integer from 0 to 65,535</td></tr>
<tr><td>string</td><td>System.String</td><td>zero or more Unicode characters</tr>
</table>
<br /><br />
This is taken from the <a href="http://msdn.microsoft.com/en-us/library/ya5y69ds(v=vs.80).aspx" rel="nofollow">MSDN Page on Built-In Types</a> which contains more detailed information about each type. 

### Variables in C&#35;

We call these containers _variables_ because the data frequently changes, yet the type of data it contains doesn't. Variable can mean several things in C&#35; meaning it can be a local variable, or fields or properties in objects. For now we'll just talk about local variables that will be used to store information within a method.

To declare a variable, you must first declare the type, then the name you want for it. 

{% codeblock %}
int apples = 0;
{% endcodeblock %}

This declares an integer value named apples, and sets it to 0. You can just create the variable without any data like this:

{% codeblock %}
int apples;
{% endcodeblock %}

But you must assign this variable a value before trying to use it, if you don't the compiler will give you an error. Let's take our hello world app, and add this variable to it:

{% codeblock lang:c %}
namespace HelloWorldApp
{
  class Program
  {
      static void Main()
      {
          int apples;
          System.Console.WriteLine("Hello, World!");
      }
  }
}
{% endcodeblock %}

When you try to compile the program, you get the following warning:

>int.cs(7,15): warning CS0168: The variable 'apples' is declared but never used

Note that this is only a warning, the program will still compile and run, but you're warned that you have a variable that isn't being used. So what happens when we try to use it? 

{% codeblock lang:c %}
namespace HelloWorldApp
{
  class Program
  {
      static void Main()
      {
          int apples;
          System.Console.WriteLine("We have {0} apples in our basket", apples);
      }
  }
}
{% endcodeblock %}

As you can see we create the variable _apples_ and then we try to use it though it has no value. When you compile it you'll get the following error:

>int.cs(8,57): error CS0165: Use of unassigned local variable 'apples'

An error is more serious than a warning: this program will not compile. When a local variable is created you have to give it a value before we use it. Change the program to the following:

{% codeblock lang:c %}
namespace HelloWorldApp
{
  class Program
  {
      static void Main()
      {
          int apples = 42;
          System.Console.WriteLine("We have {0} apples in our basket", apples);
      }
  }
}
{% endcodeblock %}

Now when you compile it, you'll get no errors or warnings because you created a variable, assigned it a value of 42, and then used it. After it compiles, run it and you'll see:

>We have 42 apples in our basket

This is our expected output. 

####A note about variable naming

Notice how we named the variable _apples_ to represent how many apples we have. The truth is, the compiler doesn't care if you name it apples, oranges, or oiueoriue. It's only useful for programmers, you could name the variable "a" and the next one you need "b" if you really wanted to. But the next time you go back into your code, or someone else does things will be a lot harder. Always give your variables valuable names that represent the data being stored. 

###Strings

Strings are what we were dealing with in our hello world app. A string is a sequence of Unicode characters that represent text. Most human readable items are stored in strings. A string is a reference type, but you and also use it as an object to do do comparisons and I'll demonstrate that in a future tutorial. You can learn more about strings in the <a href="http://msdn.microsoft.com/en-us/library/362314fe%28v=vs.80%29.aspx" rel="nofollow">MSDN C# Reference</a>. 

{% codeblock lang:c %}
string sentence = "The quick brown fox jumped over the lazy dog";
{% endcodeblock %}

###Char

The char type contains a single Unicode character within the valid range. They are 16 bit values and can be very useful in many situations. You can write Hexadecimal Unicode and Integers into a char value when needed.

{% codeblock %}
char ourHexChar = '\x0058';   // Hexadecimal Value
{% endcodeblock %}

###Bool

The Boolean data type only stores either true or false values. You'll be using Booleans a lot in your expressions. Boolean values are used for checking, validation and flow control. It's a crucial part of any application. Here's an example:

{% codeblock lang:c %}
bool isValid = true;
{% endcodeblock %}


###Integers

Integers represent whole numbers. Integer data types are best for discrete values, such as incrementers, rows in a database or any value constrained to a whole number. The benefit of using integers is the computation is exact, no rounding or guessing involved. 

data types that use integers are often referred to as _integral_ data types. This can sometimes confuse new programmers because they trip up on the word "integral" or mistake it for "integrated". Integral just means a value that uses integers.

####Signed and unsigned integers

Of the integer data types you'll notice some of them have negative numbers some do not. *Unsigned* integers can only recognize positive numbers, while *signed* values can represent negative or positive. Why do we have these two different data types? You'll notice unsigned integers have a much higher maximum value, because it utilizes space that would otherwise be used for negative values. 

For example a signed 16-bit integer has a maximum value of 32,767. If the value you're storing is larger than that you'll have to use a 32-bit integer. However if you know you'll never need negative numbers you can use an unsigned 16-bit integer as large as 65,535 in the same 16 bits of space. 

Many languages do not support unsigned integers so you'll sometimes find types in the .NET framework that don't use negative values, yet still use signed integers for compatibility. The effect this has on memory and performance is very minimal. 

####8-bit, 16-bit, 32-bit, and 64-bit integers

At the present time 32-bit integers are the most widely used. This is because it offers a very good range of values and is very efficient with 32-bit CPUs. Here are some of the uses for each type:

**8-bit** - sometimes used for I/0 and network connections when byte-oriented operations are optimal. 

**16-bit** - Mostly used for compatibility with old protocols an interfaces. 

**32-bit** - Most frequently used for integer operations 

**64-bit** - used for very large values where the 32-bit limitations are not optimal.

####Big Integers

In version 4 of the .NET framework you have BigInteger as an option. This is for very large values but there is a key difference in that it is a dynamic data type, and it will only use as much space as it needs. As the size of the integer grows more space is allocated, meaning your theoretical size limit is dependent on how much memory you have. Not something you'd want to use unless you absolutely need it. 

####Floating Point

Floating point numbers are named such because there is a fixed number of digits available, but the decimal point is allowed to "float" around, for example:

>123.456
>12.3456

While the decimal point is allowed to move within the number the amount of _precision_ changes. Precision is the amount of detail allowed in your value. For example, our monetary system uses a precision of 2 digits, such as 

>$10.34

There is no such value as $10.345 because we generally don't deal in terms of fractions of a cent. As you can see from our table above, you can have _float_ values ranging from &#177;1.5 x 10-45 to &#177;3.4 x 1038(approximate). If you need a greater range you can use something like _long_ (-9,223,372,036,854,775,808 to 9,223,372,036,854,775,807) or even _ulong_ for very large positive values (0 to 18,446,744,073,709,551,615). 

Since I mentioned precision earlier, you might be wondering if data can be lost, or calculations can possibly be inaccurate if there is not enough precision and the value is truncated. This is correct, and though it's fairly accurate if you're doing something that requires absolute results from computations you'll want to use the next data type. 

###Decimal

For high precision computation such as accounting, you'll want to use the decimal format. Because floating point numbers are rounded off, you can end up with small incremental changes to each value that can lead to inaccuracies. This is why you would use the aptly named _decimal_ data type for decimal values. Decimal data types have a precision up to 28 digits and won't give unexpected results for precise calculations. 

You want to use this data type only when it's needed because there is a trade off and decimals are slightly less efficient than double or float because of the conversions from decimal to binary and vice-versa. 

{% include custom/asides/dotnet-newsletter-banner.html %}

###Summary

In this tutorial I have explained variables, what they are how to assign them. We also talked about some of the types available. Because this started to get so long winded I haven't covered everything on the subject but given you a good foundation to start with. You'll be working with variables and types a lot in the future, and I'll cover more as we go on. 

If you have any questions or comments, leave them below I'll be checking them frequently. In the next tutorial we're going to cover some statements. 

{% include custom/asides/tutorials-footer.html %}
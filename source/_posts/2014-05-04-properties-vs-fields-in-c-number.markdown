---
layout: post
title: "Properties vs Fields in C#"
date: 2014-05-04 11:25
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Programming
- DotNet
description: One of the areas that causes a lot of confusion for new C# developers is the idea of properties and fields. It's an easy thing to mess up and there aren't really any solid rules on it, but here are some general guidelines to help you decide how to use these members in your project.
permalink: /blog/programming/properties-vs-fields/
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---

One of the areas that causes a lot of confusion for new C# developers is the idea of properties and fields. It's an easy thing to mess up and there aren't really any solid rules on it, but here are some general guidelines to help you decide how to use these members in your project. 

<!-- more -->
###Definitions

Here are some quick definitions of what I'll be talking about:

**Properties** - A property is a member that provides a flexible mechanism to read, write or compute the data of a private field. ([From MSDN](http://msdn.microsoft.com/en-us/library/x9fsa0sw.aspx))

**Fields** - The private members of a class that contain values specific to the object

**Methods** - Methods are behaviors of an object, or "a code block that contains a series of statements" ([From MSDN](http://msdn.microsoft.com/en-us/library/ms173114.aspx))

These are core parts of Object Oriented Programming as it relates to C#. 

###When should I use a property?

In general you should use properties if you need them to look and behave like a variable. Properties give you a level of abstraction so you can change the fields while not affecting how they're used by a class. 

Here are some basic rules:

- **Should be quick to read** - reading a property should be just as fast as if it were reading a variable. If there are heavy calculations involved or you need to go to a database every time it's needed, this isn't the best way to use a property.
- **Client code should be able to read it's value.** - Write only properties are best reserved for methods.
- **Reading and writing to a property should not have any side effects** - You should have no unexpected actions or side affects when working with this value. Changing this value should produce the results expected (like a color on a web page for instance) but changes should not be able to break the functionality of your program. 
- **Properties should require an order** - You should be able to set the properties in any order, you should not have any errors in a property if another property has not been set. This creates a dependency chain that can make your program unpredictable. 
- **Validation and other logic is fine** - you can encapsulate logic in properties, and adding an additional level of validation here is fine, if not recommended in some cases. 
- **Read it a million times with the same result** - You should be able to read the property multiple times with the same result. If you have a value that's constantly changing like how much gas in the gas tank, a GetGasLevel() method would be better. If you want to store values that don't change often like the amount of gallons the tank holds, use a property. 

###When do you I use a field?

Fields should nearly always be private members of a class, so you don't expose internal implementation. They can be constants if necessary. Fields are used for data hiding, which is a best practice for Object Oriented Design:


>In computer science, information hiding is the principle of segregation of the design decisions in a computer program that are most likely to change, thus protecting other parts of the program from extensive modification if the design decision is changed. The protection involves providing a stable interface which protects the remainder of the program from the implementation (the details that are most likely to change). ([Wikipedia Definition](http://en.wikipedia.org/wiki/Information_hiding))

You can perform any internal operations on a field, so long as it's private and you can expose it's value with a property. Here's an example:

{% codeblock lang:c %}

public class Person
{
   // name field
   private string ourname;
   
   // name property
   public string Name
   {
      get
      {
         return ourname;
      }
      set
      {
         _name = value;
      }
   }
}
{% endcodeblock %}

As you can see in this code we have the inner field named "ourname" and a Name property that's available to the outside world. While in the code example above it looks like pointless ceremony but if you wanted to perform operations on the name, such as making it title case this would be a great place to do it. 

If you don't have any logic to perform you can use AutoProperties (C# 3.0 or later):

{% codeblock lang:c %}

public class Person
{
   // name property
   public string Name { get; set; }
}
{% endcodeblock %}

This is much more concise and simple, if you need to apply logic to the value later you can always come back and expand it.

###Summary 

I hope that clears up the name vs property question when dealing with objects. Remember there are no hard rules here so if you really need to violate these guidelines you can, but remember some changes may make extension or interfacing difficult. 

If you have any questions leave a comment! 

{% include custom/asides/programming-footer.html %}
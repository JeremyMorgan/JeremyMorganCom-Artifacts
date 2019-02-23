---
layout: post
title: "C# .Net Tutorials - How to learn C# Part 2 - Namespaces"
date: 2012-11-17 18:42
comments: true
categories:
- Tutorials
description: Part 2 of my tutorial series on learning C# .Net which takes a deeper look at C# namespaces
permalink: /tutorials/c-sharp/how-to-learn-c-sharp-part-2-namespaces/
author: Jeremy Morgan
sharing: true

---
In the second part of our learning C# series we're going to explain namespaces. You got a look at a namespace when we ran the sample code in the <a href="/tutorials/c-sharp/how-to-learn-c-sharp-part-1/" rel="prev">last chapter</a>, and now we're going to dig in a little deeper into C# namespaces and what they mean. 
<!-- more -->
<br />
### What is a namespace?

{% include custom/asides/csharp-sidebar-2.html %}
The .NET Framework class library is huge, over 10,000 classes in fact. Namespaces bring order to all those classes by creating containers for entities such as classes or types. 

In our Hello World application it looked like this:

{% codeblock lang:c %}
namespace HelloWorldApp
{% endcodeblock %}

But we also had another namespace in use that we identified above that:

{% codeblock lang:c %}
using System;
{% endcodeblock %}

These two lines let the compiler know what namespaces we're working in. We implemented the using statement for System to let our program have access to entities within the "System" namespace, which is a part of the .NET Framework. The namespace "HelloWorldApp" is our namespace that we created for our application. 

The primary function of namepsaces is organizing your code. With our Hello World application they didn't do much because it's very minimal, but in a real application they help you out immensely.

<br />
### What do they do? 

A namespace organizes your code by creating boundaries and hierarchies for your types. They do several things:

** Identify the purpose of the type ** - For example, System.IO controls input and output, System.Text contains classes that deal with character encodings. 

** Creates a hierarchy of types ** - For instance, System.Net handles communication at a higher level, while System.Net.Sockets is more granular and focuses on sockets. You may only need what's contained within sockets, or you may need several parts of the System.Net namespace. 

** Help you navigate the Library ** - As stated before there are over 10,000 classes in the .NET Framework library and you don't need them all. When you're searching you don't want to search all of them looking for a particular method. As in the example above, you know sockets are used for communication, so you can browse to System.Net and look for System.Net.Sockets and then find the method or type you're looking for. Autocomplete in Visual Studio helps with this also. 

** Namespaces ensure uniqueness ** - Namespaces can determine how a method is used. For example the "scan" method means something different for a networking library than it would for an OCR library. In the regex class there is a "capture" but if you're writing something for a mobile phone it could mean taking a picture. 

** Namespaces can also make your code cleaner ** - By implementing "using" directives you can include a namespace and reference all the methods in it within it's scope. 

For example instead of writing **System.Console.WriteLine("text")** you can call it out implicitly, such as **Console.WriteLine("text")**. This may not seem like much of a difference, but when working with large projects things like this matter more. 

<br />
### How namespaces are named

The primary function of namepsaces is organizing your code. With our Hello World application they didn't do much because it's very minimal, but in a real application they help you out immensely. The name of your namespace reflects who created it and what it's purpose is.

**System.[name]** - These are entities that are part of the .NET Framework Class Library. 

Examples:

>- System.IO
>- System.Text
>- System.Console

You can even put your own types into the System namespace, but I wouldn't recommend it. 

**Microsoft.[name]** - These are usually libraries with functionality created by Microsoft, but not included in the .NET Framework libraries. 

Examples:

>- Microsoft.CSharp
>- Microsoft.Runtime.Hosting
>- Microsoft.SqlServer

**[CompanyName].[name]** - Companies often put their own name in as the first part of the namespace to indicate something is utilizing their own tools. 

Examples:

>- Telerik.Windows.Controls
>- CookComputing.XmlRpc

**[ProjectName].[name]** - Open source projects often use the same naming conventions for their namespaces as well.

Examples: 

>- Codemonkey.TextParser
>- Thor.Net.Views

As you can see in the examples a hierarchy is created by the namespace and we try to reflect that in the naming. You can name your namespaces just about any way you'd like but it's highly recommended to follow the general convention:

{% codeblock %}
<Company>.(<Product>|<Technology>)[.<Feature>][.<Subnamespace>]
{% endcodeblock %}

This adds clarity to your solution and helps protect you from naming conflicts. The way you identify your namespaces will make your life easier down the road. We'll explore even further in the next section. 

<br />
###Additional naming considerations

Preventing conflicts is a full time job for any programming language or framework and C# .NET is no exception. Here are some tips to follow when naming your namespaces.

**Use your company name in the namespace** - This helps avoid conflicts if your entities are named similar to another company's software. 

**Don't put version numbers in the names** - Changing namespaces introduces a host of problems, and version numbers change frequently.

**Don't name it after the internal codename of your company project** - These names tend to change over time. 

**Don't use keywords or types as names for namespaces** - this seems pretty obvious, but can lead to some nasty conflicts down the road. 

<br />
###Explicit references and namespace aliases

So what if you have two methods with the same name in two different namespaces? Well, it's not the end of the world. You just need to call them out explicitly:

{% codeblock lang:c %}
Htmltools.Parsetags("someparameter");

Xmltools.Reader.Parsetags("someparameter", "anotherone");
{% endcodeblock %}

As you can see, you have can two different methods, even with different types and signatures, and you'll be just fine as long as you call them out explicitly. This should be easy for most programmers to figure out if they're reading your code. 

Another option for similarly named types would be to use an alias. This is another way to differentiate similarly named types. Let's say you have a path class defined in one of your namespaces, but you also need a class that works with filesystem paths. Here's both of them called out explicitly:

{% codeblock lang:c %}
using System.IO;
using JeremysTools.IniReader;

// explicit calls would be:
System.IO.Path;
JeremysTools.IniReader.Path;
{% endcodeblock %}

You can create an alias for both very easily to avoid confusion:

{% codeblock lang:c %}
using IOPath = System.IO.Path;
using IniPath = JeremysTools.IniReader.Path;
{% endcodeblock %}

See how easy that is? Now you can easily differentiate between IOPath and IniPath without doing a bunch of extra typing. 

<br />
###Nested namespaces

The .NET Framework uses namespace nesting a lot, with good reason. For instance the System namespace is huge, and contains types such as System.Net and subcategories such as System.Net.Socket and System.Net.Mail. If you declare the socket namespace, you can't neccessarily use the Mail namespace types, even though they're both in the System.Net namespace. This creates the hierarchy we talked about earlier. This is done for effieciency, as we don't want to load the entire framework for every application. 

You can use nested namespaces too if your application needs it. It's a very simple method:

{% codeblock lang:c %}
namespace YourApp {

	namespace NetTools {
		// do stuff
	}
}
{% endcodeblock %}

This is a simple way to create a hierarchy and better organize your code. Another even more succinct method looks like this:

{% codeblock lang:c %}

namespace YourApp.Net
{
	// do stuff
}
{% endcodeblock %} 

This is the most common method. Any code you put in a nested namespace can use types from the parent namespace without calling it explicitly. 

<br />
###Conclusion

I hope this tutorial was a good introduction to namespaces. Honestly I didn't think it would be this long until I started writing it and really thinking about it. This isn't really code heavy, but the next part will be when I start talking about types. 

Most tutorials go straight from Hello world to types, but I thought the namespace would be an important first step since all your code is contained in them. But software is about data, so the next part will be about types, variables and classes then we'll start on some conditional operation. I'll also start to dive into some more object oriented stuff so you start off doing things in an object oriented manner. 

I hope this stuff helps, leave me some comments or shoot me a message if you have any questions or comments. 

<br />
<br />



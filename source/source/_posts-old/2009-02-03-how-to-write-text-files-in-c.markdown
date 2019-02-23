---
comments: true
sharing: true
date: 2009-02-03 01:06:01
layout: post
slug: how-to-write-text-files-in-c
title: "Tutorial: How to write text files in C#"
wordpress_id: 57
categories:
- "Tutorials"
Author: Jeremy Morgan

permalink: /tutorials/c-sharp/how-to-write-text-files-in-c/

tags:
- c
- C sharp
- C# .net
- C++ tutorials
- Visual Studio
---

So you want to know how to write a text file in C#? It's actually super easy. This tutorial explains how.

To start out, I'm just going to paste the code (I have received feedback about this) and then explain it later.

{% codeblock %}    
    using System;
    using System.IO;
    
    public class FileWriter
    {
        public static void Main()
        {
            StreamWriter OurStream;
            OurStream = File.CreateText("c:\examples\writer\test.txt");
            OurStream.WriteLine("This is a line of text");
            OurStream.Close();
            Console.WriteLine("Created File!");
        }
    
    }
{% endcodeblock %}

When you run this code from your IDE (F5 Button) it will write a text file in the C:\examples\filewriter directory.

**How to start **

Open up Visual Studio Express, and select **File->New Project**

Create a new project called "filewriter", using the following options:

{% img center https://s3.amazonaws.com/images.jeremymorgan.com/how-to-write-text-file-c-sharp01.jpg How to write a text file in C# %}

Create a new console application and copy and paste the code from above in. I'll explain how each step works.

At the top of the file, you have the following two lines:

{% codeblock %}    
    using System;
    using System.IO;
{% endcodeblock %}

What this does is include the System and System.IO classes, so you can use methods from them. Without these lines, the compiler will not be able to fetch the code for the methods we'll be using.

{% codeblock %}    
    public class FileWriter
    {
{% endcodeblock %}

This code creates a new object (or class) that will run when compiled. For more details on classes and objects, [check out this page](http://www.csharphelp.com/archives3/archive497.html).

For this application, every task is executed within this class, within the brackets.

{% codeblock %}  
     public static void Main()
        {
{% endcodeblock %}

These lines create yet another loop, that tell the compiler to run everything within the bracket automatically on load, using the Main() method. Anything loaded in this method will be run when the main executable is run.

Next, we want to create a StreamWriter object. This class creates a textwriter to write characters to a stream. This is commonly used for text file operations. ([more info on StreamWriter](http://msdn.microsoft.com/en-us/library/system.io.streamwriter.aspx))

{% codeblock %}   
    StreamWriter OurStream;
{% endcodeblock %}

Then, we actually create the file, using the CreateText Method from the [File](http://msdn.microsoft.com/en-us/library/system.io.file.aspx) class:

{% codeblock %}   
    OurStream = File.CreateText("c:\examples\filewriter\test.txt");
{% endcodeblock %}

Then, we write a string of text to the stream:

{% codeblock %}    
    OurStream.WriteLine("This is a line of text");
{% endcodeblock %}

You can really work with this a lot, there are tons of ways to expand on this. You can take text from another file using a streamreader, or text from a database, xml file, or whatever you want. The possibilities are endless.

When we're done writing, we close the file with the following line:

{% codeblock %}   
    OurStream.Close();
{% endcodeblock %}

This closes the stream. This is very important, if you leave too many streams open, it will take up valuable resources. This is especially important in web apps (which this app is not, but something you should keep in mind).

The last line we just do just to let you know that we done.

{% codeblock %}
    Console.WriteLine("Created File!");
{% endcodeblock %}

When you compile and run your program, you should see this:

{% img center https://s3.amazonaws.com/images.jeremymorgan.com/how-to-write-text-file-csharp-02.jpg How to write a text file in C# %}

If you have any questions, feel free to contact me!

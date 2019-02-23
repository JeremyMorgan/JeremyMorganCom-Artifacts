---
comments: true
sharing: true
date: 2010-10-15 19:50:36
layout: post
slug: java-tutorial-hello-world
title: "Java Tutorial: Hello World"
wordpress_id: 131
categories:
- "Tutorials"
permalink: /tutorials/java/java-tutorial-hello-world/
Author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/java-ogimage.png
description: The proverbial Hello World! app, in Java
---

The "hello world" app is always the first thing most students do in any language. Java is no different, and I'll show you how easy it is here.

[Java Tutorial - Hello World](http://www.youtube.com/v/rtknqrUbq6M)

This tutorial makes a few assumptions. We've assumed that you've [installed the JDK](http://www.oracle.com/technetwork/java/javase/downloads/index.html) and have it running. For this tutorial I'm using Ubuntu Linux at the command line, but the code is the same if you're using Windows.

**Step 1: Create File **

Create a file called "HelloWorld.java". In there type the following code:

{% codeblock lang:java%}    
    class HelloWorld {
        public static void main(String[] args) {
    
            System.out.println("Hello World!");
        }
    }
{% endcodeblock %}

This code is pretty self explanatory. We're creating a class called "HelloWorld". When that class executes the first thing that runs is the main() method. Within that method we have a [System.out.println](http://download.oracle.com/javase/1.4.2/docs/api/java/lang/System.html) method that outputs text.

**Step 2: compile**

To compile this, we simply type:

{% codeblock %}
javac HelloWorld.java
{% endcodeblock %}

This compiles into a file named HelloWorld.class

**Step 3: Run**

To run this file, we type in:

{% codeblock %}
java HelloWorld
{% endcodeblock %}

And it outputs text. It's that easy!

Now find some ways to make text output interesting. There are thousands of cool things you can do at the console.
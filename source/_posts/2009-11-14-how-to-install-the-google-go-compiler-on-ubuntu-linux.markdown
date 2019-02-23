---
layout: post
title: "Tutorial: How to install the Google GO compiler on Ubuntu Linux"
date: 2009-11-14 22:27
updated: 2018-03-25 12:22
comments: true
sharing: true
categories:
- Tutorials
- Programming
- Linux
description: Want to try out Google Go? Here's a guide to getting it working in Ubuntu.
permalink: /tutorials/linux/how-to-install-the-google-go-compiler-on-ubuntu-linux/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/ubuntu-ogimage.png
---


This week google introduced "go", their new programming language. I was curious so I started messing around with it. Here's how you can try it out if you'd like to "give it a go".
###About Google Go

From <a title="Google Go Homepage" href="http://golang.org" target="_blank">the Go website</a>:

<blockquote>
No major systems language has emerged in over a decade, but over that time the computing landscape has changed tremendously. 
There are several trends:
<ul>
	<li>Computers are enormously quicker but software development is not faster.</li>
	<li>Dependency management is a big part of software development today but the "header files" of languages in the C tradition are antithetical to clean dependency analysis - and fast compilation.</li>
	<li>There is a growing rebellion against cumbersome type systems like those of Java and C++, pushing people towards dynamically typed languages such as Python and JavaScript.</li>
	<li>Some fundamental concepts such as garbage collection and parallel computation are not well supported by popular systems languages.</li>
	<li>The emergence of multicore computers has generated worry and confusion.</li>
</ul>
We believe it's worth trying again with a new language, a concurrent, garbage-collected language with fast compilation.
</blockquote>

So I decided to install the GO compiler, so I could play around with it. I found it to be a little different than the instructions.

###Step 1: edit your .bashrc and add these lines:

{% codeblock  Lines to add to .bashrc %}
export GOROOT=$HOME/go
export GOARCH=386
export GOOS=linux
export GOBIN=$HOME/bin
export PATH=$GOBIN:$PATH
{% endcodeblock %}

The last two are not listed on the GO site, but I needed them to compile.

###Step 2. Create a bin folder

{% codeblock  lang:bash %}
mkdir ~/bin
chmod 755 ~/bin
{% endcodeblock %}

This was also not included in the instructions, this is so quietgcc has a place to sit, and be run by the installer.

###Step 3. Run the following commands:

{% codeblock  lang:bash %}
sudo apt-get install python-setuptools python-dev
sudo apt-get install mercurial
hg clone -r release https://go.googlecode.com/hg/ $GOROOT
{% endcodeblock %}

This will pull down the latest copy of go. Next, you'll need the libraries to build go:

{% codeblock  lang:bash %}
sudo apt-get install bison gcc libc6-dev ed make
{% endcodeblock %}
###Step 4: Build and install

{% codeblock  lang:bash %}
cd $GOROOT/src
./all.bash
{% endcodeblock %}

If all goes well, you'll see this screen:

{% img center https://s3-us-west-1.amazonaws.com/jeremymorgan/hosted/how-to-install-google-go.jpg How to Install Google Go %}

I am using Ubuntu Linux, Karmic Koala with GCC 4.4.1

If you have any questions, feel free to contact me!
---
comments: true
sharing: true
date: 2011-09-23 18:53:44
layout: post
slug: how-to-capture-the-output-of-a-linux-command-in-c
title: How to Capture The Output of a Linux Command in C++
wordpress_id: 688
categories:
- Tutorials
permalink: /tutorials/c-programming/how-to-capture-the-output-of-a-linux-command-in-c/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/linux-ogimage.png
tags:
- c
- c programming
- c++ programming
- How to
- tutorials
description: A quick way to capture the output of a Linux command in your C++ program
---

Ok, I admit this is a pretty obscure one but this came up for a task at work today and I had forgotten exactly how to do this. I Googled around a bit and found a lot of answers I either didn't understand completely or just seemed too complicated for what I was trying to accomplish. I had done this with the boost libraries before but I didn't have them on this machine so I wanted a clean, stdlib type solution.

I dug around and found this snippet of code on my hard drive, and put something together to make it work. I didn't write it, and I don't remember where it came from so I can't give credit for it, but it works like a charm:

(tested using G++ v. 4.4.4)

    
    string GetStdoutFromCommand(string cmd) {
    
    string data;
    FILE * stream;
    const int max_buffer = 256;
    char buffer[max_buffer];
    cmd.append(" 2>&1");
    
    stream = popen(cmd.c_str(), "r");
    if (stream) {
    while (!feof(stream))
    if (fgets(buffer, max_buffer, stream) != NULL) data.append(buffer);
    pclose(stream);
    }
    return data;
    }


As you can see, this is a function and you simply pass the command as a string to that function. It's really easy to use. As a note, you can run system commands from within C using [system.](http://www.cplusplus.com/reference/clibrary/cstdlib/system/) The problem with this is, the command is often run first, before any output commands and the function returns an integer indicating success or failure, but not the output of the string. The function above fixes that for you.

What it does is creates a buffer, opens up a read-only stream, runs the command and captures the output, stuffs it into the buffer and returns it as a string.

Here is how we put it to use:

    
    int main (){
    
    string ls = GetStdoutFromCommand("ls -la");
    
    cout << "LS: " << ls << endl;
    
    return 0;
    
    }


Keep in mind that there is no real checking here, and you should test the outputs of the commands carefully. For instance, when I used it today I had a set of long commands where things were piped into grep and cut, etc and I found that if I got unexpected output it caused a problem which hung the executable. So you want to make sure and validate your input and output as you go along, don't just go running a bunch of commands and working on the output without some good error checking.

Here is the full code:

{% codeblock lang:c %}

    #include <iostream>
    #include <stdio.h>
    #include <stdlib.h>
    
    using namespace std;
    
    string GetStdoutFromCommand(string cmd) {
    
    string data;
    FILE * stream;
    const int max_buffer = 256;
    char buffer[max_buffer];
    cmd.append(" 2>&1");
    
    stream = popen(cmd.c_str(), "r");
    if (stream) {
    while (!feof(stream))
    if (fgets(buffer, max_buffer, stream) != NULL) data.append(buffer);
    pclose(stream);
    }
    return data;
    }
    
    int main (){
    
    string ls = GetStdoutFromCommand("ls -la");
    
    cout << "LS: " << ls << endl;
    
    return 0;
    }

{% endcodeblock %}

Like I said this a pretty obscure tutorial but I figured if I had this problem, others might as well so I thought I'd throw it up there. I hope it helps.

Happy Coding!

{% include custom/asides/tutorials-footer.html %}

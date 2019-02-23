---
layout: post
title: "A Cleaner Display of Your IP in Windows"
date: 2012-12-12 22:20
comments: true
categories:
- Tutorials
permalink: /tutorials/c-programming/a-cleaner-display-of-your-ip/
description: How you can build a quick program in C++ to show just your ip address from the prompt. 
Author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/cplusplus-ogimage.png
---

If you're like me, you constantly need your IP in Windows. When working with network interfaces and multiple servers, I find myself checking my IP a lot. 

I built a little utility for myself that only shows the IP addresses on the host, rather than typing ipconfig and getting a long list, I can simply type "ip" and it will only show IP addresses.
<!-- more -->
<br />
###C++ Version of the Tool

The following compiles with GCC for Windows, and probably a lot of other compilers as well. This utility is standalone and only needs to be copied into a folder within your path.

Create a file called ip.cpp and add the following:

{% codeblock lang:c %}

#include <iostream>
#include <stdio.h>
#include <typeinfo>
using namespace std;

int main()
{
    FILE *dir;
    char direntry[80];

    dir = popen("ipconfig", "r");

    while (!feof(dir)) {

        fgets(direntry, sizeof(direntry), dir);

        string output = direntry;

        if ((output.find("IP") != string::npos)) {
            cout << direntry << "\n";
        }

    }
    return 0;
}

{% endcodeblock %}

This simple executable will cut down your time by only showing the information you need at the time. I hope this helps someone.

<br />
###C&#35; Version of the Tool

I have also created a C# version of this tool, but it requires the .NET framework to be installed. Create a file called IP.cs with the following code:

{% codeblock lang:c %}

using System;

namespace iptools
{
    class ip
    {

        static void Main(string[] args)
        {

            //Create process
            System.Diagnostics.Process pProcess = new System.Diagnostics.Process();

            //the command we want to run
            pProcess.StartInfo.FileName = "ipconfig";

            // we don't want this to output the original command
            pProcess.StartInfo.UseShellExecute = false;

            //Set output of program to be written to process output stream
            pProcess.StartInfo.RedirectStandardOutput = true;

            //Start the process
            pProcess.Start();

            //Get program output
            string strOutput = pProcess.StandardOutput.ReadToEnd();

            // split it by line
            string[] ourText = strOutput.Split('\n');

            Console.WriteLine("\n\n");

            foreach (string line in ourText)
            {
                if (line.Contains("IP"))
                {
                    Console.WriteLine(line + "\n");
                }
            }
			// close the process
            pProcess.Close();
        }
    }
}
{% endcodeblock %}

Compile this file from the command line (csc ip.cs) and it's ready!

<br />
###Summary

These files both provide a simple executable to output your ip address where you can read it quickly. If you have multiple adapters they will show up as well.

I hope this helps!

{% include custom/asides/programming-footer.html %}

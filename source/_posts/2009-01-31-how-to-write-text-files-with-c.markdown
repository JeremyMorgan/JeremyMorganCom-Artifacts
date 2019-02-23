---
comments: true
sharing: true
date: 2009-01-31 04:40:34
updated: 2018-03-25 12:22
layout: post
title: How to write text files with C++
categories:
- Programming
- Tutorials

tags:
- c
- Tutorials

description: Step by step description of how to write text files with C++. Using Bloodshed C++
permalink: /tutorials/c-programming/how-to-write-text-files-with-c/
Author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/cplusplus-ogimage.png
---


If you're reading this tutorial, it's likely because you googled how to read and write text files with C++.  And it's probably a pretty lucky guess you're a beginner, so I'll try to explain as much as I can here to make it clear.

If you're thinking of getting into C++, hopefully this example will show you that it's not as complicated as commonly thought. C++ can be very difficult, but the performance advantages are worth the effort sometimes. Java and C# are definitely stealing marketshare from C++, but it still has it's place in the software development world, mainly in applications that require high performance. But that's for another article. Let's get started.

For this example, I'm using [Bloodshed Dev C++,](http://www.bloodshed.net/devcpp.html) because it's simple, fast and free. You could just as easily use Visual C++ express, also free, but I feel that Dev C++ is far simpler, and better for learning the code.

Go to **file->new** and create a new project. Your options should look like this:

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/how-to-write-text-file-c%2B%2B-01.jpg  How to write a text file in C++ %}

Start a new C++ project, and call it whatever you want. You can save the dev file wherever you feel neccessary. Go into options and choose a folder to put your executable:

Select **Project->Project Options->(Build Options)**

{% img center http://s3.amazonaws.com/images.jeremymorgan.com/how-to-write-text-file-c%2B%2B-02.jpg  How to write a text file in C++ %}

This will put your final executable in a folder you can easily get to when you decide to run it.

When you first create your project, you'll find the following code:

{% codeblock %}

#include <cstdlib>
#include <iostream>

    
    using namespace std;
    
    int main(int argc, char *argv[])
    {
        system("PAUSE");
        return EXIT_SUCCESS;
    }
{% endcodeblock %}

This code is pretty self explanatory, and I won't go into it here, because we're going to erase it anyway. Select all the code in the window and delete it. Replace it with this:

{% codeblock %}
<------ start code ------->

#include <iostream>
#include <fstream>

    
    using namespace std;
    int main () {
    
      ofstream myfile;
      myfile.open ("test.txt");
      myfile <<  "Hey this is my first written text file.\n";
      myfile.close();
      return 0;
    }


<------ end code -------->
{% endcodeblock %}

After you have entered this code, save the file, then press Ctrl+F9. This will compile your executable. Run it from the command prompt, wherever you set it to build to. In my case, it looks like this:

{% img center https://s3.amazonaws.com/images.jeremymorgan.com/how-to-write-text-file-c%2B%2B-03.jpg How to write a text file in C++ %}

When you run the executable it generates test.txt. Everything you specified in your cout gets written to a file. But lets examine how that happened.

The following code is the start of your program:

{% codeblock %}   
    int main () {
{% endcodeblock %}

This is the starting point of your program. Wherever you see main() that is the method you use to start your program. By putting this in you are telling the compiler where to begin. "Int" is the return type, which I will talk about in future tutorials. "int" stands for integer, which is what your main function must return. For this example, you don't need to be concerned with that part, but in the future, you will create funtions which return a datatype, and it will become more important.

The following opens up an output file stream:

 {% codeblock %}      
    ofstream myfile;
{% endcodeblock %}

What this does is open up a stream for file output. [You can get more info about ofstream here](http://www.cplusplus.com/reference/iostream/ofstream/). By opening up this stream, you are preparing the compiler to output data to a file. You create an object called "myfile" that you can use to perform the necessary file output functions.

{% codeblock %}       
    myfile.open ("test.txt");
{% endcodeblock %}

As you've probably guessed, this is how you open your file. You are using that same ofstream object to open a file you specify within the parentheses. In our case, we are instructing the myfile object to open test.txt.

{% codeblock %}      
    myfile << "Hey this is my first written text file.\n";
{% endcodeblock %}

This portion of the code does the actual writing. You are essentially "pushing" the data to the file object using the << operator. You can see above the line of text, and then followed by \n. At the end of the string we put \n to indicate a new line. This is what's known as a "escape character" and is used to create a new line. Play around with this line and see what you can do with it. You can use \n as many times as needed to format your output with the proper line breaks.

Finally, we need to close the file:

{% codeblock %}   
    
      myfile.close();
      return 0;
{% endcodeblock %}

By calling the close method of myfile, we are closing the file we wrote to. While not required, you should always close your files on execution. If you are building an application, whether it's just one person using it or hundreds, you should always close the files used, for resource usage purposes. Too many files loaded into memory can be a bad thing. Note that we also return 0,  as a "success flag" for the compiler. The program exits at this point.

When you run the executable, it will generate a text file, as you've specified. This concludes our lesson. You can use these same methods to read another file, filter it and build it another file. You can also build something that will filter the strings being parsed, and write strings with different patterns, or pretty much anything you can imagine.

So copy this code, and try it out. If you have any questions, or need general help, be sure to ask in our forums. I will gladly help others trying to learn who are stuck on something. Till then, enjoy!!

{% include custom/asides/tutorials-footer.html %}

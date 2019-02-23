---
layout: post
title: "Raspberry Pi how to: Set up a SVN Server"
date: 2013-02-11 22:44
updated: 2018-03-25 12:22
comments: true
categories: 
 - Raspberry Pi
 - Tutorials
author: Jeremy Morgan
sharing: true
permalink: /tutorials/raspberry-pi/raspberry-pi-how-to-svn-server/
description: Want to set up an SVN Server on your Raspberry Pi? Here's a step by step guide.
ogimage: https://www.jeremymorgan.com/images/raspberry-pi-ogimage.png
---
{% include custom/asides/iot-newsletter-banner.html %}
Today we're going to go thru the process of turning your Raspberry Pi into an SVN server. While this may not be the most practical use of your Pi, it's an excellent learning experience. SVN is a pretty good way to manage your code, especially if you're juggling lots of projects. 

This isn't going to be a "how to use SVN" tutorial but more of a guide for setting it up on a Raspberry Pi. If you're not familiar with SVN <a href="http://svnbook.red-bean.com/" target="_blank" rel="nofollow">Here is an excellent free guide</a> to get you started. 

<!-- more -->
{% include custom/asides/rpi-footer.html %}
<br /><br />

###Getting Started

The first thing we want to do is ssh into the Raspberry Pi or open up a terminal. We're going to do all of this from the Linux prompt. 

Then, we'll install Subversion:

<pre>
sudo apt-get install subversion
</pre>

Now let's create a folder to put our repositories in:

<pre>
mkdir -p /home/pi/repos
</pre>

Now, we need to create a project:

<pre>
svnadmin create /home/pi/repos/helloworld
</pre>

With that created, you should see a folder that looks like this:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-1.png "Raspberry Pi how to setup SVN server" %}

Let's create a project that we'll add to SVN.

<pre>
mkdir /home/pi/projects/helloworld
cd /home/pi/projects/helloworld
</pre>

create a file called main.cpp:

<pre>
sudo nano main.cpp
</pre>

add the following to the file:

{% codeblock lang:c main.cpp %}

// main.cpp v .1
#include <iostream>
using namespace std;

int main ()
{
  cout << "Hello World!";
  return 0;
}

{% endcodeblock %}

And save it. 

Now we'll want to import it into svn:

<pre>
sudo svn import /home/pi/projects/helloworld/ file://localhost/home/pi/repos/helloworld/
</pre>

You should see a screen that looks like this. 

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-2.png "Raspberry Pi how to setup SVN server" %}

Enter a message for committing this file. CTRL+X exits this screen.

You should see: 
<pre>
Adding /home/pi/projects/helloworld/main.cpp

Committed revision 1.
</pre>

###Set up Remote Access

Now, we'll need to set up the server part of it so you can access it remotely:

<pre>
sudo apt-get install apache2 libapache2-svn
</pre>

(If you already have Apache installed you won't need to reinstall it)

Now let's edit the dav_svn.conf:

<pre>
sudo nano /etc/apache2/mods-available/dav_svn.conf
</pre>

Add this to the bottom of the file:

{% codeblock %}
<Location /svn>
  DAV svn
  SVNParentPath /home/pi/repos
  AuthType Basic
  AuthName "Subversion Repo"
  AuthUserFile /etc/apache2/dav_svn.passwd
  <LimitExcept GET PROPFIND OPTIONS REPORT>
    Require valid-user
  </LimitExcept>
 </Location>
{% endcodeblock %}

Quit and save the file, then restart apache:

<pre>
sudo /etc/init.d/apache2 restart
</pre>

Now we need to change the permissions of this folder:

<pre>
sudo chown -R www-data:www-data /home/pi/repos
</pre>

We're changing this so the SVN server can access these files. Don't modify these files by hand anymore! Always use SVN.

Now you need to create an SVN user:

<pre>
sudo htpasswd -c /etc/apache2/dav_svn.passwd jeremy
</pre>

Remember **only use -c the first time you add a user**. If you run this with -c again it will delete existing users! This is for the first time only!

Now you can check your repo thru a web browser on your machine using the IP of your Raspberry Pi (probably different than mine)

http://192.168.254.18/svn/helloworld/

You should see a screen like this:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-3.png "Raspberry Pi how to setup SVN server" %}

Go back to your main computer and check out the repo. 

###Check out the repository in Linux

Open up a terminal window, and type the following: 

<pre>
svn co --username jeremy http://192.168.254.18/svn/helloworld
</pre>

You should see:
<pre>
A helloworld/main.cpp
Checked out revision 1.
</pre>

Now go into that folder and edit the file again:

<pre>
cd helloworld
nano main.cpp
</pre>

And make the following changes:

{% codeblock lang:c main.cpp %}
// main.cpp v .2
#include <iostream>
using namespace std;

int main ()
{
    cout << "Hello World! Version 2";
    return 0;
}
{% endcodeblock %}

Quit and save the file.

Now do a diff on the file:

<pre>
svn diff main.cpp
</pre>

A diff shows you the difference between the file you're editing, and what's stored in SVN. 

You will see a screen that looks like this:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-4.png "Raspberry Pi how to setup SVN server" %}

Now, let's commit that file with the message "version 2"

<pre>
sudo svn commit -m "version 2" main.cpp
</pre>

You should see:

<pre>
Sending main.cpp
Transmitting file data .
Committed revision 2.
</pre>

Now, if you check your repo browser again:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-5.png "Raspberry Pi how to setup SVN server" %}

You will see that your change has been committed. It's that easy!

###Check out the repository in Windows

Let's say you're a Windows user (not that there's anything wrong with that) and you want to connect to your Pi from Windows. I recommend using <a href="http://tortoisesvn.net/downloads.html" rel="nofollow">Tortiose SVN</a> for the task. It's a great free program that works well.

Once it's installed, create a folder on your Desktop called "repos". Then, right click inside that box and select "SVN Checkout".

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-6.png "Raspberry Pi how to setup SVN server" %}

In that window, put in the URL to your repository:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-7.png "Raspberry Pi how to setup SVN server" %}

For me it is http://192.168.254.18/svn/helloworld but yours may be different.

Click OK, and you should see the main.cpp file in there. 

Edit it and make the following changes:

{% codeblock lang:c main.cpp %}
// main.cpp v .2
#include <iostream>
using namespace std;

int main ()
{
    cout << "Hello World! Version 2";
    return 0;
}
{% endcodeblock %}

Save the file. Then right click on the file and select "SVN Commit".

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-8.png "Raspberry Pi how to setup SVN server" %}

Enter a message and commit the file. It will ask for your login, then you You will see the following screen:

{% img https://www.jeremymorgan.com/images/raspberry-pi-how-to-svn-server-9.png "Raspberry Pi how to setup SVN server" %}

And you're done! 

{% include custom/asides/iot-newsletter-banner.html %}

###Conclusion

I hope this has helped you with setting up an SVN server on your Raspberry Pi. It's not incredibly practical but it seems to work well for me, as I'm the only developer using it. I also store my repos on an external drive, as the SD cards seem to flake out quite a bit. 

If you have any questions, leave me a comment!

{% include custom/asides/rpi-footer.html %}


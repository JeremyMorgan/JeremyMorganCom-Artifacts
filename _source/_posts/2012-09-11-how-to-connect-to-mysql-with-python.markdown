---
layout: post
title: "Tutorial: How to connect to MySQL with Python"
date: 2012-09-13 16:33
comments: true
categories: 
- "Tutorials"
permalink: /tutorials/python-tutorials/how-to-connect-to-mysql-with-python/
published: true
sharing: true
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/python-ogimage.png
description: A step by step guide to connecting to a MySQL database with Python. Super easy. 
---

The more I jump into Python the more I like it. This tutorial is about one of the more basic parts of Python - connecting it to a MySQL database. 

The reason I chose MySQL is purely because of ubiquity, I figure this will be the one people will be connecting to the most if they're using Python especially in a web envronment. 
<!-- more --> 
### Get The Database Setup

If you're following this excersize exactly, you'll want to create a table on your MySQL database that holds names. This is just a simple dumb table for this excersize. 

{% codeblock SQL to create the table for this tutorial. lang:sql %}

CREATE  TABLE `test`.`name` (
	`nameid` INT NOT NULL AUTO_INCREMENT ,
	`firstname` VARCHAR(45) NULL ,
	`lastname` VARCHAR(45) NULL ,
	PRIMARY KEY (`nameid`) 
);

INSERT INTO `test`.`name`
(`firstname`,`lastname`)
VALUES
("Cookie","Monster"),
("Guy","Smiley"),
("Big","Bird"),
("Oscar","Grouch"),
("Alastair","Cookie");

{% endcodeblock %}

Now that you have your highly sophisticated database set up, let's connect to it and start playing around. 



### Create Your Python Script

The first step of course is to create your Python Script. Create a file called "datademo.py" (or whatever you want to call it). 

{% codeblock Your Initial Python Script. lang:python %}
#!/usr/bin/python
# filename: datademo.py 
# a simple script to pull some data from a MySQL table
{% endcodeblock %}

### Connect to the Database

The first thing you'll need do is import the MySQL modules with the following line: 

{% codeblock lang:python %}
import MySQLdb
{% endcodeblock %}

This assumes you have MySQLdb installed. If not, don't worry it's a quick install. 

* Windows Users can get it here: <a href="http://sourceforge.net/projects/mysql-python/files/latest/download?source=files">MySQL for Python Installer</a>
* Linux Users you can get the <a href="http://pypi.python.org/pypi/MySQL-python/">Linux Install</a> and install it by hand, or use your package manager and look for python-mysql

Now that you have that set up, let's get connected:

{% codeblock lang:python %}
db = MySQLdb.connect(host="localhost", user="root", passwd="", db="test")
{% endcodeblock %}

With this string you can connect using your MySQL credentials. If you want you can store these credentials in variables elsewhere. 

### The Cursor 

Python uses a "cursor" when dealing with data. A cursor is a simple data structure that transverses the records in the database. Cursors perform CRUD ( Create Read Update Delete ) operations on the database. 

{% codeblock lang:python %}
#create a cursor for the select
cur = db.cursor()
{% endcodeblock %}

This intializes the cursor so you can use the "cur "object wherever needed. So the next thing we need to do is come up with an SQL command. 

{% codeblock lang:sql %}
SELECT firstname,lastname FROM test.name;
{% endcodeblock %}

This of course selects a first and last name from our database. We want to stuff that SQL command into a parameter for the execute method of the cursor:

{% codeblock lang:python %}
#execute an sql query
cur.execute("SELECT firstname,lastname FROM test.name")
{% endcodeblock %}

### Iteration and Display

The next part of this is iterating through the database result and displaying it. 

{% codeblock lang:python %}
# loop to iterate
for row in cur.fetchall() :
		#data from rows
        firstname = str(row[0])
        lastname = str(row[1])

		#print it
        print "The first name is " + firstname
        print "The last name is " + lastname
{% endcodeblock %}

Pretty simple huh? The for loop iterates through the data and produces an array, in this case it's "row". You then select the index of that row to get the data from it. 

When you run it you should see this output: 

<pre>
The first name is Cookie
The last name is Monster
The first name is Guy
The last name is Smiley
The first name is Big
The last name is Bird
The first name is Oscar
The last name is Grouch
The first name is Alastair
The last name is Cookie
</pre>

This is just a straight dump of the database. Let's clean it up little. 


{% codeblock lang:python %}
# loop to iterate
for row in cur.fetchall() :
		#data from rows
        firstname = str(row[0])
        lastname = str(row[1])

		#print i
        print "This Person's name is " + firstname + " " + lastname 

{% endcodeblock %}

This obviously is a cleaned up version of the same thing. Just remember, for iterates but the cursor is the important part. 

Your output will look like this: 

<pre>
This Person's name is Cookie Monster
This Person's name is Guy Smiley
This Person's name is Big Bird
This Person's name is Oscar Grouch
This Person's name is Alastair Cookie
</pre>

You can also simply print out the row and look at the raw data:

{% codeblock lang:python %}
# loop to iterate
for row in cur.fetchall() :
	print row
{% endcodeblock %}

Your output will look something like this: 

<pre>
('Cookie', 'Monster')
('Guy', 'Smiley')
('Big', 'Bird')
('Oscar', 'Grouch')
('Alastair', 'Cookie')
</pre>

This allows you to look at the data structure to determine what you want to grab. 

### Closing it all up

One quick way to bring down a server is leaving your connections open. Since there are persistent connections, when you end your script that doesn't mean the database session ends with it, generally it does not. So here is how you close it up:

{% codeblock lang:python %}
# close the cursor
cur.close()

# close the connection
db.close ()
{% endcodeblock %}

Notice how we call the close() method for both objects. closing them. You are actually closing two things: the cursor and the connection. It's actually a good thing you have to do them separate, as opposed to one function. There may be a need to close 
a cursor yet leave the connection open. This is why we do it in two steps. 

### The full script

Here is the full code for this article, in case you are one of those people who skip down to the code, then download it and play around. 

{% codeblock lang:python %}

#!/usr/bin/python
# datademo.py 
# a simple script to pull some data from MySQL

import MySQLdb

db = MySQLdb.connect(host="localhost", user="root", passwd="", db="test")

#create a cursor for the select
cur = db.cursor()

#execute an sql query
cur.execute("SELECT firstname,lastname FROM test.name")

##Iterate 
for row in cur.fetchall() :
		#data from rows
        firstname = str(row[0])
        lastname = str(row[1])

		#print 
        print "This Person's name is " + firstname + " " + lastname 

# close the cursor
cur.close()

# close the connection
db.close ()

{% endcodeblock %}

There it is, easy as that! In the next article I'll be diving in a little deeper and we'll build some tests to demonstrate the MySQL usage. 

Good luck! 





















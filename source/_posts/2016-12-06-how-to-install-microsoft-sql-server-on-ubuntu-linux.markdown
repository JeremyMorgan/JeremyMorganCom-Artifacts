---
layout: post
title: "How To Install Microsoft SQL Server on Ubuntu Linux in 5 Minutes"
date: 2016-12-06 21:13
updated: 2018-03-25 12:22
comments: true
categories:
- Linux
- Tutorials
- DotNet

author: Jeremy Morgan
sharing: true
description: This is how you can install Microsoft SQL server in Ubuntu Linux.. in about 5 minutes! Easy process. 

ogimage: https://www.jeremymorgan.com/images/sql-server-linux/how-to-install-sql-server-linux-og.jpg
permalink: /tutorials/linux/how-to-install-microsoft-sql-server-ubuntu-linux/

---

I must admit I was surprised when I learned that Microsoft SQL Server would be availble in Linux. They've been pushing the open source initiative hard, but I didn't expect something this big. Oh yeah, Visual Studio is now available for Mac as well. I just saw a pig flying by. 

While MS-SQL is not open source they have made it available to run on open source platforms such as Linux and OSX, which I can imagine took a ton of work. So I decided to take advantage of this new option and try it out. It works great! It took 5 minutes to install. Here's how you can do it too. Note that you will need a server with 3.5 gigs of RAM for this. 
<!-- more --> 
The first thing I always do on an Ubuntu machine is update it

```
sudo apt-get update
sudo apt-get upgrade
```

Next we need to import the public repository GPG keys

```
curl https://packages.microsoft.com/keys/microsoft.asc | sudo apt-key add -
curl https://packages.microsoft.com/config/ubuntu/16.04/mssql-server.list | sudo tee /etc/apt/sources.list.d/mssql-server.list
```

Next we'll install SQL Server. 

```
sudo apt-get update
sudo apt-get install -y mssql-server
```

{%img /images/sql-server-linux/how-to-install-sql-server-linux-1.jpg "How to Install SQL Server in Linux" %}


Now we need to run a configuration script to set up the server:

```
sudo /opt/mssql/bin/sqlservr-setup
````
It will ask if you want to start the service and if you'd like to start it on boot. 

Here's how you can check if the service is running:

```
systemctl status mssql-server
```

{%img /images/sql-server-linux/how-to-install-sql-server-linux-2.jpg "How to Install SQL Server in Linux" %}

###Install the MSSQL Tools for Linux

To test this out a little, install the MSSQL tools on Ubuntu. 

Add in a new repository:

```
curl https://packages.microsoft.com/config/ubuntu/16.04/prod.list | sudo tee /etc/apt/sources.list.d/msprod.list

sudo apt-get update 
sudo apt-get install mssql-tools
```

Now, Let's try to connect! 

```
sqlcmd -S localhost -U SA -P '<YourPassword>'
```

You can run this command to view all your databases:

```
SELECT Name from sys.Databases;
GO
```

{%img /images/sql-server-linux/how-to-install-sql-server-linux-3.jpg "How to Install SQL Server in Linux" %}

This should look pretty familiar to you if you've worked with SQL in the past. 

```
CREATE DATABASE acmewidgets;
GO
```

Now we need to select that database:

```
USE acmewidgets;
GO
```

As a test. let's create a customer table

```
CREATE TABLE customer (id INT, firstname NVARCHAR(50), lastname NVARCHAR(50));
GO
```

Now, let's put some customers in there:

```
INSERT INTO customer VALUES (1, 'Lloyd', 'Christmas');
INSERT INTO customer VALUES (2, 'Harry', 'Dunn');
INSERT INTO customer VALUES (3, 'Mary', 'Swanson');
GO
```

Now, let's take a look at those customers:

```
SELECT * FROM customer
GO
```

{%img /images/sql-server-linux/how-to-install-sql-server-linux-4.jpg "How to Install SQL Server in Linux" %}

And it's that easy! You can run SQL scripts here, or connect to it from SSMS, a traditional ASP site, or a .Net Core site/app. I'll be doing a lot of ASP.Net core work in the coming months, so be sure to check back here.

To quit from SQL server, type in 

```
QUIT
```

And you're done!

I'll be messing with this some more in the coming weeks and really putting it to the test, and I'll share my results. 

-Jeremy

I also did a YouTube tutorial for this article:

<iframe width="560" height="315" src="https://www.youtube.com/embed/OqsOdUNsO4g" frameborder="0" allowfullscreen></iframe>

<br />
<br />
{% include custom/asides/programming-footer.html %}
<br />
---
layout: post
title: "How to install Magento on Windows Azure"
date: 2013-10-19 13:15
comments: true
author: Jeremy Morgan
categories:
- Tutorials
permalink: /tutorials/windows-azure/how-to-install-magento-windows-azure/
description: Today I'm going to show you how to set up Magento with Ubuntu 13.04 on Windows Azure. Scalability and performance are always a concern with Magento, and one way you can rectify that is to throw some more server power at it. Windows Azure is great for this purpose.

ogimage: https://www.jeremymorgan.com/images/windows-azure-og.jpg

---

Today I'm going to show you how to set up Magento with Ubuntu 13.04 on Windows Azure. Scalability and performance are always a concern with Magento, and one way you can rectify that is to throw some more server power at it. Windows Azure is great for this purpose. 
<!-- more -->
###Why Azure?   
While traditionally used for Microsoft Development, Linux Virtual Machines are available on Azure. One of the biggest complaints about Magento is speed and Azure handles it quite nicely. When Magento sites start getting a lot of products and / or traffic they tend to slow, with Azure you can easily scale up and load balance across many machines to solve that problem.

You can also split up application and the database servers and scale more VMs for each until you get the performance you're looking for. It's always good to have room to grow in an easy and affordable fashion.


###Getting Started

First, you'll need to create a virtual machine on Windows Azure. This is pretty easy. 

From the Windows Azure Portal, 

- Select "Virtual Machines" from the button on the left hand side. 
- Click "Create a virtual Machine"
- Select Compute -> Virtual Machine -> Quick Create
- Select "Ubuntu Server 13.04"
- Create a name for your service, and enter a password
  
{% img center https://www.jeremymorgan.com/images/windows-azure-magento-1.jpg Install Windows Azure on Magento %}

After your machine is created, select the arrow next to the name to access the Quick Start page. 

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-2.jpg Install Windows Azure on Magento %}

- Select "Endpoints"
- Select "Add standalone endpoint"
- Select "Name: http"
- Save changes (check mark)

This will create a http endpoint so you can access the web. It should now show the http endpoint in addition to the ssh endpoint, which we'll use in a minute. 

###Connect to your Virtual Machine

Now we'll want to connect to your virtual machine through ssh. If you're using Linux or a Mac, it's already installed, if you're using Windows I recommend Putty for this purpose. 

{% codeblock lang:console %}
ssh azureuser@[ your cloudapp url ]
{% endcodeblock %}

Let's get started!   

####Step 1: Add MariaDB Repositories

We need to enter a few commands here to add the MariaDB repository. MariaDB is the database we're going to use for Magento, it's a drop in place swap for MySQL that's better and more secure, so that's what we'll use. Magento will never know the difference. 

{% codeblock lang:console %}
sudo apt-get install software-properties-common
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
sudo add-apt-repository 'deb http://ftp.osuosl.org/pub/mariadb/repo/5.5/ubuntu raring main'
sudo apt-get update
{% endcodeblock %}

####Step 2: Install the Web Server

We're going to install Apache with PHP 5 to support Magento on this machine, as well as MySQL connectors, and the maria Database server with the following commands:  
  
{% codeblock lang:console %}
sudo apt-get install apache2
sudo apt-get install php5 libapache2-mod-php5
sudo apt-get install php5-mysql
sudo apt-get install mariadb-server
sudo apt-get install php5-mysql php5-curl php5-mcrypt php5-gd php5-common php-apc
{% endcodeblock %}
  
During the install you will see the following screen asking for a root password.
{% img center https://www.jeremymorgan.com/images/windows-azure-magento-3.jpg Install Windows Azure on Magento %}

Set this password and keep a note of it, we'll be using it very shortly. 

####Step 3: Install Magento

For this you'll need to download the Magento tarball here and put it on your server, or you can use the wget command below. I'm currently hosting the 1.8.0.0 version. 

{% codeblock lang:console %}
cd /var/www
sudo wget http://www.jeremymorgan.com/hosted/magento-1.8.0.0.tar.gz 
sudo tar -zxvf magento-1.8.0.0.tar.gz 
sudo mv magento/* magento/.htaccess .
{% endcodeblock %}

Now we'll need to set the permissions so Magento can write the files it needs to:

{% codeblock lang:console %}
sudo chmod -R o+w media var
sudo chmod o+w app/etc
{% endcodeblock %}

You're set! now let's create the database.

####Step 4: Create the Database

Now we want to create a MariaDB database for this. First, since we just installed this database we want to run a quick script that will make it more secure. Run the following script and answer yes to all the questions:

{% codeblock lang:console %}
sudo mysql_secure_installation
{% endcodeblock %}

Now we need to create our tables and a user for Magento. 

{% codeblock lang:console %}
mysql -u root -p
{% endcodeblock %}

Once logged in, you'll want to create the database, and a user:

{% codeblock lang:console %}
CREATE DATABASE magento;
CREATE USER magentouser IDENTIFIED BY '(enter a password here)'
{% endcodeblock %}

Now we want to assign that user to the database and give it the proper permissions:  

{% codeblock lang:console %}
GRANT SELECT, INSERT, CREATE, ALTER, UPDATE, DELETE, LOCK TABLES on magento.* to magentouser;
{% endcodeblock %}

now type in "quit" to exit MariaDb.

####Step 5: Final Server Configuration

We want to enable search engine friendly URLs in our install, so run the following command to install mod_rewrite for Apache:

{% codeblock lang:console %}
sudo a2enmod rewrite
{% endcodeblock %}

Now, we need to open up this file to enable it:

{% codeblock lang:console %}
sudo nano /etc/apache2/sites-available/default
{% endcodeblock %}

Change "AllowOverride None" to "AllowOverride All" so it looks like this:

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-4.jpg Install Windows Azure on Magento %}
  
Save the file and quit.   
  
Now restart the server:

{% codeblock lang:console %}
sudo service apache2 restart
{% endcodeblock %}

Load it up in a web browser and let's get this configured! 

####Step 6: Set up Magento

Now we have Magento all set up and ready to go. Load up the url (whatever name you chose) in web browser and start the installation. 

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-5.jpg Install Windows Azure on Magento %}

Click I agree on the first screen, and continue on the next. 

On the next screen, enter your database name, user name and user password in the Database Connection box. You created these earlier on the MariaDB setup. 

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-6.jpg Install Windows Azure on Magento %}

in the web access options, make sure "Use Web Server (Apache) Rewrites" is checked

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-7.jpg Install Windows Azure on Magento %}

Click Continue.

You will now set up your admin information:

{% img center https://www.jeremymorgan.com/images/windows-azure-magento-8.jpg Install Windows Azure on Magento %}

Click Continue and you're done!  
  
You can now log into to your admin panel (yourname.cloudapp.net/admin) and get started!  
  
###Summary
 
I hope this helps to get your Magento site up and running on Windows Azure. With the load balancing and scaling capabilities this could be an awesome solution for your e-commerce site. Traditionally expansion has been tough and expensive for small and medium businesses who run software like this, but Windows Azure and other cloud based solutions are making it easier and cheaper to expand.   
  
If you're looking for a durable and scalable solution for your e-commerce needs I would recommend trying this approach. 

{% include custom/asides/tutorials-footer.html %}






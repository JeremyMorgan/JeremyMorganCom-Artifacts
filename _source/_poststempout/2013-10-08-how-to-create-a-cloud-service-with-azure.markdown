---
layout: post
title: "How to Create a Cloud Service with Windows Azure"
date: 2013-10-08 17:31
comments: true
author: Jeremy Morgan
categories: 
- Tutorials
description: Today I'm going to show you how I created a cloud service with Microsoft Windows Azure. It's pretty easy, and the tools are great to work with. If you want to create a scaleable cloud service with Azure, check this out.
permalink: /tutorials/windows-azure/how-to-create-a-cloud-service-with-azure/
ogimage: https://www.jeremymorgan.com/images/windows-azure-og.jpg

---

Today I'm going to show you how I created a cloud service with Microsoft Windows Azure. It's pretty easy, and the tools are great to work with. I am putting the code up on [GitHub](https://github.com/JeremyMorgan/ipcountrycode) if you want to extend or experiment with it.

<!-- more --> 
###About this tutorial

For this tutorial we'll be building a web service that is an API that returns country codes for a given IP. It takes the IP in string format and returns a JSON object with country codes in it. This can also be run as a regular ASP.Net website as well. 

This web service will:

Take an IP address and turn it into an Integer
Search through integer ranges in a database
find the corresponding country code for that range
return the country code and name in JSON format.

This service is meant as an exercise, but could actually be a useful service if you want to tailor your website content to different countries. 

###What you'll need

For this tutorial I'm using Visual Studio 2012 and a Windows Azure account. If you haven't already you can sign up for a free trial of Windows Azure, and check out what they have to offer. 

For interfacing with Azure, you'll need to get the Windows Azure SDK:

- [SDK For Visual Studio 2013 Preview / RC](http://http://go.microsoft.com/fwlink/p/?linkid=313927&clcid=0x409)
- [SDK For Visual Studio 2012](http://http://go.microsoft.com/fwlink/?linkid=254364&clcid=0x409)
- [SDK For Visual Studio 2010](http://go.microsoft.com/fwlink/?linkid=254269&clcid=0x409)

Remember in order to run the Azure emulator you will need to run Visual Studio in Administrator Mode. 

###Get Started - Create your Cloud Service

Log in to your Windows Azure portal, and there you'll see a list of options. Click on the "Cloud Services Option"

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-1.jpg)

Click "Create a cloud service".

You will see a screen that looks like this:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-2.jpg) 

You can use the quick create, choose your URL and subscription. If you're using the free trial it will show up here, select that and click "create a cloud service". 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-3.jpg)

Now you should see your service listed under whatever you named it. Click the arrow next to the name to see the welcome page for that service. 

###Create your Database Back End

For this project we'll need to create a database backend for our IP addresses and how they'll relate to country codes. Your project may not even need a database but if you'd like to build this project you'll have to pay special attention to this part as it's a little different than a standard MS-SQL database. 

on "SQL Databases" in the menu on the left hand side. 

Click "Create a SQL Database"

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-4.jpg)

Here, when you create a new database, you'll need to name it. Select "1GB" as the database size, you won't need much. 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-5.jpg)

Here is where you'll create your database credentials. 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-6.jpg)

Make sure "Allow Windows Azure Services to Access the Server" is checked. Keep a note of your authentication info because you'll need it later. 

You will now see your SQL Server listed amongst your SQL databases. 

You can now connect to this database with [Microsoft SQL Server Management Studio](http://http://msdn.microsoft.com/en-us/data/tools.aspx). 

###Connect to your SQL Server

In order to connect to your server, you will need to change the firewall rules to allow access. Look for this link:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-7.jpg)

Setting up is really easy, it will pop up the following message:

> The current IP address xx.xxx.xxx.xxx is not included in existing firewall rules. Do you want to update the firewall rules?

Select Yes. On the welcome page, you'll see some info you'll need to connect:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-8.jpg)

Copy this information for SQL Server Management Studio, which we'll open next. 

###Open Microsoft SQL Server Management Studio

You will now connect to the server you just created, it isn't much different from any other SQL server: 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-9.jpg)

Replace [SERVERNAME] with the name of your database server, and make sure to put username@[SERVERNAME] as your login. Connect to the server. 

Now open up a new query window, and copy in the SQL found from [this file](https://github.com/JeremyMorgan/ipcountrycode/blob/master/SQL/createdb.sql) which will create our database. 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-10.jpg)

I won't go into a lot of details just yet, but this is what will be required for our iplookup function, as it will turn an IP into an integer and look it up via this table. 

###Import data into our table

Now we need to import the iplookup data into our table. I have created a .CSV for this purpose here. 

[Download the SQL and CSV for this tutorial here](https://github.com/JeremyMorgan/ipcountrycode/tree/master/SQL).

Open up the SQL Server Import and Export Wizard ( [More info here](http://technet.microsoft.com/en-us/library/ms140052.aspx) )

For your data source, select "flat file source" and browse to the .CSV file you just downloaded.

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-11.jpg) 

Select "Advanced"

Make sure the column names match those in the database, and the screen should look like this:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-12.jpg) 

These column names and types are very important, and should be:

- id numeric
- ipStart eight-byte unsigned integer
- ipEnd eight-byte unsigned integer
- CountryCode String (width 4)
- CountryName String (width 50)

Take a look at the preview, it should look like this:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-13.jpg) 

Click Next.

####Select your destination

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-14.jpg) 

Here is where we put the authentication information for the SQL server, which is the same as you used for SQL Server Management Studio. Click Next.


![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-15.jpg)

On the next window you'll see mappings. Click on the "Edit Mappings" Button. Make sure it looks exactly like this:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-16.jpg)

Click Next. You may see some warnings, but it's ok it will go through. Click "run now" and go have an Orange Soda. Depending on your internet connection it could take a while. 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-17.jpg)

Now you should have a database loaded with our IP decimal ranges to country codes. 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-18.jpg)

Now, we're ready to write a service to interface with it!

###Building the Web Service in Visual Studio 2012

By now you should have installed the Microsoft Azure SDK for Visual Studio 2012 and restarted it. Open up Visual Studio and create a new project.

Under Templates, we want to select *Visual C# -> Cloud -> Windows Azure Cloud Service*

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-19.jpg)

In the next screen, select ASP.NET MVC4 Web Role:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-20.jpg)

Then select "Web API"

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-21.jpg)

Click "OK" to create your new project. 

####Change the welcome page

One of the first things I'll do is change the welcome page, so it doesn't have that default web API page. 

Click to MvcWebRole1 -> Views -> Home 

and open Index.cshtml

I just put in the following code, just to keep it simple:

    <h1>IP Country Code Lookup</h1>
    
    
    <p>Usage:</p>
    
    <p>http://ipcountrylookup.cloudapp.net/api/ApiCountryCode/?get&ip=[IP ADDRESS]</p>
    
    <br />
    <br />
    <br />

Save the file.

####Create the Model

We're going to create a model that can access our database. 

Right click on the Models folder, and select *"Add" -> New item*.

Select Data -> ADO.NET Entity Data Model

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-22.jpg)

I've named mine ipcountrylookup.edmx

Now select "Generate from database" and click next.

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-23.jpg)

From this screen, we will want to set up a new connection to your Azure database. Click "New Connection" and enter in your database credentials:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-24.jpg)

Click ok. 

In the next screen, make sure everything looks correct. Also, check the box to save sensitive data in the connection string. Generally for production applications you do not want to do this, but for learning purposes it will speed things up. Save your entity connections in Web.Config as "ipcountryEntities". Click next. 

In the next screen, you'll want to select your table "iptocountry" and click next. You'll see a data model that looks like this:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-25.jpg)

Make sure and build your project after this, so the model shows up in the next dialog boxes. 

###Add your controller

The controller is where it will all come together. 

Right click on the controllers folder, and select Add -> Controller

Make sure the following options are selected: 

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-28.jpg)


Click add. 

Now open up ApiCountryCodeController.cs in the Controllers folder. 

We can delete the other methods here, as this is not going to be a fully RESTful api. Remove the PUT, POST and DELETE methods:


![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-29.jpg)

You can also delete this method, as it will just return a huge array of all the rows:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-30.jpg)


Now you should be left to the single getiptocountry method. Let's work on that. 

###Getiptocountry method

The way this works now, won't really work for what we need. We need a method that will:

- take an IP address as a parameter
- convert that ip address to an integer
- do a lookup in the database to find the proper range
- find the country code for that range
- return the country code

It sounds pretty simple, and it is pretty straightforward. But after playing and experimenting with things I made a few mistakes and came up with a pretty clean method of doing it. We'll build that method now. 

The first thing we need to do is change the input parameter of this function to a string like so:

    public iptocountry Getiptocountry(string ip)

This will make it so we can pass in the IP address as the string. Then, we need to convert that into an integer.

    int intAddress = BitConverter.ToInt32(IPAddress.Parse(ip).GetAddressBytes().Reverse().ToArray(), 0);
    
Now we'll perform our query to get the country code for that IP range by quering our entity:

    iptocountry iptocountry = db.iptocountries.Single(i =i.ipStart <= intAddress && i.ipEnd >= intAddress);

We can keep the last lines the same. So your full method will look like this:


     // GET api/ApiCountryCode/10.0.0.1
    
    public iptocountry Getiptocountry(string ip)
    {
    int intAddress = BitConverter.ToInt32(IPAddress.Parse(ip).GetAddressBytes().Reverse().ToArray(), 0);
    
    iptocountry iptocountry = db.iptocountries.Single(i => i.ipStart <= intAddress && i.ipEnd >= intAddress);
    
    if (iptocountry == null)
    {
    throw new HttpResponseException(Request.CreateResponse(HttpStatusCode.NotFound));
    }
    
    return iptocountry;
    }

Build it, and you're almost ready. 

####Make it output JSON

For the next part, we want to make sure our output is in JSON format. To do that, we'll need to open up Global.asax in the MvcWebRole root, and add the following line below your Bundleconfig registration:
    GlobalConfiguration.Configuration.Formatters.XmlFormatter.SupportedMediaTypes.Clear(); 

The entire method should now look like this:
    
    protected void Application_Start()
    {
    	AreaRegistration.RegisterAllAreas();
    
    	WebApiConfig.Register(GlobalConfiguration.Configuration);
    	FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
    	RouteConfig.RegisterRoutes(RouteTable.Routes);
    	BundleConfig.RegisterBundles(BundleTable.Bundles);
    	GlobalConfiguration.Configuration.Formatters.XmlFormatter.SupportedMediaTypes.Clear(); 
    }


Save the file. 

Now, let's run our application and try it out. Note that you do have to run Visual Studio 2012 as an Administrator to get the Azure Emulator to work properly. 

Now, run the application. Use this for your URL

    http://127.0.0.1:81/api/ApiCountryCode/get?ip=10.0.0.1

You will see output in your browser like this: (Chrome)

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-31.jpg)

Note the JSON output, and what you're looking for are the countryCode and countryName outputs. These are what we'll be looking for when referencing each IP. 

Now, lets publish it to Azure.

###Publish the service to Windows Azure

First, build the solution again, and go to the build menu, and select "Publish to Windows Azure". 

You will see a screen that asks for credentials:

![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-32.jpg)

Click on "sign in to download credentials".

You'll then be directed to download a file, that is your "Publishsettings" file. Save that in your documents, or somewhere you can find it.

Now, on that same window, import your credentials. Choose your subscription and press next. 

If you get a window that says "Create a storage service" put in the name of your application and select a location, then press OK. 

Here you will get the next configuration screen:
![How to create a cloud service with Microsoft Azure](https://www.jeremymorgan.com/images/how-to-cloud-azure-33.jpg)

As you start to develop applications this feature comes in handy. You won't always be deploying straight to production, so Visual Studio gives you the option to place the build in different areas. This is pretty nice. For now we'll drop it into production. 

Click Next, review the options and click "publish".

One of the things you'll notice is the first publish takes a long time. That's because every file and the entire build is pushed up, future builds won't take nearly as long. 

###Summary

I hope this has helped you learn some of the basics of building and deploying a cloud service in Windows Azure. I tried to cover the database creation and data insertion parts, the application creation and deployment. It's a front to back look at what it takes to create a cloud service. 

Why a cloud service? As I said this application could just as easily be put on an ASP.Net website. It barely qualifies as a "web service" but by using this with Azure, scaling is incredibly easy. You can build the application to spawn multiple instances at the start, or scale it from Azure. Meaning if this were a true API service, you could monitor your load, and scale it up as needed, very far. If it were on a standard ASP.Net website you'd have a lot harder time scaling. 

And that's one of the biggest selling points of Azure in the first place is the easy scaling. We live in a world where your application can become the next big thing overnight, and you need to prepare for it. 

###Note

This is not ready to be a production application. If you're serious about building this into a true service, here are some things you should do:

- Optimize the database calls
- sanitize and validate the input (it just takes an open string right now)
- better error checking and handling
- clean up the JSON output to only include country code and/or name
- create a script to interface with it (copy and paste JavaScript is always a good thing)

If you do any of these things, fork the repo on [GitHub](https://github.com/JeremyMorgan/ipcountrycode) or [CodePlex](https://iplookup.codeplex.com/) or contact me and let me know what you've done with it! Enjoy!

{% include custom/asides/tutorials-footer.html %}


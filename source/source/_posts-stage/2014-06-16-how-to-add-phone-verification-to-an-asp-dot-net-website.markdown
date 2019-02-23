---
layout: post
title: "How to add phone verification to an ASP.Net Website"
date: 2014-06-30 14:32
comments: true
categories: 
---
Surely in the last few years you've seen websites that use phone verification as a step to verifying your identity. Google, Facebook and Craigslist are some of the largest that do this in order to not only verify you, but prevent multiple account creation and abuse. With this tutorial I'll show you how to add this powerful option to your website using ASP.Net. 

In this tutorial you'll build a sample application using membership just to show the concepts behind it and what you'll have to build and once you understand it you can implement it into your own existing site. It's actually a very simple and straightforward process and a great way to add an extra layer of security for you and your visitors. 

##Creating the project

For this tutorial I will be using Visual Studio Express 2013 for Web, and we will create an MVC5 application with membership. If you already know how to do this you can skip ahead. 

#### 1. Create an ASP.Net Web Application

Select file -> New Project and select ASP.NET Web Application from the Visual C# / Web Menu:

{% img http://localhost/jeremy/images/phoneverify/how-to-phone-verify-asp-mvc-1.jpg How to add phone verification to an ASP.NET MVC Website" %}

In the next window, make sure MVC is selected, and Authentication is set to **Individual User Accounts** as shown below:


{% img http://localhost/jeremy/images/phoneverify/how-to-phone-verify-asp-mvc-2.jpg How to add phone verification to an ASP.NET MVC Website" %}

Click OK. This will create a boilerplate MVC Membership site, but we're going to make some changes to it. 

#### 2. Connect it to a MS-SQL Database

The next step will be to create a new MS-SQL database and have the authentication details ready. We will use this instead of the built in instance, and I'll show how you how to initialize it. 

Open up your web config and change the connection string to reflect your MS-SQL database:

{% codeblock %}
&lt;add name="DefaultConnection" connectionString="server=localhost;database=databasename;uid=username;password=password;"providerName="System.Data.SqlClient" /&gt;
{% endcodeblock %}

Now, press F5 to run your site. Click on the "Register" link and create an account.

{% img http://localhost/jeremy/images/phoneverify/how-to-phone-verify-asp-mvc-3.jpg How to add phone verification to an ASP.NET MVC Website" %}

This will initialize and create the necessary tables on your SQL Database:

{% img http://localhost/jeremy/images/phoneverify/how-to-phone-verify-asp-mvc-4.jpg How to add phone verification to an ASP.NET MVC Website" %}

These are tables for the ASP.Net identity authentication, which we're going to make some changes to. 

#### 3. Add Some profile information. 

The first thing we'll want to do is enable migrations (more information on Entity Framework Migrations) so we can make these changes and have them end up in our model. 

Open up the package manager console (Tools -> NuGet Package Manager -> Package Manager Console) and type in:

>Enable-Migrations -EnableAutomaticMigrations

You should see the following:

>PM> Enable-Migrations -EnableAutomaticMigrations
>
>Checking if the context targets an existing database...
>
>Code First Migrations enabled for project PhoneVerify.



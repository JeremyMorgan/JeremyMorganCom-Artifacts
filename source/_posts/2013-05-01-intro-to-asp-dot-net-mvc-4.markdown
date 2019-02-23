---
layout: post
title: "Intro to ASP.NET MVC 4"
date: 2013-05-01 19:13
updated: 2018-03-25 12:22
comments: true
description: In this tutorial we'll explore ASP.Net MVC 4 and give you a taste of this awesome new package. 
categories: 
- Tutorials
- DotNet
- Programming
permalink: /tutorials/c-sharp/how-to-asp-mvc/
author: Jeremy Morgan
sharing: true
ogimage: https://www.jeremymorgan.com/images/csharp-ogimage.png
---
{% include custom/asides/dotnet-newsletter-banner.html %}
The ASP.Net MVC 4 framework was introduced in August of last year and it boasts tons of improvements over MVC 3. If you're considering building a large application in .Net, you should consider MVC 4 for your project. Today we're going to take a look at it and build a quick website in MVC 4.
<!-- more -->
###What you'll need

In order to complete this tutorial you will need Visual Studio. I have decided to use Visual Studio Express 2012 for Web to do this tutorial. I made this choice because it's a free download and not everyone can afford the professional version of Visual Studio, but if you're using Visual Studio 2010 or 2012 you can still go along as well. 

####Software needed:

**[Microsoft Visual Studio Express 2012 for Web](http://www.microsoft.com/visualstudio/eng/downloads#d-2012-express "Microsoft Visual Studio Express for Web")** (or a licensed version of Visual Studio 2010/2012)

**[Microsoft Web Matrix 2](http://www.microsoft.com/web/webmatrix/ "Microsoft Web Matrix 2")** - This is a handy little stack to help organize your server and projects for development

[**Microsoft ASP.Net MVC 4**](http://www.asp.net/mvc/mvc4 "Microsoft MVC download") - The package you'll need to install to deploy this on your website. 

Keep in mind all of this is free! The MVC package is also Open Source. It's nice to see Microsoft come around with stuff like this. 


###Let's get set up

One of the things every Visual Studio has been raving about lately is the NuGet package manager, for good reason. It makes setting things up super easy. We want to make sure we have it installed for our project. 

Go to ***Tools -> Extensions and Updates***

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4.jpg)

And make sure the **NuGet Package Manager** is installed:

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-2.jpg)

This will enable you to install stuff into your website easily. They have a lot of great plugins and templates available. 

###Create the Project

Go to the start section and click "New Project" or select it from the File menu. You want make sure to select an ASP.NET MVC 4 Web Application.

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-3.jpg)

On the next screen, select "Internet Application". As you can see there are various options here, feel free to play around with them and see what you come up with.

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-4.jpg)

Now you've created your new MVC application. Let's take a look at it. If you press F5 you'll see it's already assembled into a site. But that doesn't do much yet. 

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-5.jpg)

###The parts of your MVC application.

You'll notice the controller is opened automatically. Let's take a look at it and see what it does:

{% codeblock %}
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";

            return View();
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your app description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
{% endcodeblock %}

As you can see this is the "Home" controller that extends the controller class. Since Home is your default route it will control what's seen on your site root. 

{% codeblock %}
    public ActionResult Index()
    {
        ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
        return View();
    }
{% endcodeblock %}

This is the "Index" method, and it's not too tough to guess it's place. This is what shows up when you hit a root directory. Whatever you put in here gets shown on the page. But let's look a little closer inside the method. 

<pre>
ViewBag.Message = "Modify this template to jump-start your ASP.NET MVC application.";
</pre>

The ViewBag is a wrapper object used to store dynamic data for the ViewData dictionary object. There are some arguments circulating about which one to use, but since Visual Studio stuffs this in, we'll use it. Let's change it to something else:

<pre>
ViewBag.Message = "This is my first MVC Project!";
</pre>

Where does this data go? If you open up /Views/Home/Index.cshtml you'll see where this object is used. 

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-6.jpg)

First, at the top you'll see where the ViewBag.Title property is assigned a value:

{% codeblock %}
@{
    ViewBag.Title = "Home Page";
}
{% endcodeblock %}

This is a part of the Razor engine and it's how you change the title of the page when it loads. You can also change it later. Then further down the page you'll see:

{% codeblock %}
 <h1>@ViewBag.Title.</h1>
 <h2>@ViewBag.Message</h2>
{% endcodeblock %}

As you can see, this is where the ViewBag.Message you changed earlier will go. 

One advantage of this is you can make the text displayed dynamic, pulled from a database, object or other data source without touching the design. You can also use this for localization if needed. The Razor engine is pretty sweet, this is just scratching the surface of it.

###Creating a New Page

By now you've probably figured out that the methods in the controller correlate with pages: Index(), About(), and Contact(). So let's look at creating a new page. We will be creating a page located at "http://(your site url)/Home/Newpage".


**1. Create a new ActionResult Method**

Inside your HomeController, create a new method:

{% codeblock %}
public ActionResult Newpage()
{
    ViewBag.Message = "This is a new page! ";
    return View();
}
{% endcodeblock %}

The home controller is found in /Controllers/HomeController.cs

What is this? The HomeController is the controller for your home directory and each ActionResult is a function of that controller or page. In our case the url would be

Http://www.yoursite.com/home/newpage

Each action must have a view, which we'll create next. 

**2. Create a view page**

A view is simply an HTML page that displays data and interacts with the controller. You create views for pages or parts of pages, such as menus. 

In the /Views/Home/ folder, create a new view by right-clicking on the /Views/Home folder and selecting "New View":

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-7.jpg)

You'll see a dialog box that looks like this:

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-8.jpg)

As you can see, this dialog box has a few options. For the view engine, you can choose Razor or ASPX(C#). Choose Razor for this, and leave the rest of the options open. You can create a strongly typed view that's based of an object, but we'll leave that for another tutorial. Hit add. 

You'll see the page now in your views folder. 

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-9.jpg)

Open up that page, and you'll see the following code:

{% codeblock %}
@{
    ViewBag.Title = "Newpage";
}

<h2>Newpage</h2>
{% endcodeblock %}

Add some html for fun in there. Also, add the following line:

{% codeblock %}
Hi! Today is @DateTime.Now.DayOfWeek 
{% endcodeblock %}

Save the file, and press F5 to run. 

###Your new MVC Page

To load the page you just created, type in

/home/newpage

after the URL. For instance my local URL is http://localhost:59312/home/newpage but yours may vary. You should see something like this:

![How to Program ASP.Net MVC 4](https://www.jeremymorgan.com/images/how-to-mvc-asp-4-10.jpg) 

This is your newly created view! Feel free to experiment with the views and the Razor view engine. The best way to learn is to break it! 

{% include custom/asides/dotnet-newsletter-banner.html %}

##Summary

In this tutorial we built a very basic MVC 4 page in ASP.Net. I hope it gets you excited enough to start really experimenting. The MVC package really does a lot of the work for you, you can actually create whole websites without a lot of code at all. But I do hope you will dig into the code, and get rid of some that atrocious HTML that's generated and fiddle around. 

In a future tutorial I'll cover the Entity Framework and show you how easy it is to add data to your MVC Pages. Sign up for my newsletter and you'll know right when it's posted!
{% include custom/asides/tutorials-footer.html %}

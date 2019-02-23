---
layout: post
title: "Create a self hosted API for Local Development"
date: 2014-05-13 20:20
comments: true
author: Jeremy Morgan
categories: 
- Programming
- DotNet
description: In this tutorial I'll show you how you can build your own self hosted ASP.Net Web API for local development on your machine
permalink: /blog/programming/how-to-create-asp-self-hosted-api/
ogimage: https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-6.png
---
If you've ever worked in an overly restrictive environment, you know you have to come up with some workarounds to get your job done. I worked in such and environment and ran into a problem developing some front end pages to work with an API, but I didn't want to use live data. Here's a solution I came up with and I decided to write it out and explain it in hopes it will help others. 
<!-- more --> 
Tools Needed for this Tutorial (both free of charge):

* <a href="http://www.microsoft.com/en-us/download/details.aspx?id=40787" rel="nofollow" target="_new">Microsoft Visual Studio 2013 Express for Desktop</a>
* <a href="http://www.telerik.com/download/fiddler" rel="nofollow" target="_new">Telerik Fiddler</a>

###Why a self hosted API? 

When you're developing front end stuff its always nice to have a development environment to work against rather than live data, as I explain in [smell it before you eat it.](http://www.jeremymorgan.com/blog/programming/smell-it-before-you-eat-it/) But what if a development environment isn't available? What if you can't install IIS on your machine either? In that case you make a self hosted API to send fake calls to, and try to replicate the behavior. 

You don't need anything other than Visual Studio to do this, and it gives you a good starting point, and since everything is stored in memory you don't have to worry about breaking anything important. There are some other cool uses for a self hosted API but today we'll focus on using it to test your JavaScript front end stuff. 

For this tutorial I'm going to assume you already know all about REST and some ASP.Net API basics. 

###Find out what you need. 

First you need to find out which API functions you'll need and map them out, because you're going to have replicate them here, on a small scale. For the demo, we're going to make something that stores a listing of books. 


> /API/Book


We want to be able to have some basic CRUD methods for it, so let's set it up. For this you will need a copy of Visual Studio Professional, or Express 2013 for Windows Desktop. That's what I'll use for this demo. 

###1. Create the Project

Select File -> New Project 

Choose "Console Application"

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-1.jpg How to build self hosted Web API in ASP.Net" %}

Right click on your project and select "Manage NuGet Packages"

Search the Online Packages for "Microsoft ASP.Net Web API Self Host" and install the assemblies. 

###2. Set up the executable

Next we'll want to add configuration data, so in Program.cs add the following using statements:

{% codeblock lang:c %}

using System.Web.Http;
using System.Web.Http.SelfHost;

{% endcodeblock %}

And then inside in the static void Main() function add:

{% codeblock lang:c %}

var config = new HttpSelfHostConfiguration("http://localhost:31337");

{% endcodeblock %}

Note that the port can be anything you want it to be. 

Now create an instance of the HttpSelfHostServer passing in your config object as the parameter: 

{% codeblock lang:c %}

var server = new HttpSelfHostServer(config);

{% endcodeblock %}

Now create a task that calls the OpenAsync method and set the task to Wait:

{% codeblock lang:c %}

var task = server.OpenAsync();
task.Wait();

{% endcodeblock %}

Next, we'll want to output something to console to let you know it's started, and put a Console.ReadLine in there to make sure it stays open until you want it to quit. 

{% codeblock lang:c %}

Console.WriteLine("Server Up");
Console.ReadLine();

{% endcodeblock %}

> **Note:** At this time you can have a running service, but you must be running Visual Studio as an administrator. Now, if you're in a restricted environment like I was you can't do that, so you just have to code it with blind faith that it will work. You can run the finished product once it's done, but if you are allowed to run as admin you can debug and test better. 

###3. Set up routing

Ok, so much of this doesn't do you a lot of good until you can route your requests. 

Open up the package manager again (*Right click on your project and select "Manage NuGet Packages"*)
and search for "**Attribute Routing Self-Hosted**". Install the AttributeRouting(Self-Hosted Web API) package.

Now, open up Program.cs and add the following: 

{% codeblock lang:c %}

config.Routes.MapHttpRoute("Default", "api/{controller}/{id}", new { id = RouteParameter.Optional });

{% endcodeblock %}

This will handle the routing for your application. 

###4. Create a Model

In this tutorial we're going to create a storage space for some books. Create a class that looks like this:

{% codeblock lang:c %}

    public class Book
    {
        public int Id { get; set; }
        public string Title { get; set; }
        public string Author { get; set; }
        public decimal Price { get; set; }
    }

{% endcodeblock %}

This will obviously store some simple attributes for our books. 


###5. Create a Controller

Let's create a class called BookController that extends the ApiController:

{% codeblock lang:c %}

public class BookController : ApiController

{% endcodeblock %}

In that class we'll want to create a few demo books every time it starts. We do this by creating a List of type book, and adding a few instances into it to start out:

{% codeblock lang:c %}

static List<Book> ourbooks = InitBooks();

private static List<Book> InitBooks()
{
    var booklist = new List<Book>();

    booklist.Add(new Book { Id = 1, Title = "Microsoft Visual C# 2012", Author = "John Sharp", Price = 29.99M });
    booklist.Add(new Book { Id = 2, Title = "C# 5.0 in a nutshell", Author = "Joseph Albahari", Price = 19.99M }); 
    booklist.Add(new Book { Id = 3, Title = "C# in Depth, 3rd Edition", Author = "Jon Skeet", Price = 29.99M });
    booklist.Add(new Book { Id = 4, Title = "Pro ASP.NET MVC 5", Author = "Adam Freeman", Price = 34.01M });

    return booklist;
}

{% endcodeblock %}

Next, we'll want to create a method to retrieve all books:

{% codeblock lang:c %}

  public IEnumerable<Book> Get()
	{
		return ourbooks;
	}

{% endcodeblock %}

This will return all the books in our list. Let's open up fiddler and see what that looks like:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-2.png How to build self hosted Web API in ASP.Net" %}

So as you can see, a list of our items is returned with a GET request. This may be all you need, but if you need REST services, continue on. 


###6. Setting up REST actions

in our BookController, you'll want to add a few more methods to add update and delete items. 

#####Retrieve a book by ID (GET)
Let's make it so we can select a book by it's Id. Add a method to the controller that looks like this:

{% codeblock lang:c %}

  public Book Get(int Id)
        {

            var result = (from b in ourbooks
                          where b.Id == Id
                          select b).FirstOrDefault();

            if (result == null)
            {
                var resp = new HttpResponseMessage(HttpStatusCode.NotFound)
                {
                    Content = new StringContent(string.Format("No book with ID = {0}", Id)),
                    ReasonPhrase = "Book ID Not Found"
                };
                throw new HttpResponseException(resp);
            }

            return result;
        }

{% endcodeblock %}

This overrides the Get method, so if you pass it an Id, it will return some details for that book. As you can see if it does not find an ID it returns a 404 error, with a custom response. 

####Add a new book (POST)

To add a new book, we want to create a method that takes a POST command, and gets the JSON object from the body of the request. To that, add the following method:

{% codeblock lang:c %}

public void Post([FromBody]Book b)
{
	b.Id = ourbooks.Count + 1;
	ourbooks.Add(b);
    var resp = new HttpResponseMessage(HttpStatusCode.Created);           
    throw new HttpResponseException(resp);
}

{% endcodeblock %}

In order to add a new item to our list, we'll need to change the request in Fiddler to a POST, and set the Content-Type:

> Content-Type: application/json

And we'll need to send it a JSON object, like this:

{% codeblock lang:c %}

{"Id": 0, "Title":"One More Book!","Author":"Jeremy Morgan","Price":1.99}

{% endcodeblock %}

Your composer should look like this:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-3.png How to build self hosted Web API in ASP.Net" %}

Once you submit, run another GET request, and you'll see the new object:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-4.png How to build self hosted Web API in ASP.Net" %}

It's that easy! The next are even easier.

####Update a book (PUT)

In this method we're going to update a book using the PUT command. 

Add the following method to your controller:

{% codeblock lang:c %}

public void Put(int Id, [FromBody]Book book)
{
    var result = (from b in ourbooks
                    where b.Id == Id
                    select b).FirstOrDefault();
            
    result.Title = book.Title;
    result.Author = book.Author;
    result.Price = book.Price;
    var resp = new HttpResponseMessage(HttpStatusCode.Accepted);
    throw new HttpResponseException(resp);
}

{% endcodeblock %}

Now, if you run a GET in Fiddler, you should see a set of results as they are set by default:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-5.png How to build self hosted Web API in ASP.Net" %}

Since it's a new instance the one we added will not be there. 

In Fiddler (or whatever program you're using) change the request to a PUT, and add an ID at the end (for the record you want to change). Then set the Content-Type to application/json and send the JSON string we used earlier. It should look like this:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-6.png How to build self hosted Web API in ASP.Net" %}

Once you send the put request, now send a GET and you'll see the updated information: 

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-7.png How to build self hosted Web API in ASP.Net" %}


####Remove a book (DELETE)

This one is really easy:

{% codeblock lang:c %}

public void Delete(int Id)
{
    var result = (from b in ourbooks
                    where b.Id == Id
                    select b).FirstOrDefault();

    ourbooks.Remove(result);
    var resp = new HttpResponseMessage(HttpStatusCode.OK);
    throw new HttpResponseException(resp);
}

{% endcodeblock %}

Now, just set fiddler to delete an id and send it:

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-8.png How to build self hosted Web API in ASP.Net" %}

And it's deleted!


###7. Build and use it! 

So now that your application is ready, you can build and executable and use it for development. 

Just build it, then look in your /bin/release folder and run it from there!

{%img center https://www.jeremymorgan.com/images/how-to-self-host-asp-web-api-9.jpg How to build self hosted Web API in ASP.Net" %}

Whenever it's running you can connect to it like a standard web service.


###So what's the point of all this?

After reading this it might seem like a lot of work, but after you've done it a few times it's really quick to whip it up. You might be asking, what's the point? 

The best use of this is to test the functionality of your application on a sample set of data. You can use this with a plain HTML/JavaScript page, asp page, or even another application. It's a good way to test and develop your apps without using live data, or even accessing a live database.

Since you control what data is seeded in, you can write better unit tests for it knowing exactly what to expect. Since it's only stored in memory, it's really fast and resets as soon as you restart the executable. This can drastically speed up the development time and create better test cases. 

Let me know if you use this, the <a href="https://github.com/JeremyMorgan/ASP-Self-Hosted-API" target="_new">code is on GitHub</a> feel free to fork it and expand on it! 

{% include custom/asides/programming-footer.html %}
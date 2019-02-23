---
layout: post
title: "Unit Testing with dotnet core"
date: 2018-03-29 23:48
updated: 2018-03-29 23:48
comments: true
categories:
- CSharp
- Tutorials

permalink: /tutorials/c-sharp/how-to-net-core-unit-test/
author: Jeremy Morgan
sharing: true
ogimage: https://www.jeremymorgan.com/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-og.jpg
---

So you've just started building .Net Core applications and really starting to gain some traction. You quickly learn how mature and thorough the .Net Core framework is becoming and think "I need to start writing some unit tests for this!". As it turns out, it's super easy and very intuitive, especially for C# developers.

<!-- more -->

> Note: I cover this topic and many others in my course, <a href="https://www.udemy.com/hands-on-asp-net-core-2/?couponCode=JMDOTCOMTUTORIAL" target="_blank">**Hands on .Net Core**</a> at Udemy. Check it out! 

So let's walk through building Unit Tests for .Net core apps.



## Let's Build a Class Library

For this tutorial we'll build a simple class library called "string modifier". As the name suggests, it will be used to modify strings. We'll use the .NET Core CLI to create a new class library. 

```
dotnet new classlib -o stringModifier 
```

You should see something that looks like this: 

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-01.jpg" alt="How to Unit Testing .Net Core" />

This uses the dotnet CLI to create a new class library in the folder named stringModifier. It creates an application that is essentially just a basic class. We're going to name this something a bit more useful though. 

rename your class to ChangeMyString. It should look like this:

{% codeblock lang:c %}
using System;

namespace stringModifier
{
    public class ChangeMyString
    {
    }
}
{% endcodeblock %}


We're going to create a library that modifies strings for us, so let's add a couple methods to our string modifier library. 

{% codeblock lang:c %}
public static string makeAllUppercase(string inputString){
    return inputString.ToUpper();
}
{% endcodeblock %}

This method will make any string you send it all uppercase. 

The next method will reverse a string: 

{% codeblock lang:c %}
public static string makeReverse(string inputString){
    char[] arr = inputString.ToCharArray();
    Array.Reverse(arr);
    return new string(arr);
} 
{% endcodeblock %}

Now these are obviously for demo purposes and easy to see what they do, but let's do a quick smoke test with them. 

Let's make sure the application builds. Run the following in the folder your project is located in:

```
dotnet build
```
It should look like this:

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-02.jpg" alt="How to Unit Testing .Net Core" />

And we can go into our BIN folder and verify the artifacts were generated:

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-03.jpg" alt="How to Unit Testing .Net Core" />

Now you're ready to go. 

## Smoke Test

Let's build a quick console application that calls the class library just to do a quick visual test of functionality. Exit out of the project folder, and we want to use the dotnet CLI to create a runner for this. 

```
dotnet new console - smrunner
```

This will create a simple "hello world" application for us. Open up Project.cs and add the following using:

```
using stringModifier;
```

then add the following into the Main method:

{% codeblock lang:c %}
Console.WriteLine("Hello World!");
Console.WriteLine(ChangeMyString.makeAllUppercase("Hello World!"));
Console.WriteLine(ChangeMyString.makeReverse("Hello World!"));
{% endcodeblock %}

The entire method should look this:

{% codeblock lang:c %}
using System;
using stringModifier;

namespace smrunner
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.WriteLine("Hello World!");
            Console.WriteLine(ChangeMyString.makeAllUppercase("Hello World!"));
            Console.WriteLine(ChangeMyString.makeReverse("Hello World!"));
        }
    }
}
{% endcodeblock %}

Now, back at the command line, let's add a reference to our class library:

```
dotnet add reference "../stringModifer/stringModifier.csproj"
```

This will add the reference to the class library automatically. You could also manually put in the following in the .csproj file:

```
<ItemGroup>
    <ProjectReference Include="..\stringModifier\stringModifier.csproj" />
</ItemGroup>
```
Either way is fine. Now we're ready to run it:

```
dotnet run
```

You should see something that looks like this:

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-04.jpg" alt="How to Unit Testing .Net Core" />

Now we can verify that the methods work as we expect them to. But we'll add some unit tests to be sure. 

> Remember: Unit tests are not just to check the individual functionality of a method. They also check the functionality does not change when other parts of the application change. This is part of what makes them so important.

## Building the Unit Tests

Let's build a separate project for the unit tests. This is the project you'll run after a build, or preferably automatically on a build server every time you deploy. 

Exit out of the directory you were just in and let's use the dotnet CLI to create yet another project. This will be an MSTEST Unit Test project. 

```
dotnet new mstest -o libraryTester
```

This creates a unit test project in the libraryTester directory. Now we open up UnitTest1.cs, and this should look really familiar to you if you've built unit tests before. This looks identical to tests in conventional .Net. 

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-05.jpg" alt="How to Unit Testing .Net Core" />

So let's add a couple tests. 

First we need to add a using statement to include the library. 

```
using stringModifier;
```

The first tests we want to run are to make sure the test method returns a string. Now we know the return type of these methods, but we want to make a test to catch it if everyone ever changes that: 


{% codeblock lang:c %}
[TestMethod]
public void TestMUCReturnsString()
{
    string sample = "Test String";
    Assert.IsInstanceOfType(ChangeMyString.makeAllUppercase(sample), typeof(string));
}

[TestMethod]
public void TestMRReturnsString()
{
    string sample = "Test String";
    Assert.IsInstanceOfType(ChangeMyString.makeReverse(sample), typeof(string));
}
{% endcodeblock %}

Next we want to test the actual functionality of the methods. So we have a couple test cases here to do that. 

{% codeblock lang:c %}
[TestMethod]
public void TestMakeAllUppercase()
{
    string sample = "Test String";
    Assert.AreEqual(ChangeMyString.makeAllUppercase(sample), "TEST STRING");
}

[TestMethod]
public void TestMakeReverse()
{
    string sample = "Test String";
    Assert.AreEqual(ChangeMyString.makeReverse(sample), "gnirtS tseT");
}
{% endcodeblock %}

Now what we are doing here is asserting what we expect the method to return, and then inserting test string in the method to see if it matches what we expect.

This is what the final file should look like: 

{% codeblock lang:c %}

using Microsoft.VisualStudio.TestTools.UnitTesting;
using stringModifier;
namespace libraryTester
{
    [TestClass]
    public class UnitTest1
    {
        [TestMethod]
        public void TestMUCReturnsString()
        {
            string sample = "Test String";
            Assert.IsInstanceOfType(ChangeMyString.makeAllUppercase(sample), typeof(string));
        }

        [TestMethod]
        public void TestMRReturnsString()
        {
            string sample = "Test String";
            Assert.IsInstanceOfType(ChangeMyString.makeReverse(sample), typeof(string));

        }
        
        [TestMethod]
        public void TestMakeAllUppercase()
        {
            string sample = "Test String";
            Assert.AreEqual(ChangeMyString.makeAllUppercase(sample), "TEST STRING");
        }

        [TestMethod]
        public void TestMakeReverse()
        {
            string sample = "Test String";
            Assert.AreEqual(ChangeMyString.makeReverse(sample), "gnirtS tseT");
        }
    }
}

{% endcodeblock %}

These are some pretty basic tests, but should be good for now. Let's try it out. 

Now we're in the library tester folder, and In order to build this, we'll have to add a reference again.

```
dotnet add reference "../stringModifier/stringModifier.csproj"
```

Now let's test the build.

```
dotnet build
```

It looks like we don't have any failures here so we should be good to go. 

To run the tests we'll type in 

```
dotnet test
```

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-06.jpg" alt="How to Unit Testing .Net Core" />


And our tests are successful! We can see that 4 tests were run and everything is green.

Now, let's break a test just to see what that looks like. 


Let's go back to our original library. Change this: 

{% codeblock lang:c %}
public static string makeAllUppercase(string inputString){
    return inputString.ToUpper();
}
{% endcodeblock %}		

to this: 

{% codeblock lang:c %}
public static string makeAllUppercase(string inputString){
    return inputString;
}
{% endcodeblock %}


Let's refactor the method to pass through the string instead of making it upper case. Save it and build it. 

```
dotnet build
```

And go back into our library tester folder, and run a test again:

```
dotnet test
```

<img src="/images/how-to-unit-testing-net-core/how-to-unit-testing-net-core-07.jpg" alt="How to Unit Testing .Net Core" />

And now we have a failure. As you can see by the splash of red on the screen it threw an error. It expected test string to be in all caps, and it's not. 

This is a great feature of unit tests, if some yahoo goes in and refactors something and breaks the functionality, your test will pick it up right away. 

This is how easy it is to build unit tests in .NET Core!!


## Conclusion

Unit tests are super important. I'm not going to use this tutorial as a lecture, but they're well worth your time and too frequently overlooked. Just because you're developing .NET Core apps doesn't mean they can't be unit tested, MSTEST seems to work very well with everything I've done with it so far. So do it!!

And as I mentioned I cover this and many other topics in my course, <a href="https://www.udemy.com/hands-on-asp-net-core-2/?couponCode=JMDOTCOMTUTORIAL" target="_blank">**Hands on .NET Core at Udemy**</a>. Click the link to check it out. 














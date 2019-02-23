---
layout: post
title: "Getting Started With AngularJS"
date: 2014-02-17 20:59
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
categories: 
- Tutorials
- AngularJS
description: In this tutorial I'm going to show you how to create a basic AdSense calculator with AngularJS. It's easy, fun and might get you inspired to learn this great framework.
permalink: /tutorials/angularjs/how-to-adsense-calculator-angularjs/
ogimage: https://www.jeremymorgan.com/images/angularjs.jpg

---
Lately I've been playing around a little with AngularJS, and I'm pretty impressed. It's amazing how many time saving features and structure this framework brings to your applications. I decided to build an app to calculate AdSense earnings, and I'll demonstrate it here. 

<!-- more -->
###What the app does

You can check your Google AdSense earnings in realtime, and if you're a stats nut like me, you might just do that. What I wanted to do is see if I can predict my payout of the end of the month based on that day's earnings, and total earnings based on the current trends. So the application will:

- Take your day's amount and see what the total would be if you made that every day

- Take your accumulated amount and determine what you'd make at the current rate. 

The daily amount of course is just multiplied by the days of the month, but the accumulated amount is averaged over how many days are passed. You could easily do this with vanilla JavaScript but AngularJS makes it simpler and better structured. Let's get started!

###What you need
{% img right https://www.jeremymorgan.com/images/angularjs.jpg 250 250 How to build an AdSense calculator in AngularJS %}
This is the easy part. You just need a copy of Angular.Min.Js and an index.html file. You should run them in a web server on your local machine, and you can modify the index with any text editor. 

- [Angular.min.js](http://angularjs.org/)
- [The GitHub for this project](https://github.com/JeremyMorgan/AdSenseCalculator)

Let's get started!

###Initial page setup

We create a standard html webpage like so:

{% codeblock lang:html %}<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <title>Angular Demo</title>
</head>
<body>
</body>
</html>
{% endcodeblock %}

We need to add a few things to make sure this is recognized as an AngularJS application:

{% codeblock lang:html %}<html lang="en" ng-app>{% endcodeblock %}

The ng-app directive tells AngularJS that you want to auto bootstrap that root element as an Angular application. You don't need to make the entire HTML page an application, but in this case we will. 

You will also want to include your script into the page in the footer:

{% codeblock lang:html %}<script src="angular.min.js"></script>{% endcodeblock %}

Now we'll get started with the actual application. 

###Adding the controllers

Add the following to your body tag:

{% codeblock lang:html %}<body ng-controller="TextController">{% endcodeblock %}

This declares that the body element is using the controller "TextController". Controllers are a primary means of functionality in AngularJS. This is the central part of MVC (Model View Controller) pattern that AngularJS uses. 

For display purposes we want to create a placeholder in the title like so:

{% codeblock lang:html %}<h2>{% raw %}{{someText}}{% endraw %}</h2>{% endcodeblock %}

Since AngularJS treats the HTML as a template, this is a simple placeholder you may have seen in other templating systems. Let's change what this says. We will add a controller to the page within script tags using common JavaScript:

{% codeblock lang:html %}<script>
function TextController($scope){
    $scope.someText = "Angular Adsense Calculator";
}
</script>{% endcodeblock %}

One thing you may notice is the parameter we're passing to this function named "$scope". This is our root scope which serves as a global storage area for the application. The line of code in your controller shows that we're declaring the someText property value within the scope. Save and run this page and you'll see that the headline changes. 

Now we'll do some real stuff. 

###Creating the calculator form

Here we're going to create an AngularJS driven form that's going to be used to handle our input values. Add the following:

{% codeblock lang:html %}<form ng-controller="StartupController">
    Today (Actual): <input ng-change="computeDaily()" ng-model="funding.dailycount"><br />
   <br />
   This Month: <input ng-change="computeMonthly()" ng-model="funding.monthcount"><br />
    <br />
    <br />
    <b>Based on Today:</b><br />
    Predicted Payment: {% raw %}{{funding.dailyaftertax | currency:"USD $ "}}{% endraw %} <br />
    <br />
    <b>Based on Month:</b><br />
    Predicted Payment: {% raw %}{{funding.monthlyaftertax | currency:"USD $ "}} {% endraw %}<br />
</form>
{% endcodeblock %}

Some things to note. In the input tags we have ng-change="". This means when the value in this text box changes, it will call the function named inside. In this case, we're going to call the computeDaily() function, and the computeMonthly() function. 

Also, you notice the ng-model="" parameters. These set the funding.dailycount and funding.monthcount inside our scope. Funding. is our model name. 

You will notice we have two template placeholders, and they are also accessing properties in the model, funding.dailyaftertax and funding.monthlyaftertax. These two properties are also added to the funding model, which will create and use below. 

###Creating the calculator controller

As I said earlier, controllers are a crucial function of AngularJS and where most of the work gets done. Here we'll create the StartupController that will do the calculations for us.

{% codeblock lang:html %}
<script>
function StartupController($scope){
    
    var date = new Date().getDate();
        
    $scope.funding = { dailycount: 0, monthcount: 0, dailyaftertax: 0, monthlyaftertax: 0 };
        
    var computeDaily = function() {
        $scope.funding.dailyaftertax = (($scope.funding.dailycount * 28) / 1.33);
    };
    var computeMonthly = function() {
        $scope.funding.monthlyaftertax = ((28 * $scope.funding.monthcount / date) / 1.33);
    };
        
    $scope.$watch('funding.dailycount', computeDaily);
    $scope.$watch('funding.monthcount', computeMonthly);        
}
</script>
{% endcodeblock %}


If you look at this code you'll see a few things going on. For one, we're getting the date of the month from the getDate() function in JavaScript. This is so we know what day of the month it is. 

The next line shows how we set up our funding model. We define these four variables in the model and initialize them to zero. We will set values to these once the form is in use. 

The computeDaily function assigns the dailyaftertax variable a value that takes the dailycount from the input in the form and multiplies it by 28 (the number of days in February) then divides it by 1.33 to get our rate after taxes. This calculation simply assumes how much we would make if the value you input were our daily average. 

The computeMonthly function works a little different. It assigns a value to monthlyaftertax by taking how much have made so far and averaging it over the elapsed days, then multiplying that by 28, and dividing by 1.33 to remove the tax rate. 

Obviously, for months other than February we'll need to change the value 28, or determine the days present based on what month it is. For now I just hardcoded 28. 

###Adding in watches

You'll notice two lines that say $scope.$watch followed by a variable and a function name. Watch is an expression that registers a listener callback to be executed when the values of those variables change. You can assign these listeners to multiple variables and even have listeners call other listeners. 

###The full page

By now your full page should look like this:

{% codeblock lang:html %}
<!DOCTYPE html>
<html lang="en" ng-app>
<head>
    <meta charset="utf-8">
    <title>Angular Demo</title>
</head>
<body ng-controller="TextController">
    <h2>{% raw %}{{someText}}{% endraw %}</h2>
    
    <form ng-controller="StartupController">    
        Today (Actual): <input ng-change="computeDaily()" ng-model="funding.dailycount"><br />
        <br />
        This Month: <input ng-change="computeMonthly()" ng-model="funding.monthcount"><br />
        <br />
        <br />
        <b>Based on Today:</b><br />
        Predicted Payment: {% raw %}{{funding.dailyaftertax | currency:"USD $ "}}{% endraw %}<br />
        <br />
        <b>Based on Month:</b><br />
        Predicted Payment: {% raw %}{{funding.monthlyaftertax | currency:"USD $ "}}{% endraw %}<br />
    </form>
</body>
    <script src="angular.min.js"></script>
    <script>
    
    function StartupController($scope){
    
        var date = new Date().getDate();
        
        $scope.funding = { dailycount: 0, monthcount: 0, dailyaftertax: 0, monthlyaftertax: 0 };
        
        var computeDaily = function() {
           $scope.funding.dailyaftertax = (($scope.funding.dailycount * 28) / 1.33);
        };
        var computeMonthly = function() {
            $scope.funding.monthlyaftertax = ((28 * $scope.funding.monthcount / date) / 1.33);
        };
        
        $scope.$watch('funding.dailycount', computeDaily);
        $scope.$watch('funding.monthcount', computeMonthly);        
    }
        
    function TextController($scope){
       $scope.someText = "Angular Adsense Calculator";
    }
    
    </script>
</html>{% endcodeblock %}

And when you run it, you can see the realtime AdSense calculator in action. 

###Summary

AngularJS is extremely powerful, testable and suited for rapid development. It's popularity has risen dramatically and for good reason. Things are being improved and added to it daily, and people are finding best practices and establishing guidelines as we speak. 

Don't be shy! Download a copy and start digging in now!!

###Video Tutorial

Here is a video I made of this tutorial:

<iframe width="560" height="315" src="//www.youtube.com/embed/r38xNCqs-2U?list=UUAR4QD5vqpn4LFrrBiDe7lQ" frameborder="0" allowfullscreen></iframe>

Be sure to check it out and subscribe to my channel for more tutorials and instructional videos! 


---
layout: post
title: "Tutorial: How To Create an Ajax Drop Down Menu With PHP and MySQL"
date: 2012-09-21 00:20
comments: true
categories: 
- "Tutorials"
permalink: /tutorials/php-tutorials/how-to-create-an-ajax-drop-down-menu-with-php-and-mysql/
sharing: true
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png
description: A learning excersize to build a drop down with AJAX with vanilla JavaScript. Helpful for explaining how AJAX works. 
---

There's no doubt by now you've heard of Ajax, it's far from a new thing. We went from hating JavaScript in the late 90s / early 2000s to now having arguably more development in JavaScript than any other language on the web. Simply put: we found a way to turn a gimmicky technology into something useful with Ajax. 

Today I'm going to show you how a basic dropdown list works with Ajax. This is mostly geared towards beginners to show you the basics of how it works. When you get serious about development you'll likely be using some kind of library like jQuery anyway. But here's how you can roll your own Ajax dropdown.

<!-- more --> 
You can view a <a href="http://jeremymorgan.phpfogapp.com/ajaxdropdown/shoppinglist.php">live demo of this dropdown here</a>

Note: This is for academic purposes only. Please do not use this code in a production site. This is not very secure or robust code it's just to teach you the basics. This will be a website to show shopping lists for sesame street muppets. 

###Step 1: Create your MySQL tables. 

{% codeblock SQL to create the tables for this tutorial. lang:sql %}

CREATE TABLE IF NOT EXISTS `customer` ( 
  `idcustomer` int(11) NOT NULL AUTO_INCREMENT, 
  `customername` varchar(45) DEFAULT NULL, 
  PRIMARY KEY (`idcustomer`) 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;


INSERT INTO `customer` (`idcustomer`, `customername`) VALUES 
(1, 'Cookie Monster'), 
(2, 'Guy Smiley'), 
(3, 'Big Bird'), 
(4, 'Oscar Grouch'), 
(5, 'Alastair Cookie');


CREATE TABLE IF NOT EXISTS `item` ( 
  `iditem` int(11) NOT NULL AUTO_INCREMENT, 
  `customerfk` int(11) DEFAULT NULL, 
  `itemname` varchar(45) DEFAULT NULL, 
  PRIMARY KEY (`iditem`) 
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=18 ;


INSERT INTO `item` (`iditem`, `customerfk`, `itemname`) VALUES 
(1, 1, 'Milk'), 
(2, 1, 'Cookies'), 
(3, 1, 'Napkins'), 
(4, 2, 'Toothpaste'), 
(5, 2, 'Hair Gel'), 
(6, 2, 'Razors'), 
(7, 2, 'Tooth Whitener'), 
(8, 2, 'Comb'), 
(9, 3, 'Seeds'), 
(10, 3, 'Bread'), 
(11, 3, 'Snuffalupagus Treats'), 
(12, 4, 'Febreeze'), 
(13, 4, 'Earplugs'), 
(14, 4, 'St Johns Wort'), 
(15, 5, 'Cookies'), 
(16, 5, 'Milk'), 
(17, 5, 'Eyeglass cleaner'); 

{% endcodeblock %}

This of course gives us two basic tables that show a list of names, and a list of items. They're joined by idcustomer matching up to customerfk. Let's first create our page, titled shoppinglist.php and put in some code to connect to the database. 

We're just going to use mysql_connect with zero error checking for simplicity. If this were a real app I would use PDO with prepared statements and error checking. But this is just an exercise.  



###Step 2: Create Your Webpage

{% codeblock Initial php file lang:php %}
<?php

// shoppinglist.php - a Demo by Jeremy Morgan

$link = mysql_connect('localhost', 'root', 'password'); 
mysql_select_db('test', $link);

?>
{% endcodeblock %}

Replace the connection items with your own of course. And the first thing we'll do is put a database driven dropdown in the file:

{% codeblock database driven select lang:php %}

$sql = "select * from customer";

$result = mysql_query($sql);

echo "<select name=\"muppetname\" onchange=\"changeContent(this.value)\">";

while ($ary = mysql_fetch_array($result)){
	echo "<option value=\"" . $ary['idcustomer']  . "\">" . $ary ['customername']  . "</option>";
}

echo "</select>";

{% endcodeblock %}

It's pretty easy to see what this does right? It simply pulls a result from the database and uses the mysql_fetch_array() function to fetch the data into an array. This outputs the "option" part of the dropdown using the idcustomer element as an id value and the customername is the displayed value. 

Now we need to create a div below that: 

{% codeblock content div lang:html %}
?>
<h2>Shopping list:</h2>
<div id="content">(Empty)</div>
<?php
{% endcodeblock %}

It's pretty simple to see what we're doing here. We escape out of php to create a div with the id of "content". This is where our shopping list will go. 

###Step 3: Create the JavaScript

This step is where we'll create the actual JavaScript that's going to interact with the dropdown. Here's the script you'll want to add to the top of your page:

{% codeblock JavaScript to communicate with getlist.php lang:javascript %}
<script type="text/javascript">
function changeContent(str)
{
if (str=="")
  {
	// if blank, we'll set our innerHTML to be blank.
	document.getElementById("content").innerHTML="";
	return;
  } 
if (window.XMLHttpRequest)
	{	// code for IE7+, Firefox, Chrome, Opera, Safari
		// create a new XML http Request that will go to our generator webpage.
		xmlhttp=new XMLHttpRequest();
	}
else
	{	// code for IE6, IE5
		// create an activeX object
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	// on state change
	xmlhttp.onreadystatechange=function()
	{
	// if we get a good response from the webpage, display the output
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
	{
		document.getElementById("content").innerHTML=xmlhttp.responseText;
    }
  }
 // use our XML HTTP Request object to send a get to our content php. 
xmlhttp.open("GET","getlist.php?idcustomer="+str, true);
xmlhttp.send();
}
</script>
{% endcodeblock %}

I tried to explain what's going on with this script in the file. Basically what you need to know is:

+ An event (dropdownmenu changes) triggers and calls the changeContent() function
+ Event passes a string to that function (the customer id) 
+ Checks to see if string passed is blank
+ Create a new XMLHttpRequest
+ When readystate changes we send a request to getlist.php
+ If it returns back successfully we populate the div with id of content. 

###Step 4: Create the response php file

So now, it looks like the only thing missing is the getlist.php. This file simply needs to take an id and return a list. It is very black box and only serves this purpose, and the data will be populated on the page. Here's what it will look like; 

{% codeblock Initial php file lang:php %}
<?php

// getlist.php - a Demo by Jeremy Morgan

$link = mysql_connect('localhost', 'root', 'password');
mysql_select_db('test', $link);

$sql = "SELECT itemname FROM item WHERE customerfk=" . $_REQUEST['idcustomer'];

$result = mysql_query($sql);

echo "<ul>";

while ($ary = mysql_fetch_array($result)){
	echo "<li>" . $ary['itemname'] . "</li>";
}

echo "</ul>";

?>
{% endcodeblock %}

Again this file is pretty self explanatory, you send it a customer id and it sends you back the list for the customer. Now that every thing is combined, your page should be functional. Load up shoppinglist.php in a web browser.  

To be sure, this is what your final shoppinglist.php should look like: 

### The final shoppinglist.php file
{% codeblock Final shoppinglist.php lang:php %}

<script type="text/javascript">
function changeContent(str)
{
if (str=="")
  {
	// if blank, we'll set our innerHTML to be blank.
	document.getElementById("content").innerHTML="";
	return;
  } 
if (window.XMLHttpRequest)
	{	// code for IE7+, Firefox, Chrome, Opera, Safari
		// create a new XML http Request that will go to our generator webpage.
		xmlhttp=new XMLHttpRequest();
	}
else
	{	// code for IE6, IE5
		// create an activeX object
		xmlhttp=new ActiveXObject("Microsoft.XMLHTTP");
	}
	// on state change
	xmlhttp.onreadystatechange=function()
	{
	// if we get a good response from the webpage, display the output
	if (xmlhttp.readyState==4 && xmlhttp.status==200)
	{
		document.getElementById("content").innerHTML=xmlhttp.responseText;
    }
  }
 // use our XML HTTP Request object to send a get to our content php. 
xmlhttp.open("GET","getlist.php?idcustomer="+str, true);
xmlhttp.send();
}
</script>
<?php

// shoppinglist.php - a Demo by Jeremy Morgan

$link = mysql_connect('localhost', 'root', 'password');
mysql_select_db('test', $link);

$sql = "select * from customer";

$result = mysql_query($sql);

echo "<select name=\"muppetname\" onchange=\"changeContent(this.value)\">";

while ($ary = mysql_fetch_array($result)){

	echo "<option value=\"" . $ary['idcustomer']  . "\">" . $ary ['customername']  . "</option>";
}

echo "</select>";


?>
<h2>Shopping list:</h2>
<div id="content">(Empty)</div>
<?php


mysql_close($link);

?>

{% endcodeblock %}

Run the file and start changing the name in the dropdown menu. As it changes, so does the list! Congratulations you've built your first PHP Ajax page! 

{% img center https://s3-us-west-1.amazonaws.com/jeremymorgan/hosted/php-mysql-ajax-tutorial.jpg Your first PHP Ajax App %}
It should look something like this. 

### Conclusion

I hope this helps you understand how Ajax works a little better. As your skills advance there's no doubt you'll use some sort of library to perform functions like this, but it's good to know how it actually works behind the scenes.

You can view a <a href="http://jeremymorgan.phpfogapp.com/ajaxdropdown/shoppinglist.php">live demo of this dropdown here</a>

If you'd like you can <a href="https://github.com/JeremyMorgan/JM-AjaxDropDownDemo">grab the source for this on Github</a>. If you want to use it for your own tutorials or courses go for it!

I hope this tutorial has helped you and if you have any questions, feel free to contact me about it or leave a comment below. 

Good Luck! 

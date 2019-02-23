---
comments: true
date: 2008-08-05 17:43:41
layout: post
slug: how-to-work-with-arrays-in-php
title: "Tutorials: How to work with arrays in PHP"
wordpress_id: 74
categories:
- "Tutorials"
description: An easy guide to working with arrays in PHP
permalink: /tutorials/php-tutorials/how-to-work-with-arrays-in-php/
Author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png
---

**What is an array? **
Arrays are common to almost every programming language. An array is simply an ordered map of values, indexed so you can find these values, called _elements_. These elements can be of multiple datatypes, and can be ordered any way you want.

Array
(
[a] => 1
[b] => 2
[c] => 3
)

**Two types of arrays in PHP**
There are two types of arrays in PHP, [associative](http://en.wikipedia.org/wiki/Associative_array) and [enumerative](http://en.wikipedia.org/wiki/Enumerative). The difference between the two is how they are indexed.

**Associative array**s allow you to index each element with an arbitrary value. For example, you can use letters of the alphabet, or just about anything to index the value, as long as it's unique. Here is an example:

Array
(
[name] => Jeremy
[website] => jeremymorgan.com
[occupation] => developer
)
`

Some programmers prefer associative arrays because they can use the key to indicate what type of data is stored in the element, like "name" in the above example. This is an indicator of what is stored, however its not a rule that's enforced. You can just as easily put a phone number in a name field and vice versa.

**Enumerative arrays** are indexed with a numerical index, either auto incremented, or random. PHP is very flexible with arrays, you can use numbers at will, and add in associative elements, and return to enumerative again. Also, the keys do not need to be sequential. Also note if you leave a key blank, an auto incremented number will be assigned to the key. Here is an example of an enumerative array:

Array
(
[0] => Jeremy
[1] => jeremymorgan.com
[2] => developer
)`

**How to build an array in PHP**

Using the [array function](http://www.php.net/array) you can create arrays a few different ways:

$ourary = array (1,2,3);
$ourary = array ('a' => '1', 'b' => '2', 'c' => '3');
$ourary = array ();`

**What do we do with arrays? **

There are a few neat things we can do with arrays. You can extract only specific parts of an array:

`
$name = $ourary['name'];
`

or you can loop through an array:

`
$ourary = array(0 => 'Jeremy', 1 => 'jeremymorgan.com', 2 => 'developer');`

foreach ($ourary as $value) {

echo "Value: $value";

}



There are many things arrays can be really handy for, and I'll cover that in future articles.

**Checking your arrays**

One question you might have is, how to easily check the data in the array. There are two easy ways to do this.



print_r($yourary);



This will display the contents of your array so you can visually verify the data before processing it. Print_r will recursively print the values of your elements. Here is another way:



var_dump($yourary);



This also prints out the values of your elements, but displays the datatypes as well. Whether or not you need this functionality will determine whether you use print_r or var_dump.

**Conclusion**

Arrays are a beautiful thing. Mastering them is key to success in any language. In future articles I will cover some of the things you can do with arrays.

Questions or comments? [Contact me! ](http://www.jeremymorgan.com/contact/)

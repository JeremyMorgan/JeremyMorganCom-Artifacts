---
comments: true
date: 2012-05-31 00:24:18
updated: 2018-03-25 12:22
layout: post
slug: an-introduction-to-object-oriented-programming
title: An Introduction to Object Oriented Programming
author: Jeremy Morgan
categories: 
- Programming
permalink: /blog/programming/an-introduction-to-object-oriented-programming/
sharing: true

tags:
- computer science
- design
- object oriented programming
- oop
- programming
- software design
- software development
---

As a part of my increased focus on software development topics, today I'm going to talk about Object Oriented Programming (OOP). This is the first in a series of articles that will aim to teach you more about OOP and how you can use it to develop better software.

<!-- more -->
### What we'll learn with this article:
	
  1. What is OOP?
  2. What is an object?
  3. What is a class?
  4. What is inheritance?
  5. What is an interface?

This quick intro will lay a foundation of understanding so you can start learning this exciting way of developing.

### What is Object Oriented Programming?

Object Oriented Programming is a method of organizing your software and partitioning problems using data structures called "objects" and assigning attributes and methods to them. By thinking in terms of objects you can organize your software and enjoy the following benefits:
	
  * Improved Organization
  * By breaking up the problems, multiple programmers can work on it.
  * Improved stability and flexibility
  * Your software becomes more scalable.
  * Increase reuse of software.
  * Uses a very natural and easily understood way of modeling.

These are just some of the benefits that OOP brings to your software. Overall most engineers consider it to be a good approach, it's a stable and mature methodology. But there are some disadvantages to OOP as well.

  * Sometimes it's more work than it's worth.
  * Not all languages and vendors implement OOP the same way
  * OOP is not as effiecient.
  * Sometimes it make a problem more complicated.
  * You can write bad OOP code just as easy as bad procedural code.

Since you're still reading this tutorial it must mean you're still interested in OOP so let's discuss some of the basics.

### What is an Object?

![Object Oriented Programming Tutorial](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-2-300x200.jpg)

An object is basically a noun: a person place or thing. In the software world an object is a representation of something, whether it be a person, a customer order, a product or something similar. It's basically an description of a real object without the details. Objects can be cloned or copied and each copy of it can be modified.As another example we'll use YOU as an object.

We know that you're a person, so our object will be a person object. This is not a particular person but a description of one, making it an abstract.

A person has specific attributes, which are defined by our object.
	
  * First Name
  * Last Name
  * Age
  * Height
  * Hair Color

All of these can be used to describe a person, which would be our object. Since YOU are the object, you would fill in your attributes. Again you are an "instance" of the person class.

Some of your "methods" would be:
	
  * do_walk()
  * do_run()
  * do_eat()
  * do_sleep()
  * do_sit()

An object is simply a data structure that adheres to a definition and posesses attributes and methods, and those methods are what the object actually does.

### What is a Class?

[![Object Oriented Programming Tutorials](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-31.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-31.jpg)

A class is a description of an object that defines it's properties (or attributes) and methods as described above. It's a template for creating an object. I'll use the frequently cited example of cookies (tasty kind). Imagine you have a star shaped cookie cutter. The cookies are objects, and the cookie cutter is a class. The cutter itself is not a star but it's shaped like a star to create the objects (cookie) in the way you define. Each cookie is an "instance" of your star class.

A class is a definition of an object. The class contains rules about the object, including which attributes it has, and what actions it can do. It decides the structure of the object, which properties it has and which methods it performs.

### What is Inheritance?

[![Object Oriented Programming Tutorials](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-1.png)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-1.png)

Inheritance is a way for objects recieve attributes and methods from other objects. Each of these new classes "inherit" things from the parent class. For instance, you are a person object with a certain last name. If you have a child, that child object will "inherit" your last name and so will decendants that pass down. They may even inherit your height and eye color. See how much sense it makes to call it inheritance?

In programming, you generally create an object with certain attributes and methods, and then branch off with instances of that class, inheriting whatever you'll need. You can always overwrite these values later, but it's nice to be able to create objects knowing it will inherit certain things. Inheritance is very important for code reuse and design efficiency.

### What is an Interface?

[![Object Oriented Programming Tutorial](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-4.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/object-oriented-programming-4.jpg)

Inheritance is a method or interaction between components that's been defined in advance. The reason an interface is designed is so that two components can work together without the designers of either component having to know much about each other. It creates expectations so designers can focus on their own product (or class).

For example: the electrical sockets on your wall are an interface. There is a a standard that defines what plugs will fit in the socket, and how much power will be delivered through it. This way any manufacturer can build their devices and expect this interface when working with it.

When the manufacturers of the blender on your counter were designing it they know they had to deal with a 110 volt interface with a 3 prong plug. The interface (power socket) is linked to the power company, but the blender designers did not have to worry about whether the power company was using coal power or nuclear, and the power company isn't designing blenders either.

### Conclusion

Object Oriented Programming is a way of using real world scenarios to describe software and help you conceptualize it. OOP is merely an idea or discipline, not something you can hold in your hand, which is why people see OOP differently and have varying opinions on it. I hope this guide has given you a rough idea of what OOP is all about, I will be diving into this subject much deeper soon.


{% include custom/asides/programming-footer.html %}
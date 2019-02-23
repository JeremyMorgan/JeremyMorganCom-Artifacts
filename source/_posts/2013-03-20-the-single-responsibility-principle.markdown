---
layout: post
title: "The Single Responsibility Principle"
date: 2013-03-20 21:04
updated: 2018-03-25 12:22
comments: true
author: Jeremy Morgan
description: There's a lot of genius in simplicity. This applies to many things in life and definitely in software development. SRP, or Single Responsibility Principle is one of the foundations building better software.
categories: 
- Programming
- Object Oriented Programming
permalink: /blog/programming/single-responsibility-principle/
ogimage: https://www.jeremymorgan.com/images/tools-ogimage.png
---
There's a lot of genius in simplicity. This applies to many things in life and definitely in software development. SRP, or Single Responsibility Principle is one of the foundations building better software. It's a good way to keep code working as expected, and to avoid painting yourself in a corner. 

<!-- more -->

###Do one thing and do it well

The Single Responsibility Principle guides simplicity, and the rule itself is strikingly simple: There should never be more than one reason for a class to change. This is easier said than done of course, but the idea is if you have more than one reason to change a class, then you should break it into two classes. 

This goes for methods as well, as sometimes folks tend to cram a bunch of functions into a method. The problem with that is, when part of that method changes drastically, you may have to modify the signature or output of the method. Overloading can help there, but it's still better to separate tasks as much as possible. Creating another class or method doesn't cost a thing. 

I know OOP design usually dictates getting as much done in an object as you can, but this can lead to growing pains down the road. This is where extending and inheritance can really come in handy. 

###A SRP Violation

Ok one of the biggest violators I have seen is mixing presentation with data. With the MVC movement in full swing you don't see as much of it anymore, but it still happens. Take the following class from a blog app:

{% codeblock %}

class Page {

	public function drawIndex() {
		$this->getArticle($id);
		// some code to output HTML
	}
	
	private function getArticle($id){
		// query the database for the latest article
	}

}
{% endcodeblock %}

Why is this bad? It looks pretty simple, and it's pretty easy to use. The reason it's bad is because it does two separate things, it gets and article from the database, then it outputs html. This is not only a violation of the Single Responsibility Principle but Separation of Concerns as well. 

What happens when you change databases? This happens all the time. You have now made drastic changes to the getArticle function, and maybe even the output that comes from the database. This is bad design to have this coupled with your presentation code and even puts it at risk. Plus, let's say you want to display the output to JSON as well. Where would that method go? Lumping it all together creates a huge mess later down the road. 

Not to mention the fact that your designers and your DBA might both be dipping into the same class... is that something you really want?

###The Solution

{% codeblock %}

class Page {

	public function drawIndex() {
		$data = $model->getArticle($id);
		// functions to output HTML
	}
}

class Model {

	public function getArticle($id){
		// query the database for the latest article
		
	return $data;
	}

}
{% endcodeblock %}

Once you break it into two classes you create a Separation of Concerns. The Page class generates web pages, and the Model gets data from your database. The page doesn't care what the model is doing as long as it takes in data (the article id) and outputs data (the article) as expected. You can change the model to connect to any data source you want, and the Page class doesn't care. 

And the Page class is now free to output data any way it wants. If you want to create some html, you can create a method to do that, output some JSON, XML whatever, with the same data from the model. By separating them you give yourself a lot more freedom down the road to change and modify. 

>Just remember, if there is more than one reason to change, split it up. 

###When to implement the Single Responsibility Principle

In theory you want to do this from the very beginning. As you're designing your application you should always keep this in mind. In practice it's not always easy and sometimes you just have to get your project finished. This is where refactoring comes in. 

You should always go back and refactor your code at some point because business rules change, requirements change and things get added on and subtracted. Good code refactoring can really improve your development process. Remember, you're optimizing for humans here, and the easier it is for you or another programmer to make changes the better off you'll be down the road. 

For more information about the Single Responsibility Principle, check out <a href="http://www.amazon.com/gp/product/0137208715/ref=as_li_ss_tl?ie=UTF8&camp=1789&creative=390957&creativeASIN=0137208715&linkCode=as2&tag=webfootcentra-20">Principles of Object Oriented Analysis and Design</a> by James Martin.

{% include custom/asides/programming-footer.html %}
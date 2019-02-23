---
layout: post
title: "How to Write Better Unit Tests"
date: 2014-08-24 21:02
comments: true
author: Jeremy Morgan
categories: 
- Programming
description: 
permalink: /blog/programming/how-to-write-better-unit-tests/
ogimage: https://www.jeremymorgan.com/images/how-to-unit-tests.jpg

---

In working with some unit testing fairly extensively lately, I've gathered some guidelines I've tried to stick with over the years for writing better tests. Remember poorly written tests are a waste of time, and cause major problems down the road. It's best to keep some of these guidelines in mind. 
<!-- more -->

- **Unit tests should not be written to pass** - They should be written to fail. You can make any set of tests pass in minutes but you're only cheating yourself. 
- **Tests should only test one thing** - You should be testing a single method with a single function. If not you may be violating the <a href="/blog/programming/single-responsibility-principle/" target="_blank">Single Responsibility Principle</a>
- **Readability in your tests **- make sure they're commented and easy to understand, just like any other code.
- **Good Naming conventions** - Again tests should be just like any other code - easy for humans to understand.
- **Asserts are separated from actions** - Your assert should be looking for a result, and not performing logical operations
- **Use concrete inputs **- Don't use any dynamic data for inputs, things like date() can introduce variance.
- **Group locations of tests** - from a logical standpoint this makes things easier to find when there aren't errors pointing towards the problem.
- **Good tests are isolated from everything** - You should have no reliance on other tests, environment settings, etc. This creates multiple points of failure.
- **Do not include private methods** - They are implementation and should not be included in Unit Tests
- **Don't connect to databases or data sources** - This is unreliable because you cannot be certain the data served will always be the same, and can create points of failure.
- **No more than one mock per test** - Again we're trying to eliminate points of failure and inconsistenties.
- **Unit tests are not integration tests** - You want to test results, not implmentation with Unit Tests.
- **Tests must be deterministic** - You need a solid predictable result, so if it only passes sometimes, it's not done.
- **Keep your tests idempotent** - you should be able to run it multiple times without changing any outcomes, and it should not change any data or increment anything. One time or a million times should have the same effect.
- **Classes only test one class at a time, methods only test one method at a time.** - An organizational method to pinpoint problems when they arise and help you identify dependencies in testing.
- **Include exceptions in your tests **- You're going to have exceptions so don't ignore them, use them.
- **Don't test functionality of 3rd party libraries with your own tests** - Most quality libraries should have their own tests. If not consider mocks to produce consistent results
- **Always limit values** - When working with values be mindful of your limits and set them (min max) for maximum consistency.
- **Tests should not require configuration or custom setup** - Anyone should be able to jump in and make your tests work. "Works on my machine" should never apply here.

I hope this helps some of you out there learning and working with Unit Tests. 

{% include custom/asides/programming-footer.html %}
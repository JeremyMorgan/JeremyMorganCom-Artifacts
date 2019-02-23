---
layout: post
title: "Tutorial: XSLT in 5 minutes"
date: 2011-03-16 22:04:02
updated: 2018-03-25 12:22
comments: true
categories:
- Tutorials
permalink: /tutorials/html-tutorials/xslt-in-5-minutes/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/tools-ogimage.png
description: A simple introduction to XSLT stylesheets and how you can make them work for you. 

---

This is a simple introduction to XSLT, or eXtensible Stylesheet Language Transformation. It's a way of applying styles and formatting to XML files, and it's pretty useful. It's yet another acronym you see thrown around on job descriptions for Web Developers. Don't be scared, it's really easy to understand.

We'll start out with a simple XML file listing a few movies.

{% codeblock lang:xml %}
    <?xml version="1.0"?>
    <?xml-stylesheet href="movies.xsl" type="text/xsl"?>
    <collection>
          <movie>
          <title>Happy Gilmore</title>
          <year>1996</year>
          <genre>Comedy</genre>
     </movie>
     <movie>
          <title>Rango</title>
          <year>2011</year>
          <genre>Animated</genre>
     </movie>
     <movie>
          <title>Three Kings</title>
          <year>1999</year>
          <genre>Action</genre>
          </movie>
    </collection>

{% endcodeblock %}

### XML Breakdown

I shouldn't have to spend a lot of time explaining this file, you should already have a basic familiarity with XML if you want to build XML Stylesheets. This file contains three movies, as part of a "collection" and lists the following attributes:


  * Title
  * Year
  * Genre

If we load this file into a browser as it is, the page that displays will look like it does above, just an XML readout.  But we added something to our file, notice this line:

{% codeblock lang:xml %}  
    <?xml-stylesheet href="movies.xsl" type="text/xsl"?>
{% endcodeblock %}


Here is where we reference movies.xsl which will be our XML stylesheet.  We simply put in an href to the file, and a type.

Our xsl file will be somewhat different, essentially a blend of an XML file and an HTML file. What this sheet is doing is applying presentation to the XML elements.  You can build tables, lists or anything else you can do in a standard html webpage. Here is one I built for this tutorial:

{% codeblock lang:xml %}  
    <?xml version="1.0" encoding="ISO-8859-1"?>
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
    
    <xsl:template match="/collection">
     <html>
     <body>
      <table border="1">
       <tr>
        <th>Title</th>
        <th>Genre</th>
        <th>Year</th>
       </tr>
        <xsl:for-each select="movie">
        <tr>
         <td><xsl:value-of select="title"/></td>
         <td><xsl:value-of select="genre"/></td>
         <td><xsl:value-of select="year"/></td>
        </tr>
     </xsl:for-each>
     </table>
     </body>
     </html>
    </xsl:template>
    </xsl:stylesheet>
{% endcodeblock %}

### XSL Breakdown

Let's break down this file a bit. First we find the XML start tag, and then our first XSL tag, which is

{% codeblock lang:xml %}
    <xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">
{% endcodeblock %}

This is an important line, because it specifies the version and namespace of the stylesheet. The next important line is line #4:

{% codeblock lang:xml %}  
    <xsl:template match="/collection">
{% endcodeblock %}


This specifies which group to start with. Our sample XML file only has one group, "Collection". But you may have several groups and you can keep them all in one big XML file. You can then use a stylesheet to display them all in different areas, and different ways. We could decide to add a list of favorite TV shows, for instance and put that in another group. This line simply tells us which group this particular template is for.

You'll notice we start building an HTML page below it, complete with a table to display our data.

Then we have another important line:

{% codeblock lang:xml %}   
    <xsl:for-each select="movie">
{% endcodeblock %}

This is a basic "for each" loop found in many programming languages. It basically states, "for each movie, we will do ___". So it creates a loop and goes through every "movie" tag until it's done. This is how the rows are populated.

After that we close up the table and the html and drop in tags to close the template, and the style sheet:

{% codeblock lang:xml %}  
    </xsl:template>
    </xsl:stylesheet>
{% endcodeblock %}

These are pretty self explanatory, we want to close up any open tags, if you don't you'll get an error.

### Some things to note:

**Your coding has to be really good.** - Most of the time just one open tag will break the entire thing.

**Not all browsers process XSLT stylesheets, including many mobile devices. **You will need to use a XSLT parser for those pages, and I'll do a tutorial for that soon.

**We're just scratching the surface **- XSLT uses XPath to query XML files, there are a lot more cool things you can do with this technology once you get the hang of it. Check out an [XPath tutorial](http://www.w3schools.com/xpath/xpath_syntax.asp) and take a look. I've seen entire sites built with XML files and XSLT that would surprise you with what they've done.

I hope this helps. Till next time, have fun!
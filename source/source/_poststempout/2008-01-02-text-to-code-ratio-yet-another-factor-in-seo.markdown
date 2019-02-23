---
comments: true
date: 2008-01-02 22:32:59
layout: post
slug: text-to-code-ratio-yet-another-factor-in-seo
title: Text to code ratio - yet another factor in SEO?
wordpress_id: 34
categories:
- "SEO"
permalink: /blog/seo/text-to-code-ratio-yet-another-factor-in-seo/

tags:
- CSS
- HTML
- search engine
- seo
- spider
---

I'm going to start off by saying I honestly don't know whether text to code ratio affects rankings at all. Almost every piece of SEO advice I give out I have tested and proven, or at least came close to proving. This is one of the things I have not tested at all, but is certainly something interesting to consider.

What is text to code ratio?

Simply put, its the amount of text vs the amount of markup in your source code. Go to view-> source and take a look. As we all know,  this is how spiders see your site. Text to code ratio has zero effect on humans. This is why it's so often overlooked.

With the sudden surge of table-less layouts, and the previous surge of CSS popularity, code is reducing all the time. That cluttered nonsense we wrote years ago is 5 times larger, from a text perspective. Let me show you this in action.

    
    
    <table width="600" border="0"><tbody>
    <tr>
    <td width="166" valign="top"><strong><font color="#ff0000" face="Arial, Helvetica, sans-serif">This is some text</font></strong><font size="2"><strong><font color="#000000" face="Arial, Helvetica, sans-serif">This is some more text</font></strong></font></td>
    <td width="202" valign="top">
    <p align="center"><strong><font color="#ff0000" face="Arial, Helvetica, sans-serif">This is center text</font></strong></p>
    <p align="center"><font size="2"><strong><font color="#000000" face="Arial, Helvetica, sans-serif">This is some more text</font></strong></font></p>
    </td>
    <td width="218" valign="top"><strong><font color="#ff0000" face="Arial, Helvetica, sans-serif">The left menu</font></strong><font color="#ff0000">Blah blah blah.</font></td>
    </tr>
    </tbody></table>
    


Look at that mess. It's hard to believe we used to write that stuff, isn't it? This comes in at a whopping 13.2% text, with the remaining size in code.

Here is that same code with CSS applied:

    
    
    <p class="rightpanel"> </p>
    
    <p class="heading">The right menu
    
    Blah blah blah.
    <p class="leftpanel"> </p>
    
    <p class="heading">This is some text
    
    This is some more text
    <p class="center"> </p>
    
    <p class="heading">This is center text
    
    This is some more text


Aside from all the other reasons for writing code in this style (extensibility, faster development, etc) it's also a heck of a lot less code. This snippet comes in at 28.54%, more than double the amount of relevant text per file.

Jeremymorgan.com comes in at 20.16% (before this article was published). Lets see how that compares with the big boys.

CNN.com: **9.37%**

MySpace.com: **4.4%**

ESPN.com:  **8.87%**
I think you're getting the point here. They are already huge sites, so they care little about SEO, and place an emphasis on formatting, which makes perfect sense. Maybe someday you'll do that as well, but in the meantime it's not a bad idea to think about code to text ratios and how they affect your site. If you are using a CMS, you have less control over it, but it's still possible.

**Here is how you reduce your code to text ratio:**

Never style individual elements with html. Use CSS

Switch to a table-less layout, and do your layouts with CSS (There are other great reasons for it)

Dont comment your html code, or use worthless tags.

[Here is how you check it ](http://www.collinsinternet.com/code-to-text-ratio/)

As I stated, I am not sure if it has any difference on your results, but I don't see how it could harm them. I may do some testing in the future, though it will be tough to create a good control environment. My official word is: It sounds like a likely theory. It's not something that will hold a tremendous amount of weight,  but any edge you can get on your competition is good. Email me and let me know your thoughts or results!

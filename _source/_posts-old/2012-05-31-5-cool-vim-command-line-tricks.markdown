---
comments: true
sharing: true
date: 2012-05-31 21:21:21
layout: post
slug: 5-cool-vim-command-line-tricks
title: "Linux Tutorial: 5 Cool Vim Command Line Tricks"
author: Jeremy Morgan

wordpress_id: 1219
categories:
- "Tutorials"
permalink: /tutorials/linux/5-cool-vim-command-line-tricks/

tags:
- linux
- linux how to
- linux howto
- linux tutorials
- unix
- vi
- vi how to
- vi improved
- vi tutorials
- vim
---

Like most "hardcore" Linux/Unix hackers I love Vi/Vim, and I've found there is no end to the things you can learn about Vim so I decided to add a few command line tricks that I just learned recently.

{% img center http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2012/05/vi-tutorials1.png %}

I'm going to use "file.txt" as our example file.

Here are some cool Vim command line tricks:

**1. Open at the end of a file**


> vi **+** file.txt


The plus sign added before the file name opens up the file with the cursor at the end of the file. This can be handy if you have a huge text file you and you don't want to scroll down.

**2. Open file at specific line**


> vi **+_n_** file.txt


If you add a number (replace n with a number in case you hadn't guessed) the cursor will go exactly to that line number. Extremely handy for large text files or error messages that specify a line number in a config or source file.

**3. Open file at a pattern**


> vi **+/_pattern_** file.txt


This will open the file on the same line as the pattern you specify (first instance of it). This is great if you have a specific phrase to search for.

**4. Recover a file after a crash**


> vi **-r** file.txt


Use -r to open a file and recover it after a crash. This could save your butt someday.

**5. Run a script against a file**


> vi **-s** file.txt < script.sh


This trick could be super powerful, but also dangerous. This allows you to run a script against the file while opening, usually a search or something of that sort.

I hope this helps, I'm going to post more stuff as I learn it, there's a reason they've written whole books about Vim, it has a ton of features. If people enjoy these tips, I'll add some more later.

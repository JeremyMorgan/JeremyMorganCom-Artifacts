---
comments: true
date: 2011-08-18 01:03:12
layout: post
slug: how-to-use-vim-instead-of-vi-with-an-alias
title: "Tutorial: How to use Vim instead of Vi with an alias"

categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-use-vim-instead-of-vi-with-an-alias/
author: Jeremy Morgan

---

Vim is a lot better than Vi, especially if you're programming. If you would rather use Vim than Vi, and you're on an older distro, here is how you set it up in your shell.

Edit your .bashrc file:

> vi /root/.bashrc

Add a line to it:

> alias vi='vim'

And save the file. That's it! Most newer distros do this automatically but some distros still use vi by default.
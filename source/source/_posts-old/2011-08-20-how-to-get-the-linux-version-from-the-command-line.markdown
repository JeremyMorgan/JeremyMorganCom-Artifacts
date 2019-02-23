---
comments: true
date: 2011-08-20 08:18:25
layout: post
title: "Tutorial: How to Get the Linux Version From The Command Line"
wordpress_id: 916
categories:
- "Tutorials"
permalink: /tutorials/linux/how-to-get-the-linux-version-from-the-command-line/

author: Jeremy Morgan

tags:
- cli
- command line
- How to
- how to linux
- linux
- linux command line
- linux how to
- linux tutorials
- tutorial
---

There are several ways to get your Linux version from the command line. One way that just displays a basic name:


> uname


But this usually just returns "Linux". Pretty sure you already knew that. A more detailed view would be:


> uname -a


Which shows "all" the information uname provides.

Here are some other switches for uname:

    
      -a, --all                print all information, in the following order,
    except omit -p and -i if unknown:
    -s, --kernel-name        print the kernel name
    -n, --nodename           print the network node hostname
    -r, --kernel-release     print the kernel release
    -v, --kernel-version     print the kernel version
    -m, --machine            print the machine hardware name
    -p, --processor          print the processor type or "unknown"
    -i, --hardware-platform  print the hardware platform or "unknown"
    -o, --operating-system   print the operating system
    --help     display this help and exit
    --version  output version information and exit


There is another method for gathering system information:


> cat /proc/version


This will also show you quite a bit of information on your system.


> 

>     
>     Linux version 2.6.32-71.el6.x86_64 (mockbuild@x86-007.build.bos.redhat.com)
>     (gcc version 4.4.4 20100726 (Red Hat 4.4.4-13) (GCC) ) #1 SMP Wed Sep 1 01:33:01 EDT 2010
> 
> 



Some distros have their own methods of identification also, such as RedHat:

cat /etc/redhat-release

Consult your manuals for each distro to find out where they store this information.



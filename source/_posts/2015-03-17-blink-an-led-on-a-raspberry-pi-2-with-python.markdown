---
layout: post
title: "How to Blink an LED on a Raspberry Pi 2"
date: 2015-03-17 18:55
updated: 2018-03-25 12:22
comments: true
categories: 
- Raspberry Pi
- Tutorials
author: Jeremy Morgan
sharing: true
description: The blinking LED is the hello world of the maker community, and today I'll show you how easy it is to do with the Raspberry Pi 2 (or Model B)! 
ogimage: https://www.jeremymorgan.com/images/blink-led-rpi-2-python/raspberry-pi-2-blink-led-og.jpg
permalink: /tutorials/raspberry-pi/how-to-blink-led-raspberry-pi-2/
---
{% include custom/asides/iot-newsletter-banner.html %}

The blinking LED is the "hello world" of the maker community, and today I'll show you how easy it is to do with the Raspberry Pi 2 (or Model B)! We're going to use Python and WiringPi for this project. 

<!-- more -->
###What you'll need

For this article I'm using a Raspberry Pi 2, but you can also use a Raspberry Pi Model B. You will also need:

{% img right /images/blink-led-rpi-2-python/raspberry-pi-2-blink-led-1.jpg "Blink an LED Raspberry Pi 2" %}

- A GPIO Adapter
- Breadboard
- Resistor
- LED

What I am using for this project is highly recommended the <a href="http://www.amazon.com/gp/offer-listing/B008XVAVAW/ref=as_li_tl?ie=UTF8&camp=1789&creative=9325&creativeASIN=B008XVAVAW&linkCode=am2&tag=webfootcentra-20&linkId=VF3GTBAGOAKMKG2S" target="_new">Canakit for Raspberry Pi</a> which contains everything in the list above. (This is an Amazon affiliate link).

Any decent breadboard or even a set of jumpers will work for this project. 

##How to Blink an LED with Python 

The quickest way to get that LED to blink is to take a look at the <a href="http://pi.gadgetoid.com/pinout" target="_new">pins of the GPIO</a> and decide which one to tie to. Then you can use Python and the <a href="https://pypi.python.org/pypi/RPi.GPIO" target="_blank" rel="nofollow">Raspberry Pi GPIO Library</a> to create a script to light it up.

{% codeblock lang:python %}

import RPi.GPIO as GPIO             ## Import GPIO Library
import time                         ## Import 'time' library (for 'sleep')

blue = 7                            ## These are our LEDs
ourdelay = 1                        ## Delay
# pins 4,17,18,21,22,23,24,25

GPIO.setmode(GPIO.BOARD)            ## Use BOARD pin numbering
GPIO.setup(pin, GPIO.OUT)        ## set output

## function to save code

def activateLED( pin, delay ):
	GPIO.output(pin, GPIO.HIGH)      ## set HIGH (LED ON)
	time.sleep(delay)                ## wait
	GPIO.output(pin, GPIO.LOW)       ## set LOW (LED OFF)
	return;

activateLED(blue,ourdelay)

GPIO.cleanup()                      ## close down library
{% endcodeblock %}

As you can see in the code above, it doesn't take much to get things working. But I'll explain the code a little deeper. 

{% codeblock lang:python %}
import RPi.GPIO as GPIO
import time         
{% endcodeblock %}

The following code imports the Python GPIO library, and the time library. The GPIO library, as you probably guessed is the library for interacting with the GPIO in Python. It does an amazing job of simplifying the process. The time library is there so we can put a delay in, otherwise the blink might be too fast to notice. 

{% codeblock lang:python %}
blue = 7
ourdelay = 1  
{% endcodeblock %}

Here I created a variable named "blue" (the color of the LED) and assigned it "7" which is the pin number we want. If I wanted to add multiple LEDs I could name it something like:

{% codeblock lang:python %}
blue = 7 
red = 13
green 14
{% endcodeblock %}

I then created a "delay" variable of one second. This way I can change the delay of the lights blinking however I want. 

You can name the variables anything you want, but this was just to make it easy to see which LED is which if I wanted to do some fancy light show. 

{% codeblock lang:python %}
GPIO.setmode(GPIO.BOARD)  
{% endcodeblock %}

Then, we set the GPIO mode to "Board" which means we'll use the numbering of the pin by board instead of GPIO. This makes it a little easier to understand when using a bread board.

With this line of code we set the pin to be an output:

{% codeblock lang:python %}

GPIO.setup(pin, GPIO.OUT)

{% endcodeblock %}

There are 2 main commands to turn the LED on then off:

{% codeblock lang:python %}

GPIO.output(pin, GPIO.HIGH)
GPIO.output(pin, GPIO.LOW)

{% endcodeblock %}

If you wanted to blink an LED twice you would have to repeat the last two lines each time. So I decided to put this in a function and put the pin and delay as parameters. This way making a particular LED blink is as simple as:

{% codeblock lang:python %}
activateLED(blue,ourdelay)
{% endcodeblock %}

This is repeatable and saves code when doing larger programs. 

To close everything down, we need to run the following:

{% codeblock lang:python %}
GPIO.cleanup()  
{% endcodeblock %}

It's that easy! You could easily write a nice Python script that do some pretty cool stuff with just a few lines of code. 


##How to Blink an LED with WiringPi

For this step we'll install <a href="http://wiringpi.com/" target="_blank">WiringPi</a> for the libraries to interact with the GPIO. This allows us to do what we just did, but from the command line. We'll need to install WiringPi:

{% codeblock %}
cd ~/sources
git clone git://git.drogon.net/wiringPi
cd wiringPi
git pull origin
./build
{% endcodeblock %}

If successful you should see a screen like this:

{% img /images/blink-led-rpi-2-python/raspberry-pi-2-blink-led-2.jpg "Blink an LED Raspberry Pi 2" %}

Now we can light up the LED from the command line. Remember the pin 7 in the example above? We can now light up like so:

{% codeblock %}
gpio mode 7 out
gpio mode 7 1
{% endcodeblock %}

This will light up the LED. You can turn it off by entering:

{% codeblock %}
gpio mode 7 0
{% endcodeblock %}

{% img /images/blink-led-rpi-2-python/raspberry-pi-2-blink-led-3.jpg "Blink an LED Raspberry Pi 2" %}

This makes it super easy to light up LEDs from the command line. You could create a pretty neat BASH script to do this, and do some neat things, or call this from other languages. 

##Summary

I hope this has helped in showing how easy it is to blink an LED on the Raspberry Pi 2/B. Of course as you progress on you'll want to do far more than just blink an LED, but the GPIO libraries make it very easy to create some neat stuff. If you've experimented with this and done something cool, leave me a comment!! 

Special Thanks to the folks in <a href="http://www.reddit.com/r/raspberry_pi/comments/30iiq7/for_beginners_how_to_blink_an_led_on_a_raspberry/" target="_new">this thread on Reddit</a> who helped with some corrections to this article. 

{% include custom/asides/rpi-footer.html %}
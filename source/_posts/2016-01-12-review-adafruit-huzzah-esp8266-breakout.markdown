---
layout: post
title: "Setting up the Adafruit Huzzah ESP8266 Breakout"
date: 2016-01-12 21:16
updated: 2018-03-25 12:22
comments: true
categories:
- Programming
- Tutorials
- Arduino
- IoT

author: Jeremy Morgan
sharing: true
description: Today I've set up an Adafruit Huzzah ESP8266 Breakout board and played around with it. My thoughts on this board and ones like it, and what it could mean for the Internet of Things. 

ogimage: https://www.jeremymorgan.com/images/huzzah-esp8266/adafruit-huzzah-ESP8266-og.jpg
permalink: /internet-of-things/arduino-projects/huzzah-ESP8266-breakout/

---

Recently I showed a friend of mine some of the projects I've working on with Arduino and Wifi, and he introduced me to the [ESP8266 chip](http://www.esp8266.com/). I found them all over the internet ranging from $1.50 US to $20, with a variety of configurations and manufacturers. I decided to go with a company I trust, Adafruit Industries, and see what their offering is like. 

<!-- more -->
Full disclosure: I was not paid or compensated by Adafruit, I purchased this product. You can [grab one for $9.95 here](https://www.adafruit.com/products/2471). 

##Assembly

With Adafruit products you can expect a few things:

- A good design
- Software for devices
- Lots of instructions
- Soldering

As I've said before I think soldering components is a good thing, even for beginners. It gives you more freedom with how you set up your boards, and it forces you to get good at soldering. This kit comes to you looking like this:

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-01.jpg)

Its a board, with some pins (extras) and that's it. I generally like to place them in the breadboard when soldering to keep everything straight. Some have warned against this because you might damage your breadboard. If you are getting the pins that hot or slopping that much solder you're doing it wrong. Practice on some old electronic stuff! 

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-02.jpg)

In a few minutes you should have something that looks like this:

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-03.jpg)

It's ready to program! 

##Setting up the Software

I should note there are a few ways to connect to this device to program it. I chose the easy way, and got a [FTDI Serial USB cable](http://www.adafruit.com/products/70) to do this. I figure it won't be the last time I program a serial device, and I freely admit I am NOT an electronic engineer so this route worked well for me.

The first thing I thought I'd do, is the "hello world" of electronics and blink an LED. 

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-04.jpg)

To get the software you need, head on over to [this GitHub repo](https://github.com/esp8266/Arduino) and download the .zip file and save it in your libraries folder. 

Start Arduino and open Preferences window.

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-05.jpg)

Enter http://arduino.esp8266.com/stable/package_esp8266com_index.json into Additional Board Manager URLs field. You can add multiple URLs, separating them with commas. Click OK.

Open Boards Manager from Tools > Board menu and install ESP8266 platform (and don't forget to select your ESP8266 board from Tools > Board menu after installation).

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-06.jpg)

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-07.jpg)

Note, you may need to change your port also:

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-08.jpg)

###Write the Code

The code to blink an LED is super simple. Create in the already familiar Arduino IDE:

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-09.jpg)

Here's the actual code:

{% codeblock lang:c %}

void setup() {
	// initialize digital pin 14 as an output.
	pinMode(14, OUTPUT);
}

// the loop function runs over and over again forever
void loop() {
	digitalWrite(14, HIGH);   // turn the LED on (HIGH is the voltage level)
	delay(1000);              // wait for a second
	digitalWrite(14, LOW);    // turn the LED off by making the voltage LOW
	delay(1000);              // wait for a second
}
{% endcodeblock %}

In order to push the code to the ESP8266, you must hold down GPIO0 then press and release reset:

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-10.jpg)

Once you see the red light dim, it's ready to flash. 

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-11.jpg)

Once complete, you'll have a blinking LED!

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-12.jpg)

###Playing with Sensors

I decided to get a little more creative and hook a couple sensors up to this. I am not going to go into great detail, if you want to do this [head over to this repo](https://github.com/IoT-Projects/IoT-home-temp-tracking) and get code for turning your ESP8266 into a home temperature tracker. But it was super easy to set up.

![Adafruit Huzzah ESP8266](/images/huzzah-esp8266/adafruit-huzzah-ESP8266-13.jpg)

Using the [Adafruit DHT Libraries](https://github.com/adafruit/DHT-sensor-library) and some code from the IoT home temp repo I was able to get it running in minutes. Very easy!

I even ended up sending the data to Sparkfun, you can see the live feed here --> [data.sparkfun.com](https://data.sparkfun.com/streams/n1L3R6yql5I3WYrxKXK7) (it may go down at any time).


##Conclusion

I really enjoyed the [CC3000 Arduino Wifi breakout](https://www.jeremymorgan.com/internet-of-things/arduino-projects/how-to-wifi-arduino/) and would still use it if I needed additional data pins. With the ESP2866 product I have a much smaller footprint, it doesn't even require an Arduino, and it is super easy to set up. Here's how to know if you should use an ESP2866:

- You don't need a full OS
- You have a few sensors 
- You want to simply grab data and push it

This is where the ESP8266 really shines. It's dead simple and does one thing and does it well. I can't wait to start building more projects with this, and at $10 you really should too. 



<br />
<br />
{% include custom/asides/rpi-footer.html %}

---
layout: post
title: "Does Dry Ice Really Cool Five Times Better Than Regular Ice?"
date: 2016-07-31 00:58
updated: 2018-03-25 12:22
comments: true
categories:
- Raspberry Pi
- Tutorials
author: Jeremy Morgan
sharing: true
description: I saw an advertisement for dry ice claiming it cools 5 times better than wet ice. Out of curiosity I had to know if this were true, or at the very least see how much better dry ice performs. I thought I'd gather up a Raspberry Pi and some sensors and find out

ogimage: https://www.jeremymorgan.com/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-og.jpg

permalink: /tutorials/raspberry-pi/dry-ice-vs-wet-ice/

---

I saw an advertisement for dry ice claiming it cools 5 times better than wet ice. Out of curiosity I had to know if this were true, or at the very least see how much better dry ice performs. I thought I'd gather up a Raspberry Pi and some sensors and find out, using some techniques from my <a href="https://www.udemy.com/hands-on-internet-of-things-raspberry-pi/?couponCode=JEREMYMORGANDOTCOM">**Hands on Internet of Things course**</a> released recently.

<!-- more --> 
I'm sharing what I found here and showing how you can replicate the experiment. 

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-00.jpg)

###What Does 5 Times the Cooling Power Mean?

This is the first thing I wondered. Does it keep it 5 times colder? Does it keep it cool 5 times longer? The claim is still a bit unclear, but based on my results it appears it keeps it close to 5 times colder, for about the same amount of time. 

What I did was take a couple coolers, filled one with Dry Ice and one with wet ice, sealed them up and measured them for a few days. 

Take a look at our graph:

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-01.jpg)
<a href="https://plot.ly/~JeremyMorgan/14/dry-ice-vs-wet-ice/">Click here for a detailed view</a>

I did a minute by minute sampling, and perhaps unsurprisingly the first minute was the coldest. at that point:

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-02.jpg)

Our dry ice was at -111.775 degrees Fahrenheit, and the wet ice was at 26.2634. This is closer to around 4 times colder. But does it keep it cold longer? Not really. Actually if you look at the drop off wet ice actually kept it colder than the room temperature for a while longer, but the difference is small:

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-03.jpg)

This was over the course of a few days, and as you can see they converge toward the end but the wet ice still keeps cool a bit longer. I'm assuming this is because the dry ice disappears. Here are some basic conclusions I derive from this data:

- **Dry Ice Keeps Items Significantly Colder** For a couple days, the temperature was around 4 times colder in the Dry Ice cooler.  
- **Dry Ice Has a Pretty Significant Drop Off.** From -80 to 0 degrees in about 8 hours. Wet ice only got 1.5 degrees warmer in this same amount of time. 
- **Both Methods Cool for Roughly the Same Amount of Time** - I expected the wet ice to stay cool for hours, not days. Although it is much warmer by comparison it lasted just as long. 
- **Dry Ice Is Probably Overkill** - Most of the things people put in a cooler dont need to be -90 degrees. Soda, beer or sandwiches are probably just fine at 32 degrees. 

When I started this project I assumed that dry ice would be much colder, for much longer. I can't draw a ton of conclusions from this experiment just yet. I'm definitely going to run a few more just like it. 

I measured the air temperature as well, but since one of the sensors was faulty the data is bad. 

If you want access to the data [here is the dataset](https://data.sparkfun.com/streams/XGlZ2D0X26cZ9XYX3bVl). I'll surely do more with it in the future. Now, here are the details for how I set it up.

## Setting up the Project

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-04.jpg)

To set this up you'll need:

- 5 Waterproof DS18B20 Sensors  ( [https://www.adafruit.com/products/381](https://www.adafruit.com/products/381))
- 2 Styrofoam Coolers
- Raspberry Pi ( I used a 3, but 1 or 2 will work)
- Equal parts dry ice and standard ice

I wired these sensors together in a somewhat crude fashion, but you may want to do something nicer like a junction block or something. 

What I did for each sensor was grab the serial number and label it so I knew which sensors I was reading:

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-05.jpg)

And placed each of them in the cooler. I had one at the top of each cooler, and one at the bottom, and one sensor out in the open air to measure room temperature.

### Setup the Pi with the DSB1820 Sensors 

First we need to get the pi ready for the DSB1820 sensors. To do that we will set up our one wire support.

Open up your boot config (by typing sudo nano /boot/config.txt) and add the following line:

```
dtoverlay=w1-gpio
```

Then reboot the pi (sudo reboot). After rebooting, type the following:

```
sudo modprobe w1-gpio
sudo modprobe w1-therm
cd /sys/bus/w1/devices
ls
```

It should look like this: 

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-06.jpg)

Now what you're seeing here is a set of directories, one for each sensor. To make sure they all work, cd into each directory and check them with the following command:

```
cd 28-XXXXXXX (your serial number)
cat w1_slave
```

It should look like this:

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-06-b.jpg)

the YES means it works. If you're following along and just want to check all 5 really quick use this script :

[https://github.com/IoT-Projects/SuperCool/blob/master/checksensors.sh](https://github.com/IoT-Projects/SuperCool/blob/master/checksensors.sh)

It will go through all your sensors and check them. 

Now, let's write a script to grab the values. 

###Script to Read Temperature Values

For this we will use Python, and this script will read the values from the sensors that come out of that folder we were in earlier. 

For a lot of this first part we will lift some code from Adafruit and make it our own. Put this at the top of your script:

```python
import os
import glob
import time
import subprocess

os.system('modprobe w1-gpio')
os.system('modprobe w1-therm')

base_dir = '/sys/bus/w1/devices/'
```

This is what you'll need to get started reading the sensors. 

Next, you'll need to create a list of serial numbers from your devices. Yours will be different from mine. 

```python
sensor = ('28-0115649279ff','28-011564966aff','28-011564d991ff','28-01156492b9ff','28-011564c7a9ff')
```

Next, we'll create a function to read the temp in raw mode:

```python

def read_temp_raw(sensor):
    
    device_folder = glob.glob(base_dir + sensor)[0]
    device_file = device_folder + '/w1_slave'
    catdata = subprocess.Popen(['cat',device_file], stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    out,err = catdata.communicate()
    out_decode = out.decode('utf-8')
    lines = out_decode.split('\n')
    return lines
    
```

This function will be called by our read_temp function, that reads that raw data into a string array and parses it:

```python

def read_temp(sensorid):
    lines = read_temp_raw(sensor[sensorid])
    while lines[0].strip()[-3:] != 'YES':
        time.sleep(0.2)
        lines = read_temp_raw()
    equals_pos = lines[1].find('t=')
    if equals_pos != -1:
        temp_string = lines[1][equals_pos+2:]
        temp_c = float(temp_string) / 1000.0
        temp_f = temp_c * 9.0 / 5.0 + 32.0
        return temp_f

```

This next part is tricky. I plugged in each sensor individually to get the serial number of each. Now, we must match the serial number with the position of the sensor. 

For this experiment I attach one sensor to the lid (top) and one to the bottom of the container. This way the top one will measure the air temperature and the other will be submerged in water for the wet ice, and covered with dry ice. This is just my initial thoughts on this experiment, feel free to try some other configurations. Here's how we gather the readings:


```python
# Get readings
outside = read_temp(0)
weticetop = read_temp(1)
weticebot = read_temp(2)
dryicetop = read_temp(3)
dryicebot = read_temp(2)

## get averages

weticeavg = (weticebot + weticetop) / 2
dryiceavg = (dryicebot + dryicetop) / 2
```

So basically we arrange the serials in a string array and address them. The read_temp function takes in this argument and then passes it to read_temp_raw which then extracts the information from the sensor and sends it back to read_temp which parses the information and sends back a number. 

I added an average to the mix, which as you can see is just an average between the top and bottom sensor. I don't know if it will provide value or not, but decided to throw it in. 

###Storing the Data on Adafruit.IO

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-07.jpg)

I love using Adafruit.IO for their cool visualizations. I'm not going to go into setting up a dashboard in this article, but If you want to know how to set up your own Adafruit.IO dashboard <a href="https://www.jeremymorgan.com/internet-of-things/how-to-adafruit-io/">check out this article for instructions</a> or you can follow <a href="https://www.udemy.com/hands-on-internet-of-things-raspberry-pi/?couponCode=JEREMYMORGANDOTCOM">lecture 15 of my IoT course.</a>

To connect to my dashboard, I added the following code:

```python
def send_to_adafruit(url,values):

    ourvalue = {'value' : values }
    data = urllib.urlencode(ourvalue)
    req = urllib2.Request(url, data)
    req.add_header('Content-Type','application/x-www-form-urlencoded; charset=UTF-8')
    req.add_header('x-aio-key',aiokey)

    response = urllib2.urlopen(req)

    return response
```

This is a function to connect to Adafruit, you will need to include urllib and urllib2, as well as use your own aiokey. 

Then to send the data (each field is sent one at a time with Adafruit)

```python
## Sending data to Adafruit.IO 
send_to_adafruit(outsideUrl,outside)
send_to_adafruit(weticetopUrl,weticetop)
send_to_adafruit(weticebottomUrl,weticebot)
send_to_adafruit(dryicetopUrl,dryicetop)
send_to_adafruit(dryicebottomUrl,dryicebot)
send_to_adafruit(dryiceavgUrl,dryiceavg)
send_to_adafruit(weticeavgUrl,weticebot)
```
This sends our data out to a nice dashboard. 

### Sending Data to Sparkfun

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-08.jpg)

I decided to send some data to Sparkfun for the heck of it. You can get instructions for doing that here or <a href="https://www.udemy.com/hands-on-internet-of-things-raspberry-pi/?couponCode=JEREMYMORGANDOTCOM">check out lecture 13 of my IoT course</a>.

Since Sparkfun uses values passed in the URL, we build a long URL string like so:

```python
oururl = sparkfunprojecturl + '?private_key=' + sparkfunprivatekey +  '&dryiceavg=' + dryiceavg + '&dryicebottom=' + dryicebot + '&dryicetop=' + dryicetop + '&outside=' + outside + '&weticeavg=' + weticeavg + '&weticebottom=' + weticebot + '&weticetop=' + weticetop
```
The variables sparkfunprojecturl and sparkfunprivatekey are defined at the top of the script and you'll need to get your own. 

Then we call it:

```python
content = urllib2.urlopen(oururl).read()
```

We don't do anything with the content returned, but you can if you choose to. This will put send our data to the sparkfun feed found here. 


###Update every minute

Next, I want to call this script once a minute, so I'll use crontab to do that:

```
crontab -e
```

I want to call my script once a minute, so I add the following line to my crontab: 

```
* * * * * /usr/bin/python /home/pi/projects/supercool/readtemps.py
```

Your filename will be different. This simply calls the script once a minute and sends the data to our endpoints. <a href="http://kvz.io/blog/2007/07/29/schedule-tasks-on-linux-using-crontab/">For more information on cron, click here. </a>

After this, the script started running and gathering data!


##Summary

![Dry Ice ws Wet Ice](/images/dry-ice-vs-wet-ice/dry-ice-vs-wet-ice-09.jpg)

So I was curious about this claim and decided to tackle it. I didn't learn much from this, other than the fact that wet ice in a sealed cooler lasts longer than I would have thought. There were a lot of variables here outside my control, but I think it's a fun project and I will build on it some more. I hope one of you decides to take this on and improve on it. If so please share it with me!

###Important Links:

Here are some links relevant to this project, without these folks this wouldn't have been possible (or at least this easy!)

- [**Adafruit**](https://www.adafruit.com/)
- [**Adafruit.IO** ](https://io.adafruit.com/JeremyMorgan)
- [**Sparkfun**](https://data.sparkfun.com)
- [**Plot.Ly**](https://plot.ly)
- [**Lake Stop Grocery**](https://www.facebook.com/Lake-Stop-Grocery-181462005222622/)

And as I plugged several times in this article I created a course teaching you how to do experiments like this with a Raspberry Pi and you can [**get 50% off by using this link**](https://www.udemy.com/hands-on-internet-of-things-raspberry-pi/?couponCode=JEREMYMORGANDOTCOM). 

{% include custom/asides/iot-newsletter-banner.html %}
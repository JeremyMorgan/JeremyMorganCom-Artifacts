---
layout: post
title: "How to set up Free SSL for your Website"
date: 2016-04-22 20:54
updated: 2018-03-25 12:22
comments: true
categories: 
- Programming
- Tutorials

author: Jeremy Morgan
sharing: true
description: In this post I show you how to get a free SSL cert for your website with LetsEncrypt!

ogimage: https://www.jeremymorgan.com/images/free-ssl-website/free-ssl-website-og.jpg
permalink: /blog/programming/how-to-set-up-free-ssl/
---
If you're reading this then welcome to the new server! Due to my web host taking a huge nose dive, I had to scramble to find new hosting. In doing so I explored SSL solutions and a friend suggested Let's Encrypt. I liked the experience so much I thought I'd share it. 

<!-- more -->
##My Predicament

So my old host (unnamed) just imploded. What started as a nice little company with fast servers and great support, got bought out. The new company did what many big companies tend to do, which is cut costs and lower the quality of the product. They did this by giving us all a "server upgrade" which turned out to be a terrible service. The traffic from my site was crashing the cheap server quite frequently. I would call and get no answer, and emails were answered by outsourced support personnel who were just copying and pasting text into emails to me. 3 years of solid service vanished overnight. 

So, I needed to move my site fast, and since I have SSL and all my pages are spidered in Google with SSL, it would be wise to continue using it. I didn't want to even attempt to ask these support people to export my cert to move it here so I started looking at options. So I looked at [LetsEncrypt](https://letsencrypt.org/). Since I moved my site to a nice [new Linux server](https://www.digitalocean.com/?refcode=ca6f81fa42b4) I knew this would be an option for me, and decided to give it a try. 

##How to Install Free SSL/TLS

So I had my nice little NginX server set up and all I had to do was the following:

```
sudo apt-get install git
git clone https://github.com/letsencrypt/letsencrypt
cd letsencrypt
./letsencrypt-auto --help
```

This installed the per-requisites and the LetsEncrypt app. They have two options for installing the certs, one is a standalone method, and the other is a "webroot" plugin. The standalone method requires you to stop your server, while the webroot option will do it with the server running. I wasn't too worried about stopping things so I simply ran:

```
sudo /home/web/.local/share/letsencrypt/bin/letsencrypt certonly --webroot -w /var/www/html -d jeremymorgan.com -d www.jeremymorgan.com
```

<img src="/images/free-ssl-website/free-ssl-website-01.jpg" "Free SSL Website">

And that created my certs. I wanted to strengthen things up a bit, and I'll show what I did

###Generate Strong Diffie-Hellman Group

To generate a strong Diffie-Hellman group, I ran the following command: 

```
sudo openssl dhparam -out /etc/ssl/certs/dhparam.pem 2048
```

Note the location of the cert, I'll be adding that to my default config. Here is everything I added to it: 

```
listen [::]:443 default_server;
listen 443 ssl default_server;

	server_name         www.jeremymorgan.com jeremymorgan.com;
	ssl_certificate     /etc/letsencrypt/live/jeremymorgan.com/fullchain.pem;
	ssl_certificate_key /etc/letsencrypt/live/jeremymorgan.com/privkey.pem;
	ssl_trusted_certificate /etc/letsencrypt/live/jeremymorgan.com/chain.pem;
    	
	ssl_protocols       TLSv1 TLSv1.1 TLSv1.2;
	ssl_prefer_server_ciphers on;
	ssl_dhparam /etc/ssl/certs/dhparam.pem;
        
	ssl_ciphers 'ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:AES:CAMELLIA:DES-CBC3-SHA:!aNULL:!eNULL:!EXPORT:!DES:!RC4:!MD5:!PSK:!aECDH:!EDH-DSS-DES-CBC3-SHA:!EDH-RSA-DES-CBC3-SHA:!KRB5-DES-CBC3-SHA';
        
	ssl_session_timeout 1d;
	ssl_session_cache shared:SSL:50m;
	ssl_stapling on;
	ssl_stapling_verify on;
	add_header Strict-Transport-Security max-age=15768000;

```

After that, save the file and restart Nginx:

```
sudo service nginx reload
``` 

Is that it? Yes that really is it. 

<img src="/images/free-ssl-website/free-ssl-website-02.jpg" "Free SSL Website">

Now I have a nice little green lock there. Not much different than the last cert I had:

<img src="/images/free-ssl-website/free-ssl-website-03.jpg" "Free SSL Website">

Not too bad huh? 


##Conclusion

I shared this so you can see exactly how easy it is to use LetsEncrypt to set up free SSL certs for your site. The aim of this project is to encrypt everything, which is a fantastic idea. 

So go grab a [$5 server](https://www.digitalocean.com/?refcode=ca6f81fa42b4) put a [Free SSL cert on it](https://letsencrypt.org/) and you're good to go! 

What do you think? Share it in the comments. 

<br />
<br />
{% include custom/asides/programming-footer.html %}
<br />


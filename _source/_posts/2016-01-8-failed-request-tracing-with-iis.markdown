---
layout: post
title: "Failed Request Tracing with IIS"
date: 2016-01-08 19:42
comments: true

categories: 
- Programming
- DotNet
- DevOps

description: A great tool I've discovered recently is the Failed Request Tracing Tool is IIS. If you're building an ASP.Net application and having issues with requests it's a fantastic tool. I'll show you how to use it. 

permalink: /blog/programming/how-to-dapper-web-api/
author: Jeremy Morgan
sharing: true
comments: true
ogimage: /images/dapper-how-to/dapper-how-to-og.jpg

---
A great tool I've discovered recently is the Failed Request Tracing Tool is IIS. If you're building an ASP.Net application and having issues with requests it's a fantastic tool. I'll show you how to use it. 

<!-- more -->

Are you: 

- Getting a 500 error with messages suppressed? 
- Getting a permission denied and don't know where it's being denied?
- Getting an error that doesn't show up in the logs?

Each of these are good candidates for using the failed request tracing tool. This captures data right when the server gets hit. These are activities that happen right at the front, even before they can be logged. 

In your IIS Manager, select your website. In the Actions panel under Manage Web Site click "Failed Request Tracing.." 

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-001.jpg)

In the next screen, you'll enable it, and click OK. 

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-002.jpg)

Next, find the "Failed Request Tracing Rules" icon, and click it: 

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-003.jpg)

In the next screen, we'll add a rule. Right click in the open area and select "Add"

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-004.jpg)

Select the content you'd like to trace (I usually select all):

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-005.jpg)

On this screen, type in 400-999 to capture the full range of errors

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-006.jpg)

Select your trace providers (I usually select all of them)

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-007.jpg)

Then, make a request to your web site (either through browser, ajax, etc)

Next in your inetpub folder under logs, you'll see a new FailedReqLogFiles folder. In there will be generated folders. Select the latest one. 

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-008.jpg)

In here you'll see a set of xml files for each individual request.

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-009.jpg)

Double click to open it up, and you'll see very detailed information. In this case it shows I have a certificate error, that is not explained on the error page or the error log, but I've found it here and can move on.

![failed request tracing](/images/failed-request-tracing-IIS/failed-request-tracing-IIS-010.jpg)

And that's it! Make sure to turn it off once you've solved your problem. 

While IIS admins have probably been using this for years, it's a helpful too for developers as well, especially ones who work on implementation as well as development. 

Let me know in the comments what you think. 

- Jeremy 

<a href="https://affiliates.arvixe.com/track.php?id=5348&tid3=frontpage" target="_blank">
<img style="border:0px" src="https://affiliates.arvixe.com/media/banners/All.486.60.gif" width="486" height="60" alt="Cheap ASP Hosting"></a>
<br>

####<a href="https://affiliates.arvixe.com/track.php?id=5348&tid3=frontpage">Want Extreme ASP.Net hosting for only $4 a month? Click here to see this deal!!</a>
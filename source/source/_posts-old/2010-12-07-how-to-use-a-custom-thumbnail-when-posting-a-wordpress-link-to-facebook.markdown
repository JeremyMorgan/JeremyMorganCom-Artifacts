---
comments: true
sharing: true
date: 2010-12-07 22:34:37
layout: post
slug: how-to-use-a-custom-thumbnail-when-posting-a-wordpress-link-to-facebook
title: How to use a custom thumbnail when posting a WordPress link to Facebook
wordpress_id: 302
categories:
- Tutorials
permalink: /tutorials/wordpress/how-to-use-a-custom-thumbnail-when-posting-a-wordpress-link-to-facebook/
author: Jeremy Morgan

tags:
- Facebook
- PHP
- Social Media
- wordpress
- WordPress help
- wordpress seo
- WordPress template
- WordPress Themes
---

If you've ever posted a link to Facebook, you know that it brings up a thumbnail image for that page (sometimes) and it chooses them from random images on the page. Sometimes you'll only have one to choose from, sometimes hundreds. But you may want a specific image to show when you post that link, and Facebook has provided a way to do that. But if you're using WordPress it's not simple HTML hack like with other pages, but it's still really easy. I'll show you how.

**The Thumbnail**

As you know, when you post a link to Facebook, it crawls the page and brings up a thumbnail:

[![How to show custom thumbnail on Facebook](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/showing_picture_facebook1.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/showing_picture_facebook1.jpg)

As you can see this only gives me one option for a thumbnail, which is pulled from an image on the side. Obviously I don't want all my links to show my smiling mug (face it, nobody wants that) so I have to have a way to change it. Thankfully, Facebook [does provide a way](http://developers.facebook.com/docs/reference/plugins/like) for you to specify your own thumbnail:

    
    <link rel="image_src" href="http://www.yourwebsite.com/yourimage.jpg">


But that doesn't help much if you're using wordpress, unless you plan on hacking it into every post, or using one image for the whole site. Here is how you do it.

**Step 1: Add this code to your header.php file:**

    
    <?php $image = get_post_meta($post->ID, 'facebookimage', true);
    if ($image) {
    echo "<link rel=\"image_src\" href=\"" . $image . "\">";
    } ?>
    


Go to **Appearance** on the left hand menu and select "Editor"

Select "Header.php" on the right hand side.

Paste the code somewhere in the <head> like so:

[![Edit your WordPress Template header](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/wordpress_template1.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/wordpress_template1.jpg)

If you want a quick breakdown of the code, it's pretty simple. You're creating a variable called $image, and using the [get_post_meta()](http://codex.wordpress.org/Function_Reference/get_post_meta) function from wordpress to grab a custom field (we'll cover that next) and if it exists, we'll echo out some html to go into the header. We pass $post->ID to the function so it knows which post to grab it from, and "facebookimage" is the name of our custom field.

**Step 2: Create and upload your image. **

Generally the thumbnail images are 72 pixels high and 72 pixels wide. You can create an image to these specs for best results. Or, as long as your image maintains that 1:1 aspect ratio, you're fine. For example a 300px x 300px image would work just as good, Facebook will crop it to 72. Then you upload it, using ftp, or your [WordPress interface](http://codex.wordpress.org/Using_Images). Copy or save the url to the image (Example: http://www.yoursite.com/images/yourimage.jpg).

**Step 4: Create a custom field in WordPress**

When you go to make a new post in WordPress, add a custom field. This is really easy, it's in the box below your post:


[![How to add a custom field to WordPress](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/wordpress_custom_field1.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/wordpress_custom_field1.jpg)




Click on "Enter new" and create a field called "facebookimage". For the value, simply paste in the URL of the image you uploaded.




Now, you're done, and the next time you go to post that link, a better image will come up:




[![How to show a custom thumbnail on Facebook link with WordPress](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/showing_picture_facebook-2.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2010/12/showing_picture_facebook-2.jpg)




It seems like a long process, but it's actually less than 10 minutes, and you only have to do the template modification once. Then in future posts, you can drop the URL in the custom field every time you publish, and you're set!! If you have any questions, feel free to [contact me on Facebook](http://www.facebook.com/home.php?#!/pages/JeremyMorgancom/153875204649532) or shoot me an email.


{% include custom/asides/tutorials-footer.html %}

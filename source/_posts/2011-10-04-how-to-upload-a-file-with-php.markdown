---
comments: true
sharing: true
date: 2011-10-04 17:25:52
updated: 2018-03-25 12:22
layout: post
slug: how-to-upload-a-file-with-php
title: How to upload a file with PHP
categories:
- Tutorials
permalink: /tutorials/php-tutorials/how-to-upload-a-file-with-php/
author: Jeremy Morgan
ogimage: https://www.jeremymorgan.com/images/php-ogimage.png

tags:
- how to php
- PHP
- php how to
- php tutorials
- php5
- tutorials
- upload

description: Step by step tutorial to show you how to upload a file with PHP.
---

If you want to upload files to your website, making a PHP file uploader is easier than you think. Today I'm going to show you a quick example how to build one that you can easily use, and modify for your needs.

The first thing I'll start is a php page. I'm using a "index switched" page format here, meaning everything will be done with one file. This is a rather uncommon way of doing it, but once you start getting used to it, it's a much more efficient way to build your pages. I'll do a full article on that soon, but for today just follow along. Create a file that looks like this:



{% codeblock %}
<?php
    
    switch($_REQUEST['mode']){
    
    	default:
    
    	break;
    
    }
    
?>

{% endcodeblock %}
	
	
By following the code, you can see we've created a switch statement that will control what the page does. For the "default" switch, we want it to draw our upload form. This will be what the person sees when they first bring up the page. Here is what our upload form will look like:

    
    <form action="index.php" method="POST" enctype="multipart/form-data" >
        <input type="hidden" name="MAX_FILE_SIZE" value="8000000" />
        <input type="hidden" name="mode" value="doupload" />
        Select file to upload: <input name="uploadedfile" type="file" /><br />
        <input type="submit" value="Upload your File" />
    </form>


This form will be what we use to select the file. It's just a standard form, but note a couple additions: the enctype (encoding type) and two of the hidden fields. the MAX_FILE_SIZE field is pretty self explanatory. This limits the size of the file that can be uploaded.** Security Note: **This only limits the file size when using this form, and can be easily bypassed. In a public facing site you should not rely solely on this method of limiting file size.

The "mode" field is used to tell the PHP script to upload the file, which we will put in our switch statement. Your file should now look like this:

    
    <?php
    
    switch($_REQUEST['mode']){
    
    	case "doupload":
    
    	// upload actions go here
    
    	break;
    
    	default:
    
    	?>
    	<form action="index.php" method="POST" enctype="multipart/form-data" >
    	<input type="hidden" name="MAX_FILE_SIZE" value="8000000" />
    	<input type="hidden" name="mode" value="doupload" />
    	Select file to upload: <input name="uploadedfile" type="file" /><br />
    	<input type="submit" value="Upload your File" />
    	</form>
    	<?php
    
    	break;
    }
    
    ?>


When you bring up this page in a browser, you should see your upload form.

[![Tutorial: How to upload a file with php](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/10/upload-form-php-1.jpg)](http://jeremymorgan.s3.amazonaws.com/wp-content/uploads/2011/10/upload-form-php-1.jpg)

Now by itself, this form won't do anything. We need to add some action in the "doupload" section of the switch statement:

    
    	case "doupload":
    
    	// upload actions go here
    
    	break;


When the form is submitted, only everything outside the switch statement will be performed, and by adding in this case statement, when you set mode=doupload you also run all the statements within that block. This performs the action of two separate pages in one. Rather than call an upload.php you call the same page with a different switch.

Now we'll add in some statements to upload the file.

    
    	case "doupload":
    
    	// folder we'll upload files in
    	$uploadfolder = "uploads/";
    
    	// final path where we want to store the file
    	$ourpath = realpath($uploadfolder) . basename( $_FILES['uploadedfile']['name']); 
    
    	if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $ourpath) == true) {
    
    		echo "uploaded " . $_FILES['uploadedfile']['name'] . " successfully";
    
    	} else{
    		echo "could not upload the file";
    	}
    
    	break;


I'll explain what we're doing above. The steps to this process are as follows:



	
  1. Set the $uploadfolder variable to the name of the folder.

	
  2. Create a "final path" which is the absolute path where we want to put the file. We use the realpath function to get the full name of the path.

	
  3. Use the move_uploaded_file function to move the file from a temporary location to the final location and rename it.

	
  4. If successful, show the new name of the file. This variable ($_FILES['uploadedfile']['name']) is the name of the file as it was when it entered the browser.


Now you should see a message saying it was uploaded successfully. If you don't here are some things to check:

	
  1. Permissions in the folder may not be correct.

	
  2. File may be too large. There is a browser file size limit and a server size limit to adhere to.


So now that we have that done, lets look at the final code:

**The Finished Code:**



    
    switch($_REQUEST['mode']){
    
        case "doupload":
    
            // folder we'll upload files in
            $uploadfolder = "uploads/";
    
            // final path where we want to store the file
            $ourpath = realpath($uploadfolder) . basename( $_FILES['uploadedfile']['name']); 
    
            if(move_uploaded_file($_FILES['uploadedfile']['tmp_name'], $ourpath) == true) {
    
                echo "uploaded " . $_FILES['uploadedfile']['name'] . " successfully";
    
            } else{
    
                echo "could not upload the file";
    
            }
    
        break;
    
        default:
    
            ?>
            <form action="index.php" method="POST" enctype="multipart/form-data" >
            <input type="hidden" name="MAX_FILE_SIZE" value="8000000" />
            <input type="hidden" name="mode" value="doupload" />
            Select file to upload: <input name="uploadedfile" type="file" /><br />
            <input type="submit" value="Upload your File" />
            </form>
    
            <?php
    
        break;
    
    }


**Congratulations! You've created a script to upload a file in PHP.**

But you're not done yet. It should be advised that this is a very insecure script as it sits. It is intended for educational purposes only and will work great for personal use or on an internal network with people you trust, but do not put this on the internet as it is! It is very vulnerable to cross site scripting and exploits. Someone can bypass the file size limit or upload executable files.

What you should add to this file before making it public:



	
  1. Actual file size limitation (in addition to browser based limitation)

	
  2. Checking of extensions (don't allow anything but what types you're looking for)

	
  3. In depth check of file type

	
  4. checking of permissions once uploaded

	
  5. limit amount of files uploaded by IP address


This will keep your script from becoming a gateway into your site.

I hope this helps new PHP programmers understand how to make an upload script, if you're doing something cool with this send me an email!

{% include custom/asides/tutorials-footer.html %}

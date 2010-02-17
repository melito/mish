Mish Phone
==========

![](http://img.skitch.com/20100217-e6n5pmehefmbk9dh4fn2uau8c9.jpg)

Mish Phone is an iPhone app.

It's a way for designers developing html apps on the iPhone to free themselves from having to push refresh.

Using Mish you no longer have to reload Safari after edit/saving your code.  
The web browser just updates.

It consists a single view with a UIWebView instance, a UITextField, and a UIButton.


Why?
----

I was putting together a small html & javascript app for a friend.

During development I had the iPhone simulator open with MobileSafari open on the page.

My workflow went something like this:

    Edit some files.        Hit reload.
    Restart sinatra.        Hit reload.
    Tweek some CSS.         Hit reload.
    Tweeked some more CSS   Hit reload.
    Edit some javascript    Hit reload.
    Begin to hate life      Hit reload.
  

You get the idea.

Everything of value in this project comes from the left column.

Nothing of value in this project comes from the right column.

Everything you get paid for in a project lives in the left column.

That means that things in the right column are costing you money/robbing your customer.

**Fuck the right column**

These are computers damnit!  Really fucking expensive computers.
Are you really willing to pay 2 grand for a machine that won't refresh on its own?

How it works
------------

After the app loads, a TCP server starts on port 8080.

Connections to this port will cease when a newline is sent.

Anything written to this port will be shucked into the UITextField.

After that the UIWebView is refreshed.

#### Wtf?  How is that helpful?  That sounds like barely anything at all... ####

IT SOLVES A LOT! 

[For example you can use it with kicker.](http://github.com/alloy/kicker)

Go to the root of your project and put this in a .kick file:

    require 'socket'
    url = "http://0.0.0.0:9292" # Replace this with what you want refreshed
    host = "0.0.0.0" # Host the web page lives on
    port = "8080"
    process do |files| 
      socket = TCPSocket.new(host, port)
      socket << url
    end

Then run `kicker`

Anytime you edit your project, kicker will write to the TCP server on the phone causing a refresh.

This is awesome.  
It's like what Frontpage and Dreamweaver wanted to be in the WYSIWYG IDE department only without thousands of wasted man hours and all the other unneccsary bullshit that came packaged with them.

Since kicker allows you to write 'handlers' you can script all sorts of logic into this (ie, load different url's when different files are edited).

What Mish is not.
-----------------

* Perfect.
* For everyone.
* Currently on the AppStore.
* A Space Pen.

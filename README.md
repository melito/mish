Mish Phone
==========

Mish Phone is an iPhone app.
It's a single view with a UIWebView instance, a UITextField, and a UIButton.

Why?
----------

I was putting together a small html & javascript app for a friend.
During development I had the iPhone simulator open with MobileSafari open on the page.

I'd edit some files.  Hit reload.
Restart sinatra.      Hit reload.
Tweek some CSS.       Hit reload.
Tweeked some more CSS Hit reload.
Edit some javascript  Hit reload.
Begin to hate life    Hit reload.

You get the idea, but take a moment to look at the above chart.

Everything of value in this project comes from the left column.
Nothing of value in this project comes from the right column.

Everything you get paid for in a project lives in the left column.
Clients don't usually pay people to press buttons.  

That means that things in the right column are costing you money.

**Fuck the right column**

That right column is not a necessary evil.

These are computers damnit!  Really fucking expensive computers.
Are you really willing to pay 2 grand for a machine that won't refresh on its own?

LET MISH DO THAT MANUAL LABOR BULLSHIT FOR YOU, DAMNIT!

How it works
----------

After the app loads, a TCP server starts on port 8080.
Connections to this port will cease when a newline is sent.
Anything written to this port will be shucked into the UITextField.
After that the UIWebView is refreshed.

*Well wtf? How is that helpful?  That sounds like barely anything at all. Fuck you.  I was getting excited.*

IT SOLVES A LOT! 

[For example you can use it with kicker.](http://github.com/alloy/kicker)
Go to the root of your project and put this in a .kick file:

`require 'socket'

url = "http://0.0.0.0:9292/"
host = "0.0.0.0"
port = "8080"

process do |files|
  socket = TCPSocket.new(host, port)
  socket << url
end
`

Then run `kicker`

Anytime you edit your project, kicker will write to the TCP server on the phone causing a refresh.

This is awesome.  It's like what Frontpage and Dreamweaver wanted to be in the WYSIWYG IDE department only without thousands of wasted man hours and all the other unneccsary bullshit that came packaged with them.


What Mish is not.
----------

Perfect.
For everyone.
Currently on the AppStore.
A Space Pen.

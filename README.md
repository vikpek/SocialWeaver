News
=======
11.11.2013 - Presentation of Social Weaver at the ERP Future 2013 in Vienna

Social Weaver
============

Social Weaver is a prototype that performs Social Weaving. This means integrating social elements into web environments. In this context social elements can be all kinds of web technology that is used for communication. For instance, shoutboxes, chats, forums or wikis, but as well as file uploads or simple links are social elements. 
Web environments are static and dynamic webpages. The visionary goal is to support web applications as well (even browser based ERP systems), but since now this prototype is not capable of such functionality. 

For more details on Social Weaving and Social Weaver you may check out the master thesis, you'll find in this repository. Publications and development is in progress and will be documented here until further notice. So stay tuned :-)

ERP Future 2013
================

This section is for the audience of the ERP Future 2013 in Vienna, where we proudly present Social Weaver. 

For the case you attended our presentation at the conference, you'll remember that we have woven some social element into the ERP Future website. 

Perform the following steps:

1. Download the specifically designed Firefox Plugin for the ERP Future from http://goo.gl/pPUyZ6 and install it. (You can as well use the plugin from the repository here: 'socialweaver-erp-future.xpi')
2. Finally open "http://2013.erp-future.com/"

You already should see the annotations we made at the live demo in Vienna. (If not - try refreshing the website.)

Keep in mind that this is a read-only plugin that proofs that the annotation made while the presentation are synchronized and accessible to anyone. 

If you want to perform Social Weaving by yourself - check out the next sections (that require more effort). 

Thank you very much for the great time in Vienna!



How to run Social Weaver (for the brave)
=========================

The current version is a prototype in early development and not meant for productive usage. But feel free to fool around with the code and start weaving!

The repository contains the web service (folder SocialWeaverWS) and a firefox plugin (social-weaver.zip for source or .xpi for built plugin). Since all actions are synchronized between user sessions, the web service is necessary to use the plugin effectively. 

Run the Web Service
================
The project is designed in IntelliJ, but since it's Maven based - also other development platforms should be capable of resolving all dependencies. Simply build the project and generate a .war file. 

Before you start the web service, you'll need a Postgresql database with a user 'socialweaver' and a evenly called databse. The default password is 's0cialw3av3r' - but you can adjust all those properties in 'database.properties'. The database schema will be built automatically by default, as long the user has the necessary privileges on the database.
 
Now you'll need a running tomcat instance (6 & 7 are both fine). Deploy the target at the path '/sowe' and check whether the web service is running properly by opening 'localhost:8080/sowe'. A nice interface should appear. Just to be safe - check on the database whether the schema has been generated correctly. You should see the tables: anchor and social_element (among others).

Now we are ready to use the plugin!

Run the Plugin
================

In case you run the web service on localhost - then you can directly use the .xpi file for installing the plugin to firefox and start weaving.

If your running the web service at a remote server then you'll have (unfortunately) to compile the plugin by yourself - since the functionality for adjusting the IP to the web service is yet static until this point :-(

For this we recommend the Mozilla online Add-on builder and the according documentation (which is really awesome). In the main.js you can adjust the server address. Once you set this parameter - we're good to go.

Once the plugin is running you should see a little grey bird in the lower corner in the addon bar. Sometimes this bar is hidden - than you need to open 'View' in the menu bar and go to 'Toolbars'. There is the setting for enabling the addon bar.

How to Weave
===============

At this point you should have a running web service and a bird waiting in the lower right corner to be actived. 

There are two modes for the plugin. 
1. Passive Mode
2. Active (or Marking) Mode

In the passive mode Social Weaver is running and displays an social element that exists. Since you just started you'll see nothing. Click the bird (so it turns black) to activate the marking mode. 

In the marking mode basically any element is surrounded with a dotted rectangle. This signalizes what you can mark. Move the mouse over the view until the element you want to mark turns entirely green. Than use the middle-mouse button. 

This opens the annotation editor. The chat box and wiki buttons are just showcases (and the chat box is on our server - so there is no guarantee it will appear ;-)). You can add and change the functionality in the code in 'annotation-editor.js' and '.html'. Or you can just use the custom code field to add any link. This way you could host a shout box on your own and just add the reference to it. 


Thanks for playing along!
==============
If you came this far - we would love to hear from you. Our issue list is endless. Bugs and missing functionality is everywhere. But nevertheless critique from users is hihgly appreciated. You like the idea of Social Weaving and would like to join? That would be great (but better read the Background section first, so you know what you're running into :-P)

Background to the Project
===============
The project started as an idea of Dr. Dirk Draheim (CEO of the ZID University Innsbruck) and Dr. Michael Felderer (Postdoc Researcher at University Innsbruck). The guys proposed it as a topic for a master thesis and MSc. Viktor Pekar (PhD Student at University Innsbruck) was glad to jump right into it! (Which would be me by the way.) 

This project is not sponsored and I'm the only developer working on it (with absolutely not enough time to spare). Since I finished my thesis (you can grab from the repository) it became a non-mandatory activity, which doesn't make it easier to achieve progress. 

We managed to get a paper accepted on social weaving at the ERP Future 2013 in Vienna. The proceedings will be published in April 2014 approximately.

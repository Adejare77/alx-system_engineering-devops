# Application Server

While a web server can also serve dynamic content, this task is usually given to an application server. In this project I add this piece to my infrastructure, plug it to my Nginx and make it serve my Airbnb clone project.

## Gunicorn

Once I got my application server configured, I want to set it up to run by default when Linux is booted. This way when my server inevitably requires downtime (When I have to shut it down or restart it for one reason or another), My Gunicorn process(es) will start up as part of the system initialization process, freeing me from having to manually restart them.
For this to happen I used systemd. Gunicorn is a system initialization daemon for the Linux OS (amongst other things). I  wrote a systemd script which will start my application server for me.

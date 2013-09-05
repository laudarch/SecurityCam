SecurityCam
===========

Author: Dan Ruscoe (dan@ruscoe.org).

Simple script used to operate a security camera using a Linux system and a webcam.

Originally written to run on a Raspberry Pi, but will run on any Linux machine that can support a webcam.

* Captures images from a webcam at a set interval.
* Archives images by date and time.

Requirements
------------
* Bash
* fswebcam
* Apache or other web server

Installation
-------------

* Clone this git repository.

```
git clone git@github.com:ruscoe/Security-Cam.git ~/cam
```

If you choose to clone the repository into a directory other than ~/cam, make sure to update the paths defined at the top of cam.sh.

* Make cam.sh executable.

```
chmod +x ~/cam/cam.sh
```

* Install Apache web server.

* Set up a symbolic link to allow the captured image files to be served by Apache.

```
sudo ln -s ~/cam/www /var/www/cam
```

* Run the camera script.

```
./cam/cam.sh
```

* An automatically refreshing image should now be available at http://$hostname/cam/index.html, where $hostname represents the hostname or IP address of the Apache web server you installed.

Archiving Captured Images
-------------------------

The camera script archives captured images in directories named for the current date and hour. For example, an image captured on 2013-09-03 at 18:59:51 would be archived as follows:

```
~/cam/www/images/archive/2013/09/03/18/2013-09-03_185951.jpg
```

The default capture interval is every three seconds. This generates a lot of images, so it's advisable to run a daily or weekly script to compress or delete old images.

License
-------

Released under the The MIT License.

http://www.opensource.org/licenses/mit-license.php
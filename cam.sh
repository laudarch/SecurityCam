#!/bin/bash

# Captures an image from a webcam at regular intervals.
# Makes two copies of the image, one with a constant file name
# and one with an archive file name.

# Image paths.
readonly CAM_IMAGE_PATH=~/cam/www/images
readonly CAM_ARCHIVE_PATH=~/cam/www/images/archive

# Image capture interval.
readonly CAPTURE_INTERVAL=3

while :
do
	fswebcam -q -r 640x480 -d /dev/video0 /tmp/cam.jpg

	cp /tmp/cam.jpg $CAM_IMAGE_PATH/cam.jpg

	ARCHIVE_PATH=$CAM_ARCHIVE_PATH/$(date +"%Y")/$(date +"%m")/$(date +"%d")/$(date +"%H")
	FILE_NAME=$(date +"%Y-%m-%d")_$(date +"%H%M%S").jpg

	mkdir -p $ARCHIVE_PATH

	cp /tmp/cam.jpg $ARCHIVE_PATH/$FILE_NAME

	sleep $CAPTURE_INTERVAL
done

#!/bin/bash
date > log.txt
for file in `ls|grep '\.mkv\|\.avi\|\.wmv\|\.flv'`
do
echo "$file">>log.txt
#Video only
#avconv -i "$file" -c:v libx264 -c:a copy "${file%%.*}.mp4"
#Audio Only
#avconv -i "$file" -c:v copy -c:a libmp3lame "${file%%.*}.mp4"
#Audio and Video force
avconv -y -i "$file" -c:v libx264 -c:a libvo_aacenc `echo $file | sed 's/...$/mp4/'`
#mv "$file" OLD
done
date >> log.txt


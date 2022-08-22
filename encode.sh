#!/bin/bash

echo "Input file"
echo $1

echo "Output file"
echo $2

ffmpeg -y -i $1 -c:v libx264 -c:a aac -strict experimental -tune fastdecode -pix_fmt yuv420p -b:a 192k -ar 48000 $2

echo "done!!"

exit

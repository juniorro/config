#!/bin/bash

for i in *.mkv; do ffmpeg -i "$i" -codec copy "${i%.*}.mp4" done;


for file in /home/junior/mp4/*.mp4; do jumpcutter -i "$file" -o "/home/junior/mp4/output/${file}"; done

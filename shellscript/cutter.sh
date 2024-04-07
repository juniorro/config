for file in /home/junior/mp4/*.mp4; do jumpcutter -i "$file" -o "/home/junior/mp4/output/${file}"; done
for file in *.mp4; do jumpcutter -i "$file" -o "./output/${file}"; done
for file in *.mp4; do ffmpeg -i "$file" "./output/${file}"; done
for file in *.mp4; do ffmpeg -i "$file" "./audio/${file%.*}.mp3"; done
for file in *.mp4; do ffmpeg -i "$file" -i "./audio/${file%.*}.mp3" -map 0:v -map 1:a -c:v copy -shortest "./withaudio/${file}"; done
ffmpeg -safe 0 -f concat -i videos.txt -c copy onevideo.mp4

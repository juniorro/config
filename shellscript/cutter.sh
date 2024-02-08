for file in /home/junior/mp4/*.mp4; do jumpcutter -i "$file" -o "/home/junior/mp4/output/${file}"; done
for file in *.mp4; do jumpcutter -i "$file" -o "./output/${file}"; done

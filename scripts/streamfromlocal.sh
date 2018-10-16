#!/bin/bash
# brew install ffmpeg --with-tools --with-fdk-aac --HEAD
ffmpeg \
   -s 1280x720 \
   -pixel_format nv12 \
   -r 30 \
   -f avfoundation \
   -i "0:0" \
   -pix_fmt yuv420p \
   -c:v libx264 \
   -preset medium \
   -b:v 3000k \
   -bufsize 3000k \
   -nal-hrd vbr \
   -s 640x360 \
   -g 60 \
   -bf 0 \
   -x264opts scenecut=-1:rc_lookahead=0 \
   -c:a libfdk_aac \
   -b:a 128k \
   -f dash \
   -seg_duration 2 \
   -use_timeline 0 \
   -streaming 1 \
   -index_correction 1 \
   -http_persistent 1 \
   -method PUT \
   http://127.0.0.1:8080/ldash/upload/12345/out.mpd
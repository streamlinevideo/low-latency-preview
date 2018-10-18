#!/bin/bash

echo Oh 💩 here we go!
echo View your stream at http://${1}:8080/ldashplay/${2}/manifest.mpd

# Encoding settings for x264 (CPU based encoder)

x264enc='libx264 -tune zerolatency -profile:v high -preset veryfast -bf 0 -refs 3 -sc_threshold 0'

ffmpeg/ffmpeg \
    -hide_banner \
    -re \
    -f lavfi \
    -i "testsrc2=size=1920x1080:rate=30" \
    -pix_fmt yuv420p \
    -map 0:v \
    -c:v ${x264enc} \
    -g 150 \
    -keyint_min 150 \
    -b:v 4000k \
    -vf "fps=30,drawtext=fontfile=utils/OpenSans-Bold.ttf:box=1:fontcolor=black:boxcolor=white:fontsize=100':x=40:y=400:textfile=utils/text.txt" \
    -method PUT \
    -seg_duration 5 \
    -streaming 1 \
    -http_persistent 1 \
    -utc_timing_url "https://time.akamai.com/?iso" \
    -index_correction 1 \
    -use_timeline 0 \
    -media_seg_name 'chunk-stream-$RepresentationID$-$Number%05d$.m4s' \
    -init_seg_name 'init-stream1-$RepresentationID$.m4s' \
    -window_size 5  \
    -extra_window_size 10 \
    -remove_at_exit 1 \
    -adaptation_sets "id=0,streams=v id=1,streams=a" \
    -f dash \
    http://${1}:8080/ldash/${2}/manifest.mpd  >/dev/null 2>logs/encode.log

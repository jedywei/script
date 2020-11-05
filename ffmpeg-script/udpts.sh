#!/bin/bash
# send out ts by udp protocol
# Usage
#   udpts.sh 2 35000000 ~/Video/bbb_12M.ts  127.0.0.1:1937

if [[ $# < 4 ]]; then
    echo "udpts.sh {loop} {bitrate} {input} {ip:port}"
    echo "for example"
    echo "udpts.sh 2 35000000 ~/Video/bbb_12M.ts 127.0.0.1:1937"
    exit 2
fi

loop=$1
bitrate=$2
input=$3
output=$4
burstbits=$((${bitrate}/1000))
echo "bitrate=${bitrate}"
echo "burst_bits=${burstbits}"

rm -f list.txt
for i in $(seq 1 ${loop}); do printf "file '%s'\n" ${input} >> list.txt; done
ffmpeg -re -f concat -i list.txt -c copy -f mpegts -muxrate ${bitrate} -flush_packets 0 -y "udp://${output}?buffer_size=65536&pkt_size=1316&bitrate=${bitrate}&burst_bits=${burstbits}&fifo_size=1200000"
rm list.txt



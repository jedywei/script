#!/bin/bash
# send out ts by udp protocol
# Usage
#   udp2ts.sh 2 35000000 ~/Video/bbb_12M.ts  ~/Video/bbb_h264_12M.ts 127.0.0.1:1937

if [[ $# < 4 ]]; then
    echo "udp2ts.sh {loop} {bitrate} {input1} {input2} {ip:port}"
    echo "for example"
    echo "udp2ts.sh 2 35000000 ~/Video/bbb_12M.ts ~/Video/bbb_h264_12M.ts 127.0.0.1:1937"
    exit 2
fi

loop=$1
bitrate=$2
input1=$3
input2=$4
output=$5
burstbits=$((${bitrate}/1000))
echo "bitrate=${bitrate}"
echo "burst_bits=${burstbits}"

rm -f list.txt
for i in $(seq 1 ${loop}); do printf "file '%s'\nfile '%s'\n" ${input1} ${input2} >> list.txt; done
ffmpeg -re -f concat -i list.txt -c copy -f mpegts -muxrate ${bitrate} -flush_packets 0 -y "udp://${output}?buffer_size=65536&pkt_size=1316&bitrate=${bitrate}&burst_bits=${burstbits}&fifo_size=1200000"
rm list.txt



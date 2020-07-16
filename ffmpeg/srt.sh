#!/bin/bash

loop=1000

for (( i=0; i<${loop}; i++)) 
do

ffmpeg -re -i bbb_265_2160p60_24M_timecode-422-10.ts -c copy -f mpegts -muxrate 26000000 -flush_packets 0 -y "srt://127.0.0.1:9998?pkt_size=1316&smoother=live&transtype=live&mode=listener"

ffmpeg -re -i bbb_264_2160p60_24M_timecode.ts -c copy -f mpegts -muxrate 26000000 -flush_packets 0 -y "srt://127.0.0.1:9998?pkt_size=1316&smoother=live&transtype=live&mode=listener"

done


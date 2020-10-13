#!/bin/bash

loop=1000

for (( i=0; i<${loop}; i++)) 
do

ffmpeg -re -i bbb_265_2160p60_24M_timecode-422-10.ts -c copy -f mpegts -muxrate 26000000 -flush_packets 0 -y "udp://127.0.0.1:1937?buffer_size=65536&pkt_size=1316&bitrate=26000000&burst_bits=26000&fifo_size=1200000"

ffmpeg -re -i bbb_264_2160p60_24M_timecode.ts -c copy -f mpegts -muxrate 26000000 -flush_packets 0 -y "udp://127.0.0.1:1937?buffer_size=65536&pkt_size=1316&bitrate=26000000&burst_bits=26000&fifo_size=1200000"

done


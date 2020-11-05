#!/bin/bash
# create a constant bitrate h265 bitstream

ffmpeg -i $1 -map 0:v -c:v libx265 -crf 28 -b:v 12M -minrate 12M -maxrate 12M -bufsize 12M -map 0:a:0 -c:a aac -b:a 128k -f mpegts -mpegts_original_network_id 1 -mpegts_transport_stream_id 2 -mpegts_service_id 3 -mpegts_pmt_start_pid 4096 -streamid 0:221 -streamid 1:321 -metadata service_provider="Jedy" -metadata service_name="bbb_station" -muxrate 12M -y bbb_12M.ts 

#!/bin/bash
host=172.17.5.5
echo target host [${host}]

scp /usr/local/lib/libvega3311-capture.so jedywei@${host}:~/bqb
scp /usr/local/lib/libvega_bqb_hevc.so jedywei@${host}:~/bqb
scp /usr/local/lib/libvega_bqb_avc.so jedywei@${host}:~/bqb
scp /usr/local/lib/libvega_bqb_venc.so jedywei@${host}:~/bqb
scp /usr/local/lib/libvega_bqb_vdec.so jedywei@${host}:~/bqb
scp /lib/modules/3.10.0-514.26.2.el7.x86_64/m30smb.ko jedywei@${host}:~/bqb
scp /lib/modules/3.10.0-514.26.2.el7.x86_64/vega3311_fpga.ko jedywei@${host}:~/bqb
scp /usr/local/bin/vega3311_* jedywei@${host}:~/bqb
scp /usr/local/bin/vega_bqb_* jedywei@${host}:~/bqb


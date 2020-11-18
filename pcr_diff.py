#!/usr/bin/env python2

from sys import argv, exit

def readts(filename):
    with open(filename, 'rb') as ts:
        while True:
            pack = ts.read(188)
            if len(pack) == 188:
                yield bytearray(pack)
            else:
                break

def pcr2ms(pcr):
    return round(pcr * 1e3/27e6, 3)

def decode_pcr(buff):
    pcr = 0
    pcr |= buff[0] << 25
    pcr |= buff[1] << 17
    pcr |= buff[2] << 9
    pcr |= buff[3] << 1
    pcr |= buff[4] >> 7
    pcr *= 300
    ext = ((buff[4] & 1) << 8) | buff[5]
    pcr += ext
    return pcr

def get_packet_pcr(pack):
    adapt = (pack[3] >> 4) & 0x03
    if adapt == 1:
        return
    adapt_len = pack[4]
    if adapt_len and (pack[5] & 0x10):
        return decode_pcr(pack[6:])
    return

if __name__ == '__main__':
    try:
        script, filename = argv
    except ValueError:
        print('Bad commandline, usage:')
        print('\tpcr_diff.py filename')
        exit(1)

    prev_pcr = 0
    for pack in readts(filename):
        # parse a packet
        if pack[0] != 0x47:
            print('Bad sync byte:', pack[0])
            continue
        pid = (pack[1] << 8 | pack[2]) & 0x1FFF
        pcr = get_packet_pcr(pack)
        if pcr is None:
            continue
        print("pid: {} pcr: {} pcr delta (ms): {}".format(pid, pcr, pcr2ms(pcr - prev_pcr)))
        prev_pcr = pcr

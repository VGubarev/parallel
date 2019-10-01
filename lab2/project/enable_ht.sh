#!/usr/bin/env bash

for cpunum in $(seq 20 39)
do
    echo 1 > /sys/devices/system/cpu/cpu$cpunum/online
done

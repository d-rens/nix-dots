#!/bin/bash

rx_old=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
tx_old=$(cat /sys/class/net/wlan0/statistics/tx_bytes)

sleep 1

rx_new=$(cat /sys/class/net/wlan0/statistics/rx_bytes)
tx_new=$(cat /sys/class/net/wlan0/statistics/tx_bytes)

rx_bytes=$((rx_new-rx_old))
tx_bytes=$((tx_new-tx_old))

rx_speed=$(echo "scale=1; $rx_bytes/1000000*8/1" | bc -l)
tx_speed=$(echo "scale=1;

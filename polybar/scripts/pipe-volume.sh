#!/bin/bash
volume=$(pactl list sinks | grep '^[[:space:]]Volume:' | head -n 1 | awk '{print $5}')
echo "$volume"

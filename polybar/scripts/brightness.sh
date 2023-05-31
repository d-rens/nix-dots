#!/bin/sh

brightnessctl | grep -oP '\(\K\d+(?=%\))'

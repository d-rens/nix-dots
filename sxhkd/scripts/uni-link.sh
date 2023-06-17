#!/bin/bash
url=$(grep 'url:' ~/current_course/info.yaml | awk '{print $2}' | tr -d "'\"")
firefox "$url"


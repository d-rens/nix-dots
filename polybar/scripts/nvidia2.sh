#!/bin/bash

API_KEY="X743MCNW1KWM7RMQ"
SYMBOL="NVDA"

for i in {1..5}; do
    output=$(curl -s "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$SYMBOL&apikey=$API_KEY")
    if [ -n "$output" ] && [[ "$output" != *"Error"* ]]; then
        price=$(echo "$output" | grep "05. price" | cut -d ":" -f 2 | tr -d '"' | sed 's/,$//' | LC_NUMERIC="en_US.UTF-8" xargs printf "%.*f\n" 2)
        echo $price
        exit 0
    fi
    sleep 1
done

echo "Error fetching Nvidia stock price"
exit 1

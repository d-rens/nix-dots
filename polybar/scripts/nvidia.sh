#!/bin/bash

# Replace YOUR_API_KEY with your Alpha Vantage API key
API_KEY=X743MCNW1KWM7RMQ

# Replace NVDA with the stock symbol you want to track
STOCK_SYMBOL=NVDA

# Retrieve the stock price in JSON format from the Alpha Vantage API
curl -s "https://www.alphavantage.co/query?function=GLOBAL_QUOTE&symbol=$STOCK_SYMBOL&apikey=$API_KEY" | jq -r '.["Global Quote"]["05. price"]'

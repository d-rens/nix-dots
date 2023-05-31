#!/bin/python
# -*- coding: utf-8 -*-
# copied of https://gitlab.com/blutlauge

import requests

CITY = "2905826"
API_KEY = "2b568b7f4a8a7ce6c0ca5f9ba5034f4a"
UNITS = "Metric"
UNIT_KEY = "C"

LANG = "en"

REQ = requests.get("http://api.openweathermap.org/data/2.5/weather?id={}&lang={}&appid={}&units={}".format(CITY, LANG,  API_KEY, UNITS))
try:
    # HTTP CODE = OK
    if REQ.status_code == 200:
        CURRENT = REQ.json()["weather"][0]["description"].capitalize()
        TEMP = int(float(REQ.json()["main"]["temp"]))
        print("{}, {} °{}".format(CURRENT, TEMP, UNIT_KEY))
    else:
        print("calm")
except (ValueError, IOError):
    print("calm")

#!/bin/bash
########################################################################
#
# Setup the Adafruit 16x2 RGB LCD and Keypad
# https://www.adafruit.com/product/1109

sudo apt-get update

sudo apt-get install build-essential python-dev python-smbus python-pip

sudo pip install RPi.GPIO

git clone https://github.com/adafruit/Adafruit_Python_CharLCD.git

cd Adafruit_Python_CharLCD && sudo python setup.py install


# CrotchSniffer: Long Range RFID Thieving  

CrotchSniffer is the RenderLab's variation on the Wiegotcha long range RFID sniffer.  Built to be added to the RenderLab's bag of tricks 
when doing pen tests or educational demonstrations.

It's a fork of the Wiegotcha, by Mike Kelly at exfil.co, was based on previous work by Fran Brown and Bishop Fox (Tastic RFID Thief).  

Before going any further, I want to make sure to acknowledge those who helped this project, without knowing they did so in order to spread the blame
1. Fran Brown and BishopFox for the original Tastic RFID Thief (https://www.bishopfox.com/resources/tools/rfid-hacking/attack-tools/). Much of the original Arduino code was ported over into wiegotcha.c.  
2. pidoorman RPi wiegand reader code (http://pidoorman.co.uk/).  
3. Kyle Mallory for his fork of the above pidoorman code (found at https://gist.github.com/hsiboy/9598741).  
4. Derek Eder for his csv to html code (https://github.com/derekeder/csv-to-html-table).  
5. Gordon Henterson for the wiringPi library (https://projects.drogon.net/raspberry-pi/wiringpi/).  
6. Mike Kelly for the Wiegotcha code that did most of the heavy lifting (https://github.com/lixmk/Wiegotcha/)

## Information  

The CrotchSniffer is a variation on the Wiegotcha. It's simple to build, simple to install, and simple to use tool for capturing RFID 
badge information from unsuspecting targets as well as for use in static demonstations (trade shows, seminars, etc). 

The CrotchSniffer is a Raspberry Pi based system designed to be placed inside an HID Maxiprox 5375 (125kHz ProxII cards), Indala ASR-620 
(Indala), or an HID R90 (13.56mHz iClass cards). 

 - Improvements and changes include some updates to the install scripting to remove some of the manual steps
 - Unifying the power source to use a single 12v source instead of more specialized 12v/5v batteries
 - Breaking out the power to allow for battery power or AC adapter
 - Breaking out the HDMI port to an exterior port (for Diagnostic and Display)
 - Breaking out the USB ports (For diagnostics and camera input)
 - Web Camera activation on card read (for 'Gotcha' demonstrations)
  
The CrotchSniffer is intended to be built with a Raspberry Pi 3 and works best on that, but the code has been tested on an B+ and 2 (with 
external Wi-Fi). Testing has not been done on a RPi zero, but it should work, however the experience may suck.

## Name

The project is named rather appropriatly once you think about it.

The device is designed to sniff RFID access cards, which typically double as corporate ID cards.  Very often, these are on a retractable 
lanyard clipped to a belt or waistband.  This means they dangle at about crotch level, which is much easier to read serupticiously than 
one work on a neck lanyard higher up on the body.

At Defcon 17 in 2009, a similar setup was deployed under a table, behind a table skirt (crotch level) and would snap a picture of the 
presumed owner [Wired Article](https://www.wired.com/2009/08/fed-rfid/).  At a public education event in 2016 I helped orginizr, a 
similar and less serupticious version was deployed quite effectivly.  Thus, when a MaxiProx reader came into my posession, it was logical 
to build a version for offensive, as well as educational and demonstration purposes.

It is literally built to Sniff cards hanging at Crotch level = CrotchSniffer!

## Script Defaults

IP Addresing:  
* eth0 = DHCP  
* wlan0 = 192.168.69.1  
  
Access Point:  
* ESSID: CrotchSniffer  
* Open AP
  
## Code Installation

These scripts are meant to be installed on a freshly installed Raspian image and meant to make the heacy lifting of setup easier.  They 
can be tweaked as necessary.  Feel free to explore install.sh and laststep.sh. They are well commented and should allow you to fully 
understand what they do.  

1. Write a fresh raspbian SD card. You can use Stretch or Stretch lite  
2. Boot up, login and run `sudo su -` to become root
3. Run `apt-get update && apt-get -y install git #Skip this step if you're using full stretch` 
4. In /root run `git clone https://github.com/renderlab/CrotchSniffer.git` 
5. Run `cd CrotchSniffer && ./install.sh` 
6. The install script will walk you through everything, including a reboot (to enable the i2c interface)
7. After first reboot run `screen -dr install` (as root) 
8. Follow instructions to complete final steps of installation.  
9. Proceed to Hardware Installation.
  
## Hardware Installation
Thorough instructions: http://exfil.co/2017/01/17/wiegotcha-rfid-thief/

Short version:  
1. Place the RTC on the RPi's GPIO starting at pin 1 (top left), going down the left side to pin 9.  
2. Run RPi pin 4 to Level Shifter HV in.  
3. Run RPi pin 6 to Level Shifter LV gnd.  
4. Run RPi pin 11 to Level Shifter LV 1.  
5. Run Rpi pin 12 to Level Shifter LV 4.  
6. Run RPi pin 17 to Level Shifter LV in.  
7. Reader TB1-3 to Battery Ground (Black).  
8. Reader TB1-1 to Battery 12v (Red).  
9. Reader TB2-1 to Level Shifter HV 1  
10. Reader TB2-2 to Level Shifter HV 4  
11. Reader TB1-2 to Level Shifter HV gnd.  
12. OPTIONAL: Remove Speaker.  
13. OPTIONAL: Solder haptic motor.  

## BOM
* Raspberry Pi 3: [LINK](https://www.raspberrypi.org/products/raspberry-pi-3-model-b/)  
* RFID Reader (Maxiprox 5375, Indala ASR-620, iClass R90): https://www.amazon.com/dp/B002I15F90/ (Maxiprox 5375. Check eBay for better prices)  
* Level Shifter: https://www.amazon.com/dp/B00RT03GSC/, https://www.sparkfun.com/products/12009 (Many option exist, some may come presoldered for the extra lazy)  
* DS3231 Real-time Clock: https://www.amazon.com/dp/B00HF4NUSS/  
* LM2596 DC to DC step down transformer (https://www.amazon.ca/eBoot-LM2596-Converter-3-0-40V-1-5-35V/dp/B01GJ0SC2C/)
* Micro SD Card (8GB or larger): https://www.amazon.com/dp/B017NT8PNE/ (Just an example)  
* 12v Battery pack: https://www.amazon.com/dp/B00ME3ZH7C/  
* 12v AC adapter (3 Amps minimum): https://www.amazon.ca/OMNIHIL-Power-Adapter-Regulated-Supply/dp/B06XV1SGSH/
* Jumper wires (I use 5 Female to Female and 3 Male to Female): https://www.amazon.com/dp/B01EV70C78/  
* Short USB Mirco Cable: https://www.amazon.com/dp/B00VXH697W/  
* Haptic Motor (Optional) : https://www.adafruit.com/products/1201

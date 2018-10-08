#!/bin/bash

#Prompt for IP
echo "Enter IP Address:"
read IP

#start all processes with proper IP
./APM1 "$IP"
./APM2 "$IP"
./APM3 "$IP"
./APM4 "$IP"
./APM5 "$IP"
./APM6 "$IP"

#get all PID's, if we keep these files seperate, this is kind of pointless
PID1=$(ps aux | grep '[A]PM1' | awk '{print $2}')
PID2=$(ps aux | grep '[A]PM2' | awk '{print $2}')
PID3=$(ps aux | grep '[A]PM3' | awk '{print $2}')
PID4=$(ps aux | grep '[A]PM4' | awk '{print $2}')
PID5=$(ps aux | grep '[A]PM5' | awk '{print $2}')
PID6=$(ps aux | grep '[A]PM6' | awk '{print $2}')

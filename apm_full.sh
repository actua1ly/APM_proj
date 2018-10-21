#!/bin/bash

#create cleanup function
function cleanup {
PIDif=$(ps aux | grep '[i]fstat -d l' | awk '{print $2}')
kill $PID1
kill $PID2
kill $PID3
kill $PID4
kill $PID5
kill $PID6
kill $PIDif
}
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

start="$SECONDS"
curr="$SECONDS"-"$start"
#start running ifstat
ifstat -d l
#loop FOREVER untill killed
while [ ]; do
  # append a line that reads $SECONDS, <%cpu>, <%gpu>
  #TO DO SYSTEM LEVEL(ifstat (RX data rates and TX transmit rates) done? iostat sda (harddisk writes kb/second) df -hm (Availabe_USE%))
  curr="$SECONDS"-"$start"
  echo "$curr"
  "$SECONDS" ", " "$(ps -p "$PID1" %CPU)" ", " "$(ps -p "$PID1" %gpu)" >> APM1.txt
  "$SECONDS" ", " "$(ps -p "$PID2" %CPU)" ", " "$(ps -p "$PID2" %gpu)" >> APM2.txt
  "$SECONDS" ", " "$(ps -p "$PID3" %CPU)" ", " "$(ps -p "$PID3" %gpu)" >> APM3.txt
  "$SECONDS" ", " "$(ps -p "$PID4" %CPU)" ", " "$(ps -p "$PID4" %gpu)" >> APM4.txt
  "$SECONDS" ", " "$(ps -p "$PID5" %CPU)" ", " "$(ps -p "$PID5" %gpu)" >> APM5.txt
  "$SECONDS" ", " "$(ps -p "$PID6" %CPU)" ", " "$(ps -p "$PID6" %gpu)" >> APM6.txt
  "$(ifstat ens33 | awk ' { print $1"\t"$2 } ')" "," " $(iostat -d -k sda | awk ' { print $4 } ')" "," " $(df -h | awk ' { print $4} ')" > APMsys.txt;
  #since we only want to collect every five seconds
  sleep 5
done

#runs cleanup on EXIT
trap cleanup EXIT

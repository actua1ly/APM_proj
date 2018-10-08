#!/bin/bash

#loops untill 900 seconds or 15 minutes has passed
while [ "$SECONDS" -lt 900 ]; do
  # append a line that reads $SECONDS, <%cpu>, <%gpu>
  "$SECONDS" ", " "$(ps -p "$PID1" %CPU)" ", " "$(ps -p "$PID1" %gpu)" >> APM1.txt
  "$SECONDS" ", " "$(ps -p "$PID2" %CPU)" ", " "$(ps -p "$PID2" %gpu)" >> APM2.txt
  "$SECONDS" ", " "$(ps -p "$PID3" %CPU)" ", " "$(ps -p "$PID3" %gpu)" >> APM3.txt
  "$SECONDS" ", " "$(ps -p "$PID4" %CPU)" ", " "$(ps -p "$PID4" %gpu)" >> APM4.txt
  "$SECONDS" ", " "$(ps -p "$PID5" %CPU)" ", " "$(ps -p "$PID5" %gpu)" >> APM5.txt
  "$SECONDS" ", " "$(ps -p "$PID6" %CPU)" ", " "$(ps -p "$PID6" %gpu)" >> APM6.txt
  #since we only want to collect every five seconds
  sleep 5
done

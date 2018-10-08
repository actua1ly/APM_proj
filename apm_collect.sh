#!/bin/bash

#loops untill 900 seconds or 15 minutes has passed
while [ "$SECONDS" -lt 900 ]; do
  # data collection functionality will go here
  #since we only want to collect every five seconds
  sleep 5
done

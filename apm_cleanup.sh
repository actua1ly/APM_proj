#!/bin/bash

#create cleanup function
function cleanup {
#if we combine the files we do the following
kill $PID1
kill $PID2
kill $PID3
kill $PID4
kill $PID5
kill $PID6
#otherwise we do
#kill $(ps aux | grep '[A]PM' | awk '{print $2}') for all APMs
}

#runs cleanup on EXIT
trap cleanup EXIT 

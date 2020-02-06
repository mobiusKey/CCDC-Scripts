#!/bin/bash
while [true]
do
    logFile = ./test.txt
    knownFailures = ./knownFailures

    if [test ! -f "knownFailures"]; then
        echo "" > ./knownFailures;
    fi
        
    if test -f "$logFile"; then
        failures = cat $logFile | grep "authentication failure"
        previousFails = cat $knownFailures | grep "authentication failure"
        
        output = diff <(echo "$failures") <(echo "$previousFails")
        
        echo < (cat $output | grep -E "^\+")
    fi
done
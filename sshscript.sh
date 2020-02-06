#!/bin/bash
echo "running..." > /dev/tty
while :
do

  logFile=$(echo /var/log/auth.log | grep "authentication failure")
  knownFailures=$(cat ./knownFailures)
	echo "checking failures..." > /dev/tty
        output=$(diff <(echo "$logFile") <(echo "$knownFailures"))
        echo "$output" > /dev/tty
echo "saving results..." > /dev/tty
echo "$logFile" > ./knownFailures
sleep 5

done

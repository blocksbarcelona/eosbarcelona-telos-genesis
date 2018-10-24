#!/bin/bash
# eosBarcelona - Josep Rosich - Updated: Oct 17th 2018
# This script validates accounts on chain and outputs a CSV that can be compared with the balance loaded

SCRIPTSDIR=/opt/telos_main/scripts

rm ./validation_ok.csv
rm ./validation_error.csv

for line in $(tail -n +1 telos_snapshot.csv); do
    	ACCOUNT=$(echo $line | tr "," "\n" | head -2 | tail -1)
	BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)
	ORG=$(echo $line | tr -d "\r" | head -1)
	JSON=$($SCRIPTSDIR/teclos.sh get account $ACCOUNT -j)
	NAME=$(echo $JSON | jq .total_resources.account_name | cut -d ' ' -f 1 | cut -d '"' -f 2)
	NET_RES=$(echo $JSON | jq .total_resources.net_weight | cut -d ' ' -f 1 | cut -d '"' -f 2)
	CPU_RES=$(echo $JSON | jq .total_resources.cpu_weight | cut -d ' ' -f 1 | cut -d '"' -f 2)
	LIQ=$(echo $JSON | jq .core_liquid_balance | cut -d ' ' -f 1 | cut -d '"' -f 2)
	TOTAL=$(echo "$NET_RES + $CPU_RES + $LIQ" | bc)

  	if  [ $NAME ]; then
	        if [ $TOTAL !=  $BALANCE ]; then
			echo "$ACCOUNT balance error. $TOTAL != $BALANCE"
                	echo "$ORG,$TOTAL" >> validation_error.csv
        	else
                	echo "$line" >> validation_ok.csv
        	fi
	else
		echo "$line" >> validation_error.csv
	fi
done


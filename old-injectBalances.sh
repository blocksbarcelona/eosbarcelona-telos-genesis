#!/bin/bash
# eosBarcelona - Josep Rosich - Updated: Oct 17th 2018
# This script inject balances on Telos chain

SCRIPTSDIR=/opt/telos_main/scripts
AMT1=3
AMT2=11

for line in $(tail -n +2 tlos_genesis_by_esobarcelona.csv); do
	ACCOUNT=$(echo $line | tr "," "\n" | head -3 | tail -1)
	BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)
	#echo "$ACCOUNT:$BALANCE"
	BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)

	if (( $(echo "$BALANCE <= $AMT1" |bc -l) )); then
		echo "$COUNTER,$EOSKEY,$ACCOUNT,$TELOSCAP"
	else
		#echo "$COUNTER,$EOSKEY,$ACCOUNT,$BALANCE" #>> tlos_genesis_by_esobarcelona.csv
	fi
done


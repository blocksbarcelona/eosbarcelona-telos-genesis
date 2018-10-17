#!/bin/bash

# eosBarcelona - Josep Rosich - Oct 17th 2018
# This script generates the telos_snapshot csv using a validated snapshot.csv file from EOS June snapshot

COUNTER=1
sed 's/'\"'//g' ./snapshot.csv  > ./telos_snapshot.csv
TELOSCAP=40000.0000

for line in $(tail -n +2 telos_snapshot.csv); do
   	ACCOUNT=$(echo $line | tr "," "\n" | head -3 | tail -1)
	ETH=$(echo $line | tr "," "\n" | head -1 | tail -1)
	BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)
	if (( $(echo "$BALANCE > $TELOSCAP" |bc -l) )); then
		echo "$COUNTER,$ETH,$ACCOUNT,$TELOSCAP" >> tlos_genesis_by_esobarcelona.csv
	else
		echo "$COUNTER,$ETH,$ACCOUNT,$BALANCE" >> tlos_genesis_by_esobarcelona.csv
	fi
	COUNTER=$[$COUNTER +1]
done


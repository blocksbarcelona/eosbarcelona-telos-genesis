#!/bin/bash

# eosBarcelona - Josep Rosich - Oct 21st 2018
# Create account and Inject balances

SCRIPTSDIR=/opt/telos_main/scripts
COUNTER=1

for line in $(tail -n +1 telos_snapshot.csv); do
   	ACCOUNT=$(echo $line | tr "," "\n" | head -2 | tail -1)
	BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)
	KEY=$(echo $line | tr "," "\n" | head -3 | tail -1)
	LIQ=$(echo $line | tr "," "\n" | head -7 | tail -1)
	CPU=$(echo $line | tr "," "\n" | head -5 | tail -1)
	BDW=$(echo $line | tr "," "\n" | head -6 | tail -1)
	${SCRIPTSDIR}/teclos.sh system newaccount -x 100 --transfer --stake-net "$BDW TLOS"  --stake-cpu "$CPU TLOS" --buy-ram-kbytes 4 eosio $ACCOUNT $KEY
	$SCRIPTSDIR/teclos.sh transfer eosio $ACCOUNT "$LIQ TLOS"  "Telos genesis balance.Welcome to Telos!"
	echo "$COUNTER"
	COUNTER=$[$COUNTER +1]
done


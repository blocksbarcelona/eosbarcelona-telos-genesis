#!/bin/bash

# eosBarcelona - Josep Rosich - Oct 21st 2018
# Create telos csv with cpu/bandwith/liquid ready to inject

SCRIPTSDIR=/opt/telos_main/scripts
LQD1=3
LQD2=11

LIQ=0
MEM=0
BDW=0
CPU=0

COUNTER=1
TELOSCAP=40000.0000

sed 's/'\"'//g' ./snapshot.csv  > ./telos_snapshot_tmp.tmp

rm telos_snapshot.csv

for line in $(tail -n +1 telos_snapshot_tmp.tmp); do
        ACCOUNT=$(echo $line | tr "," "\n" | head -3 | tail -1)
        EOSKEY=$(echo $line | tr "," "\n" | head -3 | tail -1)
        BALANCE=$(echo $line | tr "," "\n" | head -4 | tail -1)
        KEY=$(echo $line | tr "," "\n" | head -2 | tail -1)
        if (( $(echo "$BALANCE > $TELOSCAP" |bc -l) )); then
                BALANCE=$TELOSCAP
        fi
        if (( $(echo "$BALANCE <= $LQD1" |bc -l) )); then
                LIQ=0.1000
        else
                if (( $(echo "$BALANCE <= $LQD2" |bc -l) )); then
                        LIQ=2.0000
                else
                                LIQ=10.0000
                fi
        fi
        REM=$(echo "scale=4; $BALANCE - $LIQ" | bc -l | sed 's/^\./0./')
        CPU=$(echo "scale=4; $REM / 2" | bc -l | sed 's/^\./0./')
        BDW=$(echo "scale=4; ($REM - $CPU)" | bc -l | sed 's/^\./0./')
        echo "$COUNTER,$KEY,$ACCOUNT,$BALANCE,$CPU,$BDW,$LIQ" >> telos_snapshot.csv
        COUNTER=$[$COUNTER +1]
done

rm ./telos_snapshot_tmp.tmp

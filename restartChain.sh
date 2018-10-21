#!/bin/bash
DIR=/opt/telos_main/data

$DIR/start.sh --delete-all-blocks --genesis-json $DIRa/genesis.json
sleep 5
./createChain.sh

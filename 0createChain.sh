#!/bin/bash
KEY=EOS7u9oCYhFSHTu8uHSFuZsk6Xzovu1X34RhYnSdf3bBUAgvj3J4y
DIR=/opt/telos_main/telos
TECLOS=/opt/telos_main/scripts

$TECLOS/teclos.sh create account eosio eosio.bpay $KEY
$TECLOS/teclos.sh create account eosio eosio.msig $KEY
$TECLOS/teclos.sh create account eosio eosio.names $KEY
$TECLOS/teclos.sh create account eosio eosio.ram $KEY
$TECLOS/teclos.sh create account eosio eosio.ramfee $KEY
$TECLOS/teclos.sh create account eosio eosio.saving $KEY
$TECLOS/teclos.sh create account eosio eosio.stake $KEY
$TECLOS/teclos.sh create account eosio eosio.token $KEY
$TECLOS/teclos.sh create account eosio eosio.trail $KEY
$TECLOS/teclos.sh create account eosio eosio.amend $KEY
$TECLOS/teclos.sh create account eosio eosio.arb $KEY
$TECLOS/teclos.sh create account eosio eosio.exrsrv $KEY
$TECLOS/teclos.sh create account eosio eosio.bpadj $KEY

#contracts
$TECLOS/teclos.sh set contract eosio.token $DIR/build/contracts/eosio.token
$TECLOS/teclos.sh push action eosio.token create '[ "eosio", "10000000000.0000 TLOS", 0, 0, 0]' -p eosio.token
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "178473249.3124 TLOS", "Genesis Snapshot" ]' -p eosio
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "6000000.0000 TLOS", "Telos Founders Reward Pool Issue" ]' -p eosio
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "1000000.0000 TLOS", "Telos Community Reward Pool Issue" ]' -p eosio
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "6000000.0000 TLOS", "Telos Foundation Issue" ]' -p eosio
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "140279973.0000 TLOS", "Exchange Pool" ]' -p eosio
$TECLOS/teclos.sh push action eosio.token issue '[ "eosio", "25000.0000 TLOS", "Genesis Account RAM Issue" ]' -p eosio
$TECLOS/teclos.sh set contract eosio.msig $DIR/build/contracts/eosio.msig
#$TECLOS/teclos.sh set contract trail $DIR/build/contracts/trail.service -p eosio.trail
#$TECLOS/teclos.sh set account permission eosio.trail active '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"eosio","permission":"active"},"weight":1}, {"permission":{"actor":"eosio.trail","permission":"eosio.code"},"weight":1}]}' owner -p eosio.trail
#$TECLOS/teclos.sh set contract eosio.amend $DIR/build/contracts/ratify.amend -p eosio.amend
#$TECLOS/teclos.sh set account permission eosio.amend active '{"threshold": 1,"keys": [],"accounts": [{"permission":{"actor":"eosio","permission":"active"}, "weight":1}, {"permission":{"actor":"eosio.trail","permission":"eosio.code"},"weight":1}]}' owner -p eosio.amend
#$TECLOS/teclos.sh push action eosio.trail regballot '{"publisher": "eosio.amend"}' -p eosio.amend
#$TECLOS/teclos.sh set contract eosio.work $DIR/build/contracts/worker
$TECLOS/teclos.sh set contract eosio $DIR/build/contracts/eosio.system -p eosio
$TECLOS/teclos.sh push action eosio setpriv '["eosio.msig", 1]' -p eosio@active

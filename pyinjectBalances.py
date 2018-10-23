import json
import csv
import os

f = open('telos_snapshot.csv')
csv_f = csv.reader(f)
SCRIPTSDIR = "/opt/telos_main/scripts"
i=1
for row in csv_f:
    account = row[1]
    key = row[2]
    total = row[3]
    cpu = row[4]
    bandwith = row [5]
    liq = row[6]
    create_account = SCRIPTSDIR + "/teclos.sh system newaccount -x 100 --transfer --stake-net \"" + bandwith + " TLOS\" --stake-cpu \"" + cpu + " TLOS\" --buy-ram-kbytes 4 eosio " + account + " " + key
    transfer_balance = SCRIPTSDIR + "/teclos.sh transfer eosio " + account + " \"" + liq + " TLOS\" \"Telos genesis balance.Welcome to Telos!\""
    os.system(create_account)
    os.system(transfer_balance)
print('end')
import csv
import math

f = open('tlos_genesis_snapshot.csv')
csv_f = csv.reader(f)
i = 1

cpu = 0
bandwith = 0
liquid = 0

def roundup(a, digits=0):
    n = 10**-digits
    return round(math.ceil(a / n) * n, digits)

for row in csv_f:
    eth = row[1]
    account = row[2]
    eoskey = row[3]
    balance = row[4]
    if balance > 40000:
        balance = 40000
    
    if (balance <= 3):
        liquid = 0.1
    else:
        if (balance > 3) and (balance <= 11):
            liquid = 2
        else:
            liquid = 10

    tmp_balance = balance - liquid
    cpu =  roundup(tmp_balance/2,4)
    bandwith = tmp_balance - cpu

    print str(i) +','+ account + ',' + eoskey + ',' + '{:.4f}'.format(float(balance)) + ',' + '{:.4f}'.format(float(cpu)) + ',' + '{:.4f}'.format(float(bandwith)) + ',' + '{:.4f}'.format(float(liquid))
    i+=1


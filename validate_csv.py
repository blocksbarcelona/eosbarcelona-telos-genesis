import csv

f = open('telos_snapshot.csv')
csv_f = csv.reader(f)

i = 1
total = 0.000000

eos = 0.00000
telos = 0.00000

for row in csv_f:
    balance = float(row[3])
    eosbalance = balance
    if balance > 40000:
        balance = 40000
    #
    #     print '{:.4f}'.format(float(balance))
    #else:
    #print '{:.4f}'.format(float(balance))
    telos = telos + balance
    eos = eos + eosbalance
    print i
    i+=1

print '{:.4f}'.format(float(eos)) + ' EOS'
print '{:.4f}'.format(float(telos)) + ' TLOS'
print "end"

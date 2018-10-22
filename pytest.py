import subprocess
import json
import csv

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

        output = subprocess.check_output(SCRIPTSDIR + "/teclos.sh get account " + account + " -j ", shell=True)
        jsonacc  = json.loads(output)
	acc_liquid,waste = jsonacc["core_liquid_balance"].split()

	if (acc_liquid == liq):
		acc_resources = jsonacc["total_resources"]
		acc_cpu,waste = acc_resources["net_weight"].split()

		if (cpu != acc_cpu):
			print( 'error cpu: ' + cpu + '!=' + acc_cpu)
		else:
			print('cpu ok -' + cpu + ' = ' + acc_cpu)
	else:
		print( account +': nok')

        i+=1

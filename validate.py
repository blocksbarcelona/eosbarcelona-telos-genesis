import subprocess
import json
import csv

f = open('telos_snapshot.csv')
csv_f = csv.reader(f)

SCRIPTSDIR = "/opt/telos_main/scripts"
i=0
tmp=0
totalCSV = 0
totalInChain = 0
skipRecord=1
for row in csv_f:
#	if (i <= skipRecord):
#		i+=1
#	else:
		account = row[1]
		key = row[2]
		total = row[3]
		cpu = row[4]
		net = row [5]
		liq = row[6]
		
		line = ','.join(row)

#		print(line)

#		print(account)

		totalCSV = float(totalCSV) + float(total)
		try:
			output = subprocess.check_output(SCRIPTSDIR + "/teclos.sh get account " + account + " -j ", shell=True)
			jsonacc  = json.loads(output)
			if 'core_liquid_balance' not in jsonacc:
				print(line)
				output = subprocess.check_output("echo \"" + line + " >> testPyErrors.csv", shell=True)
				print("echo \"" + line + " >> testPyErrors.csv")
			else:
                		acc_liquid,waste = jsonacc["core_liquid_balance"].split()
                		acc_resources = jsonacc["total_resources"]
                		acc_net,waste = acc_resources["net_weight"].split()
                		acc_cpu,waste = acc_resources["cpu_weight"].split()
				totalInChain = float(totalInChain) + float(acc_liquid) + float(acc_net) + float(acc_cpu)
                		tmp+=1
                		i+=1
                	if (tmp == 100):
                        	print(i)
                        	tmp=0
		except subprocess.CalledProcessError, e:
    			print (account + " does not exist!")

print(totalCSV)
print(totalInChain)

import subprocess
import json
import csv
import sys

f = open('initial_block_producers.csv.out')
csv_f = csv.reader(f)
SCRIPTSDIR = "/opt/telos_main/scripts"
i=0
tmp=0
totalCSV = 0
totalInChain = 0
skipRecord=1
for row in csv_f:
		account = row[2]
		line = ','.join(row)
		try:
			output = subprocess.check_output(SCRIPTSDIR + "/teclos.sh get account " + account + " -j ", shell=True)
			print (account)
#			jsonacc  = json.loads(output)
#			if 'core_liquid_balance' not in jsonacc:
#				print(line)
#				output = subprocess.check_output("echo \"" + line + " >> testPyErrors.csv", shell=True)
#				print("echo \"" + line + " >> testPyErrors.csv")
		except subprocess.CalledProcessError, e:
    			print (account + " does not exist!")

#print(totalCSV)
#print(totalInChain)

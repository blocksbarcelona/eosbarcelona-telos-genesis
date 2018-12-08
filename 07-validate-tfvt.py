import subprocess
import json
import csv
import sys

f = open('tfvt_accounts.csv.out')
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
		except subprocess.CalledProcessError, e:
    			print (account + " does not exist!")

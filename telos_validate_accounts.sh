#!/bin/bash
echo -e "============================================================\n"
echo -e "=================== Telos Genesis accounts =================\n"
echo -e "============================================================\n"
echo -e " 1) Downloading tlos_genesis_snapshot.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/tlos_genesis_snapshot.csv
sed -i '1d' tlos_genesis_snapshot.csv
echo -e "2) Validating genesis accounts\n"
./createTelosCsv_faster.sh
rm tlos_genesis_snapshot.csv
python 00-validate-genesis.py
rm telos_snapshot.csv

echo -e "============================================================\n"
echo -e "================= Telos Initial BP accounts ================\n"
echo -e "============================================================\n"

echo -e "1) Downloading initial_block_producers.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/initial_block_producers.csv
sed -i '1d' initial_block_producers.csv
tr -d " \t" < initial_block_producers.csv > initial_block_producers.csv.out
echo -e "2) Validating Telos BP accounts\n"
python 01-validate-telosbps.py
rm initial_block_producers.csv
rm initial_block_producers.csv.out

echo -e "============================================================\n"
echo -e "==================== EOS BP accounts =======================\n"
echo -e "============================================================\n"

echo -e "1) Downloading eos_bp_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/eos_bp_accounts.csv
sed -i '1d' eos_bp_accounts.csv
tr -d " \t" < eos_bp_accounts.csv > eos_bp_accounts.csv.out
echo -e "2) Validating EOS BP accounts\n"
python 02-validate-eosbps.py
rm eos_bp_accounts.csv
rm eos_bp_accounts.csv.out

echo -e "============================================================\n"
echo -e "==================== RAM accounts ==========================\n"
echo -e "============================================================\n"
echo -e "1) Downloading ram_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/ram_accounts.csv
sed -i '1d' ram_accounts.csv
tr -d " \t" < ram_accounts.csv > ram_accounts.csv.out
echo -e "2) Validating RAM accounts\n"
python 03-validate-ramaccounts.py
rm ram_accounts.csv
rm ram_accounts.csv.out

echo -e "============================================================\n"
echo -e "==================== TCRP accounts =========================\n"
echo -e "============================================================\n"
echo -e "1) Downloading tcrp_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/tcrp_accounts.csv
sed -i '1d' tcrp_accounts.csv
tr -d " \t" < tcrp_accounts.csv > tcrp_accounts.csv.out
echo -e "2) Validating TCRP accounts\n"
python 04-validate-tcrp.py
rm tcrp_accounts.csv
rm tcrp_accounts.csv.out

echo -e "============================================================\n"
echo -e "========== Telos Special accounts ==========================\n"
echo -e "============================================================\n"
echo -e "1) Downloading telos_special_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/telos_special_accounts.csv
sed -i '1d' telos_special_accounts.csv
tr -d " \t" < telos_special_accounts.csv > telos_special_accounts.csv.out
echo -e "2) Validating Telos Sepcial  accounts\n"
python 05-validate-special.py
rm telos_special_accounts.csv
rm telos_special_accounts.csv.out

echo -e "============================================================\n"
echo -e "========== Telos Foundation Rewards Pool ===================\n"
echo -e "============================================================\n"
echo -e "1) Downloading tfrp_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/tfrp_accounts.csv
sed -i '1d' tfrp_accounts.csv
tr -d " \t" < tfrp_accounts.csv > tfrp_accounts.csv.out
echo -e "2) Validating Telos Sepcial  accounts\n"
python 06-validate-tfrp.py
rm tfrp_accounts.csv
rm tfrp_accounts.csv.out

echo -e "============================================================\n"
echo -e "========== Telos Foundation Voting Tokens===================\n"
echo -e "============================================================\n"
echo -e "1) Downloading tfvt_accounts.csv\n"
wget https://raw.githubusercontent.com/Telos-Foundation/snapshots/master/tfvt_accounts.csv
sed -i '1d' tfvt_accounts.csv
tr -d " \t" < tfvt_accounts.csv > tfvt_accounts.csv.out
echo -e "2) Validating Telos Sepcial  accounts\n"
python 07-validate-tfvt.py
rm tfvt_accounts.csv
rm tfvt_accounts.csv.out
echo -e "Validation completed!"

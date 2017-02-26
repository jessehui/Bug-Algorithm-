#!/bin/sh
#!/bin/bash

cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#get result
touch result_1.txt
echo "Default Configuration: " > result_1.txt 
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt

###################################

echo -e "\n\n Branch Prediction TEST" >> result_1.txt

################
echo "1. Predictor Type" >> result_1.txt
#dump new configuration to file `new_cfg`
sim-outorder -bpred 2lev -dumpconfig new_cfg
echo "(1) 2lev" >> result_1.txt
#run simulation reading `new_cfg`
sim-outorder -config new_cfg eeg 2>&1 | grep -e \
"sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt


sim-outorder -bpred nottaken -dumpconfig new_cfg
echo "(2) nottaken" >> result_1.txt
#run simulation reading `new_cfg`
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n"

sim-outorder -bpred taken -dumpconfig new_cfg
echo "(3) taken" >> result_1.txt
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n"

sim-outorder -bpred bimod -dumpconfig new_cfg
echo "(4) bimod" >> result_1.txt
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n"
echo -e "\n"

#################
echo "2. bimodal predictor config" >> result_1.txt

for k in $(seq 1 4)	#no space
do
	sim-outorder -bpred:bimod $[k*1024] -dumpconfig new_cfg
	echo "bimod = $[k*1024]" >> result. txt
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
	echo -e "\n" >> result_1.txt
done

#1024 2048 3072 4096

###################
echo -e "\n"	>> result_1.txt
echo "3. 2-level predictor config" >> result_1.txt

echo "2lev = 1: 1024: 32: 0 " >> result_1.txt
sim-outorder -bpred:2lev 1 1024 32 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt

echo "2lev = 1: 2048: 8: 0 " >> result_1.txt
sim-outorder -bpred:2lev 1 2048 8 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt


echo "2lev = 1: 512: 8: 0 " >> result_1.txt
sim-outorder -bpred:2lev 1 512 8 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt


echo "2lev = 4: 2048: 32: 0 " >> result_1.txt
sim-outorder -bpred:2lev 4 2048 32 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt



###############
echo -e "\n" >> result_1.txt
echo "4. return address stack size" >> result_1.txt

for k in $(seq 0 2)
do
	sim-outorder -bpred:ras $[k*16] -dumpconfig new_cfg
	echo "ras = $[k*16]" >> result. txt
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
	echo -e "\n" >> result_1.txt
done

##############
echo -e "\n" >> result_1.txt
echo "5. BTB config" >> result_1.txt

echo "btb = 128 4 " >> result_1.txt
sim-outorder -bpred:btb 128 4 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt

echo "btb = 2048 4 " >> result_1.txt
sim-outorder -bpred:btb 2048 4 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt

echo "btb = 512 16 " >> result_1.txt
sim-outorder -bpred:btb 512 16 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt

echo "btb = 512 1 " >> result_1.txt
sim-outorder -bpred:btb 512 1 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt

echo "btb = 2048 16 " >> result_1.txt
sim-outorder -bpred:btb 2048 16 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_1.txt
echo -e "\n" >> result_1.txt



#######################################

echo -e "\n\n Memory System TEST" >> result_1.txt



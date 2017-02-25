#!/bin/sh
#!/bin/bash

cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#get result
touch result.txt
echo -e "Default Configuration: " > result.txt 
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt

###################################

echo -e "\n\n Branch Prediction TEST" >> result.txt

################
echo -e "1. Predictor Type" >> result.txt
#dump new configuration to file `new_cfg`
sim-outorder -bpred 2lev -dumpconfig new_cfg
echo -e "(1) 2lev" >> result.txt
#run simulation reading `new_cfg`
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt


sim-outorder -bpred nottaken -dumpconfig new_cfg
echo -e "(2) nottaken" >> result.txt
#run simulation reading `new_cfg`
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n"

sim-outorder -bpred taken -dumpconfig new_cfg
echo -e "(3) taken" >> result.txt
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n"

sim-outorder -bpred bimod -dumpconfig new_cfg
echo -e "(4) bimod" >> result.txt
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n"
echo -e "\n"

#################
echo -e "2. bimodal predictor config" >> result.txt

for k in $(seq 1 4)	#no space
do
	sim-outorder -bpred:bimod $[k*1024] -dumpconfig new_cfg
	echo "bimod = $[k*1024]" >> result. txt
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
	echo -e "\n" >> result.txt
done


###################
echo -e "\n"	>> result.txt
echo -e "3. 2-level predictor config" >> result.txt

echo "2lev = 1: 1024: 32: 0 " >> result.txt
sim-outorder -bpred:2lev 1 1024 32 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt

echo "2lev = 1: 2048: 8: 0 " >> result.txt
sim-outorder -bpred:2lev 1 2048 8 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt


echo "2lev = 1: 512: 8: 0 " >> result.txt
sim-outorder -bpred:2lev 1 512 8 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt


echo "2lev = 4: 2048: 32: 0 " >> result.txt
sim-outorder -bpred:2lev 4 2048 32 0 -dumpconfig new_cfg 
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt



###############
echo -e "\n" >> result.txt
echo -e "4. return address stack size" >> result.txt

for k in $(seq 0 2)
do
	sim-outorder -bpred:ras $[k*16] -dumpconfig new_cfg
	echo "ras = $[k*16]" >> result. txt
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
	echo -e "\n" >> result.txt
done

##############
echo -e "\n" >> result.txt
echo -e "5. BTB config" >> result.txt

echo "btb = 128 4 " >> result.txt
sim-outorder -bpred:btb 128 4 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt

echo "btb = 2048 4 " >> result.txt
sim-outorder -bpred:btb 2048 4 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt

echo "btb = 512 16 " >> result.txt
sim-outorder -bpred:btb 512 16 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt

echo "btb = 512 1 " >> result.txt
sim-outorder -bpred:btb 512 1 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt

echo "btb = 2048 16 " >> result.txt
sim-outorder -bpred:btb 2048 16 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
echo -e "\n" >> result.txt



#######################################

echo -e "\n\n Memory System TEST" >> result.txt



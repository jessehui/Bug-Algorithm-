cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#memory system test
touch res3.txt
echo -e "\n Memory System TEST" >> res3.txt



# echo "2. bimodal predictor config" >> result.txt

# for k in $(seq 1 4)	#no space
# do
# 	sim-outorder -bpred:bimod $[k*1024] -dumpconfig new_cfg
# 	echo "bimod = $[k*1024]" >> result. txt
# 	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result.txt
# 	echo -e "\n" >> result.txt
# done


####################### ialu
echo -e "\n 1. total number of integer ALUs available" >> res3.txt
for k in $(seq 1 4)
do
	echo "ialu $[k*4]" >> res3.txt
	sim-outorder -res:ialu $[k*4] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res3.txt
	echo -e "\n" >> res3.txt
done



####################### imult
echo -e "\n 2. total number of integer multiplier available" >> res3.txt

for k in $(seq 1 4)
do
	echo "imult $[k*2]" >> res3.txt
	sim-outorder -res:imult $[k*2] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res3.txt
	echo -e "\n" >> res3.txt
done

####################### fpalu
echo -e "\n 3. total number of floating point ALUs available" >> res3.txt
for k in $(seq 1 4)
do
	echo "fpalu $[k*4]" >> res3.txt
	sim-outorder -res:fpalu $[k*2] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res3.txt
	echo -e "\n" >> res3.txt
done


####################### fpmult
echo -e "\n 4. total number of floating point multiplier available" >> res3.txt
for k in $(seq 1 4)
do
	echo "fpmult $[k*2]" >> res3.txt
	sim-outorder -res:fpmult $[k*2] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res3.txt
	echo -e "\n" >> res3.txt
done


echo -e "\n  END FUNCTION UNIT SIMULATION" >> res3.txt


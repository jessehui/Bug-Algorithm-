cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#memory system test
touch res4.txt
echo -e "\n Data Path & Others TEST" >> res4.txt

#################### ifqsize
echo -e "\n 1. instruction fetch queue size" >> res4.txt
for k in $(seq 1 4)
do
	echo "ifqsize $[k*4]" >> res4.txt
	sim-outorder -fetch:ifqsize $[k*4] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done


################### decode width
echo -e "\n 2. instruction decode b/w" >> res4.txt
for k in $(seq 1 4)
do
	echo "decode width $[k*4]" >> res4.txt
	sim-outorder -decode:width $[k*4] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done


################### issue width
echo -e "\n 3. instruction issue b/w" >> res4.txt
for k in $(seq 1 4)
do
	echo "issue width $[k*4]" >> res4.txt
	sim-outorder -issue:width $[k*4] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done



############### issue inorder
echo -e "\n 4. run pipeline with in-order issue "
echo "inorder : true"
sim-outorder -issue:inorder true -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
echo -e "\n" >> res4.txt



############### issue wrong path
echo -e "\n 5. issue instructions down wrong execution paths "
echo "wrong path : false"
sim-outorder -issue:wrongpath false -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
echo -e "\n" >> res4.txt



################### commit width
echo -e "\n 6. instruction commit b/w" >> res4.txt
for k in $(seq 1 4)
do
	echo "commit width $[k*4]" >> res4.txt
	sim-outorder -issue:width $[k*4] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done



################### ruu size
echo -e "\n 7. register update unit (RUU) size" >> res4.txt
for k in $(seq 1 4)
do
	echo "register update unit (RUU) size $[k*8]" >> res4.txt
	sim-outorder -ruu:size $[k*8] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done


################### lsq size
echo -e "\n 8. load/store queue (LSQ) size" >> res4.txt
for k in $(seq 1 4)
do
	echo "load/store queue (LSQ) size $[k*8]" >> res4.txt
	sim-outorder -lsq:size $[k*8] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res4.txt
	echo -e "\n" >> res4.txt
done


###

echo "\n  END SIMULATION"









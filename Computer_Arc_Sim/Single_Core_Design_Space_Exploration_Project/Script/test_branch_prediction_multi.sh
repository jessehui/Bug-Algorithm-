cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#memory system test
touch res5.txt
echo -e "\n\r Multi-parameter Branch Prediction Test" >> res5.txt

echo -e "\n\r 1. Low power test" >> res5.txt

echo "2lev: (1:512:8:0), ras: (0, 8, 16, 32)" >> res5.txt
for k in $(seq 0 4)
do
	echo "ras = $[k*8]" >> res5.txt
	sim-outorder -bpred:2lev 1 512 8 0 -bpred:ras $[k*8] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res5.txt
	echo -e "\n" >> res5.txt
done


echo -e "\r\n 2lev: (1:256:8:0), ras: (0, 8, 16, 32)" >> res5.txt
for k in $(seq 0 4)
do
	echo "ras = $[k*8]" >> res5.txt
	sim-outorder -bpred:2lev 1 256 8 0 -bpred:ras $[k*8] -dumpconfig new_cfg
	sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res5.txt
	echo -e "\n" >> res5.txt
done

echo -e "\r\n 2lev: (1:1024:4:0), btb: (256:4) " >> res5.txt
sim-outorder -bpred:2lev 1 1024 4 0 -bpred:btb 256 4  -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res5.txt
echo -e "\n" >> res5.txt

#, 128:4, 512:2)
echo -e "\r\n 2lev: (1:1024:2:0), btb: (128:4) " >> res5.txt
sim-outorder -bpred:2lev 1 1024 2 0 -bpred:btb 128 4  -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res5.txt
echo -e "\n" >> res5.txt


echo -e "\r\n 2lev: (1:256:2:0), btb: (512:2) ">> res5.txt
sim-outorder -bpred:2lev 1 256 2 0 -bpred:btb 512 2  -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res5.txt
echo -e "\n" >> res5.txt













cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#memory system test
touch res2.txt
echo -e "\n\n Memory System TEST" >> res2.txt

echo -e "\n 1. L1 data cache config dl1" >> res2.txt
echo "dl1:64:32:4:l" >> res2.txt
sim-outorder -cache:dl1 dl1:64:32:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt

echo "dl1:256:32:4:l" >> res2.txt
sim-outorder -cache:dl1 dl1:256:32:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl1:512:32:4:l" >> res2.txt
sim-outorder -cache:dl1 dl1:512:32:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl1:128:64:4:l" >> res2.txt
sim-outorder -cache:dl1 dl1:128:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl1:128:32:16:l" >> res2.txt
sim-outorder -cache:dl1 dl1:128:32:16:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt

echo "dl1:128:32:4:f" >> res2.txt
sim-outorder -cache:dl1 dl1:128:32:4:f -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt

echo "dl1:128:32:4:r" >> res2.txt
sim-outorder -cache:dl1 dl1:128:32:4:r -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


###################### 
echo -e "\n\n 2. L2 data cache config  dl2" >> res2.txt


echo "dl2:2048:64:4:l" >> res2.txt
sim-outorder -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:512:64:4:l" >> res2.txt
sim-outorder -cache:dl2 dl2:512:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:16:4:l" >> res2.txt
sim-outorder -cache:dl2 dl2:1024:16:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:256:4:l" >> res2.txt
sim-outorder -cache:dl2 dl2:1024:256:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:64:1:l" >> res2.txt
sim-outorder -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:64:16:l" >> res2.txt
sim-outorder -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:64:4:f" >> res2.txt
sim-outorder -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "dl2:1024:64:4:r" >> res2.txt
sim-outorder -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


###################### 
echo -e "\n\n 3. L1 instr cache config  il1" >> res2.txt


echo "il1:128:32:1:l" >> res2.txt
sim-outorder -cache:il1 il1:128:32:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "il1:2048:32:1:l" >> res2.txt
sim-outorder -cache:il1 il1:2048:32:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt



echo "il1:512:128:1:l" >> res2.txt
sim-outorder -cache:il1 il1:512:128:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "il1:512:8:1:l" >> res2.txt
sim-outorder -cache:il1 il1:512:8:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


echo "il1:512:32:4:l" >> res2.txt
sim-outorder -cache:il1 il1:512:32:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt



echo "il1:512:32:16:l" >> res2.txt
sim-outorder -cache:il1 il1:512:32:16:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt




###################### 
echo -e "\n\n 4. L2 instr cache config  il2" >> res2.txt

echo "il12 point to dl1" >> res2.txt
sim-outorder -cache:il2 dl1 -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res2.txt
echo -e "\n" >> res2.txt


##########
echo "END OF MEMORY SYSTEM SIMULATION" >> res2.txt



















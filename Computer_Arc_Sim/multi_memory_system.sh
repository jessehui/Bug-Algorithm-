cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#memory system test
touch res6.txt
echo -e "\n\r Multi - Memory System TEST" > res6.txt

###############
echo -e "\r\n dl1 and dl2" >> res6.txt
echo "dl1: 256:32:4:l ,  dl2: 2048:64:4:l" >> res6.txt
sim-outorder -cache:dl1 dl1:256:32:4:l -cache:dl2 dl2:2048:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt




echo "dl1: 512:32:4:l ,  dl2: 2048:64:16:l" >> res6.txt
sim-outorder -cache:dl1 dl1:512:32:4:l -cache:dl2 dl2:2048:64:16:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt


echo "dl1: 256:64:4:l ,  dl2: 1024:128:16:l" >> res6.txt
sim-outorder -cache:dl1 dl1:256:64:4:l -cache:dl2 dl2:1024:128:16:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt



echo "dl1: 64:16:4:l ,  dl2: 512:64:4:l" >> res6.txt
sim-outorder -cache:dl1 dl1:64:16:4:l -cache:dl2 dl2:512:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt



###############
echo -e "\r\n dl1 and il1" >> res6.txt
echo "dl1: 256:32:4:l ,  il1: 1024:64:1:l" >> res6.txt
sim-outorder -cache:dl1 dl1:256:32:4:l -cache:il1 il1:1024:64:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt


echo "dl1: 512:64:4:l ,  il1: 1024:128:1:l" >> res6.txt
sim-outorder -cache:dl1 dl1:512:64:4:l -cache:il1 il1:1024:128:1:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt

echo "dl1: 128:64:16:l ,  il1: 512:64:4:l" >> res6.txt
sim-outorder -cache:dl1 dl1:128:64:16:l -cache:il1 il1:512:64:4:l -dumpconfig new_cfg
sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res6.txt
echo -e "\n\r" >> res6.txt

###
echo -e "\n\r END SIMULATION" >> res6.txt























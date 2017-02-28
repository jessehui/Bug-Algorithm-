#!/bin/sh
#!/bin/bash

cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#get result
touch result_final.txt
echo -e "FINAL SIMULATION\r\n" > result_final.txt 


echo -e "High Performance\r\n" >> result_final.txt

echo -e "1. Bimod, commit width 8 \r\n" >> result_final.txt
sim-outorder -bpred:bimod 2048 -res:fpmult 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 8 -ruu:size 32 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt

echo -e "2. Bimod, commit width 16\r\n" >> result_final.txt
sim-outorder -bpred:bimod 2048 -res:fpmult 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 16 -ruu:size 32 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt

echo -e "3. 2-lev, commit width 8\r\n" >> result_final.txt
sim-outorder -bpred 2lev -bpred:2lev 1 512 8 0 -res:fpmult 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 8 -ruu:size 32 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt

echo -e "3. 2-lev, commit width 16\r\n" >> result_final.txt
sim-outorder -bpred 2lev -bpred:2lev 1 512 8 0 -res:fpmult 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 16 -ruu:size 32 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt



echo -e "Low Power\r\n" >> result_final.txt
echo -e "1. Bimod, commit width 8,  BTB 128 4, RUU 16 \r\n" >> result_final.txt
sim-outorder -bpred:bimod 2048 -res:fpmult 4 -bpred:btb 128 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 8 -ruu:size 16 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt

echo -e "2. 2-lev, commit width 8\r\n BTB 128 4, RUU 16 \r\n " >> result_final.txt
sim-outorder -bpred 2lev -bpred:2lev 1 512 8 0 -res:fpmult 4 -fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 8 -ruu:size 16 -lsq:size 16 -dumpconfig new_cfg
sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt
echo -e "\r\n" >> result_final.txt

echo -e "\r\n END SIMULATION" >> result_final.txt





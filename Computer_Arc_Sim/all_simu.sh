#!/bin/sh
#!/bin/bash

cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#get result
touch result_final.txt
echo -e "\r\nFINAL SIMULATION" > result_final.txt 


echo "\r\n High Performance" >> result_final.txt

#branch prediction
sim-outorder -bpred:bimod 2048 \
-res:fpmult 4 \ #function unit
-fetch:ifqsize 16 -decode:width 16 -issue:width 8 -commit:width 8 -ruu:size 32 -lsq:size 16\  		#data path
-dumpconfig new_cfg

sim-outorder eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a result_final.txt



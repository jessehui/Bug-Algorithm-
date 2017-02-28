cd ~/5MD00_SC/src
export SCALAR_SIMPLE=1
make

#data path and others
touch res8.txt
echo -e "\n Data Path test" > res8.txt

echo -e "\n 1. instruction fetch queue size & decode width" >> res8.txt
for k in $(seq 2 4)
do
	for j in $(seq 2 4)
		echo "ifqsize $[k*4], decode width $[j*4]" >> res8.txt
		sim-outorder -fetch:ifqsize $[k*4] -decode:width $[j*4]-dumpconfig new_cfg
		sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res8.txt
		echo -e "\r\n" >> res8.txt
	done	
	echo -e "\r\n" >> res8.txt
done


echo -e "\n 2. instruction fetch queue size & decode width & issue width" >> res8.txt
for k in $(seq 2 4)
do
	for j in $(seq 2 4)
	do
		for i in $(seq 2 4)
		do
			echo "ifqsize $[k*4], decode width $[j*4], issue width $[i*4]" >> res8.txt
			sim-outorder -fetch:ifqsize $[k*4] -decode:width $[j*4] -issue:width $[i*4] -dumpconfig new_cfg
			sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res8.txt
			echo -e "\r\n" >> res8.txt
		done
	done	
done

echo -e "\n 3. instruction fetch queue size & commit width" >> res8.txt
for k in $(seq 2 4)
do
	for j in $(seq 2 4)
	do	
		echo "ifqsize $[k*4], commit width $[j*4]" >> res8.txt
		sim-outorder -fetch:ifqsize $[k*4] -commit:width $[j*4] -dumpconfig new_cfg
		sim-outorder -config new_cfg eeg 2>&1 | grep -e "sim_IPC" -e "sim_CPI" -e "avg_total_power_cycle_cc3" | tee -a res8.txt
		echo -e "\r\n" >> res8.txt
	done	
done



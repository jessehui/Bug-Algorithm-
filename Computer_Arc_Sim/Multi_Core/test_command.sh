#passing configuration options directly on the command line with the -g option
./run-sniper -g --power --viz perf_model/core/interval_timer/window_size=96

# use the --power option in combination with the --viz option to run-sniper.

#格式：sed 's/要替换的字符串/新的字符串/g'   （要替换的字符串可以用正则表达式）
#[root@localhost ruby] # sed -n '/ruby/p' ab | sed 's/ruby/bird/g'    #替换ruby为bird




################test

cd ~/snipersim/test/EEG_MP
make clean

#get the original config file (force copy)
\cp ../proc.cfg proc.cfg

#output file
touch result.txt
echo -e "FINAL SIMULATION\r\n" > result.txt 


##change config file
#after modification
echo -e "reschedule_cost = 1000\r\n" >> result.txt 
echo -e "penalty = 300\r\n" >> result.txt 

#modify
sed -n 'reschedule_cost = 100' proc.cfg | sed -i 's/1000/100/g' proc.cfg
sed -n 'penalty = 30' proc.cfg | sed -i 's/30/300/g' proc.cfg 


make mcpat N_PROC=4 2>&1 | grep -e 'total' | tee -a result.txt #total power and total area
grep 'Cycles' sim.out | tee -a result.txt	# cycles

#test
make mcpat N_PROC=4 2>&1 | grep '*sniper' | tee -a result.txt #total power and total area








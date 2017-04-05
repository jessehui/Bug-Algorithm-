

###start simulation

cd ~/snipersim/test/EEG_MP
make clean

#get the original config file (force copy)
\cp ../proc.cfg proc.cfg

#output file
touch result.txt
echo -e "SIMULATION RESULT\r\n" > result.txt 


##change config file
#after modification
echo -e "Default Configuration Single Core\r" >> result.txt 

make N_PROC=1

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	


####
echo -e "\r\n" >> result.txt
echo -e "Default Configuration Multi-Core\r" >> result.txt 
make clean
make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



#####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n\r\n" >> result.txt
echo -e "l1_icache test \r" >> result.txt
echo -e "1. \r" >> result.txt
echo -e "cache_size = 2\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 


sed -i '47s/8/2/' proc.cfg
sed -i '48s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	


####
\cp ../proc.cfg proc.cfg
make clean

echo -e "\r\n" >> result.
echo -e "2. \r" >> result.txt
echo -e "cache_size = 4\r" >> result.txt 
echo -e "associativity = 2\r" >> result.txt 


sed -i '47s/8/4/' proc.cfg
sed -i '48s/2/2/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "3. \r" >> result.txt
echo -e "cache_size = 16\r" >> result.txt 
echo -e "associativity = 2\r" >> result.txt 


sed -i '47s/8/16/' proc.cfg
sed -i '48s/2/2/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "4. \r" >> result.txt
echo -e "cache_size = 16\r" >> result.txt 
echo -e "associativity = 4\r" >> result.txt 


sed -i '47s/8/16/' proc.cfg
sed -i '48s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "5. \r" >> result.txt
echo -e "cache_size = 32\r" >> result.txt 
echo -e "associativity = 4\r" >> result.txt 


sed -i '47s/8/32/' proc.cfg
sed -i '48s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	

####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "6. \r" >> result.txt
echo -e "cache_size = 16\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 


sed -i '47s/8/16/' proc.cfg
sed -i '48s/2/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "7. \r" >> result.txt
echo -e "cache_size = 32\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 


sed -i '47s/8/32/' proc.cfg
sed -i '48s/2/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "8. \r" >> result.txt
echo -e "cache_size = 64\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 



sed -i '47s/8/64/' proc.cfg
sed -i '48s/2/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	

####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "9. \r" >> result.txt
echo -e "cache_size = 64\r" >> result.txt 
echo -e "associativity = 4\r" >> result.txt 

sed -i '47s/8/64/' proc.cfg
sed -i '48s/2/4/' proc.cfg

make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n" >> result.
echo -e "10. \r" >> result.txt
echo -e "cache_size = 64\r" >> result.txt 
echo -e "associativity = 2\r" >> result.txt 

sed -i '47s/8/64/' proc.cfg
sed -i '48s/2/2/' proc.cfg

make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	














#####

#####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n\r\n" >> result.txt
echo -e "l1_dcache test \r" >> result.txt
echo -e "1. \r" >> result.txt
echo -e "cache_size = 2\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 


sed -i '59s/8/2/' proc.cfg
sed -i '60s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	


####
\cp ../proc.cfg proc.cfg

make clean

echo -e "2. \r" >> result.txt
echo -e "cache_size = 4\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 


sed -i '59s/8/4/' proc.cfg
sed -i '60s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean

echo -e "3. \r" >> result.txt
echo -e "cache_size = 32\r" >> result.txt 
echo -e "associativity = 4\r" >> result.txt 


sed -i '59s/8/32/' proc.cfg
sed -i '60s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



####
\cp ../proc.cfg proc.cfg

make clean

echo -e "4. \r" >> result.txt
echo -e "cache_size = 64\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 


sed -i '59s/8/64/' proc.cfg
sed -i '60s/2/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	















#####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n\r\n" >> result.txt
echo -e "l2_cache test \r" >> result.txt
echo -e "1. \r" >> result.txt
echo -e "cache_size = 32\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 


sed -i '71s/128/32/' proc.cfg
sed -i '72s/4/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean

echo -e "2. \r" >> result.txt
echo -e "cache_size = 64\r" >> result.txt 
echo -e "associativity = 2\r" >> result.txt 


sed -i '71s/128/64/' proc.cfg
sed -i '72s/4/2/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean

echo -e "3. \r" >> result.txt
echo -e "cache_size = 256\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 


sed -i '71s/128/256/' proc.cfg
sed -i '72s/4/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	





####
\cp ../proc.cfg proc.cfg

make clean

echo -e "4. \r" >> result.txt
echo -e "cache_size = 512\r" >> result.txt 
echo -e "associativity = 16\r" >> result.txt 


sed -i '71s/128/512/' proc.cfg
sed -i '72s/4/16/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	









#####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n\r\n" >> result.txt
echo -e "l3_cache test \r" >> result.txt
echo -e "1. \r" >> result.txt
echo -e "cache_size = 256\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 


sed -i '105s/1024/256/' proc.cfg
sed -i '106s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean

echo -e "2. \r" >> result.txt
echo -e "cache_size = 512\r" >> result.txt 
echo -e "associativity = 1\r" >> result.txt 



sed -i '105s/1024/512/' proc.cfg
sed -i '106s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	





####
\cp ../proc.cfg proc.cfg

make clean

echo -e "3. \r" >> result.txt
echo -e "cache_size = 2048\r" >> result.txt 
echo -e "associativity = 4\r" >> result.txt 



sed -i '105s/1024/2048/' proc.cfg
sed -i '106s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




####
\cp ../proc.cfg proc.cfg

make clean

echo -e "4. \r" >> result.txt
echo -e "cache_size = 4096\r" >> result.txt 
echo -e "associativity = 8\r" >> result.txt 



sed -i '105s/1024/4096/' proc.cfg
sed -i '106s/2/8/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	









#####
\cp ../proc.cfg proc.cfg

make clean
echo -e "\r\n\r\n" >> result.txt
echo -e "Hierarchical test \r" >> result.txt
echo -e "1. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 4\r" >> result.txt 
echo -e "l1_icache_associativity = 2\r" >> result.txt 


sed -i '47s/8/4/' proc.cfg
sed -i '48s/2/2/' proc.cfg

echo -e "l1_dcache_size = 4\r" >> result.txt 
echo -e "l1_dcache_associativity = 2\r" >> result.txt 


sed -i '59s/8/4/' proc.cfg
sed -i '60s/2/2/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 64\r" >> result.txt 
echo -e "l2cache_associativity = 4\r" >> result.txt 


sed -i '71s/128/64/' proc.cfg
sed -i '72s/4/4/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 512\r" >> result.txt 
echo -e "l3cache_associativity = 2\r" >> result.txt 

sed -i '105s/1024/512/' proc.cfg
sed -i '106s/2/2/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



#####
\cp ../proc.cfg proc.cfg

make clean

echo -e "2. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 4\r" >> result.txt 
echo -e "l1_icache_associativity = 1\r" >> result.txt 


sed -i '47s/8/4/' proc.cfg
sed -i '48s/2/1/' proc.cfg

echo -e "l1_dcache_size = 4\r" >> result.txt 
echo -e "l1_dcache_associativity = 1\r" >> result.txt 


sed -i '59s/8/4/' proc.cfg
sed -i '60s/2/1/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 64\r" >> result.txt 
echo -e "l2cache_associativity = 2\r" >> result.txt 


sed -i '71s/128/64/' proc.cfg
sed -i '72s/4/2/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 512\r" >> result.txt 
echo -e "l3cache_associativity = 1\r" >> result.txt 

sed -i '105s/1024/512/' proc.cfg
sed -i '106s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	





#####
\cp ../proc.cfg proc.cfg

make clean

echo -e "3. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 8\r" >> result.txt 
echo -e "l1_icache_associativity = 1\r" >> result.txt 


sed -i '47s/8/8/' proc.cfg
sed -i '48s/2/1/' proc.cfg

echo -e "l1_dcache_size = 8\r" >> result.txt 
echo -e "l1_dcache_associativity = 1\r" >> result.txt 


sed -i '59s/8/8/' proc.cfg
sed -i '60s/2/1/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 128\r" >> result.txt 
echo -e "l2cache_associativity = 2\r" >> result.txt 


sed -i '71s/128/128/' proc.cfg
sed -i '72s/4/2/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 1024\r" >> result.txt 
echo -e "l3cache_associativity = 1\r" >> result.txt 

sed -i '105s/1024/1024/' proc.cfg
sed -i '106s/2/1/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



#####
\cp ../proc.cfg proc.cfg

make clean

echo -e "4. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 8\r" >> result.txt 
echo -e "l1_icache_associativity = 4\r" >> result.txt 


sed -i '47s/8/8/' proc.cfg
sed -i '48s/2/4/' proc.cfg

echo -e "l1_dcache_size = 8\r" >> result.txt 
echo -e "l1_dcache_associativity = 4\r" >> result.txt 


sed -i '59s/8/8/' proc.cfg
sed -i '60s/2/4/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 128\r" >> result.txt 
echo -e "l2cache_associativity = 8\r" >> result.txt 


sed -i '71s/128/128/' proc.cfg
sed -i '72s/4/8/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 1024\r" >> result.txt 
echo -e "l3cache_associativity = 4\r" >> result.txt 

sed -i '105s/1024/1024/' proc.cfg
sed -i '106s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



#####
\cp ../proc.cfg proc.cfg

make clean

echo -e "5. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 16\r" >> result.txt 
echo -e "l1_icache_associativity = 4\r" >> result.txt 


sed -i '47s/8/16/' proc.cfg
sed -i '48s/2/4/' proc.cfg

echo -e "l1_dcache_size = 16\r" >> result.txt 
echo -e "l1_dcache_associativity = 4\r" >> result.txt 


sed -i '59s/8/16/' proc.cfg
sed -i '60s/2/4/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 256\r" >> result.txt 
echo -e "l2cache_associativity = 8\r" >> result.txt 


sed -i '71s/128/256/' proc.cfg
sed -i '72s/4/8/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 1024\r" >> result.txt 
echo -e "l3cache_associativity = 4\r" >> result.txt 

sed -i '105s/1024/2048/' proc.cfg
sed -i '106s/2/4/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	



#####
\cp ../proc.cfg proc.cfg

make clean

echo -e "6. \r" >> result.txt
#l1 8, 2
echo -e "l1_icache_size = 16\r" >> result.txt 
echo -e "l1_icache_associativity = 2\r" >> result.txt 


sed -i '47s/8/16/' proc.cfg
sed -i '48s/2/2/' proc.cfg

echo -e "l1_dcache_size = 16\r" >> result.txt 
echo -e "l1_dcache_associativity = 2\r" >> result.txt 


sed -i '59s/8/16/' proc.cfg
sed -i '60s/2/2/' proc.cfg

#l2 128, 4
echo -e "l2cache_size = 256\r" >> result.txt 
echo -e "l2cache_associativity = 4\r" >> result.txt 


sed -i '71s/128/256/' proc.cfg
sed -i '72s/4/4/' proc.cfg

#l3 1024 2
echo -e "l3cache_size = 1024\r" >> result.txt 
echo -e "l3cache_associativity = 2\r" >> result.txt 

sed -i '105s/1024/2048/' proc.cfg
sed -i '106s/2/2/' proc.cfg


make N_PROC=4

#total power and total area
../../tools/mcpat.py 2>&1 | grep -e 'total' | tee -a result.txt 
../../tools/mcpat.py -t area 2>&1 | grep -e 'total' | tee -a result.txt 

# cycles
grep "Cycles" sim.out | tee -a result.txt	




### end
echo -e "END SIMULATION\r" >> result.txt 

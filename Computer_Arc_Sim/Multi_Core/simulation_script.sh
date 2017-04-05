

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



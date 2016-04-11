#ifndef __POV_lib__
#define __POV_lib__

#define TIME_DLY	500

#define ST 5   //storage clock in
#define SH 6  //shift clock in 
#define DI 7 //data in 

void Serial_Dis2(int Pat_Ext, int Pat1, int Pat0);//Serial Display for dual 595 chips
void Serial_Dis4(int Pat_ext0, int Pat3, int Pat2, int Pat1, int Pat0);

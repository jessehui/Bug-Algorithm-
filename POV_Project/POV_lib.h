// #ifndef __POV_lib_h__
// #define __POV_lib_h__

#include <Wire.h>
#include "RTClib.h"
#include <Energia.h>

RTC_DS1307 RTC;

#define TIME_DLY	70

// #define ST0	2
// #define SH0	3
// #define DI0	4

// #define ST1 5   //storage clock in
// #define SH1 6  //shift clock in 
// #define DI1 7 //data in 

// #define ST2 10
// #define SH2 9
// #define DI2 8

// #define ST3	 13
// #define SH3	 12
// #define DI3	 11




extern int ST[4] = {2,5,10,13};//0,1,2,3
extern int SH[4] = {3,6,9,12};
extern int DI[4] = {4,7,8,11};

void Serial_Dis2(int Bar, int Pat_Ext, int Pat1, int Pat0);

void Serial_Dis4(int Bar, int Pat_ext0, int Pat3, int Pat2, int Pat1, int Pat0);

/************************************************************
Serial Display for dual 595 chips (TOP display)
/************************************************************/

void Serial_Dis2(int Bar, int Pat_Ext, int Pat1, int Pat0)//Pat is a hex number e.g. 0xfc
{
  int j;
  int bitstosend[3] = {Pat0,Pat1,Pat_Ext};
  digitalWrite(ST[Bar],LOW);
  
  //clear data
  digitalWrite(SH[Bar],LOW);
  digitalWrite(DI[Bar],LOW);
  digitalWrite(SH[Bar],HIGH);//test
  
  for(j=3;j>=0;j--)
  {
    shiftOut(DI[Bar],SH[Bar],MSBFIRST,bitstosend[j]);
    
  }
  //shiftOut(DI,SH,MSBFIRST,Pat1);//0
  digitalWrite(ST[Bar],HIGH);
  
  
}


/************************************************************
Serial Display for quad 595 chips (SIDE display)
/************************************************************/

void Serial_Dis4(int Bar, int Pat_ext0, int Pat3, int Pat2, int Pat1, int Pat0)//Pat is a hex number e.g. 0xfc
{//int Pat_ext1,
  int j;
  int bitstosend[5] = { Pat0,Pat1,Pat2,Pat3,Pat_ext0};
  digitalWrite(ST[Bar],LOW);
   //clear data
  digitalWrite(SH[Bar],LOW);
  digitalWrite(DI[Bar],LOW);
  digitalWrite(SH[Bar],HIGH);//test
  
  for(j=4;j>=0;j--)
  {
    shiftOut(DI[Bar],SH[Bar],MSBFIRST,bitstosend[j]);
    
  }
  
  digitalWrite(ST[Bar],HIGH);
  
  
}


void pattern(int Stage, )


//#endif
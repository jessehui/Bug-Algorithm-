// #ifndef __POV_lib_h__
// #define __POV_lib_h__

#include <Wire.h>
#include "RTClib.h"
#include <Energia.h>

RTC_DS1307 RTC;

#define TIME_DLY	10
#define OFF_TIME 20
#define STAY_TIME 942
#define STILL_TIME 3000 //background and clock number stay

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




extern int ST[4] = {15,5,10,13};//0,1,2,3
extern int SH[4] = {4,6,9,12};
extern int DI[4] = {14,7,8,11};

//0:red 1:yellow 
extern int ST_TOP[4] = {8,11,0,13};
extern int SH_TOP[4] = {9,12,0,12};
extern int DI_TOP[4] = {10,13,0,11};



void Serial_Dis2(int Bar, int Pat_Ext, int Pat1, int Pat0);

void Serial_Dis4(int Bar, int Pat_ext0, int Pat3, int Pat2, int Pat1, int Pat0);

/************************************************************
Serial Display for dual 595 chips (TOP display)
/************************************************************/

void Serial_Dis2(int Bar, int Pat_Ext, int Pat1, int Pat0)//Pat is a hex number e.g. 0xfc
{
  int j;
  int bitstosend[3] = {Pat0,Pat1,Pat_Ext};
  digitalWrite(ST_TOP[Bar],LOW);
  
  //clear data
  digitalWrite(SH_TOP[Bar],LOW);
  digitalWrite(DI_TOP[Bar],LOW);
  digitalWrite(SH_TOP[Bar],HIGH);//test
  
  for(j=3;j>=0;j--)
  {
    shiftOut(DI_TOP[Bar],SH_TOP[Bar],MSBFIRST,bitstosend[j]);
    
  }
  //shiftOut(DI,SH,MSBFIRST,Pat1);//0
  digitalWrite(ST_TOP[Bar],HIGH);
  
  
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

void blank_Conway(void)
{
  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delay(OFF_TIME);

}

void blank_Clock_Stay(int time)
{
  // Serial_Dis2(0,0,0,0);
  Serial_Dis2(1,0,0,0);
  // Serial_Dis4(2,0,0,0,0,0);
  // Serial_Dis4(3,0,0,0,0,0);
  delay(time);

}

void pattern_1(void)
{
  Serial_Dis4(0,0,31,7,193,240);
  Serial_Dis4(1,0,31,7,193,240);
  Serial_Dis4(2,0,31,7,193,240);
  Serial_Dis4(3,0,31,7,193,240);
  delayMicroseconds(TIME_DLY);
  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delayMicroseconds(TIME_DLY);  
  Serial_Dis4(0,0,17,4,129,16);
  Serial_Dis4(0,0,17,4,129,16);
  Serial_Dis4(0,0,17,4,129,16);
  Serial_Dis4(0,0,17,4,129,16);  
  delayMicroseconds(TIME_DLY);
  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delayMicroseconds(TIME_DLY);
  Serial_Dis4(0,0,31,7,193,240); 
  Serial_Dis4(1,0,31,7,193,240); 
  Serial_Dis4(2,0,31,7,193,240); 
  Serial_Dis4(3,0,31,7,193,240);  
  delayMicroseconds(TIME_DLY);
  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delay(OFF_TIME);
}

void pattern_2(void)
{
  Serial_Dis4(0,0,14,3,129,192);
  Serial_Dis4(1,0,14,3,129,192);
  Serial_Dis4(2,0,14,3,129,192);
  Serial_Dis4(3,0,14,3,129,192);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,14,3,129,192);
  Serial_Dis4(1,0,14,3,129,192);
  Serial_Dis4(2,0,14,3,129,192);
  Serial_Dis4(3,0,14,3,129,192);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,21,5,66,160);
  Serial_Dis4(1,0,21,5,66,160);
  Serial_Dis4(2,0,21,5,66,160);
  Serial_Dis4(3,0,21,5,66,160);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delayMicroseconds(TIME_DLY);  

  Serial_Dis4(0,0,21,5,66,160);
  Serial_Dis4(1,0,21,5,66,160);
  Serial_Dis4(2,0,21,5,66,160);
  Serial_Dis4(3,0,21,5,66,160);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,14,3,129,192);
  Serial_Dis4(1,0,14,3,129,192);
  Serial_Dis4(2,0,14,3,129,192);
  Serial_Dis4(3,0,14,3,129,192);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,14,3,129,192);
  Serial_Dis4(1,0,14,3,129,192);
  Serial_Dis4(2,0,14,3,129,192);
  Serial_Dis4(3,0,14,3,129,192);
  delayMicroseconds(TIME_DLY);

  Serial_Dis4(0,0,0,0,0,0);
  Serial_Dis4(1,0,0,0,0,0);
  Serial_Dis4(2,0,0,0,0,0);
  Serial_Dis4(3,0,0,0,0,0);
  delay(OFF_TIME);


}


//#endif


/************************************************************
Serial Display for dual 595 chips (TOP display)
/************************************************************/

void Serial_Dis2(int Pat_Ext, int Pat1, int Pat0)//Pat is a hex number e.g. 0xfc
{
  int j;
  int bitstosend[2] = {Pat0,Pat1,Pat_Ext};
  digitalWrite(ST,LOW);
  
  //clear data
  digitalWrite(SH,LOW);
  digitalWrite(DI,LOW);
  digitalWrite(SH,HIGH);//test
  
  for(j=3;j>=0;j--)
  {
    shiftOut(DI,SH,MSBFIRST,bitstosend[j]);
    
  }
  //shiftOut(DI,SH,MSBFIRST,Pat1);//0
  digitalWrite(ST,HIGH);
  delay(TIME_DLY);
  
}


/************************************************************
Serial Display for quad 595 chips (SIDE display)
/************************************************************/

void Serial_Dis4(int Pat_ext0, int Pat3, int Pat2, int Pat1, int Pat0)//Pat is a hex number e.g. 0xfc
{//int Pat_ext1,
  int j;
  int bitstosend[5] = { Pat0,Pat1,Pat2,Pat3,Pat_ext0};
  digitalWrite(ST,LOW);
   //clear data
  digitalWrite(SH,LOW);
  digitalWrite(DI,LOW);
  digitalWrite(SH,HIGH);//test
  
  for(j=4;j>=0;j--)
  {
    shiftOut(DI,SH,MSBFIRST,bitstosend[j]);
    
  }
  //shiftOut(DI,SH,MSBFIRST,Pat1);//0
  digitalWrite(ST,HIGH);
  delay(TIME_DLY);
  
}
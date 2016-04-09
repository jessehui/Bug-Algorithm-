#define ST 13   //storage clock in
#define SH 12  //shift clock in 
#define DI 11 //data in 


void setup()
{
  // put your setup code here, to run once:
  pinMode(ST,OUTPUT);
  pinMode(SH,OUTPUT);
  pinMode(DI,OUTPUT);
  Serial.begin(9600);
  Serial.println("start");
  Serial_Dis(134);   //10000110
  delay(5000);
  Serial_Dis(188);  //10111100
  delay(10000000);
}


void loop()
{
  //delay(50);
  // put your main code here, to run repeatedly:
  Serial.println(Serial.available());
  if(Serial.available() > 1)
  {
    int light_num = Serial.read() - 48;//ASCII
    registerWrite(light_num, HIGH);
  }
}

void registerWrite(int Num, int State)
{
  byte bitstosend = 0;
  
  ///turn off the storage line and wait for data
  digitalWrite(ST,LOW);
  Serial.print("bitstosend (before)= ");
  Serial.print(bitstosend,DEC);
  Serial.println(".");
  
  bitWrite(bitstosend,Num,State);//write State to the Num of bit of bitstosend 
  Serial.print("bitstosend = ");
  Serial.print(bitstosend,DEC);
  Serial.println(".");
  
  shiftOut(DI,SH,MSBFIRST,bitstosend);
  
  digitalWrite(ST,HIGH);
  //delay(5000);
}


void Serial_Dis(int Pat)//Pat is a hex number e.g. 0xfc
{
  int bits[7] = {0};
  byte bitstosend = 0;
  char i;
  
  bits[7] = Pat/128;
  bits[6] = (Pat%128)/64;
  bits[5] = (Pat%64)/32;
  bits[4] = (Pat%32)/16;
  bits[3] = (Pat%16)/8;
  bits[2] = (Pat%8)/4;
  bits[1] = (Pat%4)/2;
  bits[0] = Pat%2;

  digitalWrite(ST,LOW);
  for(i=0;i<8;i++)
  {
    bitWrite(bitstosend,i,bits[i]);
  }
  
  Serial.print("bitstosend = ");
  Serial.print(bitstosend,DEC);
  Serial.println("");
  //delay(3000);
  shiftOut(DI,SH,MSBFIRST,bitstosend);
  Serial.println("Shift Complete");
  digitalWrite(ST,HIGH);
  
}

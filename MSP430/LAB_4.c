#define dig1  8 //thousand digit
#define dig2  9
#define dig3  10
#define dig4  11 // one digit

#define aa  2
#define bb  3
#define cc  4
#define dd  5
#define ee  6
#define ff  7
#define gg  14

int t = 5;


char table[]={0xc0,0xf9,0xa4,0xb0,0x99,
0x92,0x82,0xf8,0x80,0x90,0x88,0x83,0xc6,0xa1,0x86,0x8e}; //0-f

void setup()
{
  // put your setup code here, to run once:
  //pinMode(seg_pick,OUTPUT);
  pinMode(dig1,OUTPUT);
  pinMode(dig2,OUTPUT);
  pinMode(dig3,OUTPUT);
  pinMode(dig4,OUTPUT);
  
  pinMode(aa,OUTPUT);
  pinMode(bb,OUTPUT);
  pinMode(cc,OUTPUT);
  pinMode(dd,OUTPUT);
  pinMode(ee,OUTPUT);
  pinMode(ff,OUTPUT);
  pinMode(gg,OUTPUT);
}  



void loop()
{
  // put your main code here, to run repeatedly:
  int count = 0;
  int flag;
  int i;
  while(1)
  {
    int thou_dig, hundr_dig, ten_dig, one_dig;
    thou_dig = count/1000;
    hundr_dig = (count%1000)/100;
    ten_dig = (count%100)/10;
    one_dig = count%10;
    count++;
    if(count == 10000)
      count = 0;

    for(flag=0;flag<5;flag++)
    //each digit delay 50ms,4 digit will use 200ms. 
    //For 1 sec, use 5 cycle
    {
      
      for(i=0;i<4;i++)
      {
        if(i==0)//one digit
          display_num(one_dig,dig4);

        if(i==1)//
          display_num(ten_dig,dig3);

        if(i==2)
          display_num(hundr_dig,dig2);

        if(i==3)
          display_num(thou_dig,dig1);

        
      }


  }


  }





}



void display_num(char num, char digit)//display number on specific digit
{
  switch(num)
  {
    case 0: Num_0(digit);break;
    case 1: Num_1(digit);break;
    case 2: Num_2(digit);break;
    case 3: Num_3(digit);break;
    case 4: Num_4(digit);break;
    case 5: Num_5(digit);break;
    case 6: Num_6(digit);break;
    case 7: Num_7(digit);break;
    case 8: Num_8(digit);break;
    case 9: Num_9(digit);break;

  }
}




void Num_9(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW); //display 9 0x90 = 1001 0000
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}


void Num_8(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,LOW);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW); //display 8 0x80 = 1000 0000
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}


void Num_7(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,HIGH);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,HIGH); //display 7 0xf8 = 1111 1000
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}


void Num_6(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,HIGH);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,LOW);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW); //display 6 0x82 = 1000 0010
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}

void Num_5(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,HIGH);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW); //display 5 0x92 = 1001 0010
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}

void Num_4(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,HIGH);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,HIGH);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW);//0x99 1001 1001   display4
  delay(t);
  digitalWrite(dig_num,LOW);
 // delay(t);
  
}

void Num_3(char dig_num)
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

   digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,LOW); //  0xb0 = 1011 0000
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}

void Num_2(char dig_num)
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,HIGH);
  digitalWrite(dd,LOW);
  digitalWrite(ee,LOW);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,LOW); //0xa4 1010 0100   
  
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}

void Num_1(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,HIGH);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,HIGH);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,HIGH); //display 1 1111 1001   
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}

void Num_0(char dig_num)//dig1,dig2,dig3,dig4
{


  digitalWrite(dig1,LOW);
  digitalWrite(dig2,LOW);
  digitalWrite(dig3,LOW);
  digitalWrite(dig4,LOW);

  digitalWrite(dig_num,HIGH);

  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,LOW);
  digitalWrite(ff,LOW);
  digitalWrite(gg,HIGH); //display 0 0xc0 = 1100 0000
  delay(t);
  digitalWrite(dig_num,LOW);
  //delay(t);
  
}


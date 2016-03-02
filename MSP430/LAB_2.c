#define dig1  8
#define dig2  9
#define dig3  10
#define dig4  11

#define aa  2
#define bb  3
#define cc  4
#define dd  5
#define ee  6
#define ff  7
#define gg  14

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
  digitalWrite(dig2,LOW);
    digitalWrite(dig3,LOW);
      digitalWrite(dig4,LOW);
  digitalWrite(dig1,HIGH);
  digitalWrite(aa,HIGH);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,HIGH);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,HIGH); //display 1 1111 1001   
  //digitalWrite(dig1,HIGH);
  delay(1000);
  digitalWrite(dig1,LOW);
  delay(1000);

  digitalWrite(dig1,LOW);
    digitalWrite(dig3,LOW);
      digitalWrite(dig4,LOW);
  digitalWrite(dig2,HIGH);
  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,HIGH);
  digitalWrite(dd,LOW);
  digitalWrite(ee,LOW);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,LOW); //0xa4 1010 0100   
  //digitalWrite(dig1,HIGH);
  delay(1000);
  digitalWrite(dig2,LOW);
  delay(1000);

  digitalWrite(dig1,LOW);
    digitalWrite(dig2,LOW);
      digitalWrite(dig4,LOW);
  digitalWrite(dig3,HIGH);
  digitalWrite(aa,LOW);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,LOW);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,HIGH);
  digitalWrite(gg,LOW); //  0xb0 = 1011 0000
  //digitalWrite(dig1,HIGH);
  delay(1000);
  digitalWrite(dig3,LOW);
  delay(1000);
  
  
  

digitalWrite(dig1,LOW);
    digitalWrite(dig2,LOW);
      digitalWrite(dig3,LOW);
  digitalWrite(dig4,HIGH);
  digitalWrite(aa,HIGH);
  digitalWrite(bb,LOW);
  digitalWrite(cc,LOW);
  digitalWrite(dd,HIGH);
  digitalWrite(ee,HIGH);
  digitalWrite(ff,LOW);
  digitalWrite(gg,LOW); //0x99 1001 1001   
  //digitalWrite(dig1,HIGH);
  delay(1000);
  digitalWrite(dig4,LOW);
  delay(1000);

  digitalWrite(dig1,LOW);
    digitalWrite(dig2,LOW);
      digitalWrite(dig3,LOW);
        digitalWrite(dig4,LOW);

}

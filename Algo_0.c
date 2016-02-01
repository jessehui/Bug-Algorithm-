#include <RedBot.h>
RedBotMotors motors;
RedBotSensor Lsensor = RedBotSensor(A3);//left sensor
RedBotSensor Msensor = RedBotSensor(A6);//middle sensor
RedBotSensor Rsensor = RedBotSensor(A7);//right sensor
 
RedBotAccel accel;
RedBotEncoder encoder = RedBotEncoder(A2,10);
int countsPerRev = 192;
 
float wheelDiam = 65;
float wheelCirc = PI * wheelDiam;
int flag = 0;
 
void setup() 
{
    accel.enableBump();
    Serial.begin(9600);
}
 
void loop() 
{
    int bump;
    bump = accel.checkBump();
    Serial.println("where");
    while(bump)
    {
        Serial.print("IR Sensor Readings: ");
        Serial.print(Lsensor.read());
        Serial.print("\t");  // tab character
        Serial.print(Msensor.read());
        Serial.print("\t");  // tab character
        Serial.print(Rsensor.read());
        Serial.println();
 
        if ( (Lsensor.read() > 850) && (Msensor.read() > 850) )
        {
            Serial.println("wall here");
            while( ((Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850)) != 1)//
            //loop until all the sensor in white
            {
                //if all sensor in black turn left
                if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                  motors.leftDrive(-160);
                  motors.rightDrive(200);
                  delay(70);
                  motors.stop();
                  Serial.println("after rotation");
                  delay(50);
                }
 
                // if the right sensor in white, left and middle in black
                if((Rsensor.read()<850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                  motors.leftDrive(-160);
                  motors.rightDrive(200);
                  delay(70);
                  motors.stop();
                  Serial.println("after rotation 2");
                  delay(50); 
                }
 
                 //if right in black,left and middle in white, turn right a little bit
                if( (Rsensor.read()>850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(-160);
                  motors.leftDrive(200);
                  delay(30);
                  Serial.println("turn right");
                }
 
                //if right and middle in black, left in white, go forward
                if( (Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(153);
                  delay(30);
                  Serial.println("go forward");
                }
 
               Serial.println("not in one situation");
             
            }
            //at the end of the wall
            Serial.println("wall end");
            //test
            //motors.stop();
            
            //go forward;
            motors.rightDrive(160);
            motors.leftDrive(145);
            delay(600);
            motors.stop(); 
 
            //turn right for a big angle;
            motors.rightDrive(-160);
            motors.leftDrive(200);
            delay(600);
            Serial.println("turn a big angle before next level");
             
 
            //go to "next level"
            next_level();
            
             
         }
 
         else
         {
            Serial.println("move forward");
            motors.rightDrive(160);
            motors.leftDrive(153);
            delay(30);
            motors.stop(); 
         }
    }
}
 
void next_level()
{
        Serial.print("NIR Sensor Readings: ");
        Serial.print(Lsensor.read());
        Serial.print("\t");  // tab character
        Serial.print(Msensor.read());
        Serial.print("\t");  // tab character
        Serial.print(Rsensor.read());
        Serial.println();
 
  loop1:if ( (Lsensor.read() > 850) && (Msensor.read() > 850) )
        {
            Serial.println("Nwall here");
            while( ((Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850)) != 1)//
            //loop until all the sensor in white
            {
                //if all sensor in black turn right
                if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                  motors.rightDrive(-120);
                  motors.leftDrive(160);
                  delay(70);
                  motors.stop();
                  Serial.println("Nafter rotation");
                  delay(50);
                }
 
                // if the left sensor in white, white and middle in black
                if((Lsensor.read()<850)&&(Msensor.read()>850)&&(Rsensor.read()>850))
                {
                  motors.rightDrive(-120);
                  motors.leftDrive(160);
                  delay(70);
                  motors.stop();
                  Serial.println("Nafter rotation 2");
                  delay(50); 
                }
 
                 //if left in black,right and middle in white, turn left a little bit
                if( (Lsensor.read()>850)&&(Msensor.read()<850)&&(Rsensor.read()<850) )
                {
                  motors.leftDrive(-120);
                  motors.rightDrive(170);
                  delay(30);
                  Serial.println("Nturn left");
                }
 
                //if left and middle in black, left in white, go forward
                if( (Lsensor.read()>850)&&(Msensor.read()>850)&&(Rsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(153);
                  delay(30);
                  Serial.println("Ngo forward");
                }
 
                
             
            }
            //at the end of the wall
            Serial.println("Nwall end");
            //go forward;
            motors.rightDrive(160);
            motors.leftDrive(145);
            delay(450);
            motors.stop(); 
            Serial.println("Nwall not in sight");
 
            //turn left for a big angle;
            motors.leftDrive(-160);
            motors.rightDrive(200);
            delay(480);  //need to be adjusted frequently
            motors.stop();
            Serial.println("Nnext level");
 
            driveDistance(550,150);
            Serial.println("Final end");
            while(1);
           
       }
 
       else
       {
            Serial.println("Nmove forward");
            motors.rightDrive(160);
            motors.leftDrive(153);
            delay(30);
            motors.stop(); 
            goto loop1;
       }
}
 
void driveDistance(float distance, int motorPower)
{
  long lCount = 0;
  long rCount = 0;
  float numRev;
  // debug
  Serial.print("driveDistance is");
  Serial.print(distance);
  Serial.print(" mm at ");
  Serial.print(motorPower);
  Serial.println(" power.");
 
  numRev = (float) distance / wheelCirc;
  Serial.println(numRev, 3);
  encoder.clearEnc(BOTH);  // clear the encoder count
  motors.leftDrive(motorPower*0.99);
  motors.rightDrive(motorPower);
 
  while (rCount < numRev*countsPerRev)
  {
    // while the left encoder is less than the target count -- debug print 
    // the encoder values and wait -- this is a holding loop.
    lCount = encoder.getTicks(LEFT);
    rCount = encoder.getTicks(RIGHT);
    Serial.print(lCount);
    Serial.print("\t");
    Serial.print(rCount);
    Serial.print("\t");
    Serial.println(numRev*countsPerRev);
  }
  // now apply "brakes" to stop the motors.
  motors.brake();
}
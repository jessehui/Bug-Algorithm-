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
            while (flag<5)
            {
                // if all in black turn right
                if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                    Serial.println("start rotating");
                    motors.rightDrive(-80);
                    motors.leftDrive(170);
                    delay(50);
                    motors.stop();
                    Serial.println("after rotation");
                   // delay(50);
                   
                }
                 
                //if left in white,middle and right in black, turn right
                if((Lsensor.read()<850)&&(Msensor.read()>850)&&(Rsensor.read()>850))
                {
                  motors.rightDrive(-120);
                  motors.leftDrive(170);
                  delay(70);
                  motors.stop();
                  Serial.println("after rotation 2");
                  //delay(50); 
                }
 
                //if right and middle in white, left in black,turn left
                if( (Lsensor.read()>850)&&(Msensor.read()<850)&&(Rsensor.read()<850) )
                {
                  motors.leftDrive(-120);
                  motors.rightDrive(150);
                  delay(70);
                  Serial.println("turn left");
                }
 
                //if left and middle in black, right in white, go forward
                if( (Lsensor.read()>850)&&(Msensor.read()>850)&&(Rsensor.read()<850) )
                {
                  motors.rightDrive(170);
                  motors.leftDrive(158);
                  delay(70);
                  Serial.println("go forward");
                }
 
                //if all three in white turn left
                if( (Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  //go forward for a short time
                  motors.drive(160);
                  delay(50);
                  motors.stop();
                   
                  motors.leftDrive(-160);
                  motors.rightDrive(200);
                  delay(70);
                  Serial.println("turn left 2 ");
                  delay(50);
                   
                  //if not all three in white, the rotation is over,flag++
                  if( Lsensor.read()>850 )
                  {
                    flag++;
                    Serial.println("enter the white area");
                    Serial.println(flag);
                  }
                   
                }
 
 
               
            }//while
            //after the last time that the robot hits the end of the track, the encoder starts to work
            Serial.println("done1");
 
            //drive to the m-line
            driveDistance(150);
 
            //turn right for 90 degree 
            motors.leftDrive(150);
            motors.rightDrive(-130);
            delay(610);
 
            driveDistance(300*0.75);
            Serial.println("all over");
            motors.stop();
            while(1);
 
 
 
             
        }// if 
 
        else
        {
            Serial.println("move forward");
            motors.rightDrive(160);
            motors.leftDrive(153);
            delay(30);
            motors.stop(); 
           
        }
 
  }//while(bump)
}//loop
 
//move along the wall while using encoder to read the distance
void driveDistance(float distance)//distance in mm
{
          long lcount = 0;
          long rcount = 0;
          float numRev; 
 
          numRev = (float) distance/wheelCirc;
          encoder.clearEnc(BOTH);//clear the encoder count
 
          while(rcount < numRev*countsPerRev)
          {
            // if all in black turn right
                if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                    Serial.println("Dstart rotating");
                    motors.rightDrive(-80);
                    motors.leftDrive(170);
                    delay(50);
                    motors.stop();
                    Serial.println("Dafter rotation");
                   // delay(50);
                   
                }
                 
                //if left in white,middle and right in black, turn right
                if((Lsensor.read()<850)&&(Msensor.read()>850)&&(Rsensor.read()>850))
                {
                  motors.rightDrive(-120);
                  motors.leftDrive(170);
                  delay(70);
                  motors.stop();
                  Serial.println("Dafter rotation 2");
                  //delay(50); 
                }
 
                //if right and middle in white, left in black,turn left
                if( (Lsensor.read()>850)&&(Msensor.read()<850)&&(Rsensor.read()<850) )
                {
                  motors.leftDrive(-120);
                  motors.rightDrive(150);
                  delay(70);
                  Serial.println("Dturn left");
                }
 
                //if left and middle in black, right in white, go forward
                if( (Lsensor.read()>850)&&(Msensor.read()>850)&&(Rsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(158);
                  delay(70);
                  Serial.println("Dgo forward");
                }
 
                 
                //if all three in white go forward
                if( (Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(158);
                  delay(30);
                  Serial.println("Dgo forward");
                }
 
                lcount = encoder.getTicks(LEFT);
                rcount = encoder.getTicks(RIGHT);
                Serial.print(lcount);
                Serial.print("\t");
                Serial.print(rcount);
                Serial.print("\t");
                Serial.println(numRev*countsPerRev);
          }
 
          Serial.println("Done distance");
 
 
 
           
}
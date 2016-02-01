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
          //while( ((Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850)) != 1)
            //loop until all the sensor in white
 
          while(flag<7)
          {
              //if all sensor in black turn left
                if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                    Serial.println("start rotating");
                    motors.leftDrive(-120);
                    motors.rightDrive(150);
                    delay(40);
                    motors.stop();
                    Serial.println("after rotation");
                   // delay(50);
                   
                }
                  
                if((Rsensor.read()<850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                  motors.leftDrive(-120);
                  motors.rightDrive(150);
                  delay(40);
                  motors.stop();
                  Serial.println("after rotation 2");
                  //delay(50); 
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
 
                //if all three in white turn right
                if( (Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  //go forward for a short time
                  motors.drive(160);
                  delay(100);
                  motors.stop();
                   
                  motors.rightDrive(-160);
                  motors.leftDrive(200);
                  delay(70);
                  Serial.println("turn right 2 ");
                  delay(50);
                   
                  //if not all three in white, the rotation is over,flag++
                  if( Rsensor.read()>850 )
                  {
                    flag++;
                    Serial.println("enter the white area");
                    Serial.println(flag);
                  }
                   
                }
 
               Serial.println("not in one situation");
          }//while
 
          //after the last time that the rotot hits the end of the track, the encoder starts to work
          Serial.println("done1");
          driveDistance(2500*0.96);//distance need to be adjusted because the encoder doesn't work well sometimes
          Serial.println("leave the track");
          motors.stop();
 
          //turn left for 90 degree angle
          motors.leftDrive(-150);
          motors.rightDrive(160);
          delay(477);
          motors.stop();
          delay(1000);
 
          //go forwards to the goal point 
          driveDistance(300*0.9);
          motors.brake();
           
          Serial.println("Bug 1 END");
          while(1);
           
           
           
           
 
        }//if
 
        else
        {
            Serial.println("move forward");
            motors.rightDrive(160);
            motors.leftDrive(153);
            delay(30);
            motors.stop(); 
           
        }
     
  }//while(bump)
 
 
   
}
 
 
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
            if((Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                    Serial.println("Dstart rotating");
                    motors.leftDrive(-120);
                    motors.rightDrive(150);
                    delay(40);
                    motors.stop();
                    Serial.println("Dafter rotation");
                   // delay(50);
                   
                }
                  
                if((Rsensor.read()<850)&&(Msensor.read()>850)&&(Lsensor.read()>850))
                {
                  motors.leftDrive(-120);
                  motors.rightDrive(150);
                  delay(40);
                  motors.stop();
                  Serial.println("Dafter rotation 2");
                  //delay(50); 
                }
 
                 //if right in black,left and middle in white, turn right a little bit
                if( (Rsensor.read()>850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(-160);
                  motors.leftDrive(200);
                  delay(30);
                  Serial.println("Dturn right");
                }
 
                //if right and middle in black, left in white, go forward
                if( (Rsensor.read()>850)&&(Msensor.read()>850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(153);
                  delay(30);
                  Serial.println("Dgo forward");
                }
 
                //if all three in white go forward
                if( (Rsensor.read()<850)&&(Msensor.read()<850)&&(Lsensor.read()<850) )
                {
                  motors.rightDrive(160);
                  motors.leftDrive(153);
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
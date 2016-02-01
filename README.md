# Bug-Algorithm-
<img class="alignnone size-full wp-image-176" src="https://jessehui.files.wordpress.com/2016/01/e5b18fe5b995e5bfabe785a7-2016-01-08-e4b88be58d8811-53-28.png" alt="屏幕快照 2016-01-08 下午11.53.28" width="1802" height="1152" /><img class="alignnone size-full wp-image-178" src="https://jessehui.files.wordpress.com/2016/01/e5b18fe5b995e5bfabe785a7-2016-01-08-e4b88be58d8811-53-46.png" alt="屏幕快照 2016-01-08 下午11.53.46" width="1918" height="1172" /><img class="alignnone size-full wp-image-179" src="https://jessehui.files.wordpress.com/2016/01/e5b18fe5b995e5bfabe785a7-2016-01-08-e4b88be58d8811-54-18.png" alt="屏幕快照 2016-01-08 下午11.54.18" width="1914" height="1246" /><img class="alignnone size-full wp-image-177" 
src="https://jessehui.files.wordpress.com/2016/01/e5b18fe5b995e5bfabe785a7-2016-01-08-e4b88be58d8811-54-41.png" alt="屏幕快照 2016-01-08 下午11.54.41" width="1810" height="1190" />

&nbsp;

The task is to apply bug algorithm to complete this map:

<img class="alignnone size-medium wp-image-186" src="https://jessehui.files.wordpress.com/2016/01/e5b18fe5b995e5bfabe785a7-2016-01-09-e4b88ae58d8812-02-37.png?w=300" alt="屏幕快照 2016-01-09 上午12.02.37" width="300" height="277" />

Anyway, it is easy to know that bug0 algorithm will fail. However, we artificially program the robot to turn right at the second time it hits the wall.
To complete the project, we firstly should make the robot go directly forward. At first, we used motors.drive() to check if the robot can move directly. And we found that the right motor moves a little bit slower than the left ones. By reading the values of the encoder from serial port monitor, we found that the value of right encoder is always about 0.95 times the value of left encoder. So we use the function motor.leftDrive(0.95 * SpeedDes) and motor.rightDrive( SpeedDes) to make the robot go directly forward.

Second, we use the line-following sensor to detect the ‘wall’ which is actually the black line. When the value of the left sensor is more than 800, the robot will rotate a certain angle. To determine the angle, we simulated the situation that the robot rotates. When doing so, we read the value of the encoder. And adjust the velocity of each motor and the time of delay. Then we get three groups of parameters that are used to rotates for certain angles.

Third, we "teach" robot how to react to different situations by applying different bug algorithm method.

And this is the video I take for our robot
https://www.youtube.com/watch?v=Fay9hkHGQlQ


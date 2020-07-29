myRobot=mlrobot;
mlrobotstart(myRobot);

driveForward(myRobot,6)

% function Turns Left

turnLeft(myRobot,90);

% function Drives Forward

driveForward(myRobot,5)

% function Turns Left

turnLeft(myRobot,179);

% function Drives Forward

driveForward(myRobot,5)

% function Turns Left

turnLeft(myRobot,90);

% function Drives Forward

driveForward(myRobot,5)

% function Turns Left

turnLeft(myRobot,0);

% Stop Robot

mlrobotsetmotorvoltage(myRobot,'left',3);
mlrobotsetmotorvoltage(myRobot,'right',-3);
pause(2);

mlrobotsetmotorvoltage(myRobot,'left',0);
mlrobotsetmotorvoltage(myRobot,'right',0);

% Stop simulation
mlrobotstop(myRobot);

function [] = turnLeft(myRobot,dangle)
mlrobotsetmotorvoltage(myRobot,'left',3);
mlrobotsetmotorvoltage(myRobot,'right',3);
angle = mlrobotreadcompassangle(myRobot);
test = abs(dangle-angle);
while test>1.5
    angle = mlrobotreadcompassangle(myRobot);
    test = abs(dangle-angle);
    pause(0.01);
end

angle1 = mlrobotreadcompassangle(myRobot);
mlrobotsetmotorvoltage(myRobot,'left',1);
mlrobotsetmotorvoltage(myRobot,'right',1);
pause(0.01);
angle2 = mlrobotreadcompassangle(myRobot);

if abs(dangle-angle1)>abs(dangle-angle2)
    mlrobotsetmotorvoltage(myRobot,'left',0.2);
    mlrobotsetmotorvoltage(myRobot,'right',0.2);
    angle = mlrobotreadcompassangle(myRobot);
    test = abs(dangle-angle);
    while test>0.2
        angle = mlrobotreadcompassangle(myRobot);
        test = abs(dangle-angle);
        pause(0.01);
    end
else
    mlrobotsetmotorvoltage(myRobot,'left',-0.2);
    mlrobotsetmotorvoltage(myRobot,'right',-0.2);
    angle = mlrobotreadcompassangle(myRobot);
    test = abs(dangle-angle);
    while test>0.2
        angle = mlrobotreadcompassangle(myRobot);
        test = abs(dangle-angle);
        pause(0.01);
    end
end 

mlrobotsetmotorvoltage(myRobot,'left',0);
mlrobotsetmotorvoltage(myRobot,'right',0);
end

function [] = driveForward(myRobot,time)
mlrobotsetmotorvoltage(myRobot,'left',-3);
mlrobotsetmotorvoltage(myRobot,'right',3);
pause(time);
end

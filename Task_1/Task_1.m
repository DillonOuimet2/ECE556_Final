%{
ECE - 556 
Final Project - Task 1
Team 3 - Annie Kate Watson, Dillon Ouimet, Jacob Walker, Trenton Wallis 
%}

clc
clear
close all

% Setup the connections to the mindstorm
myev3 = legoev3('usb');
motorL = motor(myev3,'A'); % Initializing the motor at port A of EV3
motorR = motor(myev3,'D'); % Initializing the motor at port D of EV3

motorL.Speed = 30; %  Set the motor speed
motorR.Speed = 30;
MSD = 600; % Set the US value that corresponds to 3 inches (Motor Stopping Distance).
n = 2;
allUSvals = 1500*ones(20,1);
total = 0;
avgUSvals = 1500;
i = 1;

start(motorL)
start(motorR)

% Drive forward until the sensor picks up a value within 3 inches.
while n > 0
    us_val = readInputDeviceREADY_RAW(myev3,1,0,1) % reading the us sensor from port 1

    % might want to create a function to filter the US values...
    % If not we can just stay in the loop.

%     allUSvals(i) = us_val;
%     total = total + allUSvals(i);
%    
%     if mod(i,20) == 0
%          avgUSvals = total/20;
%     end
% 
%     i = i + 1;

    if (us_val < MSD)

        stop(motorL) % If this was a break from the loop, we might get into trouble with false readings...
        stop(motorR)

        break

    else
        motorL.Speed = 30;
        motorR.Speed = 30;
    end

end

stop(motorL)
stop(motorR)


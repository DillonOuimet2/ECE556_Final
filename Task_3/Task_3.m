%{
ECE - 556 
Final Project - Task 2
Team 3 - Annie Kate Watson, Dillon Ouimet, Jacob Walker, Trenton Embry 
%}

clc
clear
close all

%Setup the connections to the mindstorm
myev3 = legoev3('usb');
motor = motor(myev3,'A'); % Initializing the motor at port A of

motor.Speed=30; %Set the motor speed 
MSD = 200; %Set the US value that corresponds to 3 inches (Motor Stopping Distance).
n=2;

% Set the Kp and Ki values
Kp = 
start(motor)

%Drive forward until the sensor picks up a value within 3 inches.
while n>0
 %take a reading of the sensor values
 us_val = readInputDeviceREADY_RAW(myev3,1,0,1) % reading the us sensor from port 1
 ir_val_l = readInputDeviceREADY_RAW(myev3,2,0,1) % reading the left IR sensor from port 2
 ir_val_m = readInputDeviceREADY_RAW(myev3,3,0,1) % reading the left IR sensor from port 3
 ir_val_r = readInputDeviceREADY_RAW(myev3,4,0,1) % reading the left IR sensor from port 4       

 %Calculate the line position
 


% might want to create a function to filter the US values...
%If not we can just stay in the loop. 
if (us_val < MSD)
    stop(motor) % If this was a break from the loop, we might get into trouble with false readings...
else
    start(motor)
end


end
stop(motor)


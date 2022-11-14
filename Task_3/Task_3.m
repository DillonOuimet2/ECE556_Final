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
motorL = motor(myev3,'A'); % Initializing the motor at port A of EV3
motorR = motor(myev3,'B'); % Initializing the motor at port B of EV3

motorL.Speed = 30; % Set the motor speed 
motorR.Speed = 30; % Set the motor speed 
MSD = 200; % Set the US value that corresponds to 3 inches (Motor Stopping Distance).
n=2;

% Set the Kp and Ki values
Kp = 1;
Ki = 2;
start(motorL,motorR)

% Calibration (note: can be a separate code)
for i = 1:30
    L(i) = readInputDeviceREADY_RAW(myev3,2,0,1); % reading the left IR sensor from port 2
    F(i) = readInputDeviceREADY_RAW(myev3,3,0,1); % reading the left IR sensor from port 3
    A(i) = readInputDeviceREADY_RAW(myev3,4,0,1); % reading the left IR sensor from port 4       

    maxRLI = max(L,F,A);
    minRLI = min(L,F,A);
    threshold = minRLI + 1/3*(maxRLI - minRLI);
end

stop(motorL,motorR)

% Drive forward until the sensor picks up a value within 3 inches.
while n>0
 % Take a reading of the sensor values
 us_val = readInputDeviceREADY_RAW(myev3,1,0,1); % reading the us sensor from port 1
 L = readInputDeviceREADY_RAW(myev3,2,0,1); % reading the left IR sensor from port 2
 F = readInputDeviceREADY_RAW(myev3,3,0,1); % reading the left IR sensor from port 3
 A = readInputDeviceREADY_RAW(myev3,4,0,1); % reading the left IR sensor from port 4       

 reading = (-2*L)+F+A
 
 
 %call the line cal code
 

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


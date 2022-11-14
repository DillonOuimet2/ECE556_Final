%{
ECE - 556 
Final Project - Task 1
Team 3 - Annie Kate Watson, Dillon Ouimet, Jacob XXX, Trenton Wallis 
%}

clc
clear


%Setup the connections to the mindstorm
myev3 = legoev3('usb');
motor = motor(myev3,'A'); % Initializing the motor at port A of

motor.Speed=30; %Set the motor speed 
MSD = 200; %Set the US value that corresponds to 3 inches (Motor Stopping Distance).
n=2;

start(motor)

%Drive forward until the sensor picks up a value within 3 inches.
while n>0
 us_val = readInputDeviceREADY_RAW(myev3,1,0,1) % reading the us sensor from port 1

% Remove this later
% touch_read=readInputDeviceREADY_SI(myev3,1,0,1); % reading the Lego touch sensor SI reading

% might want to create a function to filter the US values...
%If not we can just stay in the loop. 
if (us_val < MSD)
    stop(motor) % If this was a break from the loop, we might get into trouble with false readings...
else
    start(motor)
end

% if (touch_read==1)
%     break
% end

end
stop(motor)


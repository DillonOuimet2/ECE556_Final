
clc
clear 
close all

myev3 = legoev3('usb');
tic;
if toc >= 5
    beep(myev3,3)
    fprintf("done\n")
end

function [result] = comp_trap(x,f_x)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
   
    result = sum(f_x);
    h = x(end) - x(end - 1);

    result = result - ((f_x(end) + f_x(1)) / 2);
    result = result * h;
end
function [ result ] = simpson_method( f, a, b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    
    mid_pt = a + (b -a) / 2;
    result = ((b - a) / 6) * (f(a) + f(b) + 4 * f(mid_pt)); 
    

end

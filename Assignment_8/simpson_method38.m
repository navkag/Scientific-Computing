function [ result ] = simpson_method38( f, a, b )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    interval_pts = linspace(a, b, 4);
    
    
    result = (3 * (b - a) / 24) * (f(a) + f(b) + 3 * f(interval_pts(2)) + 3 * f(interval_pts(3)));
%     result = result - (3 * (((b - a) / 3) ^ 5) / 80) * f(interval_pts(2)) ^ 4;
end
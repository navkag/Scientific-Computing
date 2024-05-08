function [results] = f1(x1, x2, x3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
    results = [];
    results = vertcat(results, [x1 * x2 - x3^2 - 1, x1 * x2 * x3 + x2^2 - x1^2 - 2, exp(x1) + x3 - exp(x2) - 3]);

end
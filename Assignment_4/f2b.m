function [results] = f2b(x1, x2)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    results = [];
    results = vertcat(results, [1 + x1^2 - x2^2 + exp(x1) * cos(x2), 2 * x1 * x2 + exp(x1) * sin(x2)]);
end
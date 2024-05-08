function [results] = f2a(x1, x2)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
    results = [];
    results = vertcat(results, [4 * x1^2 - x2^2, 4 * x1 * x2^2 - x1 - 1]);
end
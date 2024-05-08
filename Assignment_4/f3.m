function [results] = f3(x1, x2, x3)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    results = [];
    results = vertcat(results, [6 * x1 - 2 * cos(x2 * x3) - 1, 9 * x2 + sqrt(x1^2 +  sin(x3) + 1.06) + 0.9, 60 * x3 + 3 * exp(-1 * x1 * x2) + 10 * pi - 3]);
end
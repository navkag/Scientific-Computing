function [result] = comp_midpoint(f, n, a, b)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    h = (b - a) / (n + 2);

    fprintf("\nh value: %d\n", h);

    X = 0;

    for i = 0:n/2
        j = 2 * i;
        x = a + (j + 1) * h;

        X = X + f(x);
    end

    result = 2 * h * X;
end
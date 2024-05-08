function [result] = comp_trapfun(f, n, a, b)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
    h = (b - a) / n;

    fprintf("\nh value: %d\n", h);

    XI0 = f(a) + f(b);

    XI1 = 0;

    for i = 1:n - 1
        X = a + i * h;
        XI1 = XI1 + f(X);
    end

    result = h * (XI0 + 2 * XI1) / 2;
end
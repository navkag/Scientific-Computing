function [ results ] = newtonq1(x1, x2, x3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   (x1, x2, x3) initial approximaton.
    results = [];

    itr = 0;
    max_itr = 6;
    tolerance = 1e-10;

    while itr < max_itr
        itr = itr + 1;
        
        e11 = x2;
        e12 = x1;
        e13 = -2 * x3;

        e21 = x2 * x3 -2 * x1;
        e22 = x1 * x3 + 2 * x2;
        e23 = x1 * x2;

        e31 = exp(x1);
        e32 = -exp(x2);
        e33 = 1;
        
        J = [e11 e12 e13; e21 e22 e23; e31 e32 e33];
        
        if det(J) == 0
            results = vertcat(results, [itr, x1, x2, x3, 999, 999, 999]);
            return;
        end
        
        h = -1 * J \ [x1 * x2 - x3^2 - 1; x1 * x2 * x3 + x2^2 - x1^2 - 2; exp(x1) + x3 - exp(x2) - 3];
        
        
        x1 = x1 + h(1);
        x2 = x2 + h(2);
        x3 = x3 + h(3);
        
        results = vertcat(results, [itr, x1, x2, x3, h(1), h(2), h(3)]);
        
        if abs(h(1)) < tolerance && abs(h(2)) < tolerance && abs(h(3)) < tolerance
            return;
        end       
    end
    
    if itr == max_itr
        fprintf('Max iteration limit reached! Q1\n');
    end
end


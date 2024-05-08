function [ results ] = newtonq2a(x1, x2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   (x1, x2, x3) initial approximaton.
    results = [];

    itr = 0;
    max_itr = 2;
    tolerance = 1e-5;

    while itr < max_itr
        itr = itr + 1;
        
        e11 = 8 * x1;
        e12 = -2 * x2;
        

        e21 = 4 * x2^2 - 1;
        e22 = 8 * x1 * x2;
        
        
        J = [e11 e12; e21 e22];
        
        if det(J) == 0
            results = vertcat(results, [itr, x1, x2, 999, 999]);
            return;
        end
        
        h = -1 * J \ [4 * x1^2 - x2^2; 4 * x1 * x2^2 - x1 - 1];
        
        
        x1 = x1 + h(1);
        x2 = x2 + h(2);
        
        
        results = vertcat(results, [itr, x1, x2, h(1), h(2)]);
        
        if abs(h(1)) < tolerance && abs(h(2)) < tolerance 
            return;
        end
        
    end
    
    if itr == max_itr
        fprintf('Max iteration limit reached! Q2a\n');
    end
end


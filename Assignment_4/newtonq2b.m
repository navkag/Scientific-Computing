function [ results ] = newtonq2b(x1, x2)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   (x1, x2, x3) initial approximaton.
    results = [];

    itr = 0;
    max_itr = 5;
    tolerance = 1e-5;

    while itr < max_itr
        itr = itr + 1;
        
        e11 = 2 * x1 + exp(x1) * cos(x2);
        e12 = -2 * x2 - exp(x1) * sin(x2);
        

        e21 = 2 * x2 + exp(x1) * sin(x2);
        e22 = 2 * x1 + exp(x1) * cos(x2);
        
        
        J = [e11 e12; e21 e22];
        
        if det(J) == 0
            results = vertcat(results, [itr, x1, x2, 999, 999]);
            return;
        end
        
        h = -1 * J \ [1 + x1^2 - x2^2 + exp(x1) * cos(x2); 2 * x1 * x2 + exp(x1) * sin(x2)];
        
        
        x1 = x1 + h(1);
        x2 = x2 + h(2);
        
        
        results = vertcat(results, [itr, x1, x2, h(1), h(2)]);
        
        if abs(h(1)) < tolerance && abs(h(2)) < tolerance 
            return;
        end
        
    end
    
    if itr == max_itr
        fprintf('Max iteration limit reached! Q2b\n');
    end
end


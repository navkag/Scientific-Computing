function [ results ] = newtonq3(x1, x2, x3)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%   (x1, x2, x3) initial approximaton.
    results = [];

    itr = 0;
    max_itr = 1000;
    tolerance = 1e-6;

    while itr < max_itr
        itr = itr + 1;
        
         e11 = 6;
         e12 = 2 * x3 * sin(x2 * x3);
         e13 = 2 * x2 * sin(x2 * x3);
 
         e21 = x1 * (x1^2 + sin(x3) + 1.06)^-0.5;
         e22 = 9;
         e23 = 0.5 * cos(x3) * (x1^2 + sin(x3) + 1.06)^-0.5;
 
         e31 = -3 * x2 * exp(-x1 * x2);
         e32 = -3 * x1 * exp(-x1 * x2);
         e33 = 60;

%         J = jacobian([6 * x1 - 2 * cos(x2 * x3) - 1, 9 * x2 + sqrt(x1^2 +  sin(x3) + 1.06) + 0.9, 60 * x3 + 3 * exp(-1 * x1 * x2) + 10 * pi - 3], [x1; x2; x3]);
        
         J = [e11 e12 e13; e21 e22 e23; e31 e32 e33];
        
        if det(J) == 0
            results = vertcat(results, [itr, x1, x2, x3, 999, 999, 999]);
            return;
        end

        func_val = f3(x1, x2, x3);
        
        h = -1 * J \ [func_val(1); func_val(2); func_val(3)];
        
        
        x1 = x1 + h(1);
        x2 = x2 + h(2);
        x3 = x3 + h(3);
        
        results = vertcat(results, [itr, x1, x2, x3, h(1), h(2), h(3)]);
        
        if max(abs(h)) < tolerance
            return;
        end
        
    end
    
    if itr == max_itr
        fprintf('Max iteration limit reached! Q3\n');
    end
end


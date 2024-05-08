function [results] = modified_newton(f, df, dff, x_0, tolerance)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
    itr = 0;
    max_itr = 100000;
    
    results = [];
    results = double(results);
    
    while itr < max_itr
        itr = itr + 1;
        x_1 = x_0 - f(x_0) * df(x_0) / (df(x_0) * df(x_0) - f(x_0) * dff(x_0));
    
        results = vertcat(results, [itr, x_1, abs(x_1 - x_0)]);
        
        if abs(x_1 - x_0) < tolerance
            fprintf("Solution found at iteration %d: %d\n", itr, x_1);
            break;
        end
    
        x_0 = x_1;
    end

    if itr == max_itr
        fprintf("Max iteration limit exceeded!\n");
    % else
    %     plotter
    end
end
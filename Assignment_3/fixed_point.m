function [results] = fixed_point(x_0, g, tolerance)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here

    max_itr = 100000;
    itr = 0;
    
    results = [];
    results = double(results);
    
    while itr < max_itr
        itr = itr + 1;
        x_1 = g(x_0);
        
        results = vertcat(results, [itr, x_1, abs(x_1 - x_0)]);
    
        if abs(x_1 - x_0) < tolerance
            fprintf("Approx solution %f at iteration %d.\n", x_1, itr);
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
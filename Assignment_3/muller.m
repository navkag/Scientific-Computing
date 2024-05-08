function [results] = muller(x0, x1, x2, f, tolerance)
    results = [];
    results = double(results);
    itr = 0;
    max_itr = 10000;
    
    while itr < max_itr
        itr = itr + 1;
        
        a = (fsuppl(f, x2, x1) - fsuppl(f, x1, x0)) / (x2 - x0); 
        b = fsuppl(f, x2, x1) + (x2 - x1) * a;
        c = f(x2);

        descriminant = (b^2 - 4 * c * a) ^ 0.5;

        if abs(b - descriminant) > abs(b + descriminant)
            denominator = b - descriminant;
        else
            denominator = b + descriminant;
        end

        x3 = x2 - (2 * c / denominator);
        
        results = vertcat(results, [itr, x3, abs(x3 - x2)]);

        if abs(x3 - x2) < tolerance
            fprintf("Solution found at iteration %d: %d  + i%d\n", itr, real(x3), imag(x3));
            break;
        end

        x0 = x1;
        x1 = x2;
        x2 = x3;

    end
    
    if itr == max_itr
        fprintf("Max iteration limit exceeded!\n");
    % else
    %     plotter
    end

end
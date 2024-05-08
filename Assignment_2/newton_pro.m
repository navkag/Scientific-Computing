function [results] = newton_pro(question, x0, M, epsilon)
% BISECTION: implementation of bisection method.
% Parameters: 
% question: question number corresponding to the function.
% x0: initial point for newton's method
% M: Max number of iterations
% delta: step size tolerance
% epsilson: function value tolerance
format long
     
    itr = 0;
    results = [];
    results = double(results);

    root = 0;

    if abs(f(question, x0)) < epsilon
        % fprintf('Root already at %d\n', x0);
        results = vertcat(results, [itr, double(x0), f(question, x0)]);
        return;
    end
    while itr < M
        itr = itr + 1;
        x1 = x0 - f(question, x0) / f_der(question, x0);
        
        results = vertcat(results, [itr, double(x1), abs(x1 - x0)]);

        if abs(f(question, x1)) < epsilon 
            % fprintf('Tol achieved at iteration %d, the root is %f\n', itr, x1);
                return;
        end

        
        x0 = x1;
    end
    
    fprintf('Max iteration limit reached!\n');
    % fprintf('Root found at %f\n', x0);   
end


function result = f(question, x)
% Wrapper function for function catalogue f_wrapped
    result = f_wrapped(question, x);
end


function result = f_der(question, x)
% Derivative of the wrapper function at x
    result = (f_wrapped(question, x + 1e-10) - f_wrapped(question, x - 1e-10)) / 2e-10;
end
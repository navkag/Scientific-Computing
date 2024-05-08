function [results] = bisection_pro(question, a, b, M, epsilon)
% BISECTION: implementation of bisection method.
% Parameters: 
% question: question number corresponding to the function.
% [a, b]: interval
% M: Max number of iterations
% delta: step size tolerance
% epsilson: function value tolerance
format long

    itr = 1;
    results = [];
    results = double(results);

    root = 0;

    if abs(f(question, a)) < epsilon
        % fprintf('Root already at %d\n', a);
        results = vertcat(results, [itr, a, f(question, a)]);
    elseif abs(f(question, b)) < epsilon
        % fprintf('Root already at %d\n', double(b));
        results = vertcat(results, [itr, b, f(question, b)]);
    elseif sign(f(question, a)) * sign(f(question, b)) == -1
        while itr < M
            c = a + (b - a) / 2;

            results = vertcat(results, [itr, c, abs(root - c)]);
            root = c;
            
            if abs(f(question, c)) < epsilon
                % fprintf('Tol achieved at iteration %d, the root is %f\n', itr, c);
                break
            else
                if sign(f(question, c)) ~= sign(f(question, a))
                    b = c;
                else
                    a = c;
                end
        
                itr = itr + 1;
            end 
        end

        if itr == M
            fprintf('Max iteration limit reached!\n');
            % fprintf('Root found at %f\n', c);
        end
    end

end


function [result] = f(question, x)
% Wrapper function for function catalogue f_wrapped
    result = f_wrapped(question, x);
end
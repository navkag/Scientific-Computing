function result = backward2(n, a, b, alpha, beta, p, q, r, y)
% Central for 1st order and central for 2nd order
    xs = linspace(a, b, n + 1);
    h = (b - a) / n;
    
    w(1) = alpha;
    w(n + 1) = beta;
    
    A = zeros(n - 1);
    
    for i = 1:(n - 1)
        val = a + i * h;
    
        % A(i, i) = 2 + h * p(val) + (h ^ 2) * q(val);
        % 
        % if (i + 1) <= n - 1
        %     A(i, i + 1) = - 1;
        % end
        % 
        % if (i - 1) >= 1
        %     A(i, i - 1) = - (1 + h * p(val));
        % end

        if (i == 1)
            A(1, 1) = 1 + q(val) * (h ^ 2);
            A(1, 2) = - 1;
        elseif (i == n - 1)
            A(n - 1, n - 2) = -1 - h * p(val);
            A(n - 1, n - 1) = 1 + h * p(val) + (h ^ 2) * q(val);
        else
            A(i, i - 1) = - (1 + h * p(val));
            A(i, i) = 2 + h * p(val) + (h ^ 2) * q(val);
            A(i, i + 1) = -1;
        end
    
        if (i == 1)
            b(i) = -r(val) * (h ^ 2) - (h * alpha) * (1 + h * p(val));
        elseif (i == (n - 1))
             b(i) = -r(val) * (h ^ 2) + beta * h;
        else
            b(i) = -r(val) * (h ^ 2);
        end 
    end

    w = linsolve(A, b');
    result(:, 1) = xs;
    result(:, 2) = [alpha, w', beta];
    
    % Actual solution
    for i = 0:n
        val = a + i * h;
        result(i + 1, 3) = y(val);
    end

    error = abs(result(:, 2) - result(:, 3));
    result(:, 4) = error;
end
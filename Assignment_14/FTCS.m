function [U, x, t] = FTCS(L, T, dx, dt, alpha, f, lbc, rbc)
    N = round(L / dx) + 1;
    M = round(T / dt) + 1;
    lambda = (alpha * dt) / (dx ^ 2);
 
    x = 0:dx:L;
    t = 0:dt:T;
    
    % Mesh Matrix
    U = zeros(M, N);
    U(:, 1) = lbc(t);      % Left Boundary Condition
    U(:, end) = rbc(t);    % Right Boundary Condition
    U(1, :) = f(x);     % Initial condition

    % FTCS Scheme
    for i = 1:(M - 1)
        for j = 2:(N - 1)
            U(i + 1, j) = lambda * U(i, j + 1) + (1 - 2 * lambda) * U(i, j) + lambda * U(i, j - 1);
        end
    end

end


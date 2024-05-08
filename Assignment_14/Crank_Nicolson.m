function [U, x, t] = Crank_Nicolson(L, T, dx, dt, alpha, f, lbc, rbc)
    N = round(L / dx) + 1;
    M = round(T / dt) + 1;
    lambda = (alpha * dt) / (2 * (dx ^ 2));
    
    x = 0:dx:L;
    t = 0:dt:T;
    
    % Mesh Matrix
    U = zeros(M, N);
    U(:, 1) = lbc(t);      % Left Boundary Condition
    U(:, N) = rbc(t);      % Right Boundary Condition
    U(1, :) = f(x);     % Initial Condition
    
    % CN scheme
    A = zeros(N - 2);
    
    A(1, 1) = (1 + 2 * lambda);
    A(1, 2) = - lambda;
    A(N - 2, N - 3) = - lambda;
    A(N - 2, N - 2) = (1 + 2 * lambda);
    
    % Tri-diagonal Entries
    for i = 2:N - 3
        A(i, i - 1) = - lambda;
        A(i, i) = (1 + 2 * lambda);
        A(i, i + 1) = - lambda;
    end
    
    for i = 1:M - 1
        b = zeros(N - 2, 1);
    
        for j = 2:N - 1
            b(j - 1) = U(i, j) * (1 - 2 * lambda) + lambda * U(i, j - 1) + lambda * U(i, j + 1);
        end
    
        b(1) = b(1) + lambda * U(i + 1, 1);
        b(end) = b(end) + lambda * U(i + 1, end);
        
        res = A \ b;
    
        U(i + 1, 2:N - 1) = res;
    end
end
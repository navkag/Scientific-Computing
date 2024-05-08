function [U, x, t] = BTCS(L, T, dx, dt, alpha, f, lbc, rbc)
    N = round(L / dx) + 1;
    M = round(T / dt) + 1;
    lambda = (alpha * dt)/(dx ^ 2);
    
    x = 0:dx:L;
    t = 0:dt:T;
    
    % Mesh Matrix
    U = zeros(M, N);
    U(:, 1) = lbc(t);           % Left Boundary Condition
    U(:, N) = rbc(t);           % Right Boundary Condition
    U(1, :) = f(x);          % Initial Condition

    A = zeros(N - 2);

    A(1, 1) = 1 + 2 * lambda;
    A(1, 2) = - lambda;
    A(N - 2, N - 3) = -lambda;
    A(N - 2, N - 2) = 1 + 2 * lambda;

    for i = 2:(N - 3)
        A(i, i - 1) = -lambda;
        A(i, i) = 1 + 2 * lambda;
        A(i, i + 1) = -lambda;
    end

    % BTCS Scheme
    for i = 1:(M - 1)
        b = zeros(N - 2, 1);
        b(1) = U(i, 2) + lambda * U(i + 1, i);
        b(N - 2) = U(i, N - 1) + lambda * U(i + 1, N);

        for k = 2:(N - 3)
            b(k) = U(i, k + 1);
        end
        
        W = A \ b;

        U(i + 1, 2:(N - 1)) = W;
    end

end

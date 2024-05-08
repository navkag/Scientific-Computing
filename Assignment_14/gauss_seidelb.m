function [U, X, Y] = gauss_seidelb(BC, f, x_interval, y_interval, h, k)
    % Inputs:
    % PDE: Function handle for the PDE f(x, y)
    % BC: Function handle for the boundary conditions g(x, y)
    % x_interval: [x_min, x_max]
    % y_interval: [y_min, y_max]
    % h: Step size in x-direction
    % k: Step size in y-direction
    % Outputs:
    % U: Approximate solution
    % X: Grid points in x-direction
    % Y: Grid points in y-direction

    % Define grid
    x = x_interval(1):h:x_interval(2);
    y = y_interval(1):k:y_interval(2);
    [X, Y] = meshgrid(x, y);

    % Initialize solution matrix
    U = zeros(size(X));

    % Apply boundary conditions
    U(:, 1) = BC(x(1), y);       % Left boundary
    U(:, end) = BC(x(end), y);   % Right boundary
    U(1, :) = BC(x, y(1));       % Top boundary
    U(end, :) = BC(x, y(end));   % Bottom boundary

    % Try to run this for say 1000 iterations:
    N = 1000;
    for k = 1:N
        % Iterate through inner points
        for i = 2:length(x)-1
            for j = 2:length(y)-1
                % Apply finite difference scheme
                U(i, j) = ((1 / (h ^ 2)) * (U(i + 1, j) + U(i - 1, j) + U(i, j - 1) + U(i, j + 1)) + (1 / h) * (U(i + 1, j) + U(i, j + 1)));
                U(i, j) = U(i, j) - f(x(i), y(j));
                U(i, j) = U(i, j) / ((4 / (h ^ 2)) + (2 / h) - 1);
            end
        end
    end
    % U = transpose(U);
end

function [U, X, Y] = jacobia(BC, x_interval, y_interval, h, k)
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

    % Try to run this for say 1000 iterations.
    N = 1000;

    for k = 1:N
        U_old = U;
        % Iterate through inner points
        for i = 2:length(x)-1
            for j = 2:length(y)-1
                % Apply five-point stencil finite difference scheme
                U(i, j) = (0.25 * (U_old(i+1, j) + U_old(i-1, j) + U_old(i, j+1) + U_old(i, j-1)));
            end
        end
        % U = transpose(U);
    end
end

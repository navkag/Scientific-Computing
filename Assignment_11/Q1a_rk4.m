clear; clc;

fprintf('\n\nQ1:\n');

f41 = @(t, y) 1 + (y / t) + (y / t) ^ 2;

fprintf('\npart(a) 4th order rk method\n');

result41a = rk_4(f41, [1 3], 0, 10);
result41b = find_order(1, 3, 0, f41);
disp1(result41a);
disp2(result41b);
plot1(result41a, 'Q1ayvst_rk4.png');
plot2(result41a, 'Q1aerrorvst_rk4.png');
plot3(result41b, 'Q1aloglogn_rk4.png');
plot4(result41b, 'Q1aorderplot_rk4.png');

function result = rk_4(f, tspan, y0, N)
   
    t0 = tspan(1);
    tf = tspan(2);
    h = (tf - t0) / N;
    t = linspace(t0, tf, N+1);
%     y = zeros(1, N+1);
    y(1) = y0;
    
    % Iterate using Implicit Euler method
    for i = 1:N
        K1 = h * f(t(i), y(i));
        K2 = h * f(t(i) + h * 0.5, y(i) + 0.5 * K1);
        K3 = h * f(t(i) + h * 0.5, y(i) + 0.5 * K2);
        K4 = h * f(t(i) + h, y(i) + K3);
        y(i + 1) = y(i) + K1 / 6 + K2 / 3 + K3 / 3 + K4 / 6;
    end
    
    exact = exact_value(t);
    error = abs(y - exact);
    
    result(:, 1) = t;
    result(:, 2) = y;
    result(:, 3) = exact;
    result(:, 4) = error;
end

function y_next = newton_method(F, y_guess)
    % Newton's method for solving F(y_next) = 0
    tol = 1e-6; % Tolerance for convergence
    max_iter = 100; % Maximum number of iterations
    
    % Initialize variables
    y_next = y_guess;
    iter = 0;
    error = tol + 1;
    
    % Iterate until convergence or maximum iterations reached
    while error > tol && iter < max_iter
        iter = iter + 1;
        F_val = F(y_next);
        J = (F(y_next + tol) - F_val) / tol; % Approximate Jacobian using forward difference
        delta_y = - J\F_val; % Newton's update
        y_next = y_next + delta_y;
        error = norm(delta_y);
    end
    
    % Check for convergence
    if iter >= max_iter
        warning('Newton method did not converge');
    end
end


% function result = euler_explicit(a, b, N, alpha, f)
%     h = (b - a) / N;
%     t = a:h:b;
%     y(1) = alpha;
%     % exact(1) = alpha;
% 
%     for i = 1:N
%         y(i + 1) = y(i) + h * f(t(i), y(i));
%         % exact(i + 1) = exact_value(f, alpha, a, t(i + 1));
%     end
%     
%     % exact = zeros(1, N + 1);
%     exact = exact_value(f, alpha, a, t);
%     error = abs(y - exact);
% 
% 
%     result(:, 1) = t;
%     result(:, 2) = y;
%     result(:, 3) = exact;
%     result(:, 4) = error;
% end


function result = exact_value(x)
    syms t;
    f1 = t * tan(log(t));

    result = subs(f1, t, x);
end

function [] = disp1(results)
    headings = ['      t_i', '     Approx.', '    Exact', '    Error'];
    N = size(results, 1) - 1;
    fprintf('\nFor N = %d\n', N);
    disp(headings);
    disp(results);
end

function [] = disp2(results)
    headings = ['      N', '     E_N', '    Order'];
    disp(headings);
    disp(results);
end

function [] = plot1(results, filename)
    plot(results(:, 1), results(:, 2), 'DisplayName', 'Approx.', 'Color', 'red');
    hold on;
    plot(results(:, 1), results(:, 3), 'DisplayName', 'Exact', 'Color', 'blue');
    hold off;
    legend();
    title('y vs t for approx. and exact solutions.');
    xlabel('t');
    ylabel('y');

    saveas(gcf, filename);
    clf;
end

function [] = plot2(results, filename)
    plot(results(:, 1), results(:, 4), 'DisplayName', 'Error', 'Color', 'red');
    % legend();
    title('Error vs t.');
    xlabel('t');
    ylabel('error');

    saveas(gcf, filename);
    clf;
end

function [] = plot3(results, filename)
    plot(log(results(:, 1)), log(results(:, 2)), 'DisplayName', 'Error', 'Color', 'red');
    hold on;
    plot([3 4 3 3], [-9 -9 -5 -9], 'Color', 'blue');
    hold off;
    % legend();
    title('log(E_N) vs log(N)');
    xlabel('log(N)');
    ylabel('log(E_N)');

    saveas(gcf, filename);
    clf;
end

function [] = plot4(results, filename)
    plot(log(results(:, 1)), log(results(:, 3)), 'DisplayName', 'Order', 'Color', 'blue');
    % legend();
    title('log(order) vs log(N)');
    xlabel('log(N)');
    ylabel('log(order)');

    saveas(gcf, filename);
    clf;
end

function result = find_order(a, b, alpha, f)
    
    m = [20 40 80 160 320 640 1280 2560 5120 10240];
    result(:, 1) = m;
    n = length(m);

    for i = 1:n
        int_result = rk_4(f, [a b], alpha, m(i));
        max_error = max(int_result(:, 4));
        result(i, 2) = max_error;
    end

    orders = double(log2(result(1:n - 1, 2) ./ result(2:n, 2)));
    % orders = [0 orders];

    result(2:n, 3) = orders;
    result(1, 3) = 0;
end
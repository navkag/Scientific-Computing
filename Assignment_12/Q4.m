clear; clc;

f1a = @(t, y) y - t .^ 2 + 1;
y1a = @(t) (t + 1) .^ 2 - 0.5 .* exp(t);


fprintf('Q1\n');
fprintf('Predictor Corrector Method.\n');

result1aAB = predictor_corrector(f1a, y1a, 0, 1, 0.2, 4);
result1aABo = find_order(f1a, y1a, 0, 1, 0.2, 4, 1);

disp1(result1aAB);
disp2(result1aABo);

plot1(result1aAB, 'Q4yvst_AB.png');
plot2(result1aAB, 'Q4errorvst_AB.png');
plot3(result1aABo, 'Q4loglogn_AB.png');
plot4(result1aABo, 'Q4orderplot_AB.png');


function [result] = predictor_corrector(f, y, a, b, h, steps)
    % Use Runge Kutta 4th order method to calculate initial values.
    N1 = (b - a) / h;
    pre_result = rk_4(f, [a b], 0.5, N1);
    t_init = 0:(steps - 1);
    t_init = t_init * h;

    t = a:h:b;
    exact = y(t);

%     disp(t_init);
    t_init = t_init + a;
    y_vals = pre_result(1:4, 2);
    y_vals = y_vals';

    init_vals = f(t_init, y_vals);
%     disp(y_vals);

    N = (b - a) / h;
    
    for i = steps:N
        % Considering 4th order predictor.
        predicted = y_vals(i) + (h / 24) * (55 * init_vals(i) - 59 * init_vals(i - 1) + 37 * init_vals(i - 2) - 9 * init_vals(i - 3));

        corrected = y_vals(i) + (h / 24) * (9 * f(a + h * i, predicted) + 19 * init_vals(i) - 5 * init_vals(i - 1) + init_vals(i - 2));
        y_vals(i + 1) = corrected;
        init_vals(i + 1) = f(a + i * h, y_vals(i + 1));
    end
    
    error = abs(exact - y_vals);

    result(:, 1) = t;
    result(:, 2) = y_vals;
    result(:, 3) = exact;
    result(:, 4) = error;

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

function result = find_order(f, y, a, b, h, steps, mode)
    
    m = [20 40 80 160 320 640 1280 2560 5120 10240];
    % m = [5, 10];
    result(:, 1) = m;
    n = length(m);

    for i = 1:n
        % int_result = rk_2(f, [a b], alpha, m(i));
        h = (b - a) / m(i);
       
        int_result = predictor_corrector(f, y, a, b, h, steps);
        max_error = max(int_result(:, 4));
        result(i, 2) = max_error;
    end

    orders = double(log2(result(1:n - 1, 2) ./ result(2:n, 2)));
    % orders = [0 orders];

    result(2:n, 3) = orders;
    result(1, 3) = 0;
end

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
    
    result(:, 1) = t;
    result(:, 2) = y;
end

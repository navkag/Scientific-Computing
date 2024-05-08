clear; clc;

f1a = @(t, y) y - t .^ 2 + 1;
y1a = @(t) (t + 1) .^ 2 - 0.5 .* exp(t);


fprintf('Q1\n');
fprintf('Adams Bashforth 4 step.\n');

result1aAB = adam_bashforth(f1a, y1a, 0, 1, 0.2, 4);
result1aABo = find_order(f1a, y1a, 0, 1, 0.2, 4, 1);

disp1(result1aAB);
disp2(result1aABo);

plot1(result1aAB, 'Q3yvst_AB.png');
plot2(result1aAB, 'Q3errorvst_AB.png');
plot3(result1aABo, 'Q3loglogn_AB.png');
plot4(result1aABo, 'Q3orderplot_AB.png');

fprintf('Adams Moulton 3 step.\n');
result1aAM = adam_moulton(f1a, y1a, 0, 1, 0.2, 4);
result1aAMo = find_order(f1a, y1a, 0, 1, 0.2, 4, 2);

fprintf('(a)\n');
disp1(result1aAM);
disp2(result1aAMo);

plot1(result1aAM, 'Q3yvst_AM.png');
plot2(result1aAM, 'Q3errorvst_AM.png');
plot3(result1aAMo, 'Q3loglogn_AM.png');
plot4(result1aAMo, 'Q3orderplot_AM.png');


function [result] = adam_bashforth(f, y, a, b, h, steps)
    % steps: initial number of steps.
    t_init = 0:(steps - 1);
    t_init = t_init * h;

    t = a:h:b;
    exact = y(t);

%     disp(t_init);
    t_init = t_init + a;
    y_vals = y(t_init);

    init_vals = f(t_init, y_vals);
%     disp(y_vals);

    N = (b - a) / h;
    
    for i = steps:N
        % Considering 4th order predictor.
        y_vals(i + 1) = y_vals(i) + (h / 24) * (55 * init_vals(i) - 59 * init_vals(i - 1) + 37 * init_vals(i - 2) - 9 * init_vals(i - 3));
        init_vals(i + 1) = f(a + i * h, y_vals(i + 1));
    end
    
    error = abs(exact - y_vals);

    result(:, 1) = t;
    result(:, 2) = y_vals;
    result(:, 3) = exact;
    result(:, 4) = error;

end

function [result] = adam_moulton(f, y, a, b, h, steps)
    % steps: initial number of steps.
    t_init = 0:(steps - 2);
    t_init = t_init * h;

    t = a:h:b;
    exact = y(t);

%     disp(t_init);
    t_init = t_init + a;
    y_vals = y(t_init);

    init_vals = f(t_init, y_vals);
%     disp(y_vals);

    N = (b - a) / h;
    
    for i = steps:(N + 1)
        % Considering 4th order predictor.
        
        % Using inbuilt 'solve' method to solve the implicit equation.
        x1 = y_vals(i - 1);
        for j = 1:1000
            x1 = y_vals(i - 1) + (h / 24) * (9 * f(a + h * (i - 1), x1) + 19 * init_vals(i - 1) - 5 * init_vals(i - 2) + init_vals(i - 3));
        end

        y_vals(i) = x1;     
        init_vals(i) = f(a + (i - 1) * h, y_vals(i));
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
    result(:, 1) = m;
    n = length(m);

    for i = 1:n
        % int_result = rk_2(f, [a b], alpha, m(i));
        h = (b - a) / m(i);
        if mode == 1
            int_result = adam_bashforth(f, y, a, b, h, steps);
        else
            int_result = adam_moulton(f, y, a, b, h, steps);
        end
        max_error = max(int_result(:, 4));
        result(i, 2) = max_error;
    end

    orders = double(log2(result(1:n - 1, 2) ./ result(2:n, 2)));
    % orders = [0 orders];

    result(2:n, 3) = orders;
    result(1, 3) = 0;
end

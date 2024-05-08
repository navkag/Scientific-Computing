clear; clc;

fprintf("\n\nQ5:\n");

f5 = @(t, y) -1 * y + t + 1;

fprintf("h = 0.2:\n");
result51a = euler_explicit(0, 5, 25, 1, f5);
result51b = find_order(0, 5, 1, f5);
disp1(result51a);
disp2(result51b);
plot1(result51a, "Q51yvst.png");
plot2(result51a, "Q51errorvst.png");
plot3(result51b, "Q51loglogn.png");
plot4(result51b, "Q51orderplot.png");

fprintf("\nh = 0.1:\n");
result52a = euler_explicit(0, 5, 50, 1, f5);
result52b = find_order(0, 5, 1, f5);
disp1(result52a);
disp2(result52b);
plot1(result52a, "Q52yvst.png");
plot2(result52a, "Q52errorvst.png");
plot3(result52b, "Q52loglogn.png");
plot4(result52b, "Q52orderplot.png");

fprintf("\nh = 0.05:\n");
result53a = euler_explicit(0, 5, 100, 1, f5);
result53b = find_order(0, 5, 1, f5);
disp1(result53a);
disp2(result53b);
plot1(result53a, "Q53yvst.png");
plot2(result53a, "Q53errorvst.png");
plot3(result53b, "Q53loglogn.png");
plot4(result53b, "Q53orderplot.png");


function result = euler_explicit(a, b, N, alpha, f)
    h = (b - a) / N;
    t = a:h:b;
    y(1) = alpha;
    % exact(1) = alpha;

    for i = 1:N
        y(i + 1) = y(i) + h * f(t(i), y(i));
        % exact(i + 1) = exact_value(f, alpha, a, t(i + 1));
    end
    
    % exact = zeros(1, N + 1);
    exact = exact_value(f, alpha, a, t);
    error = abs(y - exact);


    result(:, 1) = t;
    result(:, 2) = y;
    result(:, 3) = exact;
    result(:, 4) = error;
end


function result = exact_value(f, init_val, a, x)
    syms y(t);
    ode = diff(y, t) == f(t, y);
    cond = y(a) == init_val;

    ySol(t) = dsolve(ode, cond);

    % disp(ySol(t));

    result = ySol(x);

    % disp(result(1));
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
    plot(results(:, 1), results(:, 2), "DisplayName", "Approx.", "Color", "red");
    hold on;
    plot(results(:, 1), results(:, 3), "DisplayName", "Exact", "Color", "blue");
    hold off;
    legend();
    title("y vs t for approx. and exact solutions.");
    xlabel("t");
    ylabel("y");

    saveas(gcf, filename);
    clf;
end

function [] = plot2(results, filename)
    plot(results(:, 1), results(:, 4), "DisplayName", "Error", "Color", "red");
    % legend();
    title("Error vs t.");
    xlabel("t");
    ylabel("error");

    saveas(gcf, filename);
    clf;
end

function [] = plot3(results, filename)
    plot(log(results(:, 1)), log(results(:, 2)), "DisplayName", "Error", "Color", "red");
    hold on;
    plot([3 5 3 3], [-9 -9 -7 -9], "Color", "blue");
    hold off;
    % legend();
    title("log(E_N) vs log(N)");
    xlabel("log(N)");
    ylabel("log(E_N)");

    saveas(gcf, filename);
    clf;
end

function [] = plot4(results, filename)
    plot(log(results(:, 1)), log(results(:, 3)), "DisplayName", "Order", "Color", "blue");
    % legend();
    title("log(order) vs log(N)");
    xlabel("log(N)");
    ylabel("log(order)");

    saveas(gcf, filename);
    clf;
end

function result = find_order(a, b, alpha, f)
    
    m = [20 40 80 160 320 640 1280 2560 5120 10240];
    result(:, 1) = m;
    n = length(m);

    for i = 1:n
        int_result = euler_explicit(a, b, m(i), alpha, f);
        max_error = max(int_result(:, 4));
        result(i, 2) = max_error;
    end

    orders = double(log2(result(1:n - 1, 2) ./ result(2:n, 2)));
    % orders = [0 orders];

    result(2:n, 3) = orders;
    result(1, 3) = 0;
end
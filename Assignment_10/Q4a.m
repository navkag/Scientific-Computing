clear; clc;

fprintf("\n\nQ4:\n");

f41 = @(t, y) 1 + (y / t);
f42 = @(t, y) cos(2 * t) + sin(3 * t);
f43 = @(t, y) -1 * y + t * (y ^ (0.5));

fprintf("\npart(a)\n");

result41a = euler_explicit(1, 2, 4, 2, f41);
result41b = find_order(1, 2, 2, f41);
disp1(result41a);
disp2(result41b);
plot1(result41a, "Q4ayvst.png");
plot2(result41a, "Q4aerrorvst.png");
plot3(result41b, "Q4aloglogn.png");
plot4(result41b, "Q4aorderplot.png");



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
clear; clc;

fprintf("Q1(a) Five Point Stencil: \n");
que1a(2:20, 2);


fprintf("\n---------------------------------------------------------------\n");

fprintf("Q1(b) Five Point Stencil: \n");
que1b(2:20, 5);

fprintf("\n---------------------------------------------------------------\n");

fprintf("Q2(a) Gauss Seidel: \n")
u = @(x, y) 400 * x * y;

[U, X, Y] = gauss_seidela(u, [0 0.5], [0 0.5], 0.5 / 2, 0.5 / 2);

fprintf("Format: x-axis horizontal increasing from left to right\n")
fprintf("Format: y-axis vertical increasing from top to bottom\n")
fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
[rows, cols] = size(U);
U_actual = zeros(rows, cols);

for j = 1:rows
    for i = 1:cols
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(1, i), Y(j, 1));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots

plot_exact_surf(U_actual, "Q2a_surf_exact.png");
plot_numerical_surf(U, "Q2a_surf_numerical.png");

plot_exact_cont(U_actual, "Q2a_cont_exact.png");
plot_numerical_cont(U, "Q2a_cont_numerical.png");

plot_error_surf(U_actual, U, "Q2a_surf_error.png")

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, Y] = gauss_seidela(u, [0 0.5], [0 0.5], 0.5 / N(n), 0.5 / N(n));

    [rows, cols] = size(U);
    U_actual = zeros(rows, cols);

    for j = 1:rows
        for i = 1:cols
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(1, i), Y(j, 1));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 0.5 / n;
end

log_log_error_delta(deltas, max_error, "Q2a_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("\nQ2(b) Gauss Seidel: \n")
u = @(x, y) exp(x) * cos(y);
f = @(x, y) exp(x) * (2 * cos(y) - sin(y));

[U, X, Y] = gauss_seidelb(u, f, [0 1], [0 1], 0.2, 0.2);

fprintf("Format: x-axis horizontal increasing from left to right\n")
fprintf("Format: y-axis vertical increasing from top to bottom\n")
fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
[rows, cols] = size(U);
U_actual = zeros(rows, cols);

for j = 1:rows
    for i = 1:cols
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(1, i), Y(j, 1));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots

plot_exact_surf(U_actual, "Q2b_surf_exact.png");
plot_numerical_surf(U, "Q2b_surf_numerical.png");

plot_exact_cont(U_actual, "Q2b_cont_exact.png");
plot_numerical_cont(U, "Q2b_cont_numerical.png");

plot_error_surf(U_actual, U, "Q2b_surf_error.png")

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, Y] = gauss_seidelb(u, f, [0 1], [0 1], 1 / N(n), 1 / N(n));

    [rows, cols] = size(U);
    U_actual = zeros(rows, cols);

    for j = 1:rows
        for i = 1:cols
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(1, i), Y(j, 1));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q2b_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("Q3(a) Jacobi Iterative Method: \n")
u = @(x, y) 400 * x * y;

[U, X, Y] = jacobia(u, [0 0.5], [0 0.5], 0.25, 0.25);

fprintf("Format: x-axis horizontal increasing from left to right\n")
fprintf("Format: y-axis vertical increasing from top to bottom\n")
fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
[rows, cols] = size(U);
U_actual = zeros(rows, cols);

for j = 1:rows
    for i = 1:cols
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(1, i), Y(j, 1));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots

plot_exact_surf(U_actual, "Q3a_surf_exact.png");
plot_numerical_surf(U, "Q3a_surf_numerical.png");

plot_exact_cont(U_actual, "Q3a_cont_exact.png");
plot_numerical_cont(U, "Q3a_cont_numerical.png");

plot_error_surf(U_actual, U, "Q3a_surf_error.png")

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, Y] = jacobia(u, [0 0.5], [0 0.5], 0.5 / N(n), 0.5 / N(n));

    [rows, cols] = size(U);
    U_actual = zeros(rows, cols);

    for j = 1:rows
        for i = 1:cols
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(1, i), Y(j, 1));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 0.5 / n;
end

log_log_error_delta(deltas, max_error, "Q3a_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("Q3(b) Jacobi Iterative Method: \n")
u = @(x, y) exp(x) * cos(y);
f = @(x, y) exp(x) * (2 * cos(y) - sin(y));

[U, X, Y] = jacobib(u, f, [0 1], [0 1], 1 / 5, 1 / 5);

fprintf("Format: x-axis horizontal increasing from left to right\n")
fprintf("Format: y-axis vertical increasing from top to bottom\n")
fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
[rows, cols] = size(U);
U_actual = zeros(rows, cols);

for j = 1:rows
    for i = 1:cols
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(1, i), Y(j, 1));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_surf(U_actual, "Q3b_surf_exact.png");
plot_numerical_surf(U, "Q3b_surf_numerical.png");

plot_exact_cont(U_actual, "Q3b_cont_exact.png");
plot_numerical_cont(U, "Q3b_cont_numerical.png");

plot_error_surf(U_actual, U, "Q3b_surf_error.png")

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, Y] = jacobib(u, f, [0 1], [0 1], 1 / N(n), 1 / N(n));

    [rows, cols] = size(U);
    U_actual = zeros(rows, cols);

    for j = 1:rows
        for i = 1:cols
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(1, i), Y(j, 1));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q3b_loglog_error.png");



fprintf("\n---------------------------------------------------------------\n");

fprintf("\nQ4(a) FTCS Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
f = @(x) 2 * sin(2 * pi * x);
rbc = @(t) 0;
lbc = @(t) 0;
[U, X, T] = FTCS(1, 1, 0.1, 0.2, 1 / 16, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

u = @(x, t) 2 * exp(-1 * (pi ^ 2) * t / 4) * sin(2 * pi * x);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4a_FTCS_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4a_FTCS_final_numerical.png");

plot_exact_surf(U_actual, "Q4a_FTCS_surf_exact.png");
plot_numerical_surf(U, "Q4a_FTCS_surf_numerical.png");

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = FTCS(1, 1, 1 / N(n), 0.2, 1 / 16, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4a_FTCS_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("\nQ4(a) BTCS Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
f = @(x) 2 * sin(2 * pi * x);
[U, X, T] = BTCS(1, 1, 0.1, 0.2, 1 / 16, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

u = @(x, t) 2 * exp(-1 * (pi ^ 2) * t / 4) * sin(2 * pi * x);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4a_BTCS_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4a_BTCS_final_numerical.png");

plot_exact_surf(U_actual, "Q4a_BTCS_surf_exact.png");
plot_numerical_surf(U, "Q4a_BTCS_surf_numerical.png");

N = 5:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = BTCS(1, 1, 1 / N(n), 0.2, 1 / 16, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4a_BTCS_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");


fprintf("\nQ4(a) Crank Nicolson Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
f = @(x) 2 * sin(2 * pi * x);
[U, X, T] = Crank_Nicolson(1, 1, 0.1, 0.2, 1 / 16, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

u = @(x, t) 2 * exp(-1 * (pi ^ 2) * t / 4) * sin(2 * pi * x);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4a_CN_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4a_CN_final_numerical.png");

plot_exact_surf(U_actual, "Q4a_CN_surf_exact.png");
plot_numerical_surf(U, "Q4a_CN_surf_numerical.png");

N = 10:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = Crank_Nicolson(1, 1, 1 / N(n), 0.2, 1 / 16, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4a_CN_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");



fprintf("\nQ4(b) FTCS Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
f = @(x) 0.5 * sin(2 * pi * x) + sin(0.5 * pi * x);
rbc = @(t) exp(-1 * (pi ^ 2) * t / 4);
[U, X, T] = FTCS(1, 1, 0.1, 0.2, 1, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

u = @(x, t) exp(-1 * (pi ^ 2) * t / 4) * sin(0.5 * pi * x) + 0.5 * exp(-4 * (pi ^ 2) * t) * sin(2 * pi * x);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4b_FTCS_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4b_FTCS_final_numerical.png");

plot_exact_surf(U_actual, "Q4b_FTCS_surf_exact.png");
plot_numerical_surf(U, "Q4b_FTCS_surf_numerical.png");

N = 2:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = FTCS(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4b_FTCS_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("\nQ4(b) BTCS Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
[U, X, T] = BTCS(1, 1, 0.1, 0.2, 1, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4b_BTCS_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4b_BTCS_final_numerical.png");

plot_exact_surf(U_actual, "Q4b_BTCS_surf_exact.png");
plot_numerical_surf(U, "Q4b_BTCS_surf_numerical.png");

N = 4:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = BTCS(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4b_BTCS_loglog_error.png");

fprintf("\n---------------------------------------------------------------\n");

fprintf("\nQ4(b) Crank Nicolson Method: \n");
fprintf("Format: x-axis horizontal increasing from left to right\n");
fprintf("Format: y-axis vertical time increasing from top to bottom\n");
[U, X, T] = Crank_Nicolson(1, 1, 0.1, 0.2, 1, f, lbc, rbc);

fprintf("Estimated values: \n");
disp(U);

fprintf("\nActual values: \n");
t_len = length(T);
x_len = length(X);
U_actual = zeros(t_len, x_len);

for j = 1:t_len
    for i = 1:x_len
        % fprintf("\t%d", u(X(1, i), Y(j, 1)))
        U_actual(j, i) = u(X(i), T(j));
    end
end
disp(U_actual);

fprintf("\nErrors: \n");
disp(abs(U - U_actual));

% Plots
plot_exact_final(X, U_actual(end, :), "Q4b_CN_final_exact.png");
plot_numerical_final(X, U(end, :), "Q4b_CN_final_numerical.png");

plot_exact_surf(U_actual, "Q4b_CN_surf_exact.png");
plot_numerical_surf(U, "Q4b_CN_surf_numerical.png");

N = 4:20;
max_error = zeros(length(N), 1);
deltas = zeros(length(N), 1);

for n = 1:length(N)
    [U, X, T] = BTCS(1, 1, 1 / N(n), 0.2, 1, f, lbc, rbc);

    t_len = length(T);
    x_len = length(X);
    U_actual = zeros(t_len, x_len);

    for j = 1:t_len
        for i = 1:x_len
            % fprintf("\t%d", u(X(1, i), Y(j, 1)))
            U_actual(j, i) = u(X(i), T(j));
        end
    end

    % disp(size(U));
    % disp(size(U_actual));
    U_error = abs(U - U_actual);
    max_error(n) = max(U_error(:));
    deltas(n) = 1 / n;
end

log_log_error_delta(deltas, max_error, "Q4b_CN_loglog_error.png");


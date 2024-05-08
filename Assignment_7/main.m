clear; clc;

fprintf("Question 1\n");
x = [-1 -0.5 0 0.5];
f_x = [0.86199480 0.95802009 1.0986123 1.2943767];
fd_x = [0.15536240 0.23269654 0.33333333 0.45186776];

[Q1, result1, poly1] = hermite_interpolation(x, f_x, fd_x, 0.25);
actual_result1 = log(exp(0.25) + 2);
fprintf("Interpolated value of function at 0.25: %d\n", double(result1));
fprintf("Actual value of function at 0.25: %d\n", double(actual_result1));
fprintf("Absolute error: %d\n", double(abs(actual_result1 - result1)));


fprintf("\nQuestion 2\n");
x = [0 3 5 8 13];
f_x = [0 225 383 623 993];
fd_x = [75 77 80 74 72];
syms x_ [1 5];
syms x_in;

[Q2a, result2a, poly2] = hermite_interpolation(x, f_x, fd_x, 10);
fprintf("Predicted position of the car at 10s: %d feet.\n", double(result2a));
poly2a = subs(poly2, x_, x);
poly2a_speed = diff(poly2a, x_in);
predicted_speed = subs(poly2a_speed, x_in, 10);
fprintf("Predicted speed of the car at 10s: %d feet/sec.\n", double(predicted_speed));

roots = double(solve(poly2a_speed == 80.67, x_in));
real_roots = roots(imag(roots) == 0);
min_real_root = min(real_roots);
fprintf("Yes, the car exceeds 55 mph first at %d s.\n", double(min_real_root));

critical_points = solve(diff(poly2a_speed, x_in) == 0, x_in);
max_value = double(max(subs(poly2a_speed, x_in, critical_points)));

fprintf("Maximum predicted speed of the car: %d feet/sec.\n", double(max_value));

fprintf("\nQuestion 3a\n");
x = [0 0.5];
f_x = exp(2 * x);
[results, res_poly] = natural_cubic_spline(x, f_x);
disp(results);
fprintf("Interpolation polynomials: \n");
for i = 1:length(x) - 1
    disp(res_poly(i));
end

syms x_ [1 1];
syms x_in;
res_poly_subs = subs(res_poly, x_, x(1:end - 1));
res_poly_subs_diff = diff(res_poly_subs, x_in);
function_values = subs(res_poly_subs, x_in, 0.43);
function_derv_values = subs(res_poly_subs_diff, x_in, 0.43);

fprintf("Function value at 0.43: %d\n", double(function_values(1)));
fprintf("Function derivative value at 0.43: %d\n", double(function_derv_values(1)));

actual_function_val = exp(2 * 0.43);
actual_slope_val = 2 * exp(2 * 0.43);

fprintf("Actual function value at 0.43: %d\n", double(actual_function_val));
fprintf("Actual function derivative value at 0.43: %d\n", double(actual_slope_val));

fprintf("Absolute function value error: %d\n", double(abs(function_values(1) - actual_function_val)));
fprintf("Absolute function slope error: %d\n", double(abs(function_derv_values(1) - actual_slope_val)));

fprintf("\nQuestion 3b\n");
x = [0 0.5];
f_x = log(exp(x) + 2);
[results, res_poly] = natural_cubic_spline(x, f_x);
disp(results);
fprintf("Interpolation polynomials: \n");
for i = 1:length(x) - 1
    disp(res_poly(i));
end

syms x_ [1 1];
syms x_in;
res_poly_subs = subs(res_poly, x_, x(1:end - 1));
res_poly_subs_diff = diff(res_poly_subs, x_in);
function_values = subs(res_poly_subs, x_in, 0.25);
function_derv_values = subs(res_poly_subs_diff, x_in, 0.25);

fprintf("Function value at 0.25: %d\n", double(function_values(1)));
fprintf("Function derivative value at 0.25: %d\n", double(function_derv_values(1)));

actual_function_val = log(exp(0.25) + 2);
actual_slope_val = exp(0.25) / (exp(0.25) + 2);

fprintf("Actual function value at 0.25: %d\n", double(actual_function_val));
fprintf("Actual function derivative value at 0.25: %d\n", double(actual_slope_val));

fprintf("Absolute function value error: %d\n", double(abs(function_values(1) - actual_function_val)));
fprintf("Absolute function slope error: %d\n", double(abs(function_derv_values(1) - actual_slope_val)));

fprintf("\nQuestion 4\n");
x = [-1 -0.5 0 0.5];
f_x = [0.86199480 0.95802009 1.0986123 1.2943767];
fd_x = [0.15536240 0.23269654 0.33333333 0.45186776];

[results, res_poly] = clamped_cubic_spline(x, f_x, fd_x);
disp(results);
fprintf("Interpolation polynomials: \n");
for i = 1:length(x) - 1
    disp(res_poly(i));
end



fprintf("\nQuestion 5a\n");
x = [0 3 5 8 13];
f_x = [0 225 383 623 993];
fd_x = [75, 72];

[results, res_poly] = natural_cubic_spline(x, f_x);
disp(results);
fprintf("Interpolation polynomials: \n");
for i = 1:length(x) - 1
    disp(res_poly(i));
end

syms x_ [1 4];
syms x_in;
res_poly_subs = subs(res_poly, x_, x(1:end - 1));
res_poly_subs_diff = diff(res_poly_subs, x_in);
function_values = subs(res_poly_subs, x_in, 10);
function_derv_values = subs(res_poly_subs_diff, x_in, 10);

fprintf("Distance at 10s: feet.%d\n", double(function_values(4)));
fprintf("Speed at 10s: feet/s.%d\n", double(function_derv_values(4)));

fprintf("\nQuestion 5b\n");
[results, res_poly] = clamped_cubic_spline(x, f_x, fd_x);
disp(results);
fprintf("Interpolation polynomials: \n");
for i = 1:length(x) - 1
    disp(res_poly(i));
end

syms x_ [1 4];
syms x_in;
res_poly_subs = subs(res_poly, x_, x(1:end - 1));
res_poly_subs_diff = diff(res_poly_subs, x_in);
function_values = subs(res_poly_subs, x_in, 10);
function_derv_values = subs(res_poly_subs_diff, x_in, 10);

fprintf("Distance at 10s: feet.%d\n", double(function_values(4)));
fprintf("Speed at 10s: feet/sec.%d\n", double(function_derv_values(4)));
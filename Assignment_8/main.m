clear; clc;

f1a = @(x) x ^ 4;
f1b = @(x) 2 / (x - 4);
f1c = @(x) 2 * x / (x ^ 2 - 4);
f1d = @(x) exp(3 * x) * sin(2 * x);
f1e = @(x) (sin(x) ^ 2 - 2 * x * sin(x) + 1);

result1a = rectangle_method(f1a, 0.5, 1);
result1b = rectangle_method(f1b, 0, 0.5);
result1c = rectangle_method(f1c, 1, 1.6);
y = pi / 4;
result1d = rectangle_method(f1d, 0, y);
result1e = rectangle_method(f1e, 0.75, 1.3);

fprintf('Q1a Rectangle method: %d\n', result1a);
fprintf('Q1b Rectangle method: %d\n', result1b);
fprintf('Q1c Rectangle method: %d\n', result1c);
fprintf('Q1d Rectangle method: %d\n', result1d);
fprintf('Q1e Rectangle method: %d\n\n', result1e);


result21a = midpoint_method(f1a, 0.5, 1);
result21b = midpoint_method(f1b, 0, 0.5);
result21c = midpoint_method(f1c, 1, 1.6);
y = pi / 4;
result21d = midpoint_method(f1d, 0, y);
result21e = midpoint_method(f1e, 0.75, 1.3);

fprintf('Q21a Midpoint method: %d\n', result21a);
fprintf('Q21b Midpoint method: %d\n', result21b);
fprintf('Q21c Midpoint method: %d\n', result21c);
fprintf('Q21d Midpoint method: %d\n', result21d);
fprintf('Q21e Midpoint method: %d\n\n', result21e);


result22a = trap_method(f1a, 0.5, 1);
result22b = trap_method(f1b, 0, 0.5);
result22c = trap_method(f1c, 1, 1.6);
y = pi / 4;
result22d = trap_method(f1d, 0, y);
result22e = trap_method(f1e, 0.75, 1.3);

fprintf('Q22a Trapezoidal method: %d\n', result22a);
fprintf('Q22b Trapezoidal method: %d\n', result22b);
fprintf('Q22c Trapezoidal method: %d\n', result22c);
fprintf('Q22d Trapezoidal method: %d\n', result22d);
fprintf('Q22e Trapezoidal method: %d\n\n', result22e);



result23a = simpson_method(f1a, 0.5, 1);
result23b = simpson_method(f1b, 0, 0.5);
result23c = simpson_method(f1c, 1, 1.6);
y = pi / 4;
result23d = simpson_method(f1d, 0, y);
result23e = simpson_method(f1e, 0.75, 1.3);

fprintf('Q23a Simpson method: %d\n', result23a);
fprintf('Q23b Simpson method: %d\n', result23b);
fprintf('Q23c Simpson method: %d\n', result23c);
fprintf('Q23d Simpson method: %d\n', result23d);
fprintf('Q23e Simpson method: %d\n\n', result23e);



f3 = @(x) 4 / (1 + x ^ 2);

result3a = rectangle_method(f3, 0, 1);
fprintf('Q3a Rectangle method: %d\n', result3a);

result3b = trap_method(f3, 0, 1);
fprintf('Q3b Trapeziodal method: %d\n', result3b);

result3c = simpson_method(f3, 0, 1);
fprintf('Q3c Simpson 1/3 method: %d\n', result3c);

result3d = simpson_method38(f3, 0, 1);
fprintf('Q3d Simpson 3/8 method: %d\n\n', result3d);

x4 = [1 1.25 1.5 1.75 2];
f_x4 = [10 8 7 6 5];

result4 = comp_trap(x4, f_x4);
fprintf('Q4 Composite Trapezoidal method: %d\n\n', result4);


f5 = @(x) x * log(x);

result5a = comp_trapfun(f5, 77, 1, 2);
fprintf('Q5 Composite Trapezoidal method with n = 92: %d\n', result5a);
result5b = comp_simpson(f5, 106, 1, 2);
fprintf('Q5 Composite Simpson method with n = 6: %d\n', result5b);
result5c = comp_midpoint(f5, 106, 1, 2);
fprintf('Q5 Composite Midpoint method with n = 128: %d\n\n', result5c);


x6 = [0 6 12 18 24 30 36 42 48 54 60 66 72 78 84];
y6 = [124 134 148 156 147 133 121 109 99 85 78 89 104 116 123];

result6 = comp_trap(x6, y6);
fprintf('Q6 Composite Trapezoidal method: %d\n\n', result6);
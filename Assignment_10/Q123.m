% Euler's method of solving 1st order differential equations.
clear; clc;
format long

fprintf("\n\nQ1:\n");

xa = [0.5 0.6 0.7];
fxa = [0.4794 0.5646 0.6442];

xb = [1.0 1.2 1.4];
fxb = [1 1.2625 1.6595];

% Forward difference.
for i = 1:2
    f_xa_fwd(i) = (fxa(i + 1) - fxa(i)) / (xa(i + 1) - xa(i));
    f_xb_fwd(i) = (fxb(i + 1) - fxb(i)) / (xb(i + 1) - xb(i));
end

f_xa_fwd(3) = 0;
f_xb_fwd(3) = 0;


% Backward difference.
f_xa_back(1) = 0;
f_xb_back(1) = 0;

for i = 1:2
    f_xa_back(i + 1) = (fxa(i) - fxa(i + 1)) / (xa(i) - xa(i + 1));
    f_xb_back(i + 1) = (fxb(i) - fxb(i + 1)) / (xb(i) - xb(i + 1));
end

fwd_diff_a(:, 1) = xa;
fwd_diff_a(:, 2) = fxa;
fwd_diff_a(:, 3) = f_xa_fwd;

fwd_diff_b(:, 1) = xb;
fwd_diff_b(:, 2) = fxb;
fwd_diff_b(:, 3) = f_xb_fwd;

back_diff_a(:, 1) = xa;
back_diff_a(:, 2) = fxa;
back_diff_a(:, 3) = f_xa_back;

back_diff_b(:, 1) = xb;
back_diff_b(:, 2) = fxb;
back_diff_b(:, 3) = f_xb_back;

fprintf("Forward Difference 1(a): \n");
disp('Columns:  xa,  fxa, f_xa\n');
disp(fwd_diff_a);

fprintf("\nBackward Difference 1(a): \n");
disp('Columns:  xa,  fxa, f_xa\n');
disp(back_diff_a);

fprintf("\nForward Difference 1(b): \n");
disp('Columns:  xb,  fxb, f_xb\n');
disp(fwd_diff_b);

fprintf("\nBackward Difference 1(b): \n");
disp('Columns:  xb,  fxb, f_xb\n');
disp(back_diff_b);

fprintf("\n\nQ2:\n");
syms x;

f2a = @(x) sin(x);
f2b = @(x) x^2 * log(x) + 1;

df2a_dx = diff(f2a, x);
df2b_dx = diff(f2b, x);

f_xaexact = subs(df2a_dx, x, xa);
f_xbexact = subs(df2b_dx, x, xb);

error_a_fwd = abs(f_xaexact - f_xa_fwd);
error_b_fwd = abs(f_xbexact - f_xb_fwd);

error_a_fwd(3) = 0;
error_b_fwd(3) = 0;

error_a_back = abs(f_xaexact - f_xa_back);
error_b_back = abs(f_xbexact - f_xb_back);

error_a_back(1) = 0;
error_b_back(1) = 0;


fwd_diff_a(:, 4) = f_xaexact;
fwd_diff_a(:, 5) = error_a_fwd;

fwd_diff_b(:, 4) = f_xbexact;
fwd_diff_b(:, 5) = error_b_fwd;

back_diff_a(:, 4) = f_xaexact;
back_diff_a(:, 5) = error_a_back;

back_diff_b(:, 4) = f_xbexact;
back_diff_b(:, 5) = error_b_back;


fprintf("Forward Difference 1(a): \n");
disp('Columns:  xa,  fxa, f_xa f_xa(exact) error\n');
disp(fwd_diff_a);

fprintf("\nBackward Difference 1(a): \n");
disp('Columns:  xa,  fxa, f_xa f_xa(exact) error\n');
disp(back_diff_a);

fprintf("\nForward Difference 1(b): \n");
disp('Columns:  xb,  fxb, f_xb f_xb(exact) error\n');
disp(fwd_diff_b);

fprintf("\nBackward Difference 1(b): \n");
disp('Columns:  xb,  fxb, f_xb f_xb(exact) error\n');
disp(back_diff_b);
 

% Finding error bounds.
ddf2a_dx = diff(df2a_dx, x);
ddf2b_dx = diff(df2b_dx, x);

interval_a_1 = linspace(xa(1), xa(2));
interval_a_2 = linspace(xa(2), xa(3));

interval_b_1 = linspace(xb(1), xb(2));
interval_b_2 = linspace(xb(2), xb(3));

interval_a_1_bound = double(max(abs(subs(ddf2a_dx, x, interval_a_1))));
interval_a_2_bound = double(max(abs(subs(ddf2a_dx, x, interval_a_2))));
interval_b_1_bound = double(max(abs(subs(ddf2b_dx, x, interval_b_1))));
interval_b_2_bound = double(max(abs(subs(ddf2b_dx, x, interval_b_2))));

fprintf("Error bound on (%d, %d) for (a): %d\n", xa(1), xa(2), interval_a_1_bound);
fprintf("\nError bound on (%d, %d) for (a): %d\n", xa(2), xa(3), interval_a_2_bound);
fprintf("\nError bound on (%d, %d) for (b): %d\n", xb(1), xb(2), interval_b_1_bound);
fprintf("\nError bound on (%d, %d) for (b): %d\n", xb(2), xb(3), interval_b_2_bound);



fprintf("\n\nQ3:\n");

times = [1.00 1.01 1.02 1.03 1.04];
current = [3.10 3.12 3.14 3.18 3.24];
L = 0.98;
R = 0.142;

for i = 1:4
    eps(i) = L * ((current(i + 1) - current(i)) / (times(i + 1) - times(i))) + R * current(i);
end

eps(5) = L * ((current(4) - current(5)) / (times(4) - times(5))) + R * current(5);

fprintf("Voltage values: ");
disp(eps);

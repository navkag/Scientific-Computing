clear; clc;

x5a = [0.0 0.1 0.3 0.6 1.0];
y5a = [-6 -5.89483 -5.65014 -5.17788 -4.28172];
disp('Q5a newton divided diff');
newton_divided_diff(x5a, y5a, 0.2);

x5b = [0.0 0.1 0.3 0.6 1.0 1.1];
y5b = [-6 -5.89483 -5.65014 -5.17788 -4.28172 -3.99583];
fprintf('\n');
disp('Q5b newton divided diff');
newton_divided_diff(x5b, y5b, 0.2);

x5a = [0.0 0.1 0.3 0.6 1.0];
y5a = [-6 -5.89483 -5.65014 -5.17788 -4.28172];
fprintf('\n');
disp('Q5a lagrange');
a = lagrange_divdiff(x5a, y5a, 0.2);

x5b = [0.0 0.1 0.3 0.6 1.0 1.1];
y5b = [-6 -5.89483 -5.65014 -5.17788 -4.28172 -3.99583];
fprintf('\n');
disp('Q5b lagrange');
a = lagrange_divdiff(x5b, y5b, 0.2);


x4 = [1950 1960 1970 1980 1990 2000];
y4 = [151326 179323 203302 226542 249633 281422];
fprintf('\n');
disp('Q4 newton divided diff');
newton_divided_diff(x4, y4, 1940);
newton_divided_diff(x4, y4, 1975);
newton_divided_diff(x4, y4, 2020);

x3a = [0 0.25 0.5 0.75];
y3a = [1 1.64872 2.71828 4.48169];

x3b = [0.6 0.7 0.8 1];
y3b = [-0.17694460 0.01375227 0.22363362 0.65809197];
fprintf('\n');
disp('Q3a lagrange');
a = lagrange_divdiff(x3a, y3a, 0.43);
fprintf('\n');
disp('Q3b lagrange');
a = lagrange_divdiff(x3b, y3b, 0.9);

fprintf('\n');
disp('Q2 lagrange');
x2 = [2 2.4 2.6];
y2 = sin(log(x2));

x = linspace(2, 2.6, 100);
y_est = zeros(1, 100);
for i = 1:100
    y_est(i) = lagrange_divdiff(x2, y2, x(i));
end
y_actual = sin(log(x));

abs_error = abs(y_actual - y_est);

plot(x, abs_error);
xlabel('x');
ylabel('Absolute error');
title('Absolute error vs x');
saveas(gcf, 'abs_errorQ2.png');

fprintf('\n');
disp('Q1 newton fwd diff');
x1 = [0 0.2 0.4 0.6 0.8];
y1 = [1 1.2214 1.49182 1.82212 2.22554];
a = newton_fwddiff(x1, y1, 0.05);
fprintf('\n');
disp('Q1 newton back diff');
a = newton_backdiff(x1, y1, 0.65);


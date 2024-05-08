clear; clc;

% Q1 
fprintf("Q1\n");
x1 = [1 1.5 2 2.5];
y1 = [2.7183 4.4817 7.3819 12.1825];
fprintf("Exact value of function at 2.25: %d\n", exp(2.25));

% Part i)
fprintf("\nQ1 Part 1")
fprintf("\nNewton's forward difference method.\n");
a = newton_fwddiff( x1, y1, 2.25 );
fprintf('f(2.25) = %d\n', a);
% Part ii)
fprintf("\nQ1 Part 2")
fprintf("\nNewton's backward difference method.\n");
a = newton_backdiff( x1, y1, 2.25 );
fprintf('f(2.25) = %d\n', a);

% Q2
% Part i)
x2a = [0 0.25 0.5 0.75];
y2a = [1 1.64872 2.71828 4.48169];

fprintf("\nQ2 Part 1\n")
fprintf("Newton's forward difference method of degree 1.\n");
a = newton_fwddiff( x2a(1:2), y2a(1:2), 0.43 );
fprintf('f(0.43) = %d\n', a);
fprintf("\nNewton's forward difference method of degree 2.\n");
a = newton_fwddiff( x2a(1:3), y2a(1:3), 0.43 );
fprintf('f(0.43) = %d\n', a);
fprintf("\nNewton's forward difference method of degree 3.\n");
a = newton_fwddiff( x2a(1:4), y2a(1:4), 0.43 );
fprintf('f(0.43) = %d\n', a);

x2aglobal = linspace(0, 0.75, 20);
y2adeg1 = zeros(1, 20);
y2adeg2 = zeros(1, 20);
y2adeg3 = zeros(1, 20);

fprintf('\n');
for i = 1:20
    y2adeg1(i) = newton_fwddiff( x2a(1:2), y2a(1:2), x2aglobal(i) );
    y2adeg2(i) = newton_fwddiff( x2a(1:3), y2a(1:3), x2aglobal(i) );
    y2adeg3(i) = newton_fwddiff( x2a(1:4), y2a(1:4), x2aglobal(i) );
end

hold on;
plot(x2aglobal, y2adeg1, "blue", 'DisplayName', "Degree 1");
plot(x2aglobal, y2adeg2, "green", 'DisplayName', "Degree 2");
plot(x2aglobal, y2adeg3, "red", 'DisplayName', "Degree 3");
hold off;

xlabel('x');
ylabel('y');
title('Q2a 1, 2 and 3rd degree interpolated polynomials.');
legend('show');
saveas(gca, "Q2a.png");


% Part ii)
fprintf("\nQ2 Part 2\n");
x2b = [-0.75 -0.5 -0.25 0];
y2b = [-0.07181250 -0.02475000 0.33493750 1.10100000];

fprintf("Newton's forward difference method of degree 1.\n");
a = newton_fwddiff( x2b(1:2), y2b(1:2), -1 / 3 );
fprintf('f(-0.33) = %d\n', a);
fprintf("\nNewton's forward difference method of degree 2.\n");
a = newton_fwddiff( x2b(1:3), y2b(1:3), -1 / 3 );
fprintf('f(-0.33) = %d\n', a);
fprintf("\nNewton's forward difference method of degree 3.\n");
a = newton_fwddiff( x2b(1:4), y2b(1:4), -1 / 3);
fprintf('f(-0.33) = %d\n', a);

x2bglobal = linspace(-0.75, 0, 20);
y2bdeg1 = zeros(1, 20);
y2bdeg2 = zeros(1, 20);
y2bdeg3 = zeros(1, 20);

fprintf('\n');
for i = 1:20
    y2bdeg1(i) = newton_fwddiff( x2b(1:2), y2b(1:2), x2bglobal(i) );
    y2bdeg2(i) = newton_fwddiff( x2b(1:3), y2b(1:3), x2bglobal(i) );
    y2bdeg3(i) = newton_fwddiff( x2b(1:4), y2b(1:4), x2bglobal(i) );
end
clf;
hold on;
plot(x2bglobal, y2bdeg1, "blue", 'DisplayName', "Degree 1");
plot(x2bglobal, y2bdeg2, "green", 'DisplayName', "Degree 2");
plot(x2bglobal, y2bdeg3, "red", 'DisplayName', "Degree 3");
hold off;

xlabel('x');
ylabel('y');
title('Q2b 1, 2 and 3rd degree interpolated polynomials.');
legend('show');
saveas(gca, 'Q2b.png');

% Q3
fprintf("Q3\n");
ans1 = zeros(1, 10);
ans2 = zeros(1, 10);
ans3 = zeros(1, 10);

for i = 1:10
    h = 10 / i;
    x = -5:h:5;
    y = 1 ./ (1 + x.^2);
    
    ans1(i) = lagrange_divdiff(x, y, 1 + 10^0.5);
    ans2(i) = newton_fwddiff(x, y, 1 + 10^0.5);
    ans3(i) = newton_backdiff(x, y, 1 + 10^0.5);
end

fprintf("Step sizes: ");
disp(10:-1:1);
fprintf("\nLagrange: ");
disp(ans1);
fprintf("\nNewton fwd: ");
disp(ans2);
fprintf("\nNewton back: ");
disp(ans3);

clf;
hold on;
plot(1:10, ans1, "blue", 'DisplayName', "Lagrange");
plot(1:10, ans2, "green", 'DisplayName', "Newton Fwd");
plot(1:10, ans3, "red", 'DisplayName', "Newton Back");
hold off;

xlabel('h');
ylabel('y(1 + sqrt(10))');
title('Q3 interpolated polynomials convergence analysis.');
legend('show');
saveas(gca, 'Q3.png');
clear; clc;

warning("off", "all");

format long

% Question 1
[results_1] = bisection_pro("1", 0, 1, 30, 10^-8);
fprintf("Solution 1 found at %d after %d iterations.\n", results_1(end, 2), results_1(end, 1));
% disp(results_1)
plotter(results_1, "Q1");
fprintf("\n");

% Question 2
[results_2a] = bisection_pro("2a", 0.5, 1.5, 20, 10^-5);
fprintf("Solution 2a found at %d after %d iterations.\n", results_2a(end, 2), results_2a(end, 1));
% disp(results_2a)
plotter(results_2a, "Q2a");
[results_2b] = bisection_pro("2b", 0, 4, 20, 10^-5);
fprintf("Solution 2b found at %d after %d iterations.\n", results_2b(end, 2), results_2b(end, 1));
% disp(results_2b)
plotter(results_2b, "Q2b");
[results_2c] = bisection_pro("2c", 3, 4, 20, 10^-5);
fprintf("Solution 2c found at %d after %d iterations.\n", results_2c(end, 2), results_2c(end, 1));
% disp(results_2c)
plotter(results_2c, "Q2c");
fprintf("\n");


% Question 3
[results_3a] = newton_pro("3a", 1.5, 1000000, 10^-5);
fprintf("Solution 3a found at %d after %d iterations.\n", results_3a(end, 2), results_3a(end, 1));
% disp(results_3a)
plotter(results_3a, "Q3a");
[results_3b] = newton_pro("3b", 1, 1000000, 10^-5);
fprintf("Solution 3b found at %d after %d iterations.\n", results_3b(end, 2), results_3b(end, 1));
% disp(results_3b)
plotter(results_3b, "Q3b");
[results_3c] = newton_pro("3c", 1, 1000000, 10^-5);
fprintf("Solution 3c found at %d after %d iterations.\n", results_3c(end, 2), results_3c(end, 1));
% disp(results_3c)
plotter(results_3c, "Q3c");
[results_3d] = newton_pro("3d", 6.5, 1000000, 10^-5);
fprintf("Solution 3d found at %d after %d iterations.\n", results_3d(end, 2), results_3d(end, 1));
% disp(results_3d)
plotter(results_3d, "Q3d");
fprintf("\n");
 
% Question 4
[results_4a] = newton_pro("4", 0.0001, 1000000, 10^-200);
fprintf("Solution 4a found at %d after %d iterations.\n", results_4a(end, 2), results_4a(end, 1));
% disp(results_4a)
plotter(results_4a, "Q4a");
[results_4b] = newton_pro("4", 0.00005, 1000000, 10^-200);
fprintf("Solution 4b found at %d after %d iterations.\n", results_4b(end, 2), results_4b(end, 1));
% disp(results_4b)
plotter(results_4b, "Q4b");
fprintf("\n");
machine_epsilon = eps;
disp(['Machine Epsilon for your system is: ', num2str(machine_epsilon)]);
fprintf("\n");

% Question 5
fprintf("Newton's method:\n")
[results_5an] = newton_pro("5", -0.5, 1000000, 10^-6);
fprintf("Solution 5 on [-1, 0] found at %d after %d iterations.\n", results_5an(end, 2), results_5an(end, 1));
% disp(results_5an)
plotter(results_5an, "Q5an");
[results_5bn] = newton_pro("5", 0.5, 1000000, 10^-6);
fprintf("Solution 5 on [0, 1] found at %d after %d iterations.\n", results_5bn(end, 2), results_5bn(end, 1));
% disp(results_5bn)
plotter(results_5bn, "Q5bn");

[results_5bnmod] = newton_pro("5", 0.6, 1000000, 10^-6);
fprintf("\nSolution 5 on [0, 1] with initial point 0.6 found at %d after %d iterations.\n", results_5bnmod(end, 2), results_5bnmod(end, 1));
fprintf("\n");

fprintf("\nBisection method:\n")
[results_5as] = bisection_pro("5", -1, 0, 1000000, 10^-6);
fprintf("Solution 5 on [-1, 0] found at %d after %d iterations.\n", results_5as(end, 2), results_5as(end, 1));
% disp(results_5as)
plotter(results_5as, "Q5as");
[results_5bs] = bisection_pro("5", 0, 1, 1000000, 10^-6);
fprintf("Solution 5 on [0, 1] found at %d after %d iterations.\n", results_5bs(end, 2), results_5bs(end, 1));
% disp(results_5bs)
plotter(results_5bs, "Q5bs");
fprintf("\n");

% Question 6
[results_6] = newton_pro("6", 10, 1000000, 10^-6);
fprintf("Solution 6 found at %d after %d iterations.\n", results_6(end, 2), results_6(end, 1));
% disp(results_6)
plotter(results_6, "Q6");
fprintf("\n");
 
% Question 7
[results_7] = newton_pro("7", 2, 1000000, 10^-6);
fprintf("Solution 7 found at %d after %d iterations.\n", results_7(end, 2), results_7(end, 1));
% disp(results_7)
plotter(results_7, "Q7");
fprintf("\n");

[results_7mod] = newton_pro("7", 2.006, 1000000, 10^-6);
fprintf("Solution 7 with initial point 2.006 found at %d after %d iterations.\n", results_7mod(end, 2), results_7mod(end, 1));
fprintf("\n");

warning("on", "all");
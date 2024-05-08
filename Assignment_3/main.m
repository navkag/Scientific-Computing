clear; clc;

fprintf("Q1) Fixed point method:\n");
results1 = fixed_point(2, @g1, 1e-4);
% plotter(results1, "Q1", @f1);
printer(results1);
fprintf("\n\n")

fprintf("Q2a) Modified Newton method:\n");
results2a = modified_newton(@f2a, @df2a, @ddf2a, 1.5, 1e-5);
% plotter(results2a, "Q2a", @f2a);
printer(results2a);
fprintf("\n")

fprintf("Q2b) Modified Newton method:\n");
results2b = modified_newton(@f2b, @df2b, @ddf2b, -0.5, 1e-5);
% plotter(results2b, "Q2b", @f2b);
printer(results2b);
fprintf("\n\n")

fprintf("Q3a) Muller method:\n");
results3a = muller(-0.5, 0, 0.5, @f3a, 1e-5);
% plotter(results3a, "Q3a", @f3a);
printer_mod(results3a);
fprintf("\n")

fprintf("Q3b) Muller method:\n");
results3b = muller(-0.5, 0.1, 0.5, @f3b, 1e-5);
% plotter(results3b, "Q3b", @f3b);
printer_mod(results3b);
fprintf("\n\n")

fprintf("Q4) Fixed point method:\n");
results4 = fixed_point(2, @g4, 1e-4);
% plotter(results4, "Q4", @f4);
printer(results4);
fprintf("\n\n")
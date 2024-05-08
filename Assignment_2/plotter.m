function [] = plotter(results, filename)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
iterations = results(:, 1);
solutions = results(:, 2);
errors = results(:, 3);
log_errors = log10(errors);

yyaxis left;
plot(iterations, solutions, "blue", LineWidth=2);
ylabel("Solution");

yyaxis right;
plot(iterations(2:end), log_errors(2:end), "red", LineWidth=2);
ylabel("Log residue");


xlabel("#iterations");
title("Solution-log residue vs #iterations");
legend("Solution", "Log residue");
grid on;

filename = strcat(filename, ".png");
saveas(gca, filename);
end
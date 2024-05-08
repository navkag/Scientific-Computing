function [] = plotter(results, filename, f)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    iterations = results(:, 1);
    solutions = results(:, 2);
    errors = results(:, 3);

    func_values = [];

    for i = 1:length(solutions)
        func_values = [func_values, f(solutions(i))];
    end

    log_errors = log(abs(solutions(2:end) - solutions(1:end - 1)) ./ abs(solutions(1:end - 1)));
    log_iterations = log(iterations(2:end));
    
    plot(log_iterations, log_errors, "blue", LineWidth=2);
    xlabel("log-order")
    ylabel("log-error")
    title(filename);
    filename1 = strcat(filename, "log-log.png");
    saveas(gca, filename1);
    grid on;
    
    plot(iterations, func_values, "red", LineWidth=2);
    xlabel("iteration#")
    ylabel("Function value")
    title(filename);
    filename2 = strcat(filename, "function.png");
    saveas(gca, filename2);
    grid on;

end
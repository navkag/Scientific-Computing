clear; clc;

% Q-1
results1 = newtonq1(1, 1, 1);
errors1 = abs(results1(:, 5:end));

plot(results1(:, 1), errors1(:, 1), "blue", 'LineWidth', 2, 'DisplayName', 'error1');
hold on;
plot(results1(:, 1), errors1(:, 2), "green", 'LineWidth', 2, 'DisplayName', 'error2');
plot(results1(:, 1), errors1(:, 3), "red", 'LineWidth', 2, 'DisplayName', 'error3');

grid on;
xlabel("Iteration#");
ylabel("Errors");
title("Q-1 errors vs iteration plot");
legend('show');
saveas(gca, "Q-1error.png");
hold off;


% Q-2a
results2a = newtonq2a(0, 1);
errors2a = abs(results2a(:, 4:end));

plot(results2a(:, 1), errors2a(:, 1), "blue", 'LineWidth', 2, 'DisplayName', 'error1');
hold on;
plot(results2a(:, 1), errors2a(:, 2), "green", 'LineWidth', 2, 'DisplayName', 'error2');

grid on;
xlabel("Iteration#");
ylabel("Errors");
title("Q-2a errors vs iteration plot");
legend('show');
saveas(gca, "Q-2aerror.png");
hold off;

% Function plot for Q-2a
equation = @(x, y) 4*x.^2 - y.^2;
equation2 = @(x, y) 4*x*y^2 - x - 1;
% [x, y] = meshgrid(linspace(-5, 5, 100), linspace(-5, 5, 100));

% % Calculate z values based on the equation
% z2a = f2a(x2a, y2a);
% z2a1 = z2a(:, 1);
% z2a2 = z2a(:, 2);
figure;
fsurf(equation, [-5, 5, -5, 5]);
hold on;
fsurf(equation2, [-5, 5, -5, 5]);
title('Function plot 2a');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
hold off;

colormap('jet'); 
colorbar;

saveas(gcf, 'surface_plot2a.png');

% Optionally, set the FaceColor property of the surface object
% h.FaceColor = 'interp';% 

% Q-2b
results2b = newtonq2b(-1, 4);
errors2b = abs(results2b(:, 4:end));

plot(results2b(:, 1), errors2b(:, 1), "blue", 'LineWidth', 2, 'DisplayName', 'error1');
hold on;
plot(results2b(:, 1), errors2b(:, 2), "green", 'LineWidth', 2, 'DisplayName', 'error2');

grid on;
xlabel("Iteration#");
ylabel("Errors");
title("Q-2b errors vs iteration plot");
legend('show');
saveas(gca, "Q-2berror.png");
hold off;


% Function plot for Q-2b
equation = @(x1, x2) 1 + x1^2 - x2^2 + exp(x1) * cos(x2);
equation2 = @(x1, x2) 2 * x1 * x2 + exp(x1) * sin(x2);
% [x, y] = meshgrid(linspace(-5, 5, 100), linspace(-5, 5, 100));

% % Calculate z values based on the equation
% z2a = f2a(x2a, y2a);
% z2a1 = z2a(:, 1);
% z2a2 = z2a(:, 2);
figure;
fsurf(equation, [-5, 5, -5, 5]);
hold on;
fsurf(equation2, [-5, 5, -5, 5]);
title('Function plot 2b');
xlabel('X-axis');
ylabel('Y-axis');
zlabel('Z-axis');
grid on;
hold off;

colormap('jet'); 
colorbar;

saveas(gcf, 'surface_plot2b.png');

% Q-3
results3 = newtonq3(0, 0, 0);
errors3 = abs(results3(:, 5:end));

plot(results3(:, 1), errors3(:, 1), "blue", 'LineWidth', 2, 'DisplayName', 'error1');
hold on;
plot(results3(:, 1), errors3(:, 2), "green", 'LineWidth', 2, 'DisplayName', 'error2');
plot(results3(:, 1), errors3(:, 3), "red", 'LineWidth', 2, 'DisplayName', 'error3');

grid on;
xlabel("Iteration#");
ylabel("Errors");
title("Q-3 errors vs iteration plot");
legend('show');
saveas(gca, "Q-3error.png");
hold off;

clear; clc;

f = @(t, y) -2 .* y + 1;
y = @(t) 0.5 + 0.5 .* exp(-2 .* t);

a = 0;
b = 1;

% Stability analysis for

% i) Explicit Euler Method.
Hs = [0.25 0.125 0.0625 0.03125];
alpha = 1;

for i = 1:4
    h = Hs(i);
    N = (b - a) / h;
    t = a:h:b;
    
    y_exp = explicit(f, y, a, b, h, N, alpha);
    y_imp = implicit(f, y, a, b, h, N, alpha);
    y_cent = central(f, y, a, b, h, N, alpha);

    plot(t, y_exp, 'DisplayName', 'Explicit', 'Color', 'blue');
    hold on;
    plot(t, y_imp, 'DisplayName', 'Implicit', 'Color', 'green');
    plot(t, y_cent, 'DisplayName', 'Central', 'Color', 'red');
    hold off;

    legend();
    title(['Stability Analysis with h: ', num2str(h)]);
    xlabel('t');
    ylabel('error');
    
    filename = strcat('Stability Analysis with h=', num2str(h), '.png');
    saveas(gcf, filename);
    clf;

end 




function max_error = explicit(f, y_func, a, b, h, N, alpha)
t = a:h:b;

y(1) = alpha;
exact_y = y_func(t);

    for i = 1:N
        y(i + 1) = y(i) + h * f(t(i), y(i));
    end

 max_error = abs(y - exact_y);
end


function max_error = implicit(f, y_func, a, b, h, N, alpha)
t = a:h:b;

y(1) = alpha;
exact_y = y_func(t);

    for i = 1:N
        x = y(i);
        for j = 1:1000
            x = y(i) + h * f(t(i + 1), x);
        end
        y(i + 1) = x;
    end

 max_error = abs(y - exact_y);
end


function max_error = central(f, y_func, a, b, h, N, alpha)
t = a:h:b;

y(1) = alpha;
y(2) = y_func(t(2));
exact_y = y_func(t);

    for i = 2:N
          y(i + 1) = y(i - 1) + 2 * h * f(t(i), y(i));
    end

 max_error = abs(y - exact_y);
end
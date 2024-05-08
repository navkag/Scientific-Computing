function [ cnt ] = newton_fwddiff( x, f_x, x_in )
% Returns interpolation on basis of x and f_x using
% Newton's forward difference method.

n = length(x);
h = x(2) - x(1);

M = zeros(n, n);

for i = 1:n
    M(i, 1) = f_x(i);
end

for j = 2:n
    for i = 1:n - j + 1
        M(i, j) = M(i + 1, j - 1) - M(i, j - 1);
    end
end

s = (x_in - x(1)) / h;

cnt = f_x(1);
m = 1;

for i = 1:n - 1
    m = m * (s - i + 1) / i;
    cnt = cnt + M(1, i + 1) * m;
end

disp(['The value of f(x) at ', num2str(x_in),' is: ', num2str(cnt)])
end


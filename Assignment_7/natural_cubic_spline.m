function [results, resulting_polynomials] = natural_cubic_spline(x, f_x)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
n = length(x) - 1;

h = zeros(1, n);
alpha = zeros(1, n + 1);
l = zeros(1, n + 1);
mu = zeros(1, n + 1); % n or n + 1
z = zeros(1, n + 1);
c = zeros(1, n + 1);
b = zeros(1, n + 1);
d = zeros(1, n + 1);


for i = 0:n - 1
    h(i + 1) = x(i + 2) - x(i + 1);
end

% alpha(1) = 3 * (f_x(2) - f_x(1)) / h(1) - 3 * fd_x(1);
% alpha(n + 1) = 3 * fd_x(end) - 3 * (f_x(n + 1) - f_x(n)) / h(n);

for i = 1:n - 1
    alpha(i + 1) = (3 / h(i + 1)) * (f_x(i + 2) - f_x(i + 1)) - ((3 / h(i)) * (f_x(i + 1) - f_x(i)));
end

l(1) = 1;
mu(1) = 0;
z(1) = 0;

for i = 1:n - 1
    l(i + 1) = 2 * (x(i + 2) - x(i)) - h(i) * mu(i);
    mu(i + 1) = h(i + 1) / l(i + 1);
    z(i + 1) = (alpha(i + 1) - h(i) * z(i)) / l(i + 1);
end

l(n + 1) = 1;
z(n + 1) = 0;
c(n + 1) = 0;

for j = n-1:-1:0
    c(j + 1) = z(j + 1) - mu(j + 1) * c(j + 2);
    b(j + 1) = (f_x(j + 2) - f_x(j + 1)) / h(j + 1) - h(j + 1) * (c(j + 2) + 2 * c(j + 1)) / 3;
    d(j + 1) = (c(j + 2) - c(j + 1)) / (3 * h(j + 1));
end

results = zeros(4, n);

results(1, :) = f_x(1:end - 1);
results(2, :) = b(1:n);
results(3, :) = c(1:n);
results(4, :) = d(1:n);

results = results';

syms x_in;
syms x_ [1 n];

resulting_polynomials = [];

for i = 1:n
    polynomial = 0;
    for j = 1:4
        polynomial = polynomial + results(i, j) * ((x_in - x_(i)) ^ (j - 1));
    end
    resulting_polynomials = [resulting_polynomials, polynomial];
end

end
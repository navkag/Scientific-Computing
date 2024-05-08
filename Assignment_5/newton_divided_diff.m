function [ cnt ] = newton_divided_diff( x, f_x, x_in )
% Returns interpolation on basis of x and f_x using
% Newton's divided difference method.

n = length(x);
M = zeros(n - 1, n - 1);

for i = 1:n - 1
    M(i, 1) = (f_x(i + 1) - f_x(i)) / (x(i + 1) - x(i));
end

for col = 2:n - 1
    for row = 1:n - col
        M(row, col) = (M(row + 1, col - 1) - M (row, col - 1)) / (x(row + col) - x(row)); 
    end
end

cnt = f_x(1);

for i = 1:n - 1
    term = 1;
    for j = 1:i
        term = term * (x_in - x(j)); 
    end
    cnt = cnt + M(1, i) * term;
end

disp(['The value of f(x) at ', num2str(x_in),' is: ', num2str(cnt)])

end


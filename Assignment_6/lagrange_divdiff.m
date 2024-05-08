function [ cnt ] = lagrange_divdiff( x, f_x, x_in )
% Returns interpolation on basis of x and f_x using
% Newton's divided difference method.

n = length(x);

cnt = 0;

for i = 1:n
    term = 1;
    for j = 1:n
        if i == j
            continue;
        else
            term = term * (x_in - x(j)) / (x(i) - x(j));
        end
    end
    cnt = cnt + term * f_x(i);
end


% disp(['The value of f(x) at ', num2str(x_in),' is: ', num2str(cnt)]);

end


function [Q, result, hermite_polynomial] = hermite_interpolation(x, f_x, fd_x, x_0)

format long;
n = length(x) - 1;
 
Q = zeros(2 * n + 2, 2 * n + 2);
z = zeros(1, 2 * n + 2);

for i = 0:n
    z(2 * i + 1) = x(i + 1);
    z(2 * i + 2) = x(i + 1);

    Q(2 * i + 1, 1) = f_x(i + 1);
    Q(2 * i + 2, 1) = f_x(i + 1);

    Q(2 * i + 2, 2) = fd_x(i + 1);
 
    if i ~= 0
        Q(2 * i + 1, 2) = (Q(2 * i + 1, 1) - Q(2 * i, 1)) / (z(2 * i + 1) - z(2 * i));
    end
end

for i = 2:2 * n + 1
    for j = 2:i
        Q(i + 1, j + 1) = (Q(i + 1, j) - Q(i, j)) / (z(i + 1) - z(i - j + 1));
    end
end

% result = 0;
% syms x_in;
% syms x_ [1 n + 1];
% 
% for i = 0:2 * n + 1
%     result = result + Q(i + 1, i + 1) * factor(x, x_0, i);
% end

hermite_polynomial = 0;
syms x_in;
syms x_ [1 n + 1];

for i = 0:2 * n + 1
    term = Q(i + 1, i + 1);
    for j = 1:i
        k = ceil(j / 2);
        term = term * (x_in - x_(k));
    end
    hermite_polynomial = hermite_polynomial + term;
end

result = subs(hermite_polynomial, [x_ x_in], [x, x_0]);

end


% function [result] = factor(x, x_0, i)
%     cnt = 1;
%     n = length(x) - 1;
%     power = zeros(1, n + 1);
% 
%     while i >= 2
%         power(cnt) = 2;
%         cnt = cnt + 1;
%         i = i - 2;
%     end
% 
%     power(cnt) = i;
%     difference = x_0 - x;
%     products = difference .^ power;
% 
%     result = prod(products, "all");
% end

% 
% function [Q, result, hermite_sym] = hermite_interpolation(x, f_x, fd_x, x_0)
% % HERMITE_INTERPOLATION Interpolate using Hermite interpolation
% %
% % Inputs:
% %   x       - vector of x coordinates
% %   f_x     - vector of function values at x
% %   fd_x    - vector of derivative values at x
% %   x_0     - the point to evaluate the interpolant
% %
% % Outputs:
% %   Q           - the divided difference table
% %   result      - the interpolated value at x_0
% %   hermite_sym - symbolic representation of the Hermite interpolating polynomial
% 
% n = length(x) - 1;
% 
% Q = zeros(2 * n + 2, 2 * n + 2);
% z = zeros(1, 2 * n + 2);
% 
% for i = 0:n
%     z(2 * i + 1) = x(i + 1);
%     z(2 * i + 2) = x(i + 1);
% 
%     Q(2 * i + 1, 1) = f_x(i + 1);
%     Q(2 * i + 2, 1) = f_x(i + 1);
% 
%     Q(2 * i + 2, 2) = fd_x(i + 1);
% 
%     if i ~= 0
%         Q(2 * i + 1, 2) = (Q(2 * i + 1, 1) - Q(2 * i, 1)) / (z(2 * i + 1) - z(2 * i));
%     end
% end
% 
% for i = 2:2 * n + 1
%     for j = 2:i
%         Q(i + 1, j + 1) = (Q(i + 1, j) - Q(i, j)) / (z(i + 1) - z(i - j + 1));
%     end
% end
% 
% syms x_in;
% syms x_ [1 n+1];
% hermite_sym = 0; % Initialize symbolic Hermite polynomial
% 
% % Construct symbolic Hermite polynomial
% for i = 0:2 * n + 1
%     term = 1;
%     for j = 1:i
%         k = ceil(j / 2);
%         term = term * (x_(k) - x_in);
%     end
%     hermite_sym = hermite_sym + term * Q(i + 1, i + 1);
% end
% 
% hermite_s = subs(hermite_sym, x_in, x_0); % Evaluate the Hermite polynomial at x_0
% result = subs(hermite_s, x_, x);
% end

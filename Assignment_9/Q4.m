clear; clc;

f1 = @(x) exp(-1 .* x .^ 2);
f2 = @(x) 1 ./ (1 + x .^ 2);

a1 = 0;
b1 = 1;
a2 = -4;
b2 = 4;

fprintf("Q4 Gauss-Legendre Integration\n");
fprintf("Part (i) integration with n = 2: %d\n", double(gauss_legendre(f1, a1, b1, 2)));
fprintf("Part (i) integration with n = 4: %d\n", double(gauss_legendre(f1, a1, b1, 4)));
fprintf("Part (i) integration with n = 6: %d\n", double(gauss_legendre(f1, a1, b1, 6)));
fprintf("Part (ii) integration with n = 2: %d\n", double(gauss_legendre(f2, a2, b2, 2)));
fprintf("Part (ii) integration with n = 4: %d\n", double(gauss_legendre(f2, a2, b2, 4)));
fprintf("Part (ii) integration with n = 6: %d\n", double(gauss_legendre(f2, a2, b2, 6)));


function result = gauss_legendre(f, a, b, n)
    
    p = legendre_polynomial(n);
    
    x = roots(p(n+1,:));
     
    if a ~= -1 || b ~= 1
       y = f_legendre(f,a,b);
       G = y(x);
    else
       G = f(x);		
    end
    
    p_n = polyder(p(n+1, :));
    
    C = zeros(1, n);
    
    for i = 1:n
       C(i) = 2 / ((1 - x(i)^2) * ((polyval(p_n, x(i))) ^2));
        
    end
    
    result = dot(C, G);
end


function Y = f_legendre(f, a, b)
    syms x;
    x = ((b - a) / 2) * x + (b + a) / 2;
    dx = (b - a) / 2;
    y = feval(f, x) * dx;
    Y = matlabFunction(y);
end

function p = legendre_polynomial(n)
    
    p = zeros(n + 1);

    p(1, 1) = 1;
    p(2, 1:2) = [1 0]; 
    for k = 2:n
       p(k + 1, 1 : k + 1) = ((2 * k - 1) * [p(k, 1 : k) 0] - (k - 1) * [0 0 p(k - 1, 1 : k - 1)]) / k;
    end

end
clear; clc;

f1 = @(x) 4 .* ((4 .* x - 5) .^ 2) .* log(4 .* x - 5);
f2 = @(x) (80 / 7) ./ (((40 / 7) * x - 1) .^ 2 - 4);

f1_ = @(x) (exp(3 .* x)) .* sin(2 .* x);
f2_ = @(x) (2 .* x) ./ ((x) .^ 2 - 4);

fprintf("Q2 Gauss-Lobatto Integration\n");
fprintf("Part (i) integration with n = 2: %d\n", double(gauss_lobatto(f1, 2)));
fprintf("Part (i) actual integration with n = 2: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 2: %d\n\n", abs(double(gauss_lobatto(f1, 2)) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 2: %d\n", double(gauss_lobatto(f2, 2)));
fprintf("Part (ii) actual integration with n = 2: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 2: %d\n\n", abs(double(gauss_lobatto(f2, 2)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lobatto Integration\n");
fprintf("Part (i) integration with n = 3: %d\n", double(gauss_lobatto(f1, 3)));
fprintf("Part (i) actual integration with n = 3: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 3: %d\n\n", abs(double(gauss_lobatto(f1, 3)) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 3: %d\n", double(gauss_lobatto(f2, 3)));
fprintf("Part (ii) actual integration with n = 3: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 3: %d\n\n", abs(double(gauss_lobatto(f2, 3)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lobatto Integration\n");
fprintf("Part (i) integration with n = 4: %d\n", double(gauss_lobatto(f1, 4)));
fprintf("Part (i) actual integration with n = 4: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 4: %d\n\n", abs(double(gauss_lobatto(f1, 4)) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 4: %d\n", double(gauss_lobatto(f2, 4)));
fprintf("Part (ii) actual integration with n = 4: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 4: %d\n\n", abs(double(gauss_lobatto(f2, 4)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lobatto Integration\n");
fprintf("Part (i) integration with n = 5: %d\n", double(gauss_lobatto(f1, 5)));
fprintf("Part (i) actual integration with n = 5: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 5: %d\n\n", abs(double(gauss_lobatto(f1, 5)) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 5: %d\n", double(gauss_lobatto(f2, 5)));
fprintf("Part (ii) actual integration with n = 5: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 5: %d\n\n", abs(double(gauss_lobatto(f2, 5)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lagrange (Newton Cotes) Integration\n");
fprintf("Part (i) integration with n = 2: %d\n", double(gauss_lagrange(f1_, 0, pi / 4, 2)));
fprintf("Part (i) actual integration with n = 2: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 2: %d\n\n", abs(gauss_lagrange(f1_, 0, pi / 4, 2) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 2: %d\n", double(gauss_lagrange(f2_, 1, 1.6, 2)));
fprintf("Part (ii) actual integration with n = 2: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 2: %d\n\n", abs(double(gauss_lagrange(f2_, 1, 1.6, 2)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lagrange (Newton Cotes) Integration\n");
fprintf("Part (i) integration with n = 3: %d\n", double(gauss_lagrange(f1_, 0, pi / 4, 3)));
fprintf("Part (i) actual integration with n = 3: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 3: %d\n\n", abs(gauss_lagrange(f1_, 0, pi / 4, 3) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 3: %d\n", double(gauss_lagrange(f2_, 1, 1.6, 3)));
fprintf("Part (ii) actual integration with n = 3: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 3: %d\n\n", abs(double(gauss_lagrange(f2_, 1, 1.6, 3)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lagrange (Newton Cotes) Integration\n");
fprintf("Part (i) integration with n = 4: %d\n", double(gauss_lagrange(f1_, 0, pi / 4, 4)));
fprintf("Part (i) actual integration with n = 4: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 4: %d\n\n", abs(gauss_lagrange(f1_, 0, pi / 4, 4) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 4: %d\n", double(gauss_lagrange(f2_, 1, 1.6, 4)));
fprintf("Part (ii) actual integration with n = 4: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 4: %d\n\n", abs(double(gauss_lagrange(f2_, 1, 1.6, 4)) - double(integral(f2_, 1, 1.6))));

fprintf("Q2 Gauss-Lagrange (Newton Cotes) Integration\n");
fprintf("Part (i) integration with n = 5: %d\n", double(gauss_lagrange(f1_, 0, pi / 4, 5)));
fprintf("Part (i) actual integration with n = 5: %d\n", double(integral(f1_, 0, pi / 4)));
fprintf("Part (i) integration error with n = 5: %d\n\n", abs(gauss_lagrange(f1_, 0, pi / 4, 5) - double(integral(f1_, 0, pi / 4))));
fprintf("Part (ii) integration with n = 5: %d\n", double(gauss_lagrange(f2_, 1, 1.6, 5)));
fprintf("Part (ii) actual integration with n = 5: %d\n", double(integral(f2_, 1, 1.6)));
fprintf("Part (ii) integration error with n = 5: %d\n\n", abs(double(gauss_lagrange(f2_, 1, 1.6, 5)) - double(integral(f2_, 1, 1.6))));

function result = gauss_lobatto(f, n)

    if n == 3
        result = (1 / 3) * (f(-1) + f(1)) + (4 / 3) * f(0);
    elseif n == 4
        result = (5 / 6) * (f(sqrt(1 / 5)) + f(-sqrt(1 / 5))) + (1 / 6) * (f(1) + f(-1));
    elseif n == 5
        result = (32 / 45) * f(0) + (49 / 90) * (f(sqrt(3 / 7)) + f(-sqrt(3 / 7))) + (1 / 10) * (f(1) + f(-1));
    elseif n == 2
        result = (f(-1) + f(1));
    end
end



function result = gauss_lagrange(f, a, b, n)

    h = (b - a) / (n - 1);

    if n == 3
        result = (h / 3) * (f(a) + f(b) + 4 * f((a + b) / 2));
    elseif n == 4
        result = (3 * h / 8) * (f(a) + f(b) + 3 * f(a + h) + 3 * f(b - h));
    elseif n == 5
        result = (2 * h / 45) * (7 * f(a) + 7 * f(b) + 32 * f(a + h) + 12 * f((a + b) / 2) + 32 * f(b - h));
    elseif n == 2
        result = (h / 2) * (f(a) + f(b));
    end
    
end
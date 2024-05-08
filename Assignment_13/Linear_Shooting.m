function max_error = Linear_Shooting(a, b, alpha, beta, N, p, q, r, actual_f, disp, str)
    h = (b - a)/N;
    u1 = zeros(1, N+1); u2 = zeros(1, N+1);
    v1 = zeros(1, N+1); v2 = zeros(1, N+1);
    
    u1(1) = alpha; v2(1) = 1;
    
    for i = 1:N
        x = a + (i-1)*h;
        
        k1_1 = h*u2(i);
        k1_2 = h*(p(x)*u2(i) + q(x)*u1(i) + r(x));
        
        k2_1 = h*(u2(i) + 0.5*k1_2);
        k2_2 = h*(p(x + 0.5*h)*(u2(i) + 0.5*k1_2) + q(x + 0.5*h)*(u1(i) + 0.5*k1_1) + r(x + 0.5*h));
        
        k3_1 = h*(u2(i) + 0.5*k2_2);
        k3_2 = h*(p(x + 0.5*h)*(u2(i) + 0.5*k2_2) + q(x + 0.5*h)*(u1(i) + 0.5*k2_1) + r(x + 0.5*h));
        
        k4_1 = h*(u2(i) + k3_2);
        k4_2 = h*(p(x + h)*(u2(i) + k3_2) + q(x + h)*(u1(i) + k3_1) + r(x + h));
        
        u1(i+1) = u1(i) + (1/6)*(k1_1 + 2*k2_1 + 2*k3_1 + k4_1);
        u2(i+1) = u2(i) + (1/6)*(k1_2 + 2*k2_2 + 2*k3_2 + k4_2);
        
        k1_1 = h*v2(i);
        k1_2 = h*(p(x)*v2(i) + q(x)*v1(i));
        
        k2_1 = h*(v2(i) + 0.5*k1_2);
        k2_2 = h*(p(x + 0.5*h)*(v2(i) + 0.5*k1_2) + q(x + 0.5*h)*(v1(i) + 0.5*k1_1));
        
        k3_1 = h*(v2(i) + 0.5*k2_2);
        k3_2 = h*(p(x + 0.5*h)*(v2(i) + 0.5*k2_2) + q(x + 0.5*h)*(v1(i) + 0.5*k2_1));
        
        k4_1 = h*(v2(i) + k3_2);
        k4_2 = h*(p(x + h)*(v2(i) + k3_2) + q(x + h)*(v1(i) + k3_1));
        
        v1(i+1) = v1(i) + (k1_1 + 2*k2_1 + 2*k3_1 + k4_1) / 6;
        v2(i+1) = v2(i) + (k1_2 + 2*k2_2 + 2*k3_2 + k4_2) / 6;
    end
    
    w1 = zeros(1, N+1);
    w2 = zeros(1, N+1);
    errs1 = zeros(1, N+1);
    actual_y = [alpha, zeros(1, N)];
    
    w1(1) = alpha;
    w2(1) = (beta - u1(end)) / v1(end);
    
    for i = 2:N+1
        w1(i) = u1(i) + w2(1)*v1(i);
        w2(i) = u2(i) + w2(1)*v2(i);
    end
    
    for i = 1:N
        actual_y(i+1) = actual_f(a+i*h);
        errs1(i+1) = abs(w1(i+1) - actual_y(i+1));
    end
    
    if disp == 1
        figure;
        plot(a:h:b, actual_y, a:h:b, w1, 'Linewidth', 2);
        title(strcat('Actual solution and Approximations Plot for', str));
        xlabel('t')
        ylabel('y(t)');
        legend('Actual', 'Approximation');
        hold off;

        figure;
        plot(a:h:b, errs1, 'Linewidth', 2);
        title(strcat('Absolute Errors Plot (Approx - Actual) for', str));
        xlabel('t')
        ylabel('|yi(t) - y(t)|');
        hold off;

        fprintf('For h = %d\nt\t\t\tApproximation\t\tExact\t\t\tError(|Exact - Approx.|)\n', h);
        for i = 1:N+1
            fprintf('%.6f\t\t%.7f\t\t%.7f\t\t%.7f\n',a + (i-1)*h, w1(i), actual_y(i), errs1(i));
        end
        fprintf('\n');
    end
    
    max_error = max(errs1);
end
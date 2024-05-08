function result = find_order(n, a, b, alpha, beta, p, q, r, y, mode)
    
    m = [20 40 80 160 320 640 1280 2560 5120 10240];
    result(:, 1) = m;
    n = length(m);

    for i = 1:n
        if mode == 1
            int_result = forward(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 2
            int_result = backward(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 3
            int_result = central(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 4
            int_result = forward2(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 5
            int_result = backward2(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 6
            int_result = central2(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 7
            int_result = forward3(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 8
            int_result = backward3(m(i), a, b, alpha, beta, p, q, r, y);
        elseif mode == 9
            int_result = central3(m(i), a, b, alpha, beta, p, q, r, y);
        end

        max_error = max(int_result(:, 4));

        if mode == 4 || mode == 5 || mode == 6 || mode == 7 || mode == 8 || mode == 9
            max_error = max(int_result(2:end - 1, 4));
        end

        result(i, 2) = max_error;
    end

    orders = double(log2(result(1:n - 1, 2) ./ result(2:n, 2)));
    % orders = [0 orders];

    result(2:n, 3) = orders;
    result(1, 3) = 0;
end
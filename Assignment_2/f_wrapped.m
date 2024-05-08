function [result] = f_wrapped(question, x)
% Catalogue for all functions in this assignment.
%   First argument takes question number corresponding to the function.
%   Second arguemnt takes input for that function.
    if question == "1"
        result = (1 / x) - 2^x;

    elseif question == "2a"
        result = 2 + cos(exp(x) - 2) - exp(x);
    elseif question == "2b"
        result = x - tan(x);
    elseif question == "2c"
        result = exp(-x) * (3.2 * sin(x) - 0.5 * cos(x));

    elseif question == "3a"
        result = exp(x) + 2^(-x) + 2 * cos(x) - 6;
    elseif question == "3b"
        result = x * cos(x) - x^2;
    elseif question == "3c"
        result = 3 * x - cos(x) - 1;
    elseif question == "3d"
        result = sin(x) - exp(-x);

    elseif question == "4"
        if x
            result = exp(-1 / x^2);
        else
            result = 0;
        end
    
    elseif question == "5"
        result = 230 * x^4 + 18 * x^3 + 9 * x^2 + -221 * x - 9;

    elseif question == "6"
        result = 1000000 * exp(x) + (435000 / x) * (exp(x) - 1) - 1564000;

    else
        result = x^3 + 94 * x^2 - 389 * x + 294;
    end

end
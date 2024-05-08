function output_file()
    clc

    N1 = 1:1:250;
    N2 = 2*N1;
    
    fprintf('Que-1\n');

    str = ' Que-1 by Linear-Shooting';
    fprintf(strcat(str, '\n'));
    que1(0, pi/2, str, N1, N2, [2, 4, 0], @(x) 1, @(x) 2, @(x) cos(x), @(x) (-1/10)*(sin(x) + 3*cos(x)), -0.3, -0.1);
end
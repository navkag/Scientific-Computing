function [] = printer_mod(results)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    fprintf("\nIteration#\tApprox. Sol.\t\t\t\tError\n");
    for i = 1:length(results)
        fprintf("%d\t\t%d + i%d\t\t%d\n", results(i, 1), real(results(i, 2)), imag(results(i, 2)), results(i, 3));
    end
end
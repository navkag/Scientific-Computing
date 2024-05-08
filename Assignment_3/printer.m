function [] = printer(results)
%UNTITLED12 Summary of this function goes here
%   Detailed explanation goes here
    fprintf("\nIteration#\tApprox. Sol.\t\tError\n");
    for i = 1:length(results)
        fprintf("%d\t\t%d\t\t%d\n", results(i, 1), results(i, 2), results(i, 3));
    end
end
function plot_numerical_cont(U, filename)
    contourf(U);
    title('Numerical Solution Contour');
    xlabel('X');
    ylabel('Y');
    zlabel('Solution');
    saveas(gcf, filename);
    clf;
end
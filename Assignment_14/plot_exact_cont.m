function plot_exact_cont(U_actual, filename)
    contourf(U_actual);
    title('Exact Solution Contour');
    xlabel('X');
    ylabel('Y');
    zlabel('Solution');
    saveas(gcf, filename);
    clf;
end
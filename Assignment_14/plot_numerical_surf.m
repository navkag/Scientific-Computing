function plot_numerical_surf(U, filename)
    surf(U);
    title('Numerical Solution Surface');
    xlabel('X');
    ylabel('Y');
    zlabel('Solution');
    saveas(gcf, filename);
    clf;
end
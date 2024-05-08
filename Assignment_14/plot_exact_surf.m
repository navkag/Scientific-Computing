function plot_exact_surf(U_actual, filename)
    surf(U_actual);
    title('Exact Solution Surface');
    xlabel('X');
    ylabel('Y');
    zlabel('Solution');

    saveas(gcf, filename);
    clf;
end
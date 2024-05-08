function plot_error_surf(U_exact, U, filename)
    U_error = abs(U_exact - U);
    surf(U_error);
    title('Error Surface');
    xlabel('X');
    ylabel('Y');
    zlabel('Solution');
    saveas(gcf, filename);
    clf;
end
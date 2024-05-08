function plot_numerical_final(x, f, filename)
    plot(x, f);
    title('Numerical Solution at Final Time');
    xlabel('X');
    ylabel('Y');

    saveas(gcf, filename);
    clf;
end
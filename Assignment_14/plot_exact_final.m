function plot_exact_final(x, f, filename)
    plot(x, f);
    title('Exact Solution at Final Time');
    xlabel('X');
    ylabel('Y');

    saveas(gcf, filename);
    clf;
end
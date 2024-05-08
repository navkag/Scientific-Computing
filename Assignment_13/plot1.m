function [] = plot1(results, filename)
    plot(results(:, 1), results(:, 2), "DisplayName", "Approx.", "Color", "red");
    hold on;
    plot(results(:, 1), results(:, 3), "DisplayName", "Exact", "Color", "blue");
    hold off;
    legend();
    title("y vs t for approx. and exact solutions.");
    xlabel("t");
    ylabel("y");

    saveas(gcf, filename);
    clf;
end
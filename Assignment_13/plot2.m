function [] = plot2(results, filename)
    plot(results(:, 1), results(:, 4), "DisplayName", "Error", "Color", "red");
    % legend();
    title("Error vs t.");
    xlabel("t");
    ylabel("error");

    saveas(gcf, filename);
    clf;
end
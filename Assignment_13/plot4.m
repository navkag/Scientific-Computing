function [] = plot4(results, filename)
    plot(log(results(:, 1)), log(results(:, 3)), "DisplayName", "Order", "Color", "blue");
    % legend();
    title("log(order) vs log(N)");
    xlabel("log(N)");
    ylabel("log(order)");

    saveas(gcf, filename);
    clf;
end
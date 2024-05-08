function [] = plot3(results, filename, order)
    plot(log(results(:, 1)), log(results(:, 2)), "DisplayName", "Error", "Color", "red");
    hold on;
    if order == 1
        plot([3 5 3 3], [-9 -9 -7 -9], "Color", "blue");
    elseif order == 2
        plot([3 5 3 3], [-9 -9 -5 -9], "Color", "blue");
    end
    hold off;
    % legend();
    title("log(E_N) vs log(N)");
    xlabel("log(N)");
    ylabel("log(E_N)");

    saveas(gcf, filename);
    clf;
end
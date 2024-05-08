function log_log_error_delta(deltas, max_errors, filename)
    plot(log(deltas), log(max_errors));
    title('Log Max Error vs Step size');
    xlabel('Step size');
    ylabel('Max error');
    saveas(gcf, filename);
    clf;
end
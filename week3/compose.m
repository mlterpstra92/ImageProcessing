function approximation = compose(a, d)
    approximation = zeros(1, 2 * length(a));
    approximation(1:2:end) = (a + d);
    approximation(2:2:end) = (a - d);
end
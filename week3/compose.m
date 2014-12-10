function res = compose(a, d)
    res = zeros(1, 2 * length(a));
    res(1:2:end) = (a + d) / sqrt(2);
    res(2:2:end) = (a - d) / sqrt(2);
end

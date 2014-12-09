function res = compose(dwtCoefficients, j)
    numApproximations = 2^j;
    res = [];
    approximations = dwtCoefficients(1:numApproximations);
    details = dwtCoefficients(numApproximations + 1:2 * numApproximations);
    for i=1:numApproximations
        res = [res, approximations(i) + details(i), approximations(i) - details(i)];
    end
    res = [res / sqrt(2), dwtCoefficients(2 * numApproximations + 1:end)];
end


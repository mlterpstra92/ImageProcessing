function res = compose(dwt, j)
    res = [];
    numApproximations = 2^j;
    approximations = dwt(1:numApproximations);
    details = dwt(numApproximations + 1:2 * numApproximations);
    
    for i=1:numApproximations
        res = [res, approximations(i) + details(i), approximations(i) - details(i)];
    end
    res = [res / sqrt(2), dwt(2 * numApproximations + 1:end)];
end


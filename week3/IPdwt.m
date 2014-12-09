function res = IPdwt( fVector, J)
    n = size(fVector, 2);
    assert(bitand(n, n-1) == 0);
    a = fVector;
    details = [];
    for j=J-1:-1:0
        [a, d] = decompose(a);
        details = [d, details];
    end
    res = [a, details];
end
function approximation = IPidwt(dwt, j0 )
    n = size(dwt, 2);
    assert(bitand(n, n-1) == 0);
    approximation = dwt;
    J = log2(n);
    j0 = J - j0;
    for j=j0:J-1
        approximation = compose(approximation, j);
    end
end
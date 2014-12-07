function f = IPidwt_han(dwt_rep)
%IPIDWT_HAN Transforms the DWT back to the spatial representation.
    M = size(dwt_rep, 2);
    J = log2(M);
    j_0 = 0;
    
    % Evenly placed points along the x-axis, in the middle of the sample
    % points. It is the domain of the signal.
    cell_size = 1 / M;
    x = linspace(cell_size / 2, 1 - cell_size / 2, M);
    
    % First term in Eq 7.3-7
    f = dwt_rep(1) * haar_scaling(x, 0, 0);
    
    idx = 2;
    j = j_0;
    while j <= J - 1
        k = 0;
        while k <= 2^j - 1
            % Second term in Eq. 7.3-7
            f = f + dwt_rep(idx) * haar_wavelet(x, j, k);
            idx = idx + 1;
            k = k + 1;
        end
        j = j + 1;
    end
    % Division in Eq. 7.3-7
    f = f / sqrt(M);
end


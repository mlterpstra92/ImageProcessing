function dwt_rep = IPdwt_han(f)
%DWT_WAVELET_ARRAY Transforms the spatial representation to the DWT representation.
    M = size(f, 2);
    J = log2(M);
    j_0 = 0;
    
    % Evenly placed points along the x-axis, in the middle of the sample
    % points. It is the domain of the signal.
    cell_size = 1 / M;
    x = linspace(cell_size / 2, 1 - cell_size / 2, M);
    
    dwt_rep = zeros(1, M);
    
    % Eq. 7.3-5 with k=0
    dwt_rep(1) = sum(f .* haar_scaling(x, j_0, 0));
    
    idx = 2;
    for j = j_0:J - 1
        for k = 0:2^j - 1
            % Eq. 7.3-6
            dwt_rep(idx) = sum(f .* haar_wavelet(x, j, k));
            idx = idx + 1;
        end
    end
    
    % Divisions in Eq. 7.3-5 and Eq. 7.3-6
    dwt_rep = dwt_rep / sqrt(M);
end
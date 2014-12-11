function filteredImage = performFiltering(noisyWavelets, j, threshold, version)
    if j == 0
        % We're done, since all levels that had to be filtered are
        % filtered.
        filteredImage = noisyWavelets;
        return;
    else
        [M, N] = size(noisyWavelets);
        
        % Only select the details we want to filter in this level, and
        % store the coarser details (and approximation) for higher
        % recursions.
        res = noisyWavelets(1:M / 2, 1:N/2);
        noisyWavelets(1:M / 2, 1:N / 2) = zeros(M/2, N/2);
        
        % Perform hard filtering by default
        noisyWaveletsFiltered = noisyWavelets .* (abs(noisyWavelets) > threshold);
        if strcmp(version, 'soft')
           % Correct hard filtering if soft filtering is required
           tmp = abs(noisyWaveletsFiltered) - threshold;
           tmp = (tmp+abs(tmp))/2;
           noisyWaveletsFiltered = sign(noisyWavelets) .* tmp;
        end
        
        % Place filtered details back in the image
        filteredImage = noisyWaveletsFiltered;
        
        % Set the rest of the image to be the recursively computed
        % filtering.
        filteredImage(1:M/2, 1:N/2) = performFiltering(res, j - 1, threshold, version);
    end
end


function filteredImage = performFiltering(noisyWavelets, j, threshold, version)
    if j == 0
        filteredImage = noisyWavelets;
        return;
    else
        [M, N] = size(noisyWavelets);
        res = noisyWavelets(1:M / 2, 1:N/2);
        noisyWavelets(1:M / 2, 1:N / 2) = zeros(M/2, N/2);
        noisyWaveletsFiltered = noisyWavelets .* (abs(noisyWavelets) > threshold);
        if strcmp(version, 'hard') ~= 1
           tmp = abs(noisyWaveletsFiltered) - threshold;
           tmp = (tmp+abs(tmp))/2;
           noisyWaveletsFiltered = sign(noisyWavelets) .* tmp;
        end
        filteredImage = noisyWaveletsFiltered;
        filteredImage(1:M/2, 1:N/2) = performFiltering(res, j - 1, threshold, version);
    end
end


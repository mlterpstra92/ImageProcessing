function filteredImage = performFiltering(noisyWavelets, j, threshold, version)
    if j == 0
        filteredImage = noisyWavelets;
        return;
    else
        [M, N] = size(noisyWavelets);
        res = noisyWavelets(1:M / 2, 1:N/2);
        %Only select the details we want to filter in this level
        noisyWavelets(1:M / 2, 1:N / 2) = zeros(M/2, N/2);
        
        %perform hard filtering by default
        noisyWaveletsFiltered = noisyWavelets .* (abs(noisyWavelets) > threshold);
        if strcmp(version, 'soft') == 1
            %correct hard filtering if soft filtering is required
           tmp = abs(noisyWaveletsFiltered) - threshold;
           tmp = (tmp+abs(tmp))/2;
           noisyWaveletsFiltered = sign(noisyWavelets) .* tmp;
        end
        %Place filtered details back in the image
        filteredImage = noisyWaveletsFiltered;
        %Set the rest of the image to the recursed filtered details
        filteredImage(1:M/2, 1:N/2) = performFiltering(res, j - 1, threshold, version);
    end
end


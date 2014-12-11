function denoisedImage = IPwaveletdenoise(image, j, threshold, version)
    if nargin < 4
        % Default to hard filtering
        version = 'hard';
    end
    
    % Compute the wavelets
    noisyWavelets = IPdwt2(image, j);
    [M, N] = size(noisyWavelets);
    
    % Store the approximation for later as it is removed in the recursion
    approx = noisyWavelets(1:M/(2^j), 1:N/(2^j));
    
    % Filter recursively up to level j
    filteredImage = performFiltering(noisyWavelets, j, threshold, version);
    
    % Restore the original approximation
    filteredImage(1:M/(2^j), 1:N/(2^j)) = approx;
    
    % Return to the normal image representation
    denoisedImage = IPidwt2(filteredImage, j);
end
function denoisedImage = IPwaveletdenoise(image, j, threshold, version)
    %default to hard filtering
    if nargin < 4
        version = 'hard';
    end
    %compute the wavelets
    noisyWavelets = IPdwt2(image, j);
    [M, N] = size(noisyWavelets);
    %store the approximation for later as it is removed in the recursion
    approx = noisyWavelets(1:M/(2^j), 1:N/(2^j));
    %filter recursively up to level j
    filteredImage = performFiltering(noisyWavelets, j, threshold, version);
    %place the approximation back
    filteredImage(1:M/(2^j), 1:N/(2^j)) = approx;
    denoisedImage = IPidwt2(filteredImage, j);
end
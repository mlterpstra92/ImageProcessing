function denoisedImage = IPwaveletdenoise(image, j, threshold, version)
%IPWAVELETDENOISE Summary of this function goes here
%   Detailed explanation goes here
    if nargin < 4
        version = 'hard';
    end
    %compute the wavelets
    noisyWavelets = IPdwt2(image, j);
    [M, N] = size(noisyWavelets);
    height = M / (2^j);
    width = N / (2^j);
    
    %Find and remove the approximation, we only want to filter the details
    approx = noisyWavelets(1:height, 1:width);
    noisyWavelets(1:height, 1:width) = zeros(height, width);
    
    %Filter everything lower than the threshold
    noisyWaveletsFiltered = noisyWavelets;
    noisyWaveletsFiltered(abs(noisyWavelets) < threshold) = 0;
    if strcmp(version, 'hard') ~= 1
        % scale nonzero thresholds towards 0 (?)
    end
    
    %Place the approximation back and compute the original image
    noisyWaveletsFiltered(1:height, 1:width) = approx;
    denoisedImage = IPidwt2(noisyWaveletsFiltered, j);
end
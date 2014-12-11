function denoisedImage = IPwaveletdenoise(image, j, threshold, version)
    %default to hard filtering
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
    
    %Filter everything below than the threshold with either hard or soft
    %filtering
    if strcmp(version, 'hard') == 1
        noisyWaveletsFiltered = noisyWavelets .* (abs(noisyWavelets) > threshold);
    else
        tmp = abs(noisyWavelets) - threshold;
        tmp = (tmp+abs(tmp))/2;
        noisyWaveletsFiltered = sign(noisyWavelets) .* tmp;
    end
    
    figure; imshow(noisyWaveletsFiltered, [0 255]);
    figure; imshow(approx, [0 255]); figure
    
    %Place the approximation back and compute the original image
    noisyWaveletsFiltered(1:height, 1:width) = approx;
    denoisedImage = IPidwt2(noisyWaveletsFiltered, j);
end
function stats = IPtexturemeasures(image, L)
    if nargin < 2
        L = 256;
    end
    % The variable that denotes intensity
    zs = 0:L - 1;
    
    % Construct the histogram of the image
    hist = zeros(1, L);
    [M, N] = size(image);
    for i=1:M
        for j=1:N
            hist(image(i, j) + 1) = hist(image(i, j) + 1) + 1;
        end
    end
    
    % Normalize the histogram
    hist = hist / sum(hist(:));
    
    % Calculate the mean (see Eq. 11.3-5)
    mean = dot(zs, hist);
    
    % Calculate the 2nd-4th moments
    variance = mu(zs, hist, mean, 2);
    skewness = mu(zs, hist, mean, 3);
    flatness = mu(zs, hist, mean, 4);
    
    stddev = sqrt(variance);
    
    % Normalize the 2nd and 3rd moments
    variance = variance / (L - 1)^2;
    skewness = skewness / (L - 1)^2;
    
    % Measure for relative smoothness (see Eq. 11.3-6)
    R = 1 - (1 / (1 + variance));
    
    % Various other measures
    uniformity = dot(hist, hist);
    entropy = -dot(hist(hist > 0), log2(hist(hist > 0)));
    
    % Build the stats object
    stats = {};
    stats.mean = mean;
    stats.stddev = stddev;
    stats.variance = variance;
    stats.skewness = skewness;
    stats.flatness = flatness;
    stats.R = R;
    stats.uniformity = uniformity;
    stats.entropy = entropy;
end


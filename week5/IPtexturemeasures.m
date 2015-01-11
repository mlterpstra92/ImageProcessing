function [ m, mu_n, r, skewedness, uniformity, entropy ] = IPtexturemeasures( image, n )
    hist = zeros(1, 255);
    [M, N] = size(image);
    for i=1:M
        for j=1:N
            hist(image(i, j)) = hist(image(i, j)) + 1;
        end
    end
    m = mean(hist);
    hist_normalized_sq = hist / (255.0 * 255.0);
    hist_normalized = hist / 255.0;
    if nargin > 1
        mu_n = mu(hist, n, m);
    else 
        mu_n = 0;
    end
    
    r = 1 - (1 / (1 + mu(hist_normalized_sq, 2, m)));
    
    skewedness = mu(hist_normalized, 3, m);
    uniformity = sum(hist_normalized .* hist_normalized);
    entropy = -sum((hist_normalized(hist_normalized > 0)) .* log2(hist_normalized(hist_normalized > 0)));
end


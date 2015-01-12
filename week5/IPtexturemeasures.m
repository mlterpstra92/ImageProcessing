function [ m, r, skewedness, uniformity, entropy ] = IPtexturemeasures( image)
    hist = zeros(1, 255);
    [M, N] = size(image);
    for i=1:M
        for j=1:N
            if(image(i, j) > 0)
                hist(image(i, j)) = hist(image(i, j)) + 1;
            end
        end
    end
    m = mean(image(:));
    hist_normalized = hist / sum(hist(:));
    variance = 0;
    skewedness = 0;
    for z=1:length(hist)
        variance = variance + ((z - 1 -m) / length(hist_normalized - 1))^2 * hist_normalized(z);
        skewedness = skewedness + ((z - 1 -m) / length(hist_normalized - 1))^3 * hist_normalized(z);
    end
    r = 1 - (1 / (1 + variance));
    uniformity = sum(hist_normalized(:) .^ 2);
    entropy = -sum((hist_normalized(hist_normalized > 0)) .* log2(hist_normalized(hist_normalized > 0)));
end


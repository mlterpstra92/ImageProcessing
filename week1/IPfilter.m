function convolutedImage = IPfilter(image, mask)
%IPFILTER Summary of this function goes here
%   Detailed explanation goes here
    [b, a] = (size(mask));
    b = floor(b / 2);
    a = floor(a / 2);
    [rows, cols] = size(image);
    paddedImage = zeros(rows + 2 * b, cols + 2 * a);
    paddedImage(1 + b:end - b, 1 + a:end - a) = image;
    convolutedImage = zeros(size(paddedImage));
    tic;
    for x=1 + b:size(convolutedImage, 2) - b
        for y=1 + a:size(convolutedImage, 1) - a
            convolutedImage(y, x) = sum(sum(mask .* paddedImage(y - a : y + a, x - b : x + b)));
        end
    end
    elapsedTime = toc;
    disp(['Total execution time: ', num2str(elapsedTime)]);
    disp(['Convolution time per pixel: ', num2str(elapsedTime / (rows * cols))]);
    convolutedImage = convolutedImage(1+b:end - b, 1 + a:end - a);
end


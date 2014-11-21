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
    for x=1 + b:size(convolutedImage, 2) - b
        for y=1 + a:size(convolutedImage, 1) - a
            convolutedImage(y, x) = sum(sum(mask .* paddedImage(y - b : y + b, x - a : x + a)));
%             for i=-b:b
%                 for j=-a:a
%                     convolutedImage(y, x) = convolutedImage(y, x) + mask(i + b + 1, j + a + 1)*paddedImage(y + j, x + i);
%                 end
%             end
        end
    end
    convolutedImage = convolutedImage(1+b:end - b, 1 + a:end - a);
end


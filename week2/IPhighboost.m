function outImage = IPhighboost( image, k )
%IPHIGHBOOST Summary of this function goes here
%   Detailed explanation goes here
% Image can contain negative values after this function if for example
% k >= 1 and image is: 
%    6     6     6
%    6     2     6
%    6     6     6
    gaussianMask = 1/9*[1, 1, 1; 1, 1, 1; 1, 1, 1];
    blurredImage = IPfilter(image, gaussianMask);
    mask = image - blurredImage;
    outImage = image + k * mask;
end
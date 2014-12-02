function outImage = IPhighboost( image, k )
    gaussianMask = 1/9*[1, 1, 1; 1, 1, 1; 1, 1, 1];
    blurredImage = IPfilter(image, gaussianMask);
    mask = image - blurredImage;
    outImage = image + k * mask;
end
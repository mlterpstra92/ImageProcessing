function outImage = IPgradient( image )
%IPGRADIENT Summary of this function goes here
%   Detailed explanation goes here
    sobelHor = [-1, -2, -1; 0,0,0; 1, 2, 1];
    sobelVert = sobelHor';
    outImage = abs(IPfilter(image, sobelHor)) + abs(IPfilter(image, sobelVert));
end


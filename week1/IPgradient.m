function filter = IPgradient(image)
    sobelHor = [-1, -2, -1; 0,0,0; 1, 2, 1];
    sobelVert = sobelHor';
    filter = abs(IPfilter(image, sobelHor)) + abs(IPfilter(image, sobelVert));
end


function outImage = IPidwt2(image, j)
    outImage = image;
    if j == 0
        return;
    end
    
    [M, N] = size(image);
    xWidth = M / (2^j);
    yWidth = N / (2^j);
    Wa = image(1:xWidth, 1:yWidth);
    Wh = image(xWidth+1:2*xWidth, 1:yWidth);
    Wv = image(1:xWidth, yWidth+1:2*yWidth);
    Wd = image(xWidth+1:2*xWidth, yWidth+1:2*yWidth);
    ding1 = compose_2d(Wa, Wh, 'rows');
    ding2 = compose_2d(Wv, Wd, 'rows');
    
    outImage = IPidwt2(compose_2d(ding1, ding2, 'columns'), j - 1);
end


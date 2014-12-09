function outImage = IPidwt2(image, j)
    if j == 0
        outImage = image;
    else
        [M, N] = size(image);
        xWidth = M / (2^j);
        yWidth = N / (2^j);
        Wa = image(1:xWidth         , 1:yWidth);
        Wh = image(xWidth+1:2*xWidth, 1:yWidth);
        Wv = image(1:xWidth         , yWidth+1:2*yWidth);
        Wd = image(xWidth+1:2*xWidth, yWidth+1:2*yWidth);
        ding1 = compose_2d(Wa, Wh, 'rows');
        ding2 = compose_2d(Wv, Wd, 'rows');
        imshow(ding1, [0 255]); figure;
        imshow(ding2, [0 255]); figure;
        image(1:xWidth * 2, 1:yWidth * 2) =  compose_2d(ding1, ding2, 'columns');

        outImage = IPidwt2(image * 2, j - 1);
    end
end


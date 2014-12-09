function [Wa, Wh, Wv, Wd] = IPdwt2(image, j)
    [M, N] = size(image);
    xCell = 1 / M;
    yCell = 1 / N;
    x = linspace(xCell / 2, 1 - xCell / 2, M);
    y = linspace(yCell / 2, 1 - yCell / 2, N);
    [a, d] = decompose_2d(image, sqrt(2), 'columns');
    [Wa, Wh] = decompose_2d(a, sqrt(2), 'rows');
    [Wv, Wd] = decompose_2d(d, sqrt(2), 'rows');
    finalImage = zeros(M, N);
    finalImage(1:M/2, 1:N/2) = Wa;
    finalImage(M/2+1:end, 1:N/2) = Wv;
    finalImage(1:M/2, N/2+1:end) = Wh;
    finalImage(M/2+1:end, N/2+1:end) = Wd;
    imshow(finalImage, [-128, 512]);
end
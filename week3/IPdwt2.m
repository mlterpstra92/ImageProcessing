function finalImage = IPdwt2(image, j, finalImage)
    if nargin < 3
        finalImage = zeros(size(image));
    end
    [M, N] = size(image);
    [a, d] = decompose_2d(image, 'columns');
    [Wa, Wh] = decompose_2d(a, 'rows');
    [Wv, Wd] = decompose_2d(d, 'rows');
    finalImage(M/2+1:M, 1:N/2) = Wv;
    finalImage(1:M/2, N/2+1:N) = Wh;
    finalImage(M/2+1:M, N/2+1:N) = Wd;
    if j == 1
        finalImage(1:M/2, 1:N/2) = Wa;
    else
        finalImage = IPdwt2(Wa, j - 1, finalImage);
    end
end
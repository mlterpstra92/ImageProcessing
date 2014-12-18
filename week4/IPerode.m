function eroded = IPerode(logicalImage, structuringElement )
    [M, N] = size(logicalImage);
    eroded = zeros(M + 2, N + 2);
    eroded(2:M + 1, 2:N+1) = logicalImage;
    logicalImage = eroded;
    for i=2:M + 1
        for j=2:N + 1
            slice = logicalImage(i-1:i+1, j-1:j+1);
            eroded(i, j) = all(all(((slice & structuringElement) == structuringElement)));
        end
    end
    eroded = eroded(2:M + 1, 2:N + 1);
end
function dilated = IPdilate(logicalImage, structuringElement )
    [M, N] = size(logicalImage);
    dilated = zeros(M + 2, N + 2);
    dilated(2:M + 1, 2:N+1) = logicalImage; 
    for i=2:M+1
        for j=2:N+1
            if logicalImage(i - 1 , j - 1);
                dilated(i-1:i+1, j-1:j+1) = (dilated(i-1:i+1, j-1:j+1) | structuringElement);
            end
        end
    end
    dilated = dilated(2:M + 1, 2:N + 1);
end
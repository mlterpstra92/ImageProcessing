function [a, d] = decompose_2d(image, along)
    [M, N] = size(image);
    if strcmp(along, 'columns') == 1
        newSize = [M, N / 2];
        newImageEven = zeros(newSize);
        newImageOdd = zeros(newSize);
        for i=1:newSize(1)
            for j=1:newSize(2)
                newImageEven(i, j) = image(i, j * 2);
                newImageOdd(i, j) = image(i, j * 2 - 1);
            end
        end
    else
        newSize = [M / 2, N];
        newImageEven = zeros(newSize);
        newImageOdd = zeros(newSize);
        for i=1:newSize(1)
            for j=1:newSize(2)
                newImageEven(i, j) = image(i * 2, j);
                newImageOdd(i, j) = image(i * 2 - 1, j);
            end
        end
    end
    a = (newImageEven + newImageOdd) / sqrt(2);
    d = (newImageEven - newImageOdd) / sqrt(2);
end
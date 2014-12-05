function dwt = IPdwt2(image)
    mat = generateHaarMatrix(size(image, 1));
    dwt = mat * image * mat';
end


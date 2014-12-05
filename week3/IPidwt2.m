function image = IPidwt2(dwt)
    mat = generateHaarMatrix(size(dwt, 1));
    image = mat' * dwt * mat;
end


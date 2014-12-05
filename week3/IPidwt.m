function res = IPidwt( haarFactors )
    if size(haarFactors, 1) == 1
        haarFactors = haarFactors';
    end
    haarMatrix = generateHaarMatrix(size(haarFactors, 1));
    res = haarMatrix \ haarFactors;
end
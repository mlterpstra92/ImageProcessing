function res = IPidwt( haarFactors )
    if size(haarFactors, 1) == 1
        haarFactors = haarFactors';
    end
    haar4Matrix = ([1      , 1       , 1      , 1; 
                   1      , 1       , -1     , -1; 
                   sqrt(2), -sqrt(2), 0      , 0; 
                   0      , 0       , sqrt(2), -sqrt(2)]) / 2;
    res = haar4Matrix\haarFactors;
end
function res = IPdwt( fVector )
    if size(fVector, 1) == 1
        fVector = fVector';
    end
               
    haarMatrix = generateHaarMatrix(size(fVector, 1));
    
    res = haarMatrix * fVector;
end
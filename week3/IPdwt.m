function res = IPdwt( fVector, j)
    n = size(fVector, 2);
    assert(bitand(n, n-1) == 0);
    evenElements = fVector(1:2:end);
    oddElements = fVector(2:2:end);
    factor = n / 2;
    
    I = (evenElements + oddElements) / sqrt(factor);
    D = (evenElements - oddElements) / sqrt(factor);
    j = j - 1;
    tempI = I;
    tempD = D;
    while j > 0
        evenElements = tempI(1:2:end);
        oddElements = tempI(2:2:end);
        calcI = (evenElements + oddElements) / sqrt(factor);
        if isempty(calcI)
            break;
        else
            tempI = calcI;
        end
        tempD = [(evenElements - oddElements) / sqrt(factor), tempD];
        j = j -1;
    end
    res = [tempI, tempD];
end
function res = IPdwt( fVector )
    if size(fVector, 1) == 1
        fVector = fVector';
    end
    haar4Matrix = [1, 1 , sqrt(2) , 0       ;
                   1, 1 , -sqrt(2), 0       ;
                   1, -1, 0       , sqrt(2) ;
                   1, -1, 0       , -sqrt(2)] / 2;

    res = haar4Matrix\fVector;
end
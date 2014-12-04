function H = generateHaarMatrix( n )
    H = zeros(n);
    a=1/sqrt(n);
    H(1,:)=a;
    for rowIdx=1:n-1
        %here be magic
        p=fix(log2(rowIdx));
        q=rowIdx-2^p + 1;
        t1=n/2^p;
        startIdx=fix(q*t1);
        switchIdx=fix(startIdx-t1/2);
        endIdx=fix(startIdx-t1);
        haarVal=2^(p/2)*a;
        
        row = zeros(1, n);
        row(endIdx+1:switchIdx) = haarVal;
        row(switchIdx+1:startIdx) = -haarVal;
        H(rowIdx+1,:) = row;
    end
end


function [a, d] = decompose(approximation)
     even = approximation(1:2:end);
     odd = approximation(2:2:end);
     a = (even + odd) / 2;
     d = (even - odd) / 2;
end
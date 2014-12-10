function [a, d] = decompose(f)
     evenElements = f(1:2:end);
     oddElements = f(2:2:end);
     a = (evenElements + oddElements) / sqrt(2);
     d = (evenElements - oddElements) / sqrt(2);
end
function [a, d] = decompose(f)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
     evenElements = f(1:2:end);
     oddElements = f(2:2:end);
     a = (evenElements + oddElements) / sqrt(2);
     d = (evenElements - oddElements) / sqrt(2);
end


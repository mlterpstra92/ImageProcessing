function [a, d] = decompose(f, factor)
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
     evenElements = f(1:2:end);
     oddElements = f(2:2:end);
     a = (evenElements + oddElements) / factor;
     d = (evenElements - oddElements) / factor;
end


function res = IPdwt(approximation, J)
    if J == 0
        % We're done. The current approximation is the coarsest
        % approximation we want.
        res = approximation;
    else
        % Decompose the current approximation into a coarser approximation,
        % and the difference that can be used to restore the current
        % approximation.
        [a, d] = decompose(approximation);
        
        % Further decompose the new approximation while storing the details
        % in the return variable.
        res = [IPdwt(a, J - 1), d];
    end
end
function avg = IPaveragevalue(image)
    fftRepresenation = IPspectrum(image);
    [N, M] = size(fftRepresenation);
    
    % Rounding must be done differently when N and M are odd/even.
    if mod(N, 2) == 0 && mod(M, 2) == 0
        avg = fftRepresenation(N / 2 + 1, M / 2 + 1) / (N * M);
    elseif mod(N, 2) == 0
        avg = fftRepresenation(N / 2 + 1, ceil(M / 2)) / (N * M);
    elseif mod(M, 2) == 0
        avg = fftRepresenation(ceil(N / 2), M / 2 + 1) / (N * M);
    else
        avg = fftRepresenation(ceil(N / 2), ceil(M / 2)) / (N * M);
    end
end
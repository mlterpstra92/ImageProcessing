function avg = IPaveragevalue(image)
    fftRepresenation = IPspectrum(image);
    [nr, nc] = size(fftRepresenation);
    avg = fftRepresenation(ceil(nr / 2), ceil(nc / 2)) / (nr * nc);
end


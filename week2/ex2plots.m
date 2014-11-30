characters = readDoubleImage('characters');
charactersSpectrum = IPspectrum(characters);

% Normalize, such that the max value is 255 (8 bit grayscale)
charactersSpectrum = 255 * charactersSpectrum ./ max(max(charactersSpectrum));

subplot(1, 2, 1);
imshow(characters);

subplot(1, 2, 2);
imshow(charactersSpectrum);

normalAvg = mean(mean(characters));
fftAvg = IPaveragevalue(characters);
disp(['Naively calculated avg: ', num2str(normalAvg)]);
disp(['FFT calculated avg:     ', num2str(fftAvg)]);
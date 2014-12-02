characters = readDoubleImage('characters');
charactersSpectrum = abs(IPspectrum(characters));

% Normalize, such that the max value is 255 (8 bit grayscale)
charactersSpectrum = 255 * charactersSpectrum ./ max(max(charactersSpectrum));

subplot(1, 2, 1);
subimage(characters);
title('Original image');
axis off;

subplot(1, 2, 2);
subimage(charactersSpectrum);
title('Fourier spectrum');
axis off;

normalAvg = mean(mean(characters));
fftAvg = IPaveragevalue(characters);
disp(['Naively calculated avg: ', num2str(normalAvg)]);
disp(['FFT calculated avg:     ', num2str(fftAvg)]);

print(gcf, '-deps', 'characters_spectrum');
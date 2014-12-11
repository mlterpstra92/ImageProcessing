mri = readDoubleImage('noisymri');

figure;
subplot(2, 2, 1);
imshow(mri, [0, 255]);
title('Original noisy image');

softFilteredMri = IPwaveletdenoise(mri, 3, 3, 'soft');

subplot(2, 2, 2);
imshow(softFilteredMri, [0, 255]);
title('Soft-filtered image');

hardFilteredMri = IPwaveletdenoise(mri, 3, 8, 'hard');

subplot(2, 2, 3);
imshow(hardFilteredMri, [0, 255]);
title('Hard-filtered image');
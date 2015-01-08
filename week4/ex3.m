figure;

angio = readLogicalImage('angio');
subplot(2, 1, 1);
imshow(angio);
title('Original non-noisy angiogram');

angio_noise = readLogicalImage('angio_noise');
subplot(2, 1, 2);
imshow(angio_noise);
title('Noisy angiogram');

figure;

angio_noise_opened = IPopen(angio_noise, ones(3, 3));
subplot(2, 1, 1);
imshow(angio_noise_opened);
title('Opened noisy angiogram');

diff_opening = angio_noise_opened ~= angio;
subplot(2, 1, 2);
imshow(diff_opening);
title(['Difference with non-noisy angiogram (', num2str(sum(sum(diff_opening))) ')']);

figure;

angio_opened_by_recon = IPrecon_by_dilation(IPerode(angio_noise, ones(3, 3)), angio_noise, ones(3, 3));
subplot(2, 1, 1);
imshow(angio_opened_by_recon);
title('Noisy angiogram opened by reconstr.');

diff_opening_by_recon = angio_opened_by_recon ~= angio;
subplot(2, 1, 2);
imshow(diff_opening_by_recon);
title(['Difference with non-noisy angiogram (', num2str(sum(sum(diff_opening_by_recon))) ')']);
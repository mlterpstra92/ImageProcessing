sharpenMask = [0, 1, 0; 1, -4, 1; 0, 1, 0];
blurMask = (1/5) * [0, 1, 0; 1, 1, 1; 0, 1, 0];
image = readDoubleImage('angio_noise');
firstBlur = IPfilter(IPfilter(image, blurMask), sharpenMask) + image;
firstSharpen = IPfilter(IPfilter(image, sharpenMask) + image, blurMask);
difference = abs(firstBlur - firstSharpen);
difference = difference / max(max(difference));

subplot(2, 2, 1);
imshow(image);
title(gca, 'original');

subplot(2, 2, 2);
imshow(firstBlur);
title(gca, 'blur -> sharpen');

subplot(2, 2, 4);
imshow(firstSharpen);
title(gca, 'sharpen -> blur');

subplot(2, 2, 3);
imshow(difference);
title(gca, 'normalized difference');
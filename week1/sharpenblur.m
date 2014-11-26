sharpenMask = [0, 1, 0; 1, -4, 1; 0, 1, 0];
blurMask = (1/5) * [0, 1, 0; 1, 1, 1; 0, 1, 0];
image = readDoubleImage('blobs');
firstBlur = IPfilter(IPfilter(image, blurMask), sharpenMask) + image;
firstSharpen = IPfilter(IPfilter(image, sharpenMask) + image, blurMask);

subplot(2, 2, 1);
imshow(image);
title(gca, 'original');

subplot(2, 2, 3);
imshow(firstBlur);
title(gca, 'blur -> sharpen');

subplot(2, 2, 4);
imshow(firstSharpen);
title(gca, 'sharpen -> blur');
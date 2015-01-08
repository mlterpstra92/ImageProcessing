wirebond = readLogicalImage('wirebondmask');

figure;
imshow(wirebond);
title('Original image');

crossSE = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);
blockSE = true(3, 3);

figure;

subplot(2, 1, 1);
imshow(IPerode(wirebond, crossSE));
title('Eroded with cross');

subplot(2, 1, 2);
imshow(IPerode(wirebond, blockSE));
title('Eroded with block');

figure;

subplot(2, 1, 1);
imshow(IPdilate(wirebond, crossSE));
title('Dilated with cross');

subplot(2, 1, 2);
imshow(IPdilate(wirebond, blockSE));
title('Dilated with block');


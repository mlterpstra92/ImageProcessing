wirebond = readLogicalImage('wirebondmask');

figure;
subplot(3, 2, 1:2);
imshow(wirebond);
title('Original image');

plusSE = logical([0, 1, 0; 1, 1, 1; 0, 1, 0]);

subplot(3, 2, 3);
imshow(IPdilate(wirebond, plusSE));
title('Dilated with plus');

subplot(3, 2, 4);
imshow(IPerode(wirebond, plusSE));
title('Eroded with plus');

blockSE = true(3, 3);

subplot(3, 2, 5);
imshow(IPdilate(wirebond, blockSE));
title('Dilated with block');

subplot(3, 2, 6);
imshow(IPerode(wirebond, blockSE));
title('Eroded with block');
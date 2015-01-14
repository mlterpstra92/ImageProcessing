bubbles = imread('../Images/images/bubbles.tif');
cktboard = imread('../Images/images/cktboard.tif');
cereal = imread('../Images/images/cereal.tif');
%extract lower right segment
bubbles = bubbles(end - 100:end, end-100:end);
cktboard = cktboard(end - 100:end, end-100:end);
cereal = cereal(end - 100:end, end-100:end);

bubbles_stats = IPtexturemeasures(bubbles);
cktboard_stats = IPtexturemeasures(cktboard);
cereal_stats = IPtexturemeasures(cereal);

figure;
subplot(1, 3, 1);
imshow(bubbles);
title('Bubbles');
subplot(1, 3, 2);
imshow(cktboard);
title('Circuitboard');
subplot(1, 3, 3);
imshow(cereal);
title('Cereal');
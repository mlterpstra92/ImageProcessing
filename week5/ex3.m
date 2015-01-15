close all;

numImages = 6;
images = zeros(numImages, 564 * 564);
titles = {'Visible blue', 'Visible green', 'Visible red', 'Near infrared', 'Middle infrared', 'Thermal infrared'};
titlesPCA = {'Channel 1', 'Channel 2', 'Channel 3', 'Channel 4', 'Channel 5', 'Channel 6'};

% Construct matrix and show original images
figure;
for i=1:numImages
    img = readDoubleImage(['WashingtonDC_Band', num2str(i), '_564']);
    [M, N] = size(img);
    subplot(3, 2, i);
    imshow(img, [0 255]);
    title(strcat(titles(i), ' - original'));
    images(i, :) = img(:);
end

[Y, X, e] = IPprincipalcomponents(images);
e'

figure;
for j=1:numImages
    subplot(3, 2, j);
    imshow(reshape(Y(j, :), [M, N]), [0 255]);
    title(strcat(titlesPCA(j), ' - full PCA'));
end

% Retain three largest eigenvalues
[Q, Z, ef] = IPprincipalcomponents(images, 3);
ef'

figure;
for j=1:numImages
    subplot(3, 2, j);
    imshow(reshape(Q(j, :), [M, N]), [0 255]);
    title(strcat(titlesPCA(j), ' - partial PCA'));
end

figure;
for j=1:numImages
    subplot(3, 2, j);
    imshow(reshape(Z(j, :), [M, N]), [0 255]);
    title(strcat(titles(j), ' - partial reconstruction'));
end

figure;
for j=1:numImages
    subplot(3, 2, j);
    diff = abs(images(j, :) - Z(j, :));
    imshow(reshape(diff, [M, N]), [min(diff), max(diff)]);
    title([strcat(titles(j), ' - differences'),  strcat('(', num2str(sum(sum(diff))), ')')]);
end
numImages = 6;
images = [];
titles = {'Visible blue', 'Visible green', 'Visible red', 'Near infrared', 'Middle infrared', 'Thermal infrared'};


% Construct matrix and show original images
figure
for i=1:numImages
    img = readDoubleImage(['WashingtonDC_Band', num2str(i), '_564']);
    [M, N] = size(img);
    subplot(3, 2, i);
    imshow(img, [0 255]);
    title([strcat(titles(i), ' - original')]);
    images(i, :) = img(:);
end

[Y, X, e] = IPprincipalcomponents(images);
e'

figure;
for j=1:numImages
    subplot(3, 2, j);
    %imagesc(reshape(Y(j, :), [M, N]));
    imshow(reshape(Y(j, :), [M, N]), [0 255])
    title([strcat(titles(j), ' - full PCA')]);
end

% Retain three largest eigenvalues
[Q, Z, ef] = IPprincipalcomponents(images, 3);
ef'

figure;
for j=1:numImages
    subplot(3, 2, j);
    %imagesc(reshape(Q(j, :), [M, N]));
    imshow(reshape(Q(j, :), [M, N]), [0 255])
    title([strcat(titles(j), ' - partial PCA')]);
end

figure;
for j=1:numImages
    subplot(3, 2, j);
    %imagesc(reshape(Q(j, :), [M, N]));
    imshow(reshape(Z(j, :), [M, N]), [0 255])
    title([strcat(titles(j), ' - partial reconstruction')]);
end

figure;
for j=1:numImages
    subplot(3, 2, j);
    diff = abs(images(j, :) - Z(j, :)) < 0.1;
    %imagesc(reshape(diff, [M, N]));
    imshow(reshape(diff, [M, N]), [0 1])
    title([strcat(titles(j), ' - differences',  '(', num2str(sum(sum(diff))), ')')]);

end
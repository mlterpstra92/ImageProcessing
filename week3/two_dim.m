j = 4;

image = readDoubleImage('vase');
figure;
imshow(image, [0 255]);

imageDWT = IPdwt2(image, j);
[M, N] = size(imageDWT);

% Rescale the parts with details
addition = repmat(128, size(imageDWT));
addition(1:M / (2^j),1:N / (2^j)) = zeros(M/(2^j), N/(2^j));
rescaledImageDWT = imageDWT + addition;

figure;
imshow(rescaledImageDWT, [0 255]);

imageRetrieved = IPidwt2(imageDWT, j);
figure;
imshow(imageRetrieved, [0 255]);
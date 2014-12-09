% We're using this many levels in the pyramid.
% This should not be higher than log2(N) where N is the size of the
% (square) image, otherwise unexpected things will happen.
j = 9;

% Read the image.
image = readDoubleImage('vase');
figure;
imshow(image, [0 255]);

% Compute the 2D DWT of the image, using j levels.
imageDWT = IPdwt2(image, j);
[M, N] = size(imageDWT);

% Rescale the parts with details, so they're more visible.
addition = repmat(128, size(imageDWT));
addition(1:M / (2^j),1:N / (2^j)) = zeros(M/(2^j), N/(2^j));
rescaledImageDWT = imageDWT + addition;

figure;
imshow(rescaledImageDWT, [0 255]);

% Retrieve the original image by computing the inverse 2D DWT of the
% transformed image, using j levels.
imageRetrieved = IPidwt2(imageDWT, j);
figure;
imshow(imageRetrieved, [0 255]);

% Make sure that the retrieved image is indeed exactly equal to the
% retrieved image after the transformations.
assert(all(all(image == imageRetrieved)));
fingerprint = readDoubleImage('fingerprint');

figure;
imshow(fingerprint, [0 255]);

[image, threshold] = IPautothresh(fingerprint, 0.1);
disp(['threshold = ', num2str(threshold)]);

figure;
imshow(image);

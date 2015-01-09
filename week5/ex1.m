close all;
fingerprint = readDoubleImage('fingerprint');
imshow(fingerprint, [0 256]);
figure;
[image, threshold] = IPauthothres(fingerprint, 0.1);
disp(['threshold = ', num2str(threshold)]);
imshow(IPauthothres(image, 0.1));
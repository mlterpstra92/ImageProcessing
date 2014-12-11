close all;
noisymri = readDoubleImage('noisymri');
[a, h, v, d] = dwt2(noisymri, 'haar');
threshold = 70;
mode = 'h';
%a = wthresh(a, mode, threshold);
h = wthresh(h, mode, threshold);
v = wthresh(v, mode, threshold);
d = wthresh(d, mode, threshold);
imshow(noisymri, [0 255]); figure;
matlabImage = idwt2(a, h, v, d, 'haar');

ourimage = IPwaveletdenoise(noisymri, 1, threshold);
matlabImage == ourimage

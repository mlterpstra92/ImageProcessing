% haar_x = generateHaarMatrix(4);
% haar_y = generateHaarMatrix(4);
% 
% seperableScaling = haar_x(1, :)' * haar_y(1, :);
% dir_h(:, :, 1) = haar_x(2,:)' * haar_y(1, :);
% dir_h(:, :, 2) = haar_x(3,:)' * haar_y(1, :);
% dir_h(:, :, 3) = haar_x(4,:)' * haar_y(1, :);
% 
% dir_v(:, :, 1) = haar_x(1,:)' * haar_y(2, :);
% dir_v(:, :, 2) = haar_x(1,:)' * haar_y(3, :);
% dir_v(:, :, 3) = haar_x(1,:)' * haar_y(4, :);
% 
% dir_d(:, :, 1) = haar_x(2,:)' * haar_y(2, :);
% dir_d(:, :, 2) = haar_x(3,:)' * haar_y(3, :);
% dir_d(:, :, 3) = haar_x(4,:)' * haar_y(4, :);
% 
% 
% W = dir_h \ image;

% dir_v
% dir_d
image = readDoubleImage('characters');
v = zeros(size(image));
h = v;
d = v;
for i=1:size(image, 2)
    v(:, i) = IPdwt(image(:, i));
end
for i=1:size(image, 1)
    h(i, :) = IPdwt(image(i, :));
end
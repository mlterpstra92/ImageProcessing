dipxe = readDoubleImage('dipxetext');
ks = [0, 1, 2, 3, 4, 4.5];

for i=1:size(ks, 2)
    subplot(2, 3, i);
    imshow(IPhighboost(dipxe, ks(i)));
    if (ks(i) == 0)
        title('Original image');
    else
        title(['k = ', num2str(ks(i))]);
    end
end

print(gcf, '-deps', 'dipxe');

% Negative values
image = [1, 1, 1; 1, 0.1, 1; 1, 1, 1];
disp('Example image:');
disp(image);
negativeValueExample = IPhighboost(image, 0.5);
disp('Negative value example:');
disp(negativeValueExample);

gaussianMask = (1/9) * ones(3, 3);
convolutedImage = IPfilter(image, gaussianMask);
k_critical = image(2, 2) / (convolutedImage(2, 2) - image(2, 2));
disp('k_critical:');
disp(k_critical);

criticalValueExample = IPhighboost(image, k_critical);
disp('Critical value example:');
disp(criticalValueExample);
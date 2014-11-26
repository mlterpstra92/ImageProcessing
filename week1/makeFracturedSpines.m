original = readDoubleImage('fracturedspine');
cs = linspace(2, 2.5, 6);
for i=1:size(cs, 2)
    subplot(3, 2, i);
    imshow(IPlogenhance(original, cs(i)));
    title(gca, ['c = ', num2str(cs(i))]);
end
dipxe = readDoubleImage('dipxetext');
ks = [0, 1, 2, 3, 4, 4.5];

for i=1:size(ks, 2)
    subplot(2, 3, i);
    imshow(IPhighboost(dipxe, ks(i)));
    if (ks(i) == 0)
        title('Original imagse');
    else
        title(['k = ', num2str(ks(i))]);
    end
end
characters = readDoubleImage('characters');

d0s_lowpass = [5, 20, 30, 50, 100];

for i=0:size(d0s_lowpass, 2)
    if i == 0
        subplot(2, 3, i + 1);
        imshow(characters);
        title('Original');
    else
        d0 = d0s_lowpass(i);
        subplot(2, 3, i + 1);
        imshow(IPftfilter(characters, d0, true));
        title(['d_0 = ', num2str(d0)]);
    end
end

d0s_highpass = [30, 60, 160];

figure;
for i=0:size(d0s_highpass, 2)
    if i == 0
        subplot(2, 2, i + 1);
        imshow(characters);
        title('Original');
    else
        d0 = d0s_highpass(i);
        subplot(2, 2, i + 1);
        imshow(IPftfilter(characters, d0, false));
        title(['d_0 = ', num2str(d0)]);
    end
end
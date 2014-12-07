f = [1, 4, -3, 1, 4, 5, 6, 7, 8, 3, 56, 23, 78, 34, 67, -10];
disp([sprintf('Original spatial representation:\n\t'), num2str(f)]);

dwt_representation = IPdwt_han(f);
disp([sprintf('DWT representation:\n\t'), num2str(dwt_representation)]);

f_restored = IPidwt_han(dwt_representation);
disp([sprintf('Restored spatial representation:\n\t'), num2str(f_restored)]);
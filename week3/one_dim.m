f = [1, 4, -3, 1, 5, 6,7, 8];
disp('Original spatial representation:');
disp(f);

dwt_representation = IPdwt(f, 2);
disp('DWT representation:');
disp(dwt_representation);

f_restored = IPidwt(dwt_representation, 2);
disp('Restored spatial representation:');
disp(f_restored);
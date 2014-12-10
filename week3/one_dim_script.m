f = [1, 4, -3, 0];
disp('f:');
disp(f);

% Compute the DWT representation of f, using J = 2.
dwt_representation_f = IPdwt(f, 2);

disp('DWT(f, J=2):');
disp(dwt_representation_f);

% Compute the inverse DWT of f's DWT
f_restored = IPidwt(dwt_representation_f, 2);

disp('IDWT(DWT(f, J=2), J=2):');
disp(f_restored);

% Make sure that f is indeed equal to the restored f.
assert(all(f == f_restored));

g = [4, 2, 1, 3, 3, 7, 4, 2];
disp('g:');
disp(g);

% Compute the DWT representation of g, using J = 3.
dwt_representation_g = IPdwt(g, 3);
disp('DWT(g, J=3):');
disp(dwt_representation_g);

% Compute the inverse DWT of g's DWT
g_restored = IPidwt(dwt_representation_g, 3);
disp('IDWT(DWT(g, J=3), J=3):');
disp(g_restored);

% Make sure that g is indeed equal to the restored g.
assert(all(g == g_restored));
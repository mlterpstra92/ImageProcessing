bubbles = readDoubleImage('bubbles');
cktboard = readDoubleImage('cktboard');
cereal = readDoubleImage('cereal');

%extract lower right segment
bubbles = bubbles(end - 100:end, end-100:end);
cktboard = cktboard(end - 100:end, end-100:end);
cereal = cereal(end - 100:end, end-100:end);

[ m, mu_n, r, skewedness, uniformity, entropy ] = IPtexturemeasures(bubbles, 1)
[ m, mu_n, r, skewedness, uniformity, entropy ] = IPtexturemeasures(cktboard, 1)
[ m, mu_n, r, skewedness, uniformity, entropy ] = IPtexturemeasures(cereal, 1)
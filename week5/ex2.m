bubbles = readDoubleImage('bubbles');
cktboard = readDoubleImage('cktboard');
cereal = readDoubleImage('cereal');
%extract lower right segment
bubbles = bubbles(end - 100:end, end-100:end);
cktboard = cktboard(end - 100:end, end-100:end);
cereal = cereal(end - 100:end, end-100:end);

[ m_b, r_b, skewedness_b, uniformity_b, entropy_b ] = IPtexturemeasures(bubbles)
[ m_cb, r_cb, skewedness_cb, uniformity_cb, entropy_cb ] = IPtexturemeasures(cktboard)
[ m_ce, r_ce, skewedness_ce, uniformity_ce, entropy_ce ] = IPtexturemeasures(cereal)
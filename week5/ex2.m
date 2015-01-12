bubbles = readDoubleImage('bubbles');
cktboard = readDoubleImage('cktboard');
cereal = readDoubleImage('cereal');
%extract lower right segment
bubbles = bubbles(end - 100:end, end-100:end);
cktboard = cktboard(end - 100:end, end-100:end);
cereal = cereal(end - 100:end, end-100:end);

bubbles_stats = IPtexturemeasures(bubbles);
cktboard_stats = IPtexturemeasures(cktboard);
cereal_stats = IPtexturemeasures(cereal);
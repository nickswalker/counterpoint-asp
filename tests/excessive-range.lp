#include "../domain/domain.lph".
#include "../error-strings.lp".
#include "species-one.lp".
#include "test-cantus-firmus.lp".

cv(d4,0).
cv(e4,1).
cv(fs4,2).
cv(c4,3).
cv(d4,4).
cv(e4,5).
cv(c4,6).
cv(a4,7).
cv(e4,8).
cv(g4,9).
cv(d5,10).


% ---- EXPECTED ERRORS

% Pitch 10 is a double octave above the test cantus.
failed :- not error(e_excessive_range, 10).
failed :- error(X,I), reason(X), not error(e_excessive_range, 10), I=0..n.

passed :- not failed.

#show failed/0.
#show passed/0.
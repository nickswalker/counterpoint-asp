#include "../domain/domain.lph".
#include "../error-strings.lp".
#include "species-one.lp".
#include "test-cantus-firmus.lp".

cv(d4,0).
cv(c4,1).
cv(b3,2).
cv(a3,3).
cv(f3,4).
cv(g3,5).
cv(a3,6).
cv(f3,7).
cv(g3,8).
cv(e3,9).
cv(d3,10).


% ---- EXPECTED ERRORS

% 2nd - 9th pitches should never be unisons
failed :- not error(e_voice_unison, 1..n-1).

passed :- not failed.

#show failed/0.
#show passed/0.

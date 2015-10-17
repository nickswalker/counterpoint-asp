#include "../domain/domain.lph".
#include "../error-strings.lp".
#include "species-one.lp".
#include "test-cantus-firmus.lp".

cv(d4,0).
cv(e4,1).
cv(d4,2).
cv(cs4,3).
cv(d4,4).
cv(e4,5).
cv(cs4,6).
cv(a4,7).
cv(e4,8).
cv(g4,9).
cv(d3,10).


% ---- EXPECTED ERRORS

% 4th third is one too many.
expected_error(e_excessive_imperfect_consonances,4).

#show error/2.

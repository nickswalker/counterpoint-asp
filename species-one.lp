% --- CONSTRAINTS

% Voices can't be the same
error(e_voice_unison, I) :- cv(X,I), cf(X,I), note(X), I=1..n-1.

% No static motion (same note in both voices twice in a row)
error(e_static_motion, I) :- cv(A,I), cv(A, I+1), cf(B,I), cf(B,I+1), I=0..n-1.

% Can't repeat a note more than twice
error(e_repeated_pitch, I) :- cv(X,I), cv(X, I+1), cv(X,I+2), I=0..n-2.

% No m2, M2, P4, m7, M7
error(e_improper_harmonic_im2, I):- cv(Y,I), cf(X,I), im2(X,Y), I=0..n.
error(e_improper_harmonic_iM2, I) :- cv(Y,I), cf(X,I), iM2(X,Y), I=0..n.
error(e_improper_harmonic_iP4, I) :- cv(Y,I), cf(X,I), iP4(X,Y), I=0..n.
error(e_improper_harmonic_iM7, I) :- cv(Y,I), cf(X,I), iM7(X,Y), I=0..n.
error(e_improper_harmonic_im7, I) :- cv(Y,I), cf(X,I), im7(X,Y), I=0..n.

% No leaps more than a sixth

highest(I) :- 0 == #count{Y: note(X), note(Y), cv(Y,J), cv(X,I), below(X,Y), J=0..n}, I=0..n.
lowest(I) :- 0 == #count{Y: note(X), note(Y), cv(Y,J), cv(X,I), above(X,Y), J=0..n}, I=0..n.

error(e_excessive_range, -1) :- lowest(A), highest(B), cv(X,A), cv(Y,B), iM10(X,Z), above(Y,Z).
% CV must be above CF
error(e_voice_crossing, I) :- cv(X,I), cf(Y,I), above(Y,X), I=0..n.

% CV mustn't be more than a M13th above the CF
error(e_excessive_range, I) :- cv(X,I), cf(Y,I), iM13(Y,Z), above(X,Z), I=0..n.



% ---- USAGE ERRORS
error(e_cf_not_in_scale, I) :- cf(X,I), not inScale(X), I=0..n.
error(e_cv_not_in_scale, I) :- cv(X,I), not inScale(X), I=0..n.

error(e_cf_out_of_domain, I) :- cf(X,I), not note(X), I=0..n.
error(e_cv_out_of_domain, I) :- cv(X,I), not note(X), I=0..n.
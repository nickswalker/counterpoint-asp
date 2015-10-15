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

% CV must be above CF
error(e_voice_crossing, I) :- cv(X,I), cf(Y,I), above(Y,X), I=0..n.

% CV mustn't be more than a M13th above the CF
error(e_excessive_range, I) :- cv(X,I), cf(Y,I), iM13(Y,Z), above(X,Z), I=0..n.


error(e_cf_out_of_domain, I) :- cf(X,I), not note(X), I=0..n.
error(e_cv_out_of_domain, I) :- cv(X,I), not note(X), I=0..n.

% Must have leading tones and a unison at the end
error(e_improper_cadence, n) :- cv(X,n-1), cv(Y,n), cf(A, n-1), cf(B, n), not sDeg(7,X), not sDeg(8,Y).
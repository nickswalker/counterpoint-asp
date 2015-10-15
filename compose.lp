% This rule disallows any composition errors.
:- error(R,I), reason(R),I=0..n.

% --- DYNAMICS

% There is exactly one note at a given timestep in the contrapuntal voice.
1{cv(X,I) : inScale(X)}1 :- I=0..n.
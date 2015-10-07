samenote(X,X) :- note(X).

% X is above Y, if there exists some Z that X is above; and Y is above that Z.
above(X,Y) :- note(X), note(Y), above(X, Z), above(Z, Y), note(Z).
above(X,Y) :- im2(Y,X).

% --- DYNAMICS

% There may be exactly one note at a given timestep in the contrapuntal voice.
1{cv(X,I) :note(X)}1 :- I=0..0.

% --- CONSTRAINTS

% Notes can't be the same
:- cv(X,I), cf(X,I), note(X), I=0..0.

% No minor seconds
:- cv(Y,I), cf(X,I), im2(X,Y), I=0..0.

% CV must be above CF
:- cv(X,I), cf(Y,I), above(Y,X), I=0..0.


#show cv/2.
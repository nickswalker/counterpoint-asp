samenote(X,X) :- note(X).

% X is above Y, if there exists some Z that X is above; and Y is above that Z.
above(X,Y) :- note(X), note(Y), above(X, Z), above(Z, Y), note(Z).
above(X,Y) :- im2(Y,X).

below(X,Y) :- not samenote(X,Y), not above(X,Y), note(X), note(Y).

% --- DYNAMICS

% There may be exactly one note at a given timestep in the contrapuntal voice.
1{cv(X,I) :note(X)}1 :- I=0..10.

% --- CONSTRAINTS

% Notes can't be the same
:- cv(X,I), cf(X,I), note(X), I=1..9.

% No minor seconds
:- cv(Y,I), cf(X,I), im2(X,Y), I=0..10.

% CV must be above CF
:- cv(X,I), cf(Y,I), above(Y,X), I=0..10.

% CV mustn't be more than a M13th above the CF
:- cv(X,I), cf(Y,I), iM13(Y,Z), below(X,Z), I=0..10.

% Last note must be a union, part of the major triad, or an octave.
:- cv(X,10), cf(Y,10), not iP8(Y,X), not iM3(Y,X), not iP5(Y,X), not samenote(Y,X).

#show cv/2.
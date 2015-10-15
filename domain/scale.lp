% ---- SCALES

% Major
sDeg(2,Y) :- note(Y), sDeg(1,X), iM2(X,Y).
sDeg(3,Y) :- note(Y), sDeg(1,X), iM3(X,Y).
sDeg(4,Y) :- note(Y), sDeg(1,X), iP4(X,Y).
sDeg(5,Y) :- note(Y), sDeg(1,X), iP5(X,Y).
sDeg(6,Y) :- note(Y), sDeg(1,X), iM6(X,Y).
sDeg(7,Y) :- note(Y), sDeg(1,X), iM7(X,Y).
sDeg(8,Y) :- note(Y), sDeg(1,X), iP8(X,Y).

sDeg(2,Y) :- note(Y), sDeg(2,X), iP8(X,Y).
sDeg(3,Y) :- note(Y), sDeg(3,X), iP8(X,Y).
sDeg(4,Y) :- note(Y), sDeg(4,X), iP8(X,Y).
sDeg(5,Y) :- note(Y), sDeg(5,X), iP8(X,Y).
sDeg(6,Y) :- note(Y), sDeg(6,X), iP8(X,Y).
sDeg(7,Y) :- note(Y), sDeg(7,X), iP8(X,Y).
sDeg(8,Y) :- note(Y), sDeg(8,X), iP8(X,Y).

error(e_no_first_scale_degree, -1) :- not 1{sDeg(1, X): note(X)}1.

inScale(X) :- sDeg(1..8,X), note(X).
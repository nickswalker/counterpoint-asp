% ---- SCALES

% The use must provide us the first scale degree.
error(e_no_first_scale_degree, -1) :- not 1{sDeg(1, X): note(X)}1.

% Major
% Base case
sDeg(2,Y) :- note(Y), sDeg(1,X), iM2(X,Y).
sDeg(3,Y) :- note(Y), sDeg(1,X), iM3(X,Y).
sDeg(4,Y) :- note(Y), sDeg(1,X), iP4(X,Y).
sDeg(5,Y) :- note(Y), sDeg(1,X), iP5(X,Y).
sDeg(6,Y) :- note(Y), sDeg(1,X), iM6(X,Y).
sDeg(7,Y) :- note(Y), sDeg(1,X), iM7(X,Y).
sDeg(8,Y) :- note(Y), sDeg(1,X), iP8(X,Y).

% Recursive
sDeg(2,Y) :- note(Y), sDeg(2,X), iP8(X,Y).
sDeg(3,Y) :- note(Y), sDeg(3,X), iP8(X,Y).
sDeg(4,Y) :- note(Y), sDeg(4,X), iP8(X,Y).
sDeg(5,Y) :- note(Y), sDeg(5,X), iP8(X,Y).
sDeg(6,Y) :- note(Y), sDeg(6,X), iP8(X,Y).
sDeg(7,Y) :- note(Y), sDeg(7,X), iP8(X,Y).
sDeg(8,Y) :- note(Y), sDeg(8,X), iP8(X,Y).

deg(1..9).
nDeg(1,2; 2,3; 3,4; 5,6; 7,8; 8,2).
pDeg(X,Y) :- nDeg(Y,X).

inScale(X) :- sDeg(D,X), deg(D), note(X).

% ---- LEAPS AND STEPS
direction(up).
direction(down).

otherDir(up,down).
otherDir(down,up).
% There's a step if there are two notes in a voice which are adjacent scale degrees.
step(I,up) :- cv(X,I), cv(Y,I+1), sDeg(A,X), sDeg(B,Y), nDeg(A,B), below(X,Y), I=0..n-1.
step(I,down) :- cv(X,I), cv(Y,I+1), sDeg(A,X), sDeg(B,Y), pDeg(A,B), above(X,Y), I=0..n-1.


leap(I,up) :- cv(X,I), cv(Y,I+1), not step(I,up), below(X,Y), I=0..n-1.
leap(I,down) :- cv(X,I), cv(Y,I+1), not step(I,down), above(X,Y), I=0..n-1.

largeLeap(I,down) :- cv(X,I), cv(Y,I+1), iP4(Z,X), below(Y,Z), I=0..n-1.
largeLeap(I,up) :- cv(X,I), cv(Y,I+1), iP4(X,Z), above(Y,Z), I=0..n-1.
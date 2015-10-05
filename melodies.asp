note(a2).
note(b2).
note(c3).
note(d3).
note(e3).
note(f3).
note(g3).
note(a3).
note(b3).
note(c4).
note(d4).
note(e4).
note(f4).
note(g4).
note(a4).
note(b4).
note(c5).

samenote(X,X) :- note(X).
above(c5,b4).
above(b4,a4).
above(a4,g4).
above(g4,f4).
above(f4,e4).
above(e4,d4).
above(d4,c4).

above(c4,b3).
above(b3,a3).
above(a3,g3).
above(g3,f3).
above(f3,e3).
above(e3,d3).
above(d3,c3).

above(c3,b2).
above(b2,a2).

% X is above Y, if there exists some Z that is above X; and Y is above that Z.
above(X,Y) :- note(X), note(Y), above(X,Z), above(Y, Z), note(Z).

iM2(c4,d4).
iM3(c4,e4).
iP4(c4,f4).
iP5(c4,g4).
iM6(c4,a4).
iM7(c4,b4).
iP8(c4,c5).

cf(d2,0).
cf(d2,1).
cf(e2,2).
cf(f2,3).
cf(g2,4).
cf(f2,5).
cf(a2,6).
cf(c3,7).
cf(b2,8).
cf(c3,9).
cf(b3,10).

% --- DYNAMICS

% A given note Y in the cantus firmus implies some note in the contrapuntal voice.
{cv(X,I)} :- cf(Y,I), note(X), I=0..10.


% --- CONSTRAINTS
% There may be exactly one note at a given timestep in the contrapuntal voice.
1{cv(X,I): note(X)}1 :- I=1..10.

%cv(X,I) :- note(X), note(Y), cf(Y,I), above(X,Y), I=0..10.

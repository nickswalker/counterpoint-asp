% ---- NOTES

% Each line defines all the semitones between a C and its major 7th, B.
% Semitones above a diatonic pitch contain an 's'.
note(c1; cis1; d1; dis1; e1; f1; fis1; g1; gis1; a1; ais1; b1;).
note(c2; cis2; d2; dis2; e2; f2; fis2; g2; gis2; a2; ais2; b2;).
note(c3; cis3; d3; dis3; e3; f3; fis3; g3; gis3; a3; ais3; b3;).
note(c4; cis4; d4; dis4; e4; f4; fis4; g4; gis4; a4; ais4; b4;).
note(c5; cis5; d5; dis5; e5; f5; fis5; g5; gis5; a5; ais5; b5;).

% ---- INTERVALS

% The minor second is the smallest step. Each line defines a C chromatic scale.
% First pitch is the root.
im2(c1,cis1; cis1,d1; d1,dis1; dis1,e1; e1,f1; f1,fis1; fis1,g1; g1,gis1; gis1,a1; a1,ais1; ais1,b1; b1,c2).
im2(c2,cis2; cis2,d2; d2,dis2; dis2,e2; e2,f2; f2,fis2; fis2,g2; g2,gis2; gis2,a2; a2,ais2; ais2,b2; b2,c3).
im2(c3,cis3; cis3,d3; d3,dis3; dis3,e3; e3,f3; f3,fis3; fis3,g3; g3,gis3; gis3,a3; a3,ais3; ais3,b3; b3,c4).
im2(c4,cis4; cis4,d4; d4,dis4; dis4,e4; e4,f4; f4,fis4; fis4,g4; g4,gis4; gis4,a4; a4,ais4; ais4,b4; b4,c5).
im2(c5,cis5; cis5,d5; d5,dis5; dis5,e5; e5,f5; f5,fis5; fis5,g5; g5,gis5; gis5,a5; a5,ais5; ais5,b5; b5,c6).

% Major and perfect.
iM2(X,Y) :- im2(X,Z), im2(Z,Y), note(Z).
iM3(X,Y) :- iM2(X,Z), iM2(Z,Y), note(Z).
iP4(X,Y) :- iM3(X,Z), im2(Z,Y), note(Z).
iP5(X,Y) :- iP4(X,Z), iM2(Z,Y), note(Z).
iM6(X,Y) :- iP5(X,Z), iM2(Z,Y), note(Z).
iM7(X,Y) :- iM6(X,Z), iM2(Z,Y), note(Z).
iP8(X,Y) :- iM7(X,Z), im2(Z,Y), note(Z).

% Compound intervals (greater than an octave, less than a double octave)
iM9(X,Y) :- iP8(X,Z), iM2(Z,Y), note(Z).
iM10(X,Y) :- iM9(X,Z), iM2(Z,Y), note(Z).
iP11(X,Y) :- iM10(X,Z), im2(Z,Y), note(Z).
iP12(X,Y) :- iP11(X,Z), iM2(Z,Y), note(Z).
iM13(X,Y) :- iP12(X,Z), iM2(Z,Y), note(Z).
iM14(X,Y) :- iM13(X,Z), iM2(Z,Y), note(Z).
iM15(X,Y) :- iM14(X,Z), im2(Z,Y), note(Z).

% Minor
im3(X,Y) :- iM2(X,Z), im2(Z,Y), note(Z).
im6(X,Y) :- iP5(X,Z), im2(Z,Y), note(Z).
im7(X,Y) :- iM6(X,Z), im2(Z,Y), note(Z).

% Compound minor
im11(X,Y) :- iM10(X,Z), im2(Z, Y), note(Z).
im13(X,Y) :- iP12(X,Z), im2(Z, Y), note(Z).
im14(X,Y) :- iM13(X,Z), im2(Z, Y), note(Z).

% Augmented and diminished
% iA7(X,Y) :- iM7(X,Z), im2(Z,Y), note(Z).
% iD7(X,Y) :- im7(X,Z).

% ---- HELPERS

i2(X,Y) :- im2(X,Y).
i2(X,Y) :- iM2(X,Y).
i3(X,Y) :- im3(X,Y).
i3(X,Y) :- iM3(X,Y).
i6(X,Y) :- im6(X,Y).
i6(X,Y) :- iM6(X,Y).
i7(X,Y) :- im7(X,Y).
i7(X,Y) :- iM7(X,Y).

samenote(X,X) :- note(X).

% X is above Y, if there exists some Z that X is above; and Y is above that Z.
above(X,Y) :- note(X), note(Y), above(X, Z), above(Z, Y), note(Z).
above(X,Y) :- im2(Y,X).

% X is below Y
below(X,Y) :- not samenote(X,Y), not above(X,Y), note(X), note(Y).
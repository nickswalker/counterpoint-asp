% ---- NOTES

% Each line defines all the semitones between a C and its major 7th, B.
% Semitones above a diatonic pitch contain an 's'.
note(c1; cs1; d1; ds1; e1; f1; fs1; g1; gs1; a1; as1; b1;).
note(c2; cs2; d2; ds2; e2; f2; fs2; g2; gs2; a2; as2; b2;).
note(c3; cs3; d3; ds3; e3; f3; fs3; g3; gs3; a3; as3; b3;).
note(c4; cs4; d4; ds4; e4; f4; fs4; g4; gs4; a4; as4; b4;).
note(c5).

% ---- INTERVALS

% The minor second is the smallest step. Each line defines a C chromatic scale.
% First pitch is the root.
im2(c1,cs1; cs1,d1; d1,ds1; ds1,e1; e1,f1; f1,fs1; fs1,g1; g1,gs1; gs1,a1; a1,as1; as1,b1; b1,c2).
im2(c2,cs2; cs2,d2; d2,ds2; ds2,e2; e2,f2; f2,fs2; fs2,g2; g2,gs2; gs2,a2; a2,as2; as2,b2; b2,c3).
im2(c3,cs3; cs3,d3; d3,ds3; ds3,e3; e3,f3; f3,fs3; fs3,g3; g3,gs3; gs3,a3; a3,as3; as3,b3; b3,c4).
im2(c4,cs4; cs4,d4; d4,ds4; ds4,e4; e4,f4; f4,fs4; fs4,g4; g4,gs4; gs4,a4; a4,as4; as4,b4; b4,c5).

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
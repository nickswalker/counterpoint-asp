#include "error-types.lp".
#include "domain/domain.lph".

% This rule disallows any composition errors.
:- error(R,I), reason(R),I=0..n.

% --- DYNAMICS

% There is exactly one note at a given timestep in the contrapuntal voice.
1{cv(X,I) : inScale(X)}1 :- I=0..n.

#show cv/2.
#show cf/2.
#show error/2.

#script (python)

import gringo
import re
from operator import itemgetter, attrgetter

TEMPLATE = r"""
\header {
  title = "Two Voices"
  composer = "Counterpoint ASP"
  tagline = ""
}


contrapuntalVoiceNotes = \absolute {
    \time 4/4
    \key d \major
    <CV> \bar "||"
}

cantusFirmusNotes = \absolute {
    \time  4/4
    \key d \major
    <CF> \bar "||"
}


voices = \new StaffGroup <<
        \new Staff {
            \clef treble
            \contrapuntalVoiceNotes
        }
        \new Staff {
            \clef bass
            \cantusFirmusNotes
        }
    >>

\score {
	\midi {
	}
    \voices
    \layout { }
}

\version "2.18.2"

"""

def output(solution):
    terms = solution.atoms()
    current = 0
    cv = []
    cf = []
    for atom in terms:
        if atom.name() == "cv":
            cv.append(atom.args())
        elif atom.name() == "cf":
            cf.append(atom.args())

    cv = sorted(cv, key=itemgetter(1))
    cf = sorted(cf, key=itemgetter(1))

    cv_string = ""
    cf_string = ""

    for i in range(0,11):
        note = cv[i]
        cv_string += " " + to_lilypond_note(str(note[0]))
        if i == 0:
            cv_string += str(2)
        elif i == 10:
            cv_string += str(1)

    for i in range(0,11):
        note = cf[i]
        cf_string += " " + to_lilypond_note(str(note[0]))
        if i == 0:
            cf_string += str(2)
        elif i == 10:
            cf_string += str(1)


    output = TEMPLATE.replace("<CV>",cv_string)
    output = output.replace("<CF>", cf_string)
    f = open('lilypond.ly','w')
    f.write(output)
    f.close()

def to_lilypond_note(note_str):
    to_add = ""
    if "5" in note_str:
        to_add = "''"
    if "4" in note_str:
        to_add = "'"
    elif "2" in note_str:
        to_add = "'"
    elif "1" in note_str:
        to_add = ",,"

    stripped = re.sub(r'(?:\d*)?\d+', '', note_str)
    return stripped + to_add

def main(prg):
    p = []
    p.append(("base", []))
    prg.ground(p)
    print("hello")
    solution = prg.solve(on_model=output)
#end.
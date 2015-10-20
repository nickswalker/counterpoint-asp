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
import os
import shlex
import subprocess
from operator import itemgetter, attrgetter



def output(solution):
    terms = solution.atoms()

    cv_string, cf_string = convert_to_lilypond_format(terms)
    template = open("lilypond-template.ly").read()
    output = template.replace("<CV>",cv_string)
    output = output.replace("<CF>", cf_string)
    f = open('out/lilypond.ly','w')
    f.write(output)
    f.close()
    run_lilypond('out', 'lilypond.ly')

def convert_to_lilypond_format(terms):
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

    for i in range(0,len(cv)):
        note = cv[i]
        cv_string += " " + to_lilypond_note(str(note[0]))
        if i == 0:
            cv_string += str(2)
        elif i == len(cv) -1 :
            cv_string += str(1)

    for i in range(0,len(cv)):
        note = cf[i]
        cf_string += " " + to_lilypond_note(str(note[0]))
        if i == 0:
            cf_string += str(2)
        elif i == len(cv) - 1:
            cf_string += str(1)

    return (cv_string, cf_string)

def run_lilypond(outpath, filename):
    savedPath = os.getcwd()
    print(savedPath)
    os.chdir(outpath)
    args = shlex.split("/Applications/Lilypond.app/Contents/Resources/bin/lilypond " + filename)
    output = subprocess.Popen(args, stdout=subprocess.PIPE).communicate()[0]
    os.chdir(savedPath)
    return

def to_lilypond_note(note_str):
    to_add = ""
    if "5" in note_str:
        to_add = "''"
    if "4" in note_str:
        to_add = "'"
    elif "2" in note_str:
        to_add = ","
    elif "1" in note_str:
        to_add = ",,"

    stripped = re.sub(r'(?:\d*)?\d+', '', note_str)
    return stripped + to_add

def main(prg):
    p = []
    p.append(("base", []))
    prg.ground(p)
    solution = prg.solve(on_model=output)
#end.
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

model_num = -1

def output(solution):
    global model_num
    model_num += 1
    terms = solution.atoms()
    cf_string = convert_voice_to_lilypond_format(terms, "cf")
    cv_string = convert_voice_to_lilypond_format(terms, "cv")
    template = open("lilypond-template.ly").read()
    output = template.replace("<CV>",cv_string)
    output = output.replace("<CF>", cf_string)
    filename = "model_" + str(model_num) + ".ly"

    f = open('out/' + filename,'w')
    f.write(output)
    f.close()
    run_lilypond('out', filename)

def convert_voice_to_lilypond_format(terms, voicename):
    current = 0
    applicableterms = []
    for atom in terms:
        if atom.name() == voicename:
            applicableterms.append(atom.args())

    # Sort based on the time (second attribute of the fluent)
    applicableterms = sorted(applicableterms, key=itemgetter(1))

    string_version = ""

    for i in range(0,len(applicableterms)):
        note = applicableterms[i]
        string_version += " " + to_lilypond_note(str(note[0]))
        # First note needs to have the half note duration appended to it
        if i == 0:
            string_version += str(2)
        # Last one is a whole note
        elif i == len(applicableterms) -1 :
            string_version += str(1)

    return string_version

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
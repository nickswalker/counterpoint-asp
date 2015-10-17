# Counterpoint ASP

A rudimentary implementation of [first species counterpoint](https://en.wikipedia.org/wiki/Counterpoint#First_species) that can generate a contrapuntal voice to a given [cantus firmus](https://en.wikipedia.org/wiki/Cantus_firmus).

## Usage

Enter the cantus firmus in `cantus-firmus.asp`. To generate all melodies:

    clingo 0 compose.lp cantus-firmus.lp species-one.lp

To generate a melody:

    clingo 1 compose.lp cantus-firmus.lp species-one.lp
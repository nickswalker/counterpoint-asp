# Counterpoint ASP

A rudimentary implementation of [first species counterpoint](https://en.wikipedia.org/wiki/Counterpoint#First_species) that can generate a contrapuntal voice to a given cantus firmus.

## Usage

Enter the cantus firmus in `cantus-firmus.asp` and ensure that the pitches exist in the domain. To generate all melodies:

    clingo 0 domain.asp cantus-firmus.asp species-one.asp

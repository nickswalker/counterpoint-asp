# Counterpoint ASP

A rudimentary implementation of [first species counterpoint](https://en.wikipedia.org/wiki/Counterpoint#First_species) that can generate a contrapuntal voice to a given [cantus firmus](https://en.wikipedia.org/wiki/Cantus_firmus).

## Usage

Score and MIDI out is provided by [Lilypond](http://www.lilypond.org). Make sure that you have the application installed in `/Applications/`.

Enter the cantus firmus in `my-cantus.asp`. To generate all melodies, and output each as a PDF and MIDI file:

    clingo 0 compose.lp cantus-firmi/my-cantus.lp species-one.lp

To generate `N` melodies:

    clingo N compose.lp cantus-firmus.lp species-one.lp

You may find [Timidity](http://timidity.sourceforge.net) for playback and conversion.
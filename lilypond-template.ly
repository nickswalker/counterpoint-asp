\header {
  title = "Two Voices"
  composer = "Counterpoint ASP"
  tagline = ""
}


contrapuntalVoiceNotes = \absolute {
	\set midiInstrument = #"acoustic grand"
    \time 4/4
    \key c \major
    <CV> \bar "||"
}

cantusFirmusNotes = \absolute {
	\set midiInstrument = #"acoustic grand"
    \time  4/4
    \key c \major
    <CF> \bar "||"
}


scoreTempo = \tempo 4 = 100
voices = \new StaffGroup <<
         \new Staff {
            \clef treble
            \scoreTempo
            \contrapuntalVoiceNotes
        }
        \new Staff {
            \clef bass
            \scoreTempo
            \cantusFirmusNotes
        }
    >>

\score {
	\midi {
	\context {
		\Score
	 	midiChannelMapping = #'instrument
		}
	}

    \voices
    \layout { }
}

\version "2.18.2"
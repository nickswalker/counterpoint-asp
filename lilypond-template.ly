\header {
  title = "Two Voices"
  composer = "Counterpoint ASP"
  tagline = ""
}


contrapuntalVoiceNotes = \absolute {
    \time 4/4
    \key c \major
    <CV> \bar "||"
}

cantusFirmusNotes = \absolute {
    \time  4/4
    \key c \major
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
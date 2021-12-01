\version "2.20.0"
\header {
  title = "Can't stop"
  composer = ""
}
\include "articulate.ly"


global = {
  \key g \major
  \time 4/4
}

% BASS
IntroBassLine = \relative c {
  \mark \markup {"7x"}
  \<
  \repeat unfold 7  { e16 e e e e e e e e e e e e e e e}
  {e16 e e e e e e e e, e e e e e e e}
  \ff
}

IntroBassWhileGuitarRiff = \relative c {
  \mark \markup {"8x Guitar riff"} 
  \repeat volta 8 {r1}
\mark \markup {"8x"}   
}

VerseBassCommon = \relative c {
  {e8 d'-. e-. e, e16 d'8-. e16 r16 \deadNote e, e8}
  {d8 d'-. e-. r16 d,16 r16 d'8-. e16 r \deadNote d, a8}
}

VerseBassMeasureThree = \relative c {b8 b'-. b-. b, b16 b' b b r16 b, b8}
VerseBassPatternA = {\VerseBassCommon \VerseBassMeasureThree \relative c {c c'-. c-. c, c16 c' c c \deadNote g \deadNote c c8}}
VerseBassPatternB = {\VerseBassCommon \VerseBassMeasureThree \relative c {c c' c c, c16 c'8 c16 r8 c,}}
VerseBassPatternC = {\VerseBassCommon \relative c {b,8 b' b b,16 b b b' \deadNote b, b' r \deadNote fis b,8} \relative c {c c' c c, c16 c' c c \deadNote c \deadNote c c8}}

VerseBassA = \relative c {
  \mark \markup {"Verse1"} 
  \VerseBassPatternA
  \VerseBassPatternB
  \VerseBassPatternC
}

Chorus = \relative c {
  \mark \markup {"Chorus"} 
  {g'8. \deadNote g16 b c d8~d2} {b8. a16 b a c8~c4 r16 d, c' d} {g,8. g16 b c d8~d d d r} {b8. \deadNote g16 b a c8~c4 e8 d}
  {g,8. \deadNote g16 b c d8~d2} {b8. g'16~g \deadNote b, c8~c4 c16 d8.} {g,8. \deadNote g16 b c d8~d4. r8} {b4 c2.}
}

VerseC = \relative c {
  \mark \markup {"Verse 3"}
  \repeat volta 5 \VerseBassPatternA
  \mark \markup {"x5"} 
}

VerseB = \relative c {
  \mark \markup {"Verse 2"} 
  \repeat volta 4 \VerseBassPatternB
  \mark \markup {"4x"} 
}

BridgeCommonA = \relative c {e8 e' e e, r2 a'8 d,}
BridgeCommonB = \relative c {b8 b' b b, r2 d'8 c c, c'}
Bridge = \relative {
  \mark \markup {"Bridge"} 
  {\BridgeCommonA {d4 r2} \BridgeCommonB {r2}}
  {\BridgeCommonA {d8 d r2} \BridgeCommonB {r8 d r dis}}
  {\BridgeCommonA {d d' r2} \BridgeCommonB {r8 g,16 a r \deadNote d, d dis}}
  {\BridgeCommonA {d8 d' r2} \BridgeCommonB {r2}}
}

BassGuitarSolo = \relative c {
  \mark \markup {"Solo"}
  {e8 d' e e, e16 d' \deadNote e, e' \deadNote e, \deadNote e' e,8}
  {d8 d' e d, d16 d' \deadNote d, e' \deadNote d, \deadNote d' a,8}
  {b8 b' b b, b16 b' \deadNote b, b' \deadNote b, \deadNote b' b,8}
  {c8 \tuplet 3/2 8 {\deadNote c'16 \deadNote c, \deadNote c} c'8 c, a'16 b d e g,a g8}
}

song = {
  <<
    \new Staff \with {
      midiInstrument = "acoustic grand"
      instrumentName = "bass"
    } { 
      \key g \major
      \clef "bass" 
      \IntroBassLine
      \IntroBassWhileGuitarRiff
      \VerseBassA
      \Chorus
      \VerseB
      \Chorus
      \Bridge
      \BassGuitarSolo
      \VerseC
    }
  >>

}

\score {
  \song  
  \layout { }
}
\score {
  \unfoldRepeats \song
  \midi {
    \tempo 4=80
  }
}



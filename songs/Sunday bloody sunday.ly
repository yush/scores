\version "2.22.0"
\header {
  title = "Sunday bloody sunday"
  composer = ""
}


global = {
  \key c \major
  \time 4/4
}

% BASS
bassLineIntro = \relative c {
  {aes1 ees aes ees ees}
}

bassLineChorus = \relative c {
  bes16 bes bes aes bes4
  des16 des des bes des4
  ees16 ees ees des ees4
  ees16 ees ees des ees4
}

bassBridge = \relative c {
  aes2 ges f1
}

% GUITAR
guitarIntroOnly = \relative c'' {
  bes8 des f des
  aes des f des
  ges, des' ees des
  ges, des' ees des
}

guitarIntroWithBass = \relative c'' {
  <aes des f>1
  <ges des' ees>
  <aes des f>
  <ges des' ees>
  <ges des' ees>
}

guitarChorus = \relative c {
  
}

guitarBridge = \relative c {
  des8 aes4. b8 ges4.
  aes8 des4. r2  
}

intro  = {\bassLineIntro}
chorus = {\guitarIntroWithBass}

song = {
%  <<
%    \new Staff \with {
%      midiInstrument = "acoustic grand"
%      instrumentName = "guitar"
%    } 
%    {
%      \voiceOne
%      \repeat volta 10 \guitarIntroOnly
%      \chorus     
%    >>  
  <<
    \new Staff \with {
      midiInstrument = "acoustic grand"
      instrumentName = "bass"
    } { 
      \clef "bass" 
      \voiceTwo
      \mark \markup {"6x"} \repeat volta 6 {r1 r}
      \bassLineIntro
      \mark \markup {"8x"}\repeat volta 8 \bassLineChorus
      \repeat volta 2 \bassBridge
      \mark \markup {"8x"}\repeat volta 8 \bassLineChorus
      \bassLineIntro
      \mark \markup {"14x"} \repeat volta 14 \bassLineChorus
      \mark \markup {"4x"} \repeat volta 4 \bassBridge
      \mark \markup {"10x"} \repeat volta 10 \bassLineChorus
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



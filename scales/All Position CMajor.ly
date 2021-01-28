\version "2.20.0"

global = {
  \key c \major
  \time 4/4
}

\book {
\score {
  <<
    \new TabStaff \relative {c \mark "6-4" d e f g a b c d e f g a b c2}
    \set TabStaff.minimumFret = 5
    \set TabStaff.restrainOpenStrings = ##t
  >> 
  \layout { }
}

\score {
  <<
    \new TabStaff \relative { c'4\5 \mark "5-4" d\4 e f g a b c d e f g r1}
    \set TabStaff.minimumFret = 12

    \set TabStaff.restrainOpenStrings = ##t
  >> 
  \layout { }
} 
}
  

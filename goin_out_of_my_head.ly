\version "2.22.2"
\language "english"

#(define-markup-command
  (header-pad-below layout props arg)
  (markup?)
  (let ((padding (chain-assoc-get 'header:pad-below props 0)))
   (interpret-markup layout props
    (markup #:put-adjacent Y DOWN arg
     #:with-dimensions '(0 . 0) `(0 . ,padding) #:null))))

\paper {
  %ragged-bottom = ##f
  %ragged-last-bottom = ##f
  scoreTitleMarkup = \markup \header-pad-below \scoreTitleMarkup
}

\layout {
  \context {
    \Staff
    \override VerticalAxisGroup.default-staff-staff-spacing =
      #'((basic-distance . 8)
         (minimum-distance . 7)
         (padding . 1))
  }
  \context {
    \ChordNames
    \override VerticalAxisGroup
      .nonstaff-relatedstaff-spacing
      .padding = 2.5
  }
  \context {
    \Lyrics
    \override VerticalAxisGroup
      .nonstaff-relatedstaff-spacing
      .padding = 4
    \override VerticalAxisGroup
      .nonstaff-nonstaff-spacing
      .padding = 1.9
  }
}

\header {
  title = "Goin' Out Of My Head"
  subtitle = "THE FOUR SEASONS"
  composer = \markup { \column {
    \right-align {
      "Teddy Randazzo"
      "Bobby Weinstein"
    }
  } }
  subsubtitle = "1964"
  tagline = ##f
}

harmony = \chordmode {
  \set chordChanges = ##t
  s2
  c1:m7
  c:maj7
  c:m7
  c2:maj7 c:aug7
  f1:maj7
  f1:maj7
  f:m7
  bf:9
  ef:maj7
  g:m7
  ef2:maj7 g:m7
  af bf:9
  c1:maj7
  c:maj7
  \set chordChanges = ##f
  c:maj7
  \set chordChanges = ##t
  d2:m7 g:7
  c1:maj7
  f:maj7
  c:maj7
  d:m7
  c2:maj7 f4:6 c:maj7
  c8:maj7 f4.:6 c4:maj7 f:6
  c4.:maj7 f:6 c4:maj7
  c1:maj7
  d:/fs
  f:m
  c:/e
  ef:dim7
  g:7/d
  a2:m7/d d:7
  g1:sus7
  g:7
  c:m7
  c:maj7
}

melody = \relative c'' {
  \tempo 4 = 120
  \time 2/2
  \partial 2
  g4 a
  \repeat volta 2 {
    bf8 a bf a bf c a4
    g2. g8 a
    bf8 a bf a bf c a4
    g2 c,4 c'
    d ( a2.~
    a2 ) c,4 c'
    c ( af2.~
    af2. ) bf,4
    af' g2 bf,4
    c' bf2 bf,4
    af'8 g4 bf,8 c' bf4 bf,8
    af'8 g4 ef8 c' bf ef, f
  }
  \alternative {
    { g1~g2 g4 a }
    { g1 ~ }
  }
  g4 g8 g c c d4 \pageBreak
  e2. e8 e
  d8 (c4.) c8 c d4
  e2~ \tuplet 3/2 { e4 e e }
  d8 (c4.) c8 c d4
  e r8 d ~ d d e4
  r8 d4 d8 e4 d
  e4 r8 d~d d e4
  \tuplet 3/2 {r c d} \tuplet 3/2 {e d c}
  d1~
  d2 \tuplet 3/2 {b4 c d}
  c1~
  c4 c \tuplet 3/2 {c b a}
  b2 \tuplet 3/2 {b4 a g}
  a4. a8 \tuplet 3/2 {a4 g fs}
  g1~
  g2 g4 a
  \repeat volta 1 {
    bf8 a bf a bf c a g~
    g2. g8 a
  }
}

breaks = {
  s2
  \repeat unfold 2 { s1*2 \break }
  \repeat unfold 2 { s1*3 \break }
  s1*2 \break
  \repeat unfold 2 { s1*4 \break }
  \repeat unfold 2 { s1*2 \break }
  \repeat unfold 2 { s1*4 \break }
}

words_one = \lyricmode {
  Well I
  think I'm go -- ing out of my head,
  yes I think I'm go -- ing out of my head
  o -- ver you, __
  o -- ver you. __
  I want you to want me,
  I need you so bad -- ly,
  I can't tink of a -- ny -- thing but you. __
  And I
  \repeat unfold 6 { \skip 1 }
  head o -- ver you, __
  out of my head __  o -- ver you. __
  Out of my head
  day __ and night
  night and day and night
  wrong __ or right,
  I must think of a way __
  in -- to your heart. __
  There's no rea -- son
  why my be -- ing sy should keep us a -- part. __
  And I think I'm go -- ing out of my head __ Yes, I
}

words_two = \lyricmode {
  \repeat unfold 2 {\skip 1}
  think I'm go -- ing out of my head,
  'cause I can't ex -- plain the tears that I shed
  o -- ver you, __
  o -- ver you. __
  I see you each morn -- ing,
  but you just walk past me,
  you don't e -- ven know that I ex --
  \repeat unfold 3 { \skip 1 }
  ist. __
  Go -- ing out of my

}

\score {
  <<
    \new ChordNames {
      \harmony
    }
    \new Staff {
      <<
        \new Voice = "melody" {
          \melody
        }
        \new Voice {
          \breaks
        }
      >>
    }
    \new Lyrics \lyricsto "melody" {
      \words_one
    }
    \new Lyrics \lyricsto "melody" {
      \words_two
    }
  >>
  \layout {}
  \midi {}
}

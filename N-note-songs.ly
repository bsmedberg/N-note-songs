\version "2.19.46"

header_text = \markup {
  \fontsize #2 \bold \fromproperty #'header:piece
}

maryhada_pitches = \relative c' {
  \clef treble
  \cadenzaOn
  c4 d e g
  \cadenzaOff
}

maryhada_tune = \relative c' {
  \clef treble
  \key c \major
  \time 4/4

  e4 d c d e e e2
  d4 d d2 e4 g g2
  e4 d c d e e e e d d e d c1 \bar "|."
}

pop_pitches = {
  \clef treble
  \cadenzaOn
  \transpose c g \relative c' { g4 c d e f g \parenthesize a }
  \cadenzaOff
}

pop_tune = {
  \clef treble
  \key g \major
  \time 6/8
  \transpose c g
  \relative c' {
    c4 c8 d4 d8 e g e c4
    g8 c4 c8 d4 d8 e4. c4
    g8 c4 c8 d4 d8 e g e c4.
    \xNote a'8 r r d,4 f8 e4. c \bar "|."
  }
}

twinkle_pitches = {
  \clef treble
  \cadenzaOn
  \relative c' { c4 d e f g a }
  \cadenzaOff
}

twinkle_tune = {
  \clef treble
  \key c \major
  \time 4/4
  \relative c' {
    c4 c g' g a a g2
    f4 f e e d d c2
    g'4 g f f e e d2
    g4 g f f e e d2
    c4 c g' g a a g2
    f4 f e e d d c2 \bar "|."
  }
}

frerejacques_pitches = {
  \clef treble
  \cadenzaOn
  \relative c' { d4 g a b c d e }
}

frerejacques_tune = {
  \key g \major
  \time 4/4
  \relative g' {
    g4 a b g g a b g
    b c d2 b4 c d2
    d8 e d c b4 g d'8 e d c b4 g
    g4 d g2 g4 d g2 \bar "|."
  }
}

yankee_pitches = {
  \clef treble
  \cadenzaOn
  \relative c' { d4 e fis g a b c }
}

yankee_tune = {
  \key g \major
  \time 4/4
  \relative g' {
    g4 g a b g b a d,
    g g a b g2 fis
    g4 g a b c b a g
    fis d e fis g2 g2
  }
}

odetojoy_pitches = {
  \clef treble
  \cadenzaOn
  \relative c' { \parenthesize d4 g a b c d }
}

odetojoy_tune = {
  \key g \major
  \time 4/4
  \relative g' {
    b4 b c d d c b a g g a b b4. a8 a2
    b4 b c d d c b a g g a b a4. g8 g2 \break
    a4 a b g a b8 c b4 g a b8 c b4 a g a << { \voiceOne \parenthesize d2 }
                                            \new Voice { \voiceTwo d,2 } >>
    b'4 b c d d c b a g g a b a4. g8 g2 \bar "|."
  }
}

amazing_pitches = {
  \clef treble
  \cadenzaOn
  \transpose c d { \relative c' { c4 d f g a c } }
}

amazing_tune = {
  \key g \major
  \time 3/4
  \partial 4
  \transpose c d {
  \relative c' {
    c4 f2 a8 f a2 g4 f2 d4 c2
    c4 f2 a8 f a2 g4 c2.~ c2
    a4 c4. a8 c a f2 c4 d4. f8 f d c2
    c4 f2 a8 f a2 g4 f2.~ f2 \bar "|."
  } }
}

\book {
  \header {
    title = \markup { \column {
      "Tunes On a Few Notes"
      \vspace #1
    } }
    arranger = "Collected by Benjamin Smedberg"
    tagline = "Source code/pull requests at https://github.com/bsmedberg/N-note-songs"
  }
  \paper {
    #(set-paper-size "letter")
    indent = 1\in
    ragged-bottom = ##t

    markup-system-spacing = #'((basic-distance . 0)
                              (minimum-dinstance . 0)
                              (padding . 0)
                              (stretchability . 0))
    score-markup-spacing = #'((basic-distance . 0)
                              (minimum-dinstance . 0)
                              (padding . 0)
                              (stretchability . 0))

    % after-title-space = 0.5\in
    % between-system-space = 0.1\in

    scoreTitleMarkup = \header_text
  }
  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \maryhada_pitches
    }
    \header {
      piece = \markup \column {
        "Mary Had a Little Lamb"
        \vspace #1
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } \maryhada_tune
  }

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \pop_pitches
    }
    \header {
      piece = \markup {
        \column {
          \vspace #1
          \draw-hline
          "Pop Goes the Weasel"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } \pop_tune
  }

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \twinkle_pitches
    }
    \header {
      piece = \markup {
        \column {
          \vspace #1
          \draw-hline
          "Twinkle Twinkle Little Star"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } {
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \twinkle_tune
    }
  }

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \frerejacques_pitches
    }
    \header {
      piece = \markup {
        \column {
          \vspace #1
          \draw-hline
          "Frére Jacques"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } \frerejacques_tune
  }

  \pageBreak

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \yankee_pitches
    }
    \header {
      piece = \markup {
        \column {
          "Yankee Doodle"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } \yankee_tune
  }

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \odetojoy_pitches
    }
    \header {
      piece = \markup {
        \column {
          \vspace #1
          \draw-hline
          "Ode To Joy"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } {
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \odetojoy_tune
    }
  }

  \score {
    \new Staff \with {
      instrumentName = #"Notes"
      \remove "Time_signature_engraver"
      \omit Stem
      \consists "Horizontal_bracket_engraver"
    }
    {
      \amazing_pitches
    }
    \header {
      piece = \markup {
        \column {
          \vspace #1
          \draw-hline
          "Amazing Grace"
          \vspace #1
        }
      }
    }
  }
  \score {
    \new Staff \with {
      instrumentName = #"Tune"
    } {
      \override Score.BarNumber.break-visibility = ##(#f #f #f)
      \amazing_tune
    }
  }
}

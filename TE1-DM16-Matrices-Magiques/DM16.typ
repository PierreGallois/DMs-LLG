#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 16,
  titre: [Matrices Magiques],
  sections: [Partie],
  alpha: false
)

#let GL = $upright(G L)_2(ZZ)$
#let colred(x) = text(fill: red, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

= Généralités
==
===
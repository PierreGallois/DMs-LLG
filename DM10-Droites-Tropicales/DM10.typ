#import "./../templates/homework.typ": dm, code-from-file
#import "tropiques.typ": *
#import "polynomes.typ": *

#show: dm.with(
  numero: 10,
  titre: [Droites Tropicales],
  sections: [Partie],
  alpha: true
)
#let folder-name = "DM10-Droites-Tropicales"

// Auto-transform style of letters :
#show math.equation: it => {
  show regex("^A$") : math.cal("A")
  show regex("^B$") : math.cal("B")
  show regex("^C$") : math.cal("C")
  it
}


= Les droites tropicales

/ $(A')$ : par deux points du plan passe une droite tropicale
/ $(B')$ : par deux points quelconques indépendants du plan passe une et une seule droite tropicale
/ $(C')$ : deux droites tropicales dont les points centraux sont indépendants se coupent toujours en un unique point.

==
===
#exemples()

===



= Addition et Multiplication tropicales

#let tadd = math.class(
  "relation",
  sym.plus.circle
)

#let tmul = math.class(
  "relation",
  sym.times.circle
)

On définit sur $RR$ l'addition tropicale et la multiplication tropicale tel que pour tous $a, b in RR$,
$
  a tadd b = max(a, b) #h(1em) "et" #h(1em) a tmul b = a + b
$

==
On a donc : #h(1fr) $3 tadd 7 = 7$ #h(1fr) $-5 tadd 2 = 2$ #h(1fr) $3 tmul 7 = 10$ #h(1fr) $-5 tmul 2 = -3$

== 
$tadd$ est associatif et commutatif car $max$ est associatif et commutatif.

TODO : Il y a t il une preuve plus joli que par disjonction a < b < c / b < a < c / b < c < a ? (car b et c interchangeables car max)

==

Voici à quoi ressemble une fonction tropicale
#footnote[Pour des raisons esthétiques, nous utilisons dans les graphiques l'opposé des valeurs de $x$ et $y$.]
de degré 1 :
$a tmul x tadd b tmul y tadd c$ :

#align(center)[
  $1 tmul x tadd 1 tmul y tadd 1$ \
  #premier-degre(20, teal, 1, 1, 1)
]


#table(
  columns: 3,
  stroke: none,
  align(center)[
    $1 tmul x tadd 5 tmul y tadd 1$ \
    #premier-degre(6, purple.lighten(30%), 1, 4, 1)
  ],
  align(center)[
    $5 tmul x tadd 1 tmul y tadd 1$ \
    #premier-degre(6, olive, 4, 1, 1)
  ],
  align(center)[
    $1 tmul x tadd 1 tmul y tadd 5$ \
    #premier-degre(6, yellow.darken(10%), 1, 1, 4)
  ]
)

On remarque que modifier les valeurs $a$, $b$ et $c$ "décale" l'un des "bords".

#pagebreak()
==
Voici à quoi ressemble la fonction tropicale du second degré
#footnote[On prend l'opposé pour l'axe $y$] :
$ 1 tadd (-1) tmul x tadd 0 tmul y tadd (-5) tmul x^2 $

#table(
  columns: 2,
  stroke: none,
  [
    D'un côté :
    #align(center)[
      #second-degre(green.saturate(50%), 1)
    ]
  ],
  [
    De l'autre en prenant l'opposé pour l'axe $x$ :
    #align(center)[
      #second-degre(lime.lighten(50%), -1)
    ]
  ]
)



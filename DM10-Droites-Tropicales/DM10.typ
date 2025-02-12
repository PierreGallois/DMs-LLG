#import "./../templates/homework.typ": dm, code-from-file
#import "@preview/plotst:0.2.0": *

#show: dm.with(
  numero: 10,
  titre: [Droites Tropicales],
  sections: [Partie],
  alpha: true
)
#let folder-name = "DM10-Droites-Tropicales"

= Les droites tropicales




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

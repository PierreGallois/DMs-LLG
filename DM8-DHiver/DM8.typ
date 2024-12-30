#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 8,
  titre: [D'Hiver],
  sections: [Exercice],
  alpha: false
)

// FUNCTIONS

#let r = content => text(fill: red, weight: "medium")[$#content$]
#let b = content => text(fill: blue, weight: "medium")[$#content$]

#let color-rule = content => math.equation(numbering: "(a)", number-align: right, block: true, content)

#let QP = $QQ_+^*$

#let couleur(x, y) = {
  let frac = $#x/#y$
  let c = 0
  while y != 0 {
    c += calc.div-euclid(x, y)
    let r = calc.rem-euclid(x, y)
    x = y
    y = r
  }
  if calc.rem-euclid(c, 2) == 0 [
    #b(frac)
  ] else [
    #r(frac)
  ]
}

#let intercale(nombres) = {
  let sortie = (1,)
  for (before, now) in array.zip(nombres, nombres.slice(1)) {
    sortie.push(before + now)
    sortie.push(now)
  }
  sortie
}

#let pascal(n) = {
  assert(n > 0, message: "la suite commence à 1")
  let sortie = (1, 1)
  for _ in array.range(n - 1) {
    sortie = intercale(sortie)
  }
  sortie
}

#let pretty_pascal(n) = [
  $(#pascal(n).map(str).join(", "))$
]

// DM

= La couleur des nombres

#let rel = sym.tilde.op
#let notrel = sym.tilde.not

Notons $x rel y$ la relation d'équivalence sur $QP$ : "$x$ et $y$ sont de même couleur". Les propriétés d'équivalence sont évidentes. On colore enfin en #b[bleu] les nombres bleus et en #r[rouge] les nombres rouges.

Les deux premières règles deviennent :

#color-rule[#r[1]]
#color-rule[
  $x rel 1/x$
]

Enfin, comme il n'y a que deux couleurs, si $x$ et $y$ sont de couleurs différentes, alors $x$ et $y$ sont de couleurs opposées. La 3e règle devient donc :
#color-rule[
  $x+1 notrel x$
]

==

D'après (a), 1 est rouge et d'après (c), la couleur s'inverse à chaque ajout de 1. Par récurrence évidente, tous les nombres pairs sont donc bleus et tous les nombres impairs rouges.

Ainsi, comme 2016 est pair, 2016 est #b[bleu].

==
Soit $x in QP$ et $k in NN$. D'après (c) appliquée deux fois, $x+2 rel x$. Par une récurrence évidente, $x+2k rel x$.

Ainsi, si $n in NN$ est pair, alors $x + n rel x$, et si $n$ est impair :
$ 
  x + n &rel x + (n-1) + 1 \
  &rel x + 1 #h(2cm) "par (b)"\
  &notrel x #h(2cm) "par (c)"
$

Ainsi, selon la couleur de $x$, si $n$ est pair, $x + n$ aura la même couleur que $x$ et si $n$ est impair $x + n$ sera de couleur opposée à $x$.

==

$
  2016/2015 &rel #r[1] + 1/2015 \
  &rel #r[1] + #r[2015] \
  &rel #b[2016]
$
Donc $2016/2015$ est #b[bleu].

D'autre part,
$
  4/13 &rel 13/4 \
  &rel #r[3] + 1/4 \
  &rel #r[3] + #b[4] \
  &rel #r[7]
$
Donc $4/13$ est #r[rouge].

==

TODO

==

TODO

==

==
Après implémentation de l'algorithme en typst, celui-ci donne :
$
 #couleur(1515, 1789)
$

= Intercaler la somme

==

$E_4 = #pretty_pascal(4)$

$E_5 = #pretty_pascal(5)$


(bien entendu généré automatiquement, le script est dans le DM sur Github)

==
Les réponses suivantes sont calculés automatiquement :
#let E_11 = pascal(11)

===
$E_11$ contient #E_11.len() éléments.

===
La somme de tous les élèments de $E_11$ est #E_11.sum().

===
Le plus grand nombre de $E_11$ est #E_11.reduce((a, b) => {if a < b {b} else {a}}).
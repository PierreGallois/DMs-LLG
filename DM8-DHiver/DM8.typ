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

// DM

= La couleur des nombres

Pour alléger la syntaxe, nous établissons les notations suivantes : #r[nombre rouge], #b[nombre bleu].

Rappelons les règles sous une forme dévelloppée avec $x in QP$ :

#color-rule[#r[1]]
#color-rule[
  $cases(
    #r[x] <=> #r(math.frac("1", "x")),
    #b[x] <=> #b(math.frac("1", "x"))
  )$
]
#color-rule[
  $cases(
    #r[x] <=> #b("x + 1"),
    #b[x] <=> #r("x + 1")
  )$
]

==

D'après (a), 1 est rouge et d'après (c), la couleur s'inverse à chaque ajout de 1. Par récurrence évidente, tous les nombres pairs sont donc bleus et tous les nombres impaires rouges.

Avec $x in QP$ et $k in NN$ nous avons donc :

#color-rule($
  cases(
    x = 2k &=> #b[x],
    x = 2k + 1 &=> #r[x]
  )
$)

Comme 2016 est pair, 2016 est #b[bleu].

==
Soit $x in QP$ et $k in NN$, d'après (c) la couleur s'inverse à chaque ajout de 1. Nous avons donc par récurrence évidente :

#color-rule($
  cases(
    #r[x] + 2k &=> #r[x + 2k],
    #r[x] + 2k + 1 &=> #b[x + 2k + 1],
    #b[x] + 2k &=> #b[x + 2k],
    #b[x] + 2k + 1 &=> #r[x + 2k + 1],
  )
$)

Selon la couleur de $x$, si $n$ est pair, $x + n$ aura la même couleur que $x$ et si $n$ est impaire $x + n$ sera de couleur opposée à $x$.

==

$
  2016/2015 &= #r[1] + 1/#r[2015]   &"d'après (a) et (d)" \
            &= #r[1] + #r[$1/2015$] &"d'après (b)" \
            &= #b[$2016/2015$]      &"d'après (c)"
$

D'autre part,

$
  4/13 &= 1/(13/4)              & \
       &= 1/(#r[3] + 1/#b[4])   &"d'après (d)" \
       &= 1/(#r[3] + #b[$1/4$]) &"d'après (b)" \
       &= 1/#r[$13 / 4$]        &"d'après (e)" \
       &= #r[$4/13$]            &"d'après (b)"
$

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
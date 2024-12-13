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

// DM

= La couleur des nombres

Pour alléger la syntaxe, nous établissons les notations suivantes : #r[nombre rouge], #b[nombre bleu].

Rappelons les règles sous une forme dévelloppée avec $x in RR$ :

#color-rule[#r[1]]
#color-rule[
  $cases(
    #r[x] => #r(math.frac("1", "x")),
    #b[x] => #b(math.frac("1", "x"))
  )$
]
#color-rule[
  $cases(
    #r[x] => #b("x + 1"),
    #b[x] => #r("x + 1")
  )$
]

==

D'après (a), 1 est rouge et d'après (c), la couleur s'inverse à chaque ajout de 1. Par récurrence évidente, tous les nombres pairs sont donc bleus et tous les nombres impaires rouges.

Avec $x in RR$ et $k in NN$ nous avons donc :

#color-rule($
  cases(
    x = 2k &=> #b[x],
    x = 2k + 1 &=> #r[x]
  )
$)

Comme 2016 est pair, #b[2016] est bleu.

==


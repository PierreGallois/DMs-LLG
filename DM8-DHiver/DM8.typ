#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 8,
  titre: [D'Hiver],
  sections: [Exercice],
  alpha: false
)
#let folder-name = "DM8-DHiver"

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
  let sortie = (nombres.at(0),)
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

Notons $x rel y$ la relation d'équivalence sur $QP$ : "$x$ et $y$ sont de même couleur"#footnote[Bien que $rel$ soit une relation d'équivalence, ce n'est pas une relation de congruence sur l'addition, i.e on n'a pas que si $a rel b$ et $c rel d$ alors $a + c rel b + d$ : par exemple, $2 rel 1/2$ mais $2 + 2 = #b[4] notrel 1/2 + 1/2 rel #r[1]$. On utilisera donc $rel$ avec attention et uniquement pour simplifier les notations.]. Les propriétés d'équivalence sont évidentes. On colore enfin en #b[bleu] les nombres bleus et en #r[rouge] les nombres rouges.

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
  &rel x + 1 #h(1.25cm) "car" n-1 "est pair"\
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
Ces deux règles sont fausses. 

La première est fausse car $1/3 rel #r[3]$ est rouge et $2/3 rel 1 + 1/2 notrel #b[$1/2$]$ est rouge, mais $#r[$1/3$] + #r[$2/3$] rel #r[1]$.

La seconde est fausse avec l'interprétation de la couleur sur les entiers : si un entier pair est bleu, alors la somme de deux entiers pairs est aussi paire et donc bleue : $#b[2] + #b[2] rel #b[4]$.
==
On peut faire les calculs suivants :
$ 235/68 & rel 3 + 1/(2+1/(5+1/6)) \
& notrel 2 + 1/(5+1/6) \
& notrel 5 + 1/6 \
& rel #b[6] $

Donc $#b[$235/68$]$ est bleu.
==
Prenons une fraction $a/b$. On peut toujours écrire $b$ sous la forme $b' + n a$ avec $n in NN$. Alors on a :
$ a/b rel a/(b'+n a) rel (b' + n a)/a rel n + b'/a $
On est donc amené à répéter l'algorithme avec $b'/a$, c'est à dire calculer le quotient et le reste de la division euclidienne de $a$ par $b'$, jusqu'à ce que la fraction obtenue soit un entier, dans quel cas on peut facilement déterminer la couleur de la fraction initiale avec la parité de la somme des quotients.

Autrement dit, on peut déterminer la couleur d'une fraction $a/b$ en calculant la couleur de la somme des quotients donnés par l'algorithme d'Euclide pour calculer le pgcd de $a$ et $b$ (cela permet également d'assurer que l'algorithme se termine). C'est ce que fait l'algorithme en python ci-dessous :

#code-from-file(folder-name, "/code/couleur.py")

Quand éxécuté avec $a=235, b=68$, l'algorithme renvoie que $#couleur(235, 68)$, comme escompté.
==
Après implémentation de l'algorithme en typst et en python, celui-ci donne :
$
 #couleur(1515, 1789)
$

= Intercaler la somme

==
$E_4 = #pretty_pascal(4)$

$E_5 = #pretty_pascal(5)$


(bien entendu généré automatiquement, le script est dans le DM sur Github)

==
Les réponses suivantes sont calculées automatiquement :
#let E_11 = pascal(11)

===
$E_11$ contient #E_11.len() éléments.

===
La somme des éléments de $E_11$ est #E_11.sum().

===
Le plus grand élément de $E_11$ est #E_11.reduce((a, b) => {if a < b {b} else {a}}).

==
===
Notons pour $n in NN^*$, $u_n = N_n - 1$. Les premiers termes de la suite $(u_n)_(n in NN^*)$ sont :
$ u_1 = 1 #h(1cm) u_2 = 2 #h(1cm) u_3 = 4 #h(1cm) u_4 = 8 $

On conjecture que pour tout $n in NN^*, u_n = 2^(n-1)$.

*Preuve :* Notons $E'_n$ la liste $E_n$ dans laquelle on omet le dernier 1, et on considère $u_n$ comme le nombre d'éléments de $E'_n$.
Pour construire $E'_(n+1)$ à partir de $E'_n$, on rajoute un nombre à droite de chaque élément de $E'_n$. On a donc :
$ |E'_(n+1)| = |E'_n| + |E'_n| \
<==> u_(n+1) = 2u_n $

Par une récurrence immédiate, on a bien $u_n = 2^(n-1)$. Donc le nombre d'éléments de $E_n$ est $N_n = 2^(n-1) + 1$.

===
Notons pour $n in NN^*$, $S_n$ la somme des éléments de $E_n$ et $v_n = S_n - 1$ que l'on interprète comme la somme des éléments de $E'_n$. Les premiers termes de la suite $(v_n)_(n in NN^*)$ sont :
$ v_1 = 1 #h(1cm) v_2 = 3 #h(1cm) v_3 = 9 #h(1cm) v_4 = 27 $

On conjecture que $v_n = 3^(n-1)$ pour tout $n in NN^*$.

*Preuve :* Notons $x_i$ pour $1 <= i <= N_n$ le $i$-ème élément de la liste $E_n$. $E'_(n+1)$ est composé d'une copie de la liste $E'_n$, ainsi que des sommes d'éléments consécutifs de $E_n$. On a donc :
$ v_(n+1) &= v_n + sum_(i=1)^(N_n - 1) (x_i + x_(i+1)) \
&= v_n + sum_(i=1)^(N_n -1) x_i + sum_(i=2)^(N_n) x_i \
&= v_n + 2 sum_(i=1)^(N_n-1) x_i#h(1cm) #text[car $x_1$ = $x_(N_n)$] \
&= 3v_n $

Par récurrence immédiate, $v_n = 3^(n-1)$ et la somme des éléments de $E_n$ est donc $3^(n-1) + 1$ pour tout $n in NN^*$.

= Mon beau sapin !


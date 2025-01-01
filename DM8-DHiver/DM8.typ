#import "./../templates/homework.typ": dm, code-from-file
#import "figures.typ": sapin, sapin-exemple, base-exemple, sapin-transformation, base-triangles, simple-triangle, limite-surface1, limite-surface2

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

== Division des sapins en formes plus simples

Comme les données de l'exercice sont des schémas, nous continuons pour le moment de raisonner avec des schémas.

On nomme "Sapin $n$" la figure de chaque étape $n in NN^*$. Par exemple :

#sapin-exemple(1)

On nomme "Base $n$" avec $n in NN^*$ les figures suivantes :

#base-exemple(1)

Sapin 1 et Base 1 sont identiques.

On remarque que la forme complexe de chaque Sapin peut être transformé en deux formes plus simples, qui sont des figures Bases, sans que la surface bleue foncée ne change de taille :

#sapin-transformation(3)

== Aire bleue de $B_n$

Tentons maintenant de déterminer l'aire bleue foncée $A_n$ de toute Base $n$.

$A_0 = 0$ cela correspond à la situation où il n'y a pas de triangle, donc l'aire est nulle.

$A_1$ est fixé.

Toute Base est composée de triangles de différentes tailles :
#figure(
  base-triangles(5),
  caption: $B_4$,
  numbering: none
)

On nomme $T_1$ le triangle bleu, $T_2$ le triangle vert, $T_3$ le triangle rouge et ainsi de suite.
Soit $n in NN^*$. On note $A_T_n$, l'aire d'un triangle $T_n$.

On remarque que $A_T_1 = A_1$.

Dû à la disposition des triangles équilatéraux, il est clair que $A_T_(n+1) = A_T_n / 4$, donc par récurrence immédiate, $A_T_n = 4^(-(n-1)) A_T_1 = 4^(-(n-1)) A_1$

#base-exemple(1)

On remarque qu'à chaque fois des triangles bleus sont rajoutés mais aucun n'est supprimé. Donc  on peut exprimer l'aire d'une Base $B_n$ en fonction des précédentes :

$
  A_(n+1) = A_n + k_(n+1)
$

Avec $k_(n+1) in RR_+$ qui représente l'aire totale des petits triangles $T_n$ ajoutés à cette étape.

On recherche maintenant combien de triangles $T_n$ sont rajoutés lors d'une étape $n$. On remarque que lors d'une étape, chaque triangle $T_(n-1)$ existant rajoute $3$ triangles $T_n$, un sur chacun de ses côtés. On a donc pour $n in NN^*$ et $n >= 2$ :
$
  N_T_n = 3 N_T_(n-1)
$
Lorsque $n = 1$, il n'y a qu'un seul triangle donc $N_T_1 = 1$.
Par récurrence immédiate on a pour $n in NN^*$ :
$
  N_T_n = 3^(n-1)
$

Donc comme $k_(n+1) = N_T_(n+1) times A_T_(n+1)$,

$
  A_(n+1) &= A_n + 3^n times 4^(-n) A_1 \
  A_(n+1) &= A_n + (3/4)^n A_1 \
  A_n &= A_1 sum^(n-1)_(k=0) (3/4)^k
$

On rappelle l'identité géométrique :
Soit $a in RR without {1}$ et $n in NN$.
$
  sum^n_(k=0) a^k = (a^(n+1) - 1) / (a - 1)
$

Par identification :

$
  A_n &= A_1 sum^(n-1)_(k=0) (3/4)^k \
  A_n &= A_1 ((3/4)^n - 1) / (3/4 - 1) \
  A_n &= A_1 ((4^n - 3^n)/(4^(n-1)))
$

== Aire des sapins.

On note $A_S_n$ l'aire des petits triangles bleus d'un sapin $S_n$, pour $n in NN^*$.

On remarque que $A_S_1 = A_1$.

Comme nous l'avons vu, un sapin peut être divisié de telle manière que,

$
  A_S_n &= A_n + A_(n - 1) \
  A_S_n &= A_1 (sum^(n-1)_(k=0) (3/4)^k + sum^(n-2)_(k=0) (3/4)^k) \
  A_S_n &= A_1 (2 sum^(n-2)_(k=0) (3/4)^k + (3/4)^(n-1)) \
  A_S_n &= A_1 (2 ((3/4)^(n-1) - 1)/(3/4 - 1) + (3/4)^(n-1)) \
  A_S_n &= A_1 (8 - 7 (3/4)^(n-1))
$

== Application numérique

#simple-triangle(3)

On donne le côté $c = 10$ cm du triangle _clair_. On note $A_1$ l'aire du triangle _foncé_ et $A_c$ l'aire du triangle _clair_.
$
  A_1 &= 1/4 A_c \
  A_1 &= 1/4 times sqrt(3)/4 c^2 \
  A_1 &= sqrt(3)/16 c^2 
$
On a donc :

$
  A_S_n &= sqrt(3)/16 (8 - 7 (3/4)^(n-1)) c^2 \
  A_(S 10)_n &= sqrt(3)/16 (8 - 7 (3/4)^(n-1)) 10^2 
$

== Limite. 

Lorsque $n$ tend vers $+oo$, $a^n$ tend vers $0$ si $abs(a) < 1$ avec $a in RR$.

Donc $(3/4)^(n-1)$ tend vers $0$ quand $n$ tend vers $+oo$.

Donc l'aire tend vers
$
  sqrt(3)/16 times 8 times c^2 = sqrt(3)/2 c times c
$
Or, $sqrt(3)/2 c$ est la hauteur d'un triangle équilatéral de base $c$.

La surface tend donc vers le rectangle suivant :

#align(
  center,
  table(
    columns: 3,
    column-gutter: 15pt,
    stroke: none,
    align: bottom,
    limite-surface1(4),
    limite-surface2(4, 4),
    limite-surface2(4, 6)
  )
)
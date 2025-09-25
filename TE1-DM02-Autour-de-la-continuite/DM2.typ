#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 2,
  titre: [
    Autour de la continuité],
  sections: [Partie],
  alpha: false
)

#let folder-name = "TE1-DM01-Fonctions-Contractantes-Dilatantes-et-Points-Fixes/"
#let rond = sym.compose

= Bornitude et continuité

==
Soient $f:RR --> RR$ continue et $g:RR --> RR$ bornée. Il existe ainsi $m, M in RR$ tels que pour tout $x in RR$, $m <= g(x) <= M$.

D'une part, $f(x) in RR$ donc puisque $g$ est bornée, $m <= g(f(x)) <= M$ i.e. $g rond f$ est bornée.

D'autre part, pour tout $x in RR$, $g(x) in [m, M]$. $f$ est continue donc d'après le TVI, l'image du segment $[m, M]$ par $f$ est aussi un segment $[m', M']$ $(m', M' in RR)$. \
Donc $f(g(x)) in [m', M']$ i.e. $f rond g$ est bornée.


= Injectivité et continuité
==
Soit $f$ une fonction strictement monotone d'un intervalle $I$ dans $RR$.
Pour tout $x$ et $y$ tel que $x < y$, soit $f(x) < f(y)$ soit $f(x) > f(y)$ donc $f(x) != f(y)$.
Il n'existe pas deux antécédants qui donnent la même image donc $f$ est injective.

Prenons la fonction :
$
  &f : RR_+ &&-> RR\
  &f : x    &&|-> cases(-1 &"si" x = 1, x &"sinon")
$

$f$ est une bijection puique $-1 in.not RR_+$ donc $f$ est injective.
Or $f(1) < f(0) < f(2)$ donc $f$ n'est pas monotone. La réciproque est fausse.

// ==
// Soit $f$ une fonction continue et injective de l'intervalle $I$ dans $RR$.
// Prenons deux antécédents de $f$, $a$ et $b$ dans $I$ tel que $a < b$.

// Comme $f$ est injective, deux antécédents ne peuvent pas avoir la même image donc $f(a) != f(b)$. $f$ ne peut pas avoir de palier.

// Prenons $c$ un autre antécédant de $f$ différent de $a$ et $b$.
// - Si $a < c < b$, alors par le théorème des valeurs intermédiaires, $f(a) <= f(c) <= f(b)$ et comme $f$ n'admet pas de palier, $f(a) < f(c) < f(b)$.
// - Si $a < b < c$ ou $c < a < b$, alors $f(c)$ a trois options. Soit $f(c)$ 


#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 2,
  titre: [
    Autour de la continuité],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM02-Autour-de-la-continuite/"
#let rond = sym.compose

= Problème unique.

#sous-partie[Partie A - Bornitude et continuité.]

==
Soient $f:RR --> RR$ continue et $g:RR --> RR$ bornée. Il existe ainsi $m, M in RR$ tels que pour tout $x in RR$, $m <= g(x) <= M$.

D'une part, $f(x) in RR$ donc puisque $g$ est bornée, $m <= g(f(x)) <= M$ i.e. $g rond f$ est bornée.

D'autre part, pour tout $x in RR$, $g(x) in [m, M]$. $f$ est continue donc d'après le TVI, l'image du segment $[m, M]$ par $f$ est aussi un segment $[m', M']$ $(m', M' in RR)$. \
Donc $f(g(x)) in [m', M']$ i.e. $f rond g$ est bornée.#import "./../templates/homework.typ": dm, sous-partie

#sous-partie[Partie B - Injectivité et continuité]
#counter(heading).update(1)



#sous-partie[Partie C - Surjectivité et continuité]
#counter(heading).update(1)

==
Soit $f: RR^+ ->> RR$ et montrons par l'absurde que tout $k in RR$ a une infinité d'antécédants. Posons $g(x) = f(x) - k$ et supposons que $g$ n'ait qu'un nombre fini de racines - il y a donc une racine maximale $x_0$ parmi elles.

D'une part, $g(x) != 0$ pour $x > x_0$. Comme $g$ est continue, $g$ reste du même signe après $x_0$ : supposons sans perte de généralité que $g$ est négative sur $[x_0;+oo]$. D'autre part, d'après le théorème des bornes atteintes, $m <= g <= M$ sur $[0; x_0]$. Ainsi, pour tout $x in RR$, $g(x) <= max(0, M)$ d'où $f(x) <= max(0, M) + k$. Donc $f$ ne peut être surjective, ce qui est une contradiction.

#sous-partie[Partie D - Equation fonctionnelle]
#counter(heading).update(1)
==
===
Si $f$ est involutive, elle admet une réciproque (elle même) et est donc bijective. A fortiori, elle est donc injective. Enfin, comme $f$ est continue, par le B$.2$, elle doit être strictement monotone.

===
Supposons que $f$ est strictement croissante. Si pour $x in RR$, $f(x) < x$, alors par croissance $f(f(x)) = x < f(x)$, ce qui est une contradiction. Similairement, si $f(x) > x$, on arrive aussi à une contradiction. Donc $f(x) = x$ pour tout $x in RR$, c'est à dire $f = upright(I d)$

==
#set math.equation(numbering: (a => if a == 1 {[(#math.star.filled)] }), supplement: "")

$
  f(x^2 + f(y)) = f(x)^2 + y
$ <star>

===
====
En posant $x= 0$ dans@star, on a que pour tout $y in RR$ :
$
  f(f(y)) = (f compose f)(y) = f(0) + y
$
Donc $f compose f$ est une fonction affine, qui est donc injective. Ainsi, pour tous $a,b in RR$ :

$
  f(a) = f(b) ==>^f f(f(a)) = f(f(b)) ==>^(#text[Injectivité]) a=b
$
Ce qui montre que $f$ est également injective.

====
En posant $x = y = 0$, on trouve que $f(f(0)) = f(0)$. Par injectivité de $f$, $f(0) = 0$. Ainsi, pour tout $x in RR$, en posant $y = 0$, on a :
$
  f(x^2) = f(x)^2
$
Ainsi, on trouve en substituant $-x$ pour $x$ :
$
  f(-x)^2 = f((-x)^2) = f(x^2) = f(x)^2
$
Donc $f(-x) in {f(x), -f(x)}$

Enfin, pour tout $x in RR^*$, $-x != x$ d'ou par injectivité de $f$ que $f(-x) != f(x)$. Comme $f(-0) = 0 = -f(0)$ et que pour tout $x in RR^*$, on doit avoir $f(-x) = -f(x)$, $f$ est impaire.

====
Comme $f(0) = 0$, en réutilisant l'expression précédente, on trouve que pour tout $y in RR$, $f(f(y)) = y$, c'est à dire $f compose f = upright(I d)$.

De plus, comme $f$ est continue et injective, on sait que $f$ est strictement monotone. Par l'absurde, supposons que $f$ est strictement décroissante. Alors $f(-2) > f(-1) > f(0) = 0$. Comme $x |-> x^2$ est strictement croissante sur $RR^+$, $f(-2)^2 = f(4) > f(-1)^2 = f(1)$, ce qui est une contradiction. Donc $f$ est strictement croissante.

====
En appliquant le $1)$, on en déduit que $f = upright(I d)$

===
Une solution est égale à l'identité, et on vérifie facilement que l'identité est solution de $(#math.star.filled)$. Donc $S = {upright(I d)}$.
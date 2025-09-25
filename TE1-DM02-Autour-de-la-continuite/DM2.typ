#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 2,
  titre: [
    Autour de la continuité],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM02-Autour-de-la-continuite/"
#let rond = sym.compose

= Bornitude et continuité

==
Soient $f:RR --> RR$ continue et $g:RR --> RR$ bornée. Il existe ainsi $m, M in RR$ tels que pour tout $x in RR$, $m <= g(x) <= M$.

D'une part, $f(x) in RR$ donc puisque $g$ est bornée, $m <= g(f(x)) <= M$ i.e. $g rond f$ est bornée.

D'autre part, pour tout $x in RR$, $g(x) in [m, M]$. $f$ est continue donc d'après le TVI, l'image du segment $[m, M]$ par $f$ est aussi un segment $[m', M']$ $(m', M' in RR)$. \
Donc $f(g(x)) in [m', M']$ i.e. $f rond g$ est bornée.

#pagebreak()
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

==
Raisonnons par l'absurde. On suppose que $f$ n'est pas strictement monotone ie $f$ n'est pas strictement croissante et $f$ n'est pas strictement décroissante.
Cela revient à l'existence des antécédants suivants :
#footnote[A partir de ce point, nous pourrions juste réaliser 9 disjonctions de cas en fonction de la position des antécédants et des images pour prouver par le TVI que la fonction ne peut pas être injective.]
$
  &&(1)& &&exists x, y &&in I, &&x &&< y &&"et" &&f(x) &&>= f(y) \
  &&(2)& quad &&exists x', y' &&in I, &&x' &&< y' &&"et" &&f(x') &&<= f(y')
$

On peut considérer les intervalles, compris dans l'ensemble image de $f$, définis par 
$
  &I_("dim") &&= [f(y), f(x)] \
  &I_("aug") &&= [f(x'), f(y')]
$
On remarquera que les bornes de ces intervalles sont dans l'ordre correct grâce aux relations $(1)$ et $(2)$.
Comme $f$ est continue, nous avons la garantie par le théorème des valeurs intermédiaires qu'il existe des antécédants par $f$ pour toutes les valeurs de ces intervalles.

- Si ces deux intervalles possèdent une intersection non vide (typiquement lorsque la fonction est constante sur un intervalle), alors il existe nécessairement par le TVI au moins deux antécédants pour les images dans cette intersection, un dans $[x, y]$ et un dans $[x', y']$. $f$ n'est donc pas injective.
- Considérons le cas où ces deux intervalles sont disjoints (suivre avec l'illustration ci-dessous).
On remarque d'après $(1)$ que comme $x < y$, la fonction atteint d'abord $f(x)$ puis décroit pour atteindre $f(y)$ puisque $f(x) >= f(y)$. Les valeurs de $I_("dim")$ sont donc atteintes du haut vers le bas.
De manière similaire, d'après $(2)$ comme $x' < y'$, la fonction atteint d'abord $f(x')$ puis croit pour atteindre $f(y')$ puisque $f(x') <= f(y')$. Les valeurs de $I_("aug")$ sont donc atteintes du bas vers le haut.

$I_("dim")$ et $I_("aug")$ sont disjoints implique que $[x, y]$ et $[x', y']$ sont également disjoints sinon un même antécédant donnerait deux images différentes. Cela veut dire que comme $f$ est continue il existe un intervalle d'antécédants $A_("trou")$ ($[y, x']$ ou $[y', x]$) dont les images $I_("trou")$ remplissent le trou entre $I_("dim")$ et $I_("aug")$.

Comme les intervalles $I_("dim")$ et $I_("aug")$ sont remplis dans des "sens" différents et que $f$ ne peut pas faire de sauts, $f$ doit forcément repasser sur une zone d'images qu'elle a déjà couverte avec $I_("dim")$ ou $I_("aug")$. Autrement dit $I_("dim") subset.eq I_("trou")$ ou $I_("aug") subset.eq I_("trou")$. Il existe donc deux antécédants pour les images dans $I_("trou")$, un dans $I_("dim")$ ou $I_("aug")$ et un dans $A_("trou")$. $f$ n'est pas injective.

Dans les deux cas nous arrivons à la contradiction que $f$ n'est pas injective. Nous avons donc prouvé par l'absurde que si $f$ est continue et injective, alors $f$ est strictement croissante.

_Illustration_ :

#v(2em)
#align(center,
curve(
  stroke: blue,
  curve.cubic((70pt, 220pt), (180pt, -44pt), (280pt, 128pt)),
))

#v(5em)

= Surjectivité et continuité

==
Soit $f: RR^+ ->> RR$ et montrons par l'absurde que tout $k in RR$ a une infinité d'antécédants. Posons $g(x) = f(x) - k$ et supposons que $g$ n'ait qu'un nombre fini de racines - il y a donc une racine maximale $x_0$ parmi elles.

D'une part, $g(x) != 0$ pour $x > x_0$. Comme $g$ est continue, $g$ reste du même signe après $x_0$ : supposons sans perte de généralité que $g$ est négative sur $[x_0;+oo]$. D'autre part, d'après le théorème des bornes atteintes, $m <= g <= M$ sur $[0; x_0]$. Ainsi, pour tout $x in RR$, $g(x) <= max(0, M)$ d'où $f(x) <= max(0, M) + k$. Donc $f$ ne peut être surjective, ce qui est une contradiction.

==
Supposons que $f: [a;b] -> [f(a);f(b)]$ soit croissante et surjective, mais pas continue sur $[a;b]$.
Soit $z in [a;b]$.

Comme $f$ est croissante, par le théorème de la limite monotone, on a l'existence des limites de $f$ à gauche et à droite en $z$. De plus,
$
  ell_g = lim_(x->z^-) f(x) <= f(z) <= lim_(x->x^+)f(x) = ell_d
$
(Pour $z = a$ ou $b$, l'une de ces limites est juste $f(z)$). Supposons que l'une de ces inégalités soit stricte.

Si $lim_(x -> z^-) f(x) != f(z)$, par la remarque précédente, $z != a$. D'une part, si $x in [z;b]$, par croissance, $f(x) in.not ]ell_g, f(z)[$. D'autre part, pour tout $x in [a;z[$ :
$
  f(a) <= f(x) <= ell_g < f(z)
$
Donc $f(x) in.not ]ell_g;f(z)[$. Ainsi, $f$ n'atteint pas les valeurs de $]ell_g;f(z)[ subset [a;b]$, ce qui est une contradiction. Donc $ell_g = f(z)$

On procède similairement pour $ell_d = f(z)$.

= Equation fonctionnelle
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

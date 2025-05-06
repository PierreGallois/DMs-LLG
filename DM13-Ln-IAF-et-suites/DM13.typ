#import "./../templates/homework.typ": dm, sous-partie
#import "@preview/cetz:0.3.4":
#import "@preview/vartable:0.2.0": tabvar

#show: dm.with(
  numero: 13,
  titre: [
    Ln, IAF et suites],
  sections: [Problème],
  alpha: false
)

#let folder-name = "DM13-Ln-IAF-et-suites/"

= Fonction logarithme népérien
==
==
==
==
==
===

===

===

= Inégalité des accroissements finis et suites
#sous-partie[*Partie A*]
==
Supposons être dans les conditions de l'énoncé. Posons :
$ g(x) = f(x) - f(a) - M(x-a) \
h(x) = f(x) - f(a) - m(x-a) $

Alors, d'une part, $g(a) = h(a) = 0$. De plus, ces deux fonctions sont dérivables sur $]a;b[$ par sommes de fonctions dérivables et pour tout $x in ]a;b[$ :
$ g'(x) = f'(x) - M <= 0 #text[par hypothèse] $

Ainsi que :
$ h'(x) = f'(x) - m >= 0 #text[par hypothèse] $

Donc $g$ est décroissante sur $]a;b[$. Comme elle est continue sur $[a;b]$, on peut conclure que, comme $b >= a$, $g(b) <= g(a) = 0$, d'où :
$ f(b) - f(a) <= M(b-a) $

Similairement, $h$ est croissante sur $]a;b[$ et $h(b) >= h(a) = 0$, d'où :
$ m(b-a) <= f(b) - f(a) $
Ce qu'il fallait démontrer.


#sous-partie[*Partie B*]
#counter(heading).update(1)

On définit sur $RR_*$ :
$ phi(x) = 1/2(x+ 5/x) $

==
$phi$ est impaire : soit $x in RR_*$. Alors $-x in RR_*$ et :
$ phi(-x) &= 1/2(-x - 5/x) = -1/2(x + 5/x)\
&= -phi(x) $
==
// TODO: Mettre sur deux colonnes ? 
- Quand $x -> +oo$ : $5/x -> 0$ et par somme : $ lim_(x -> +oo) phi(x) = +oo $
- Quand $x -> -oo$ : $5/x -> 0$ et par somme : $ lim_(x -> -oo) phi(x) = -oo $

- Quand $x -> 0^-$ : $5/x -> -oo$ et par somme : $ lim_(x -> 0^-) phi(x) = -oo $
- Quand $x -> 0^+$ : $5/x -> +oo$ et par somme : $ lim_(x -> 0^+) phi(x) = +oo $
==
$phi$ est dérivable sur son intervalle de définition comme somme de deux fonctions dérivables sur $RR_*$. Sa dérivée est pour tout $x in RR_*$ :

$ phi'(x) = 1/2 - 5 / (2x^2) $
Ainsi, $phi'(x) <= 0$ si et seulement si :
$ 1/2 &<= 5 / (2x^2) \
<==> x^2 &<= 5 \
<==> x &in [-sqrt(5);sqrt(5)] inter RR_* $

On a donc le tableau de variations suivant :

// TODO: ajuster la taille
#tabvar(
  init: (
    variable: $x$,
    label: (
      ([Signe de $phi'(x)$], "Sign"),
      ([Variations de $phi$], "Variation"),
    ),
  ),
  domain: ($-oo$, $ -sqrt(5) $, $ 0 $, $ sqrt(5) $, $ +oo $),
  contents: (
    ($+$, $-$, ("||", $-$), $+$),
    (
      (bottom, $-oo$),
      (center, $-sqrt(5)$),
      (bottom, top, "||", $-oo$, $+oo$),
      (center, $sqrt(5)$),
      (top, $+oo$),
    ),
  ),
)

==
TODO: Thomas ? dis moi si tu ne veux pas le faire :3
==
Soit $x in RR_*$ :
$ phi(x) - x &= x/2 + 5/2x - x \
&= - x / 2 + 5/2x \
&= (5-x^2) / (2x) $
Ce qu'il fallait démontrer.
==
Soit $x in [sqrt(5); 5/2]$. Alors $x >= sqrt(5)$, et par le 3), $phi'(x) >= 0$. De plus :
$ phi'(x) &<= 1/10 \
<==> 1/2 - 1/10 &<= 5/(2x^2) \
<==> 4/5 &<= 5/(x^2) \
<==> x^2 &<= 25 / 4 \
<==> x &<= 5/2 #text[car $x >= sqrt(5) >= 0$.] $
Donc $0 <= phi'(x) <= 1/10$ sur $[sqrt(5);5/2]$.

#sous-partie[*Partie C*]
#counter(heading).update(1)
==
==
==
===

===

==
==
#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 13,
  titre: [
    Ln, IAF et suites],
  sections: [Problème],
  alpha: false
)

// #let folder-name = "DM13-Ln-IAF-et-suites"

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

On définit sur $RR_*$ :
$ phi(x) = 1/2(x+ 5/x) $

==
$phi$ est paire : soit $x in RR_*$. Alors $-x in RR_*$ et :
$ phi(-x) &= 1/2(-x - 5/x) = -1/2(x + 5/x)\
&= phi(x) $
==
// TODO: Mettre sur deux colonnes ? 
- Quand $x -> +oo$ : $5/x -> 0$ et par somme : $ lim_(x -> +oo) phi(x) = +oo $
- Quand $x -> -oo$ : $5/x -> 0$ et par somme : $ lim_(x -> -oo) phi(x) = -oo $

- Quand $x -> 0^-$ : $5/x -> -oo$ et par somme : $ lim_(x -> 0^-) phi(x) = -oo $
- Quand $x -> 0^+$ : $5/x -> +oo$ et par somme : $ lim_(x -> 0^+) phi(x) = +oo $

==
TODO: Thomas ? dis moi si tu ne veux pas le faire :3
==
==

#sous-partie[*Partie C*]
#counter(heading).update(1)
==
==
==
===

===

==
==
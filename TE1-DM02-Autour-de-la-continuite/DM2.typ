#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 2,
  titre: [
    Autour de la continuité],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM01-Fonctions-Contractantes-Dilatantes-et-Points-Fixes/"
#let rond = sym.compose

= Problème unique.

#sous-partie[Partie A - Bornitude et continuité.]

==
Soient $f:RR --> RR$ continue et $g:RR --> RR$ bornée. Il existe ainsi $m, M in RR$ tels que pour tout $x in RR$, $m <= g(x) <= M$.

D'une part, $f(x) in RR$ donc puisque $g$ est bornée, $m <= g(f(x)) <= M$ i.e. $g rond f$ est bornée.

D'autre part, pour tout $x in RR$, $g(x) in [m, M]$. $f$ est continue donc d'après le TVI, l'image du segment $[m, M]$ par $f$ est aussi un segment $[m', M']$ $(m', M' in RR)$. \
Donc $f(g(x)) in [m', M']$ i.e. $f rond g$ est bornée.
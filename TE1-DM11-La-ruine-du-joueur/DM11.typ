#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 11,
  titre: [La ruine du joueur],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM11-La-ruine-du-joueur/"

= Étude d'une suite récurrente.

Soient $b, c in NN^*$, et $p in ]0, 1[$. On pose $q = 1 - p$.

$(u_n)_(n in NN)$ est définie par : $forall n in NN, u_n = p u_(n+1) + q u_(n-1)$, avec $u_0, u_(b+c) in RR$.

==
Soit $n in NN^*.$
$
  u_n = p u_(n+1) + q u_(n-1) &<==> (p+q) u_n = p u_(n+1) + q u_(n-1) \
  &<==> q u_n - q u_(n-1) = p u_(n+1) - p u_n \
  &<==> p (u_(n+1) - u_n) = q (u_n - u_(n-1)).
$

==
Avec $p = q = 1/2$, l'égalité précédente devient pour tout $n in NN^*$,
$
  1/2 (u_(n+1) - u_n) = 1/2 (u_n - u_(n-1)) <==> u_(n+1) - u_n = u_n - u_(n-1).
$
Soit pour tout $n in NN$, $u_(n+2) - u_(n+1) = u_(n+1) - u_n$.

Par récurrence immédiate, on en déduit que pour tout $n in NN, u_(n+1) - u_n = r$ où r est une constante réelle. La suite $(u_n)_(n in NN)$ est donc arithmétique de raison $r$.

Par conséquent,
$
  u_(b+c) = u_0 + (b+c) r "i.e." r = (u_(b+c) - u_0)/(b+c).
$

On peut donc écrire :
$
  forall n in NN, u_n = u_0 + n (u_(b+c) - u_0)/(b+c).
$ 

==

= Ruine de Bob.

==

==

===

===

===

==

==

= Temps d'attente de la ruine de Bob.

==

===

===

==

===

===

===

===


_Les jeux d'argent et de hasard peuvent être dangereux : pertes d'argent, conflits familiaux, addiction... Retrouvez des conseils sur joueurs-info-service.fr (09 74 75 13 13 - Appel non surtaxé)._
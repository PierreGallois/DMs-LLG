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
On représente une partie par une suite de gains, de pertes ou rien si la partie s'est terminée. Autrement dit, une partie est une suite $(u_n) in {0, plus.minus 1}^(NN^*)$ représentant les gains algébriques de Bob au cours des parties. Ces suites doivent respecter les conditions suivantes :

- Ni Bob, ni la banque ne peuvent être dans le négatif. Autrement dit, pour tout $n in NN^*$,
$
  -b <= sum_(k=0)^n u_k <= c
$

- On joue jusqu'à la ruine, c'est à dire que s'il existe $n in NN^*$ tel que :
$
  sum_(k=0)^n u_k = -b " ou " sum_(k=0)^n u_k = c
$
Alors $u_k != 0$ pour tout $k <= n$ et $u_k = 0$ pour tout $k > n$.


On note $Omega$ l'univers (infini) des déroulements possibles de partie.

On définit maintenant une tribu $cal(T)$ sur $Omega$ comme étant la tribu générée par les évènements élémentaires suivants : pour tout $n in NN^*$ et tout $n$-uplet $(x_1, dots, x_n) in {plus.minus 1}^n$ :
$
  cal(E)((x_1, dots, x_n)) = {(u_n) in {0, plus.minus 1}^(NN^*) | forall i in [|1;n|], u_i = x_i}
$
On définit alors la loi de probabilité $PP$ sur $(Omega, cal(T))$ par :
$
  PP(cal(E)((x_1, dots, x_n))) = 1/2^n
$
Ainsi que les évènements $B_k$ de la manière suivante.
$
  Sigma_k = {}
$

==

===

===

===

==

==

= Temps d'attente de la ruine de Bob.
J'ai perduuu

==
Supposons que $p = q=1/2$.

===

Soit $alpha in RR$.

Pour tout $k >= 1$, la variable $Y_k = X_k + alpha k²$ vérifie $EE (Y_k) = 1/2 EE (Y_(k+1)) + 1/2 EE (Y_(k-1))$ si et seulement si par linéarité de l'espérance :

$
EE (X_k) + alpha k² = 1/2 EE (X_(k-1)) + 1/2 alpha (k-1)² + 1/2 EE (X_(k+1)) + 1/2 alpha (k+1)²
$
Or $EE (X_k) = 1 + q EE (X_(k-1)) + p EE (X_(k+1)) = 1 + 1/2 EE (X_(k-1)) + 1/2 EE (X_(k+1))$, donc on peut écrire :
$
  1 + alpha k² = 1/2 alpha (k-1)² + 1/2 alpha (k+1)² <==>  alpha = 1
$

===

D'après la partie A - 2), lorsque $p = q = 1/2$, la suite $(EE (Y_n))_(n in NN)$ est arithmétique et pour tout $b in NN^*$, 
$
  EE (Y_b) = EE (Y_0) + b (EE (Y_(b+c)) - EE (Y_0))/(b + c) = EE (X_0) + 0² + b (EE (X_(b+c)) + (b+c)² - EE (X_0) - 0²) / (b + c)
$
Soit :
$
  EE (X_b) = EE (Y_b) - b² = b(b+c) - b² = b c
$

==
Supposons que $p != q$ et posons $x = q/p$.

===

Soit $beta in RR$.

Pour tout $k >= 1$, la variable $Z_k = X_k + beta k$ vérifie $EE (Z_k) = p EE (Z_(k+1)) + q EE (Z_(k-1))$ si et seulement si, par linéarité de l'espérance :

$
  EE (X_k) + beta k = p EE (X_(k+1)) + q EE (X_(k-1)) + p beta (K+1) + q beta (k-1)
$

Or $EE (X_k) = p EE (X_(k+1)) + q EE (X_(k-1))$, d'où :

$
  EE (X_k) + beta k = EE (X_k) - 1 + beta (p k + q k + p - q)
$
Soit, puisque $p k + q k = k(p+q) = k(p + 1 - p) = k$, il vient :

$
  beta (p - q) = 1 <==> beta = 1 / (p - q) = 1 / (2p -1)
$

===

D'après la partie A - 3), la suite $(EE (Z_n))_(n in NN)$ vérifie, pour tout $n in NN^*$ : 

$
  EE (Z_n) = EE (Z_0) +  (EE (Z_(b+C)) - EE (Z_0)) (1 - x^n) / (1 - x^(b+c))
$

On en déduit :
$
EE (Z_n) = beta (b+c)(1 - x^n) / (1 - x^(b+c))
$ 

Soit :
$
  EE (X_b) = 1/(p - q) (x^b - 1) / (x^(b+c) - 1) (b + c) - 1/(p-q) b = 1/(p-q) (((x^b-1)(b+c))/ (x^(b+c) - 1) - b)
$
===

===


_Les jeux d'argent et de hasard peuvent être dangereux : pertes d'argent, conflits familiaux, addiction... Retrouvez des conseils sur joueurs-info-service.fr (09 74 75 13 13 - Appel non surtaxé)._
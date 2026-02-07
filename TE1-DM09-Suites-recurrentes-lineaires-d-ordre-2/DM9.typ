#import "./../templates/homework.typ": dm
#import "@preview/cetz:0.4.2"

#show: dm.with(
  numero: 9,
  titre: [Suites récurrentes linéaires d'ordre 2],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM09-Suites-recurrentes-lineaires-d-ordre-2/"


= Bac 1974

Soient $a, b in RR^*.$ On définit la suite $(u_n)_(n in NN)$ par :
$
  cases(u_0 comma u_1 in RR, forall n in NN comma u_(n+2) = a u_(n+1) + b u_n)
$

Soit $Delta$ le discriminant de l'équation caractéristique $x^2 - a x - b = 0$ d'inconnue $x in RR$.

==
$
  u_2 &= a u_1 + b u_0 \
  u_3 &= a u_2 + b u_1 = a (a u_1 + b u_0)  + b u_1 = (a^2 + b) u_1 + b u_0 \
  u_4 &= a u_3 + b u_2 = a ((a^2 + b) u_1 + b u_0) + b (a u_1 + b u_0) = (a^3 + 2 a b) u_1 + (a b + b^2) u_0 \
  u_5 &= a u_4 + b u_3 = (a^4 + 2 a^2 b) u_1 + (a^2 b + a b^2) u_0 + (a^2 b + b^2) u_1 + b^2 u_0 \
  &= (a^4 + 3 a^2 b + b^2) u_1 + (a^2 b + a b^2 + b^2) u_0 \
  u_6 &= a u_5 + b u_4 = (a^5 + 3 a^3 b + a b^2) u_1 + (a^3 b + a^2 b^2 + a b^2) u_0 + (a^3 b + 2 a b^2) u_1 + (a b^2 + b^3) u_0 \
  &= (a^5 + 4 a^3 b + 3 a b^2) u_1 + (a^3 b + a^2 b^2 + 2 a b^2 + b^3) u_0
$

==
On suppose $Delta > 0.$ On note $alpha$ et $beta$ les solutions de l'équation caractéristique.

===
D'après les relations coefficients-racines d'un polynôme du second degré, on a :

$alpha + beta = -(-a)/1 = a$ et $alpha beta = (-b)/1 = -b$.

Ainsi, la relation $(1)$ peut se réécrire comme suit :
$
  &u_(n+2) = (alpha + beta) u_(n+1) - alpha beta u_n \
  "i.e." &u_(n+2) - alpha u_(n+1) = beta (u_(n+1) - alpha u_n).
$

===
On pose pour tout $n in NN$, $v_n = u_(n+1) - alpha u_n$ et $w_n = u_(n+1) - beta u_n$.

Soit $n in NN$. D'une part, $v_(n+1) = u_(n+2) - alpha u_(n+1)$ soit d'après la relation précédente,
$v_(n+1) = beta (u_(n+1) - alpha u_n) = beta v_n$. La suite $(v_n)_(n in NN)$ est donc géométrique de raison $beta$.

D'autre part,
$
  w_(n+1) &= u_(n+2) - beta u_(n+1) \
  &= (alpha + beta) u_(n+1) - alpha beta u_n - beta u_(n+1) \
  &= alpha u_(n+1) - alpha beta u_n \
  &= alpha w_n.
$
La suite $(w_n)_(n in NN)$ est donc géométrique de raison $alpha$.

===
Pour tout $n in NN$,
$
  v_n = v_0 beta^n = (u_1 - alpha u_0) beta^n \
  w_n = w_0 alpha^n = (u_1 - beta u_0) alpha^n
$

===
D'après la question ci-dessus et d'après les définitions respectives de $(v_n) "et" (w_n)$,
$
  u_(n+1) - alpha u_n = (u_1 - alpha u_0) beta^n \
  u_(n+1) - beta u_n = (u_1 - beta u_0) alpha^n
$
En soustrayant ces deux égalités, on obtient :
$(alpha - beta) u_n = (u_1 - beta u_0) alpha^n - (u_1 - alpha u_0) beta^n$.
Puisque $Delta > 0$, $alpha != beta$ et $alpha - beta != 0$. Ce qui permet d'écrire :
$
  u_n &= (u_1 - beta u_0)/(alpha - beta) alpha^n - (u_1 - alpha u_0)/(alpha - beta) beta^n \
  "ou encore" u_n &= A alpha^n - B beta^n \
  "avec" A = (u_1 - beta u_0)/(alpha - beta) &"et" B = (u_1 - alpha u_0)/(alpha - beta).
$

==
On suppose $Delta = 0$. On note $alpha$ la solution de l'équation caractéristique.

===
En reprenant la question 2.a. en remplaçant $beta$ par $alpha$,
dans la mesure où $alpha$ est ici une racine double, on trouve :
$u_(n+2) - alpha u_(n+1) = alpha (u_(n+1) - alpha u_n)$.

===
Posons, pour tout $n in NN$, $u_n = alpha^n s_n$.
La relation $(1)$ devient alors, pour tout $n in NN$ :
$
  alpha^(n+2) s_(n+2) - alpha alpha^(n+1) s_(n+1) &= alpha (alpha^(n+1) s_(n+1) - alpha alpha^n s_n) \
  alpha^(n+2) s_(n+2) - alpha^(n+2) s_(n+1) &= alpha^(n+2) s_(n+1) - alpha^(n+2) s_n \
  s_(n+2) - s_(n+1) &= s_(n+1) - s_n.
$
La différence entre deux termes consécutifs de $(s_n)$ demeure constatnte.
On en déduit que la suite $(s_n)$ est arithmétique ; on note $R$ sa raison.

===
La suite $(s_n)$ étant arithmétique de raison $R$ et de premier terme $s_0$, alors pour tout $n in NN$,
$
  s_n &= s_0 + n R \
  u_n / alpha^n &= u_0 / alpha^0 + n(s_1 - s_0) \
  u_n &= alpha^n (u_0 + n (u_1 / alpha - u_0))
$

Alors, en posant $A = u_0$ et $B = u_1 / alpha - u_0$, on peut écrire :
$
  forall n in NN, u_n = alpha^n (A + n B).
$

===
hæc quæstio perficienda est

==
===
Les solutions complexes $alpha, beta in CC without RR$ de l'équation caractéristique sont deux complexes conjugués.
On peut donc poser $alpha = r e^(i theta), beta = r e^(-i theta)$ avec $r in RR_+^*, theta in ]0,pi[$.

Les relations coefficients-racines étant toujours valables, la relation (1) peut toujours s'écrire, pour tout $n in NN$,
$
  u_(n+2) - alpha u_(n+1) &= beta (u_(n+1) - alpha u_n) \
  u_(n+2) - r e^(i theta) u_(n+1) &= r e^(-i theta) (u_(n+1) - r e^(i theta) u_n) \
  u_(n+2) - r e^(i theta) u_(n+1) &= r e^(-i theta) u_(n+1) - r^2 u_n \
  u_(n+2) &= (r e^(i theta) + r e^(-i theta)) u_(n+1) - r^2 u_n \
  u_(n+2) &= 2r cos(theta) u_(n+1) - r^2 u_n.
$
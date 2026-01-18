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
  u_2 = a u_1 + b u_0 \
  u_3 = a u_2 + b u_1 = a (a u_1 + b u_0)  + b u_1 = (a^2 + b) u_1 + b u_0 \
  u_4 = a u_3 + b u_2 = a ((a^2 + b) u_1 + b u_0) + b (a u_1 + b u_0) = (a^3 + 2 a b) u_1 + (a b + b^2) u_0 \
  u_5 = a u_4 + b u_3 = (a^4 + 2 a^2 b) u_1 + (a^2 b + a b^2) u_0 + (a^2 b + b^2) u_1 + b^2 u_0 \ = (a^4 + 3 a^2 b + b^2) u_1 + (a^2 b + a b^2 + b^2) u_0 \
  u_6 = a u_5 + b u_4 = (a^5 + 3 a^3 b + a b^2) u_1 + (a^3 b + a^2 b^2 + a b^2) u_0 + (a^3 b + 2 a b^2) u_1 + (a b^2 + b^3) u_0 \ = (a^5 + 4 a^3 b + 3 a b^2) u_1 + (a^3 b + a^2 b^2 + 2 a b^2 + b^3) u_0
$

==
On suppose $Delta > 0.$ On note $alpha$ et $beta$ les solutions de l'équation caractéristique.

===
D'après les relations coefficients-racines d'un polynôme du second degré, on a :

$alpha + beta = -(-a)/1 = a$ et $alpha beta = (-b)/1 = -b$.

Ainsi, la relation (1) peut se réécrire comme suit :
$
  u_(n+2) = (alpha + beta) u_(n+1) - alpha beta u_n \
  "i.e." u_(n+2) - alpha u_(n+1) = beta (u_(n+1) - alpha u_n).
$
#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 5,
  titre: [Existence de la fonction exponentielle],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM05-Existence-De-La-Fonction-Exponentielle/"

= Inégalité de Bernoulli
==
===
On calcule :
$
  (1+x/n)(1-x/((n+1)(n+x))) &= ((n+x)/n)(((n+1)(n+x) - x)/((n+1)(n+x))) \
  &= (n(n+x) + n)/(n(n+1)) \
  &= (n+x+1)/(n+1) = 1 + x/(n+1)
$

Ainsi,
$
  u_(n+1)(x) &= (1+x/(n+1))^(n+1) \
  &= (1+x/n)^(n+1)(1-x/((n+1)(n+x)))^(n+1)
$

===
Pour tout $x$ fixé, la suite $(-x/((n+1)(n+x)))_(n in NN)$ tend vers 0 par quotient, car $n+a -->^(n -> +oo) +oo$ pour tout $a in RR$.
Par définition de la convergence, il existe donc un rang $n_0$ pour lequel, avec $epsilon = 1/2$, on a pour tout $n >= n_0$ que :
$
  -1 < -1/2 < -x/((n+1)(n+x)) < 1/2
$

Similairement, $1+x/n -->^(n->+oo) 1$ et on obtient un rang $n_1$ de la même manière.
= Convergence de deux suites  

= Existence
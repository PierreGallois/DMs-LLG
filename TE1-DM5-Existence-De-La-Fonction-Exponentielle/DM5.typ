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

= Convergence de deux suites  

= Existence
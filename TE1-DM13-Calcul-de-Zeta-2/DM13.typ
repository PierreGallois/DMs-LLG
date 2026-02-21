#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 13,
  titre: [Calcul de $zeta(2)$],
  sections: [Partie],
  alpha: true
)

= Convergence de $(u_n)_(n in NN^*)$

==
Puisque pour tout $k in NN^*$, $1/k^2 > 0$, la suite définie par $u_n = sum_(k=1)^n 1/k^2$ est strictement croissante.
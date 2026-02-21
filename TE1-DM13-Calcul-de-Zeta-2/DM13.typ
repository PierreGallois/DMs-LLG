#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 13,
  titre: [Calcul de $zeta(2)$],
  sections: [Partie],
  alpha: true
)

= Convergence de $(u_n)_(n in NN^*)$

==
Puisque pour tout $k in NN^*$, $1/k^2 > 0$, la suite définie par $u_n = sum_(k=1)^n 1/k^2$ est strictement croissante. De plus, $u_1 = 1 <= v_1 = 1$ et pour tout $k >= 2$, par décroissance de la fonction inverse, $1/k(k-1) >= 1/k^2$. Ainsi, pour tout $n >= 2$ :
$
  u_n = 1 + sum_(k=2)^n 1/k^2 <= 1+sum_(k=2)^n 1/k(k-1) = v_n
$

==
La suite $(v_n)$ est convergente. En effet, pour tout $n >= 2$:
$
  v_n = 1+sum_(k=2)^n 1/(k-1) - 1/k = 1 + 1 - 1/n = 2 - 1/n
$

Donc $lim_(n-> +oo) v_n = 2$. Comme $v_n$ converge, alors elle est majorée. $(u_n)$ est donc alors également majorée, et croissante. Donc $(u_n)$ converge par le théorème de la limite monotone.
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

= Analyse de $(u_n)$

==
===
Par définition, pour tout $n in NN^*$, $C_n (0) = sum_(k=1)^n cos(0) = n$. De plus, pour tout $t in ]0;pi]$ :

$
  C_n (t) &= sum_(k=1)^n Re(e^(i k t)) = Re(sum_(k=1)^n e^(i k t)) \
&=^(e^(i t) != 1) Re(e^(i t)(e^(i n t) - 1)/(e^(i t) - 1)) \
&=^#text[Angle moitié] Re(e^(i t)(e^(i n/2 t) dot 2 sin ((n t)/2)) / (e^(i t/2) dot 2sin(t/2))) \
&= sin((n t)/2)/sin(t/2)Re(e^(i(n+1)/2 t)) \
&= (sin((n t)/2)cos((n+1)/2t))/(sin(t/2))
$

===
Pour tout $n in NN^*$, $C_n$ est une somme finie de fonctions continues sur $[0;pi]$, et est donc continue sur $[0;pi]$.

===
TODO

===
Pour tout $n in NN^*$ et $t in [O;pi]$, $D_n (t) = 1 + 2C_n (t)$. Par continuité de $C_n$ et opérations, $D_n$ est également continue sur $[0;pi]$

==
Soit $n in NN^*$. Les fonctions $t mapsto t^2/(2 pi) - t$ et $t mapsto C_n (t)$ sont de classe $C^oo$ par opérations ($cos$ est de classe $C^oo$). On peut donc calculer par intégration par parties :

TODO : $d$ droit
$
  integral_0^pi (t^2/(2pi) - t)cos(n t) d t &= [1/n (t^2/(2 pi)-t)sin(n t)]_0^pi - integral_0^pi 1/n (t/pi-1)sin(n t) d t \
  &=^(sin(k pi) = 0) - 1/n integral_0^pi (t/pi - 1)sin(n t) d t
$
Ainsi que :
$
  integral_0^pi (t/pi-1)sin(n t) d t &= [1/n (t/pi - 1)(-cos(n t))]_0^pi - integral_0^pi 1/(n pi) (-cos(n t)) d t \
  &= [1/n (t/pi - 1)(-cos(n t))]_0^pi + [1/(n^2 pi)(-sin(n t))]_0^pi \
$
On a :
$
  [1/n (t/pi - 1)(-cos(n t))]_0^pi &= (0 - 1/n (-1)(-cos(0))) = -1/n #text[et] \
  [1/(n^2 pi)(-sin(n t))]_0^pi &=^(sin(k pi) = 0) = 0 
$
On en conclut donc que :
$
  integral_0^pi (t^2/(2 pi) - t)cos(n t) d t = -1/n (-1/n) = 1/n^2
$

Enfin, par linéarité de l'intégrale,
$
  u_n &= sum_(k=1)^n 1/k^2 = sum_(k=1)^n integral_0^pi (t^2/(2 pi) - t)cos(k t) d t \
  &=integral_0^pi (t^2/(2 pi) - t)(sum_(k=1)^n cos(k t)) d t \
  &= integral_0^pi (t^2 / (2 pi) - t)C_n (t) d t
$

==
On calcule en primitivant :
$
  1/2 integral_0^pi (t^2/ (2 pi) - t) d t &= 1/2([1/(6 pi)t^3]_0^pi - [1/2t^2]_0^pi)\
  &= 1/2(pi^2/6 - pi^2 / 2) = -pi^2 / 6
$

Ainsi, pour tout $n in NN^*$ :
$
  u_n - pi^2/6 &= u_n + 1/2integral_0^pi (t^2/(2 pi) - t) d t \
  &= integral_0^pi (t^2/(2 pi) - t)(C_n (t) + 1/2)\
  &= 1/2 integral_0^pi (t^2/(2 pi) - t)D_n (t)
$
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

= Calcul de $lim_(n -> +oo) u_n$

==
$f$ est continue par opérations sur $]0;pi]$. De plus, pour tout $t in ]0;pi]$ :
$
  f(t) =2 (t/2) / sin(t/2) (1- t/(2pi))
$
En remarquant que le facteur du milieu est l'inverse d'un taux d'accroissement, on obtient :
$
  lim_(t -> 0) f(t) = 2 = f(0)
$
Donc $f$ est bien continue sur $[0;pi]$. D'après le théorème des bornes atteintes, on dispose donc de $M in RR^+$ tel que $|f| <= M$ sur $[0;pi]$.

==
===
Pour tout $alpha in ]0;pi[$, on a les inégalités suivantes :
$
  abs(integral_0^alpha f(t)sin((2n+1)/2t) d t) &<= integral_0^alpha abs(f(t))abs(sin((2n+1)/2t)) d t #text[par inégalité triangulaire] \
  &<= integral_0^alpha |f(t)| d t #text[car ] |sin| <= 1 \
  &<=integral_0^alpha M d t =alpha M #text[car ] |f| <= M 
$

===
$f$ est dérivable par opérations sur $]0;pi]$ : comme $alpha > 0$, elle est a fortiori dérivable sur $[alpha; pi]$. De plus, pour tout $t in [alpha; pi]$ :
$
  f'(t) = ((1-t/pi)sin(t/2) - 1/2(t - t^2/(2 pi))cos(t/2))/sin(t/2)^2
$
Qui est continue par opérations sur $[alpha;pi]$. Encore par le théorème des bornes atteintes, on dispose donc de $M' in RR^+$ tel que $|f'| <= M'$ sur $[alpha;pi]$.

===
Comme $f$ est de classe $C^1$, on peut calculer pour tout $n in NN$ par intégration par parties :
$
  I_n &= integral_alpha^pi f(t)sin((2n+1)/2t) d t \
  &= [-2/(2n+1)f(t)cos((2n+1)/2 t)]_alpha^pi - integral_alpha^pi -2/(2n+1)f'(t)cos((2n+1)/2 t) d t \
  &=^(cos((k+1/2)pi) = 0) 2/(2n + 1)f(alpha)cos((2n+1)/2alpha) + 2/(2n+1)integral_alpha^pi f'(t)cos((2n+1)/2 t) d t 
$

Ainsi, pour tout $n in NN^*$, par l'inégalité triangulaire (sur la somme et l'intégrale):
$
  |I_n| &<= abs(2/(2n + 1)f(alpha)cos((2n+1)/2alpha)) + 2/(2n+1)integral_alpha^pi abs(f'(t))abs(cos((2n+1)/2 t)) d t \
  &<= 2/(2n+1)abs(f(alpha)cos((2n+1)/2alpha)) + 2/(2n +1)(pi-alpha)M'
$
Comme $alpha$ et $M'$ sont fixés, par le théorème des gendarmes :
$
  lim_(n->+oo)abs(I_n) = 0 "d'où" lim_(n -> +oo) I_n = 0
$
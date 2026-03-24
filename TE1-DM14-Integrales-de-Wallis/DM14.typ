#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 14,
  titre: [Intégrales de Wallis],
  sections: [Partie],
  alpha: true
)

= Intégrales de Wallis.
On pose, pour tout $n in NN$,
$
  W_n = integral_0^(pi/2) cos^n (t) "d"t.
$

==
Soit $n in NN$.

On pose
$
  cases(
    x = pi/2 - t <==> t = pi/2 - x,
    "d"x = -"d"t <==> "d"t = -"d"x
  )
$

Par changement de variable, on obtient donc :
$
  W_n &= integral_(pi/2 - 0)^(pi/2 - pi/2) cos^n (pi/2 - x) (-"d"x) \
  &= integral_(pi/2)^(0) - sin^n (x) "d"x \
  &= integral_(0)^(pi/2) sin^n (x) "d"x.
$

==
===
$
  W_0 = integral_0^(pi/2) (cos(t))^0 "d"t = integral_0^(pi/2) 1 "d"t = pi/2 \
  W_1 = integral_0^(pi/2) cos(t) "d"t = [sin(t)]_0^(pi/2) = 1
$

===
Soit $n in NN$.
$
  W_(n+2) &= integral_0^(pi/2) cos^(n+2) (t) "d"t \
  W_(n+2) &= integral_0^(pi/2) cos(t) cos^(n+1) (t) "d"t \
  W_(n+2) &= [sin(t) cos^(n+1) (t)]_0^(pi/2) - integral_0^(pi/2) -(n+1) sin^2 (t) cos^n (t) "d"t \
$
$
  W_(n+2) &= (n+1) integral_0^(pi/2) (1 - cos^2 (t)) cos^n (t) "d"t \
  W_(n+2) &= (n+1) integral_0^(pi/2) cos^n (t) "d"t - (n+1) integral_0^(pi/2) cos^(n+2) (t) "d"t \
  W_(n+2) &= (n+1) W_n - (n+1) W_(n+2) \
  (n+2) W_(n+2) &= (n+1) W_n \
  W_(n+2) &= (n+1)/(n+2) W_n.
$

===
Montrons par récurrence que, pour tout $p in NN$,
$
  W_(2p) = (2p)!/(2^(2p)(p!)^2) pi/2 "et" W_(2p+1) = (2^(2p)(p!)^2)/(2p+1)!.
$

- _Initialisation._
Pour $p = 0$ :
$
  "d'une part, " W_(2 times 0) = W_0 = pi/2 quad "et" quad
  (2 times 0)!/(2^(2 times 0)(0!)^2) pi/2 = pi/2 ; \
  "d'autre part, " W_(2 times 0 + 1) = W_1 = 1 quad "et" quad
  (2^(2 times 0)(0!)^2)/(2 times 0+1)! = 1.
$
On a bien $W_(2p) = (2p)!/(2^(2p)(p!)^2) pi/2 "et" W_(2p+1) = (2^(2p)(p!)^2)/(2p+1)!$ pour $p=0$.

- _Hérédité._
Soit $p in NN$. On suppose que $W_(2p) = (2p)!/(2^(2p)(p!)^2) pi/2 "et" W_(2p+1) = (2^(2p)(p!)^2)/(2p+1)!$.

Montrons que $W_(2p+2) = (2p+2)!/(2^(2p+2)((p+1)!)^2) pi/2 "et" W_(2p+3) = (2^(2p+2)((p+1)!)^2)/(2p+3)!$.

D'après 2.b, d'une part,
$
  W_(2p+2) &= (2p+1)/(2p+2) W_(2p) \
  &= (2p+1)/(2p+2) (2p)!/(2^(2p)(p!)^2) pi/2 \
  &= (2p+1)!/(2^(2p) (2p+2) (p!)^2) pi/2 \
  &= (2p+2)!/(2^(2p) (2p+2)^2 (p!)^2) pi/2 \
  &= (2p+2)!/(2^(2p+2) (p+1)^2 (p!)^2) pi/2 \
  &= (2p+2)!/(2^(2p+2) ((p+1)!)^2) pi/2.
$

Et d'autre part,
$
  W_(2p+3) &= (2p+2)/(2p+3) W_(2p+1) \
  &= ((2p+2) 2^(2p)(p!)^2)/((2p+3)(2p+1)!) \
  &= (2^(2p) (2p+2)^2 (p!)^2)/((2p+3)(2p+2)(2p+1)!) \
  &= (2^(2p+2) (p+1)^2 (p!)^2)/((2p+3)!) \
  &= (2^(2p+2) ((p+1)!)^2)/((2p+3)!).
$

On a donc montré par le principe de récurrence que pour tout $p in NN$,
$
  W_(2p) = (2p)!/(2^(2p)(p!)^2) pi/2 "et" W_(2p+1) = (2^(2p)(p!)^2)/(2p+1)!.
$

==
===
Soit $n in NN$.
$
  W_(n+1) - W_(n) &= integral_0^(pi/2) cos^(n+1) (t) "d"t - integral_0^(pi/2) cos^n (t) "d"t \
  &= integral_0^(pi/2) cos^n (t) (cos(t) - 1) "d"t.
$

Or, pour tout $t in [0, pi/2]$, $0 <= cos(t) <= 1$ donc $cos^n (t) >= 0$ et $cos(t) - 1 <= 0$.

Ainsi, $cos^n (t) (cos(t) - 1) <= 0$ sur $[0, pi/2]$. Par conséquent $integral_0^(pi/2) cos^n (t) (cos(t) - 1) "d"t <= 0$
i.e. $W_(n+1) - W_(n) <= 0$.

La suite $(W_n)_(n in NN)$ est donc décroissante.

De plus, pour tous $t in [0, pi/2], n in NN$, on a $cos^n (t) >= 0$.

Donc $integral_0^(pi/2) cos^n (t) "d"t > 0$ i.e. $W_n > 0$. (Inégalité stricte puisque $cos^n (t) > 0$ en au moins un point, par exemple $t = pi/4$.)


La suite $(W_n)_(n in NN)$ étant décroissante et minorée, d'après le TLM, elle converge vers $l in RR_+$.

===
Soit $n in NN$. Par décroissance de la suite $(W_n)_(n in NN)$, on a :
$
  W_(n+2) &<= W_(n+1) <= W_n \
  <==> (n+1)/(n+2) W_n &<= W_(n+1) <= W_n "d'après 2.b" \
  <==> (n+1)/(n+2) &<= W_(n+1) / W_n <= 1
$

$limits(lim)_(n-->+infinity) (n+1)/(n+2) = 1$ donc d'après le théorème des gendarmes, $limits(lim)_(n-->+infinity) W_(n+1) / W_n = 1$.

===
On a pour tout $n in NN^*$ :
$
  (n+1)W_(n+1)W_n &= (n+1)(n)/(n+1)W_(n-1)W_n \
  &= n W_(n-1)W_n
$
La suite $(n W_(n-1)W_n)_(n in NN^*)$ est donc bien constante, de valeur $W_0W_1 = pi/2$.

===
Pour tout $n in NN^*$:
$
  n/(n+1)W_(n-1) <= W_n <= W_(n-1) " d'où " n/(n+1)pi/2 <= n W_n^2 <= pi/2
$
En utilisant le fait que les $W_n$ sont positifs.

Par croissance de $x mapsto sqrt(x)$ et positivité des termes, on obtient :
$
  sqrt(n/(n+1)) sqrt(pi/2) <= sqrt(n)W_n <= sqrt(pi/2)
$
Par gendarmes, on obtient :
$
  lim_(n->+oo)sqrt(n)W_n = sqrt(pi/2)
$
En multipliant les équivalents, on a $W_n ~_(n -> +oo) sqrt(pi/(2n))$. Comme $sqrt(pi/(2n)) ->^(n-> +oo) 0$, idem pour $(W_n)$.

= Produit et formule de Wallis, formule de Stirling
==
===
Démontrons par récurrence que pour tout $n in NN$ :
$
  rho_n = 2/pi product_(k=1)^n ((2k)^2)/((2k-1)(2k+1))
$

#underline[Initialisation :] $rho_0 =  1 / (pi / 2) = 2/pi.$

#underline[Hérédité :] Supposons l'assertion pour $n in NN$. On a alors :
$
  rho_(n+1) &= W_(2n+3)/W_(2n+2) = ((2n+2)/(2n+3)W_(2n+1))/((2n+1)/(2n+2)W_(2n)) \
  &=^"HR" 2/pi product_(k=1)^n ((2k)^2)/((2k-1)(2k+1)) dot (2(n+1))^2/((2n+1)(2n+3)) \
  &= 2/pi product_(k=1)^(n+1) ((2k)^2)/((2k-1)(2k+1))
$

===
Comme $W_n ~_(n->+oo) W_(n+1)$, en particulier, $W_(2n) ~_(n->+oo) W_(2n+1)$. Donc $(rho_n) -> 1$ et on obtient :
$
  lim_(n -> +oo) product_(k=1)^n ((2k)^2)/((2k-1)(2k+1)) = pi/2
$

==
===
Avec les formules de la question A)2)c), on a pour tout $n in NN$:
$
  1/rho_n &= W_(2n)/W_(2n+1) = pi/2 ((2n)!/(2^(2n)(n!)^2))/((2^(2n)(n!)^2)/(2n+1)!) \
   &=pi/2 (2n+1)/(2^(4n)) ((2n)!/(n!)^2)^2 \
   &= pi (2n+1)/(2^(4n+1))binom(2n,n)^2
$
===
Comme $(rho_n) -> 1$, $1/sqrt(pi rho_n) -->^(n-> +oo) 1/sqrt(pi)$. On trouve donc :
$
  lim_(n->+oo)sqrt(n+1/2)/2^(2n)binom(2n, n) = 1/sqrt(pi)
$
Ce qui donne, comme $sqrt(n+1/2) ~_(n->+oo) sqrt(n)$, la limite attendue.

==
===
La fonction $f$ est dérivable sur $RR_+^*$ par opérations, de dérivée :
$
  f'(x) &= "d"/("d"x)(x ln(1+1/x) + 1/2 ln(1+1/x)) \
  &= ln(1+1/x) + x (-1/x^2)1/(1+1/x) + 1/2 (-1/x^2)1/(1+1/x) \
  &= ln(1+1/x) - x/(x^2)x/(x+1) - 1/2 1/(x^2)x/(x+1) \
  &= ln(1+1/x) - 1/(x+1) - 1/2 1/(x(x+1)) \
  &=^(1/(x(x+1)) = 1/x - 1/(x+1)) ln(1+1/x) - 1/2(1/x+1/(x+1))
$

Cette fonction est à nouveau dérivable sur $RR_+^*$ et pour tout $x in RR$ :
$
  f''(x) &= -1/x^2 1/(1+1/x) - 1/2(-1/x^2 - 1/(x+1)^2) \
    &= 1/2(1/x^2 + 1/(x+1)^2)-1/x(x+1) \
    &= 1/2((1/x)^2 + (1/(x+1)^2) - 2 1/x 1/(x+1)) = 1/2(1/x - 1/(x+1))^2 >= 0
$

Donc $f''$ est positive et, sur $RR_+^*$, $f'$ est croissante.

Comme $lim_(x->+oo) f'(x) = 0$ et que $f'$ est croissante, $f'$ est négative sur $RR_+^*$ et $f$ est décroissante.
Or, $lim_(x->+oo) f(x) = 1$ (par croissances comparées). $f$ est donc nécessairement minorée par $1$ sur $RR_+^*$.

// De plus, comme une fonction convexe est au dessus de toutes ses tangentes, on a pour tout $a in RR_+^*$ l'inégalité :
// $
//   forall t in RR_+^*, f(t) &>= f'(a)(t-a) + f(a) \
//   &>=f'(a)t - a f'(a) + f(a) \
// $
// Or :
// - $lim_(a->+oo)f(a) = 1$ par croissances comparées
// - $lim_(a->+oo) a f'(a) = 1- 1 - 0 = 0$ par croissances comparées et opérations
// - $lim_(a->+oo) f'(a) = 0$ par opérations

// Ainsi, pour tout $t in RR_+^*$ fixé, en passant à la limite $a$ dans l'inégalité précédente, on obtient $f(t) >= 1$. Donc $f$ est minorée par $1$#footnote[$y=1$ est la "tangente à l'infini"].

Similairement, $g$ est dérivable deux fois sur $RR_+^*$ par somme et pour tout $x in RR_+^*$ :
$
  g'(x) &= ln(1+1/x) - 1/2(1/x + 1/(x+1)) + 1/12(1/x^2 - 1/(x+1)^2) \
"et" g''(x) &= 1/2(1/x - 1/(x+1))^2  - 1/6(1/x^3 - 1/(x+1)^3) \
&= 1/2 1/(x(x+1))^2 - 1/6 (x^3+3x^2+3x+1 - x^3)/(x(x+1))^3 \
&= 1/6 (3x+3)/(x(x+1))^3 - 1/6 ((x^3+3x^2+3x+1 - x^3)/(x(x+1))^3) \
&= -1/(6(x(x+1))^3) <= 0
$

Donc $g'$ est décroissante sur $RR_+^*$. Comme $lim_(x->+oo) g'(x) = 1 - 1 = 0$ par croissances comparées, $g'$ est négative sur $RR_+^*$ et $g$ est croissante sur $RR_+^*$. Enfin, $lim_(x->+oo) g(x) = 1 - 1/12 + 1/12 = 1$, et $g$ est majorée par $1$ sur $RR_+^*$.

===
Pour tout $n in NN^*$ :
$
  v_(n+1) - v_n &= ln(u_(n+1)/u_n) = ln((n+1)((n+1)^(n+1/2)/((n+1)!e^(n+1)))/(n^(n+1/2)/(n!e^n))) \
  &= ln(1/e ((n+1)/n)^(n+1/2)) = (n+1/2)ln(1+1/n) - 1 = f(n) - 1
$

===
Pour tout $n in NN^*$, $v_(n+1) - v_n >= 0$. Donc $(v_n)$ est croissante. D'autre part, pour tout $n in NN^*$ :

= Calcul de $zeta(2)$ par la méthode de Matsuoka
==
===
La fonction $sin$ est concave sur $[0;pi/2]$ : sa dérivée seconde est $-sin$ qui est négative sur cet intervalle. Comme une fonction concave et au dessus de toutes ses cordes, pour tout $t in [0;pi/2]$ :
$
  0 <= (1 - 0)/(pi/2-0)t <= sin(t) &"soit" 0 <= t <= pi/2sin(t) \
  &"puis" 0 <= t^2 <= pi^2/4(1-cos^2(t))
$

Car $x mapsto x^2$ est croissante sur $RR^+$. Par croissance de l'intégrale, on en déduit que pour tout $n in NN$ :
$
  0 <= M_(2n) = integral_0^(pi/2) t^2cos^(2n) (t)"d"t <=pi^2/4(W_(2n) - W_(2n+2))
$

Comme pour tout $n in NN$, $W_(n+2) = (n+1)/(n+2)W_n$, on obtient :
$
  W_(2n) - W_(2n+2) = W_(2n)(1 - (2n+1)/(2n+2)) = W_(2n)/(2n+2)
$
Ce qui donne l'encadrement attendu.

===
Comme les termes $W_n$ sont strictement positifs, on a pour tout $n in NN$:
$
  0 <= M_(2n)/W_(2n) <= pi^2/4 1/(2n+2)
$
Par gendarmes, on en déduit :
$
  lim_(n->+oo) M_(2n)/W_(2n) = 0
$

==
===
Soit $n in NN^*$. On peut écrire en intégrant par parties : (les fonctions en présence sont toutes $cal(C)^(oo))$

$
  W_(2n) &= integral_0^(pi/2) underbrace(1, u') dot underbrace(cos^(2n)(t),v)"d"t \
  &= [t cos^(2n)(t)]_0^(pi/2) - 2n integral_0^(pi/2)t (-sin(t))cos^(2n-1)(t)"d"t \
  &= 2n integral_0^(pi/2)t sin(t)cos^(2n-1)(t)"d"t
$

===
Encore en intégrant par parties, on obtient pour tout $n in NN^*$ :
$
  W_(2n) = 2n integral_0^(pi/2)underbrace(t,u') underbrace(sin(t)cos^(2n-1)(t), v)"d"t
$
La fonction $v$ est dérivable sur $[0;pi/2]$, de dérivée :
$
  v'(t) &= cos(t)cos^(2n-1)(t) + sin(t)(2n-1)(-sin(t))cos^(2n-2)(t) \
  &= cos^(2n)(t) + (2n-1)(cos^2(t)-1)cos^(2n-2)(t) \
  &=2n cos^(2n)(t) - (2n-1)cos^(2n-2)(t)
$
On a donc :
$
  W_(2n) &= 2n dot [u(t) v(t)]_0^(pi/2) - (2n)/2integral_0^(pi/2)t^2[2n cos^(2n)(t) - (2n-1)cos^(2n-2)(t)]"d"t \
  &=^(u(0) = 0)_(v(pi/2) = 0) - 2n^2integral_0^(pi/2)t^2cos^(2n)(t)"d"t + n(2n-1) integral_0^(pi/2)t^2cos^(2n-2)(t) "d"t \
  &=n(2n-1)M_(2n-2) - 2n^2M_(2n)
$

En utilisant le fait que $W_(2n) = (2n-1)/(2n)W_(2n-2)$, on a avec l'égalité précédente : ($W_(2n) != 0$)
$
  1 &= n(2n-1)M_(2n-2) / ((2n-1)/(2n)W_(2n-2)) - 2n^2M_(2n)/W_(2n) \
  &= 2n^2 M_(2n-2)/W_(2n-2) - 2n^2 M_(2n)/W_(2n)
$
D'où l'égalité :
$
  2(M_(2n-2)/W_(2n-2) - M_(2n)/W_(2n)) = 1/(n^2)
$

===
Soit $n in NN^*$. On a alors :
$
  S_n &= 2sum_(k=1)^n M_(2k-2)/W_(2k-2) - M_(2k)/W_(2k) "d'où par téléscopage" \
  &=2(M_0/W_0 - M_(2n)/W_(2n)) \
$
D'une part, $(M_(2n)/W_(2n)) -->^(n->+oo) 0$. D'autre part, $W_0 = pi/2$ et :
$
  M_0 = integral_0^(pi/2)t^2"d"t = 1/3pi^3/8
$
Par opérations sur les limites, on obtient enfin :
$
  lim_(n->+oo) S_n = zeta(2) &= 2(1/3pi^3/8)/(pi/2) \
  &= pi^2/6
$
= Calcul de l'intégrale de Gauss

==
===
Supposons que $b>a$. Alors :
$
  F(b) - F(a) =^"Chasles" integral_a^b e^(-t^2)"d"t
$
Comme $a < b$ et que $e^(-t^2) > 0$ sur $[a;b]$, on obtient $F(b) - F(a) >0$. $F$ est donc strictement croissante sur $RR^+$.

===
Pour tout $t >= 1$, $t^2 >= t$. Par décroissance de $x mapsto e^(-x)$ sur $RR^+$, on a $e^(-t^2) <= e^(-t)$ sur $[1;+oo]$.

===
Pour tout $x >= 1$, on a :
$
  F(x) &=^"Chasles" integral_0^1 e^(-t^2)"d"t + integral_1^x e^(-t^2)"d"t \
  &<= integral_0^1 e^(-t^2)"d"t + integral_1^x e^(-t)"d"t = integral_0^1 e^(-t^2)"d"t - e^(-x) + 1/e \
  &<=^(e^(-x) >= 0) integral_0^1 e^(-t^2)"d"t + 1/e
$
La fonction $F$ est donc strictement croissante et admet une majoration par une constante. Par le TLM, $F$ admet une limite en $+oo$.

==
===
Comme la fonction $x mapsto ln(1+x)$ est concave sur $]-1;+oo[$, elle est en dessous de toutes ses tangentes. En $0$, on obtient pour tout $x in ]-1;+oo[$ que $ln(1+x) <= x$. (Par stricte croissante de l'exponentielle, cette inégalité est équivalente à $1+x <= e^x$).

===
On a d'une part pour tout $0 <= t <= sqrt(n)$ :
$
  1-t^2/n <= e^(-t^2/n) "d'où" (1-t^2/n)^n <= e^(-t^2) "et" I_n <= integral_0^sqrt(n)e^(-t^2)"d"t
$
Et d'autre part :
$
  1+t^2/n <= e^(t^2/n) "d'où" (1-t^2/n)^(-n) >= e^(-t^2) "et" J_n >= integral_0^sqrt(n) e^(-t^2)"d"t
$

===
On pose :
$
  cases(
    u = arcsin(t/sqrt(n)) <==> t = sqrt(n)sin(u),
    "d"u = 1/sqrt(n)1/(sqrt(1-(t/sqrt(n))^2))"d"t = 1/sqrt(n)1/(cos(u))"d"t <==> "d"t=sqrt(n)cos(u)"d"u
  )
$
Où on utilise la fonction bien définie, positive et $cal(C)^(oo)$, $arcsin :[0;1] -> [0;pi/2]$

On obtient :
$
  I_n &= integral_0^(pi/2) sqrt(n)cos(u)(1-(sqrt(n)sin(u))^2/n)^n "d"u \
  &= sqrt(n)integral_0^(pi/2) cos^(2n+1)(u)"du" = sqrt(n)W_(2n+1)
$

===
Similairement, on pose :
$
  cases(
    u = arctan(t/sqrt(n)) <==> t = sqrt(n)tan(u),
    "d"u = 1/sqrt(n)1/(1+(t/sqrt(n))^2)"d"t = 1/sqrt(n)cos^2(u)"d"t <==> "d"t=sqrt(n)1/(cos^2(u))"d"u
  )
$
Où on utilise la fonction bien définie, positive et $cal(C)^(oo)$, $arctan: [0;1] -> [0;pi/4]$.
On obtient alors :
$
  J_n = integral_0^(pi/4) sqrt(n)1/(cos^2(u))(1+tan(u)^2)^(-n) "d"u
$
Comme on a l'identité $1+tan^2(x) = 1/(cos^2(x))$ sur $[0;pi/4]$, on a enfin :
$
  J_n = sqrt(n) integral_0^(pi/4) cos^(2n-2)(u)"d"u <=^(cos^(2n-2)>=0) sqrt(n)integral_0^(pi/2)cos^(2n-2)(u)"d"u = sqrt(n)W_(2n-2)
$

===
Avec les question précédentes, on obtient l'encadrement pour tout $n in NN^*$ :
$
  sqrt(n) W_(2n+1) = I_n <= integral_0^(sqrt(n)) e^(-t^2)"d"t <= J_n <= sqrt(n)W_(2n-2)
$

Par la question $A)3)d$, d'une part, :
$
  lim_(n->+oo)sqrt(2n+1)W_(2n+1) = sqrt(pi/2) = sqrt(2)lim_(n->+oo)sqrt(n)W_(2n+1)
$
Où l'on a la dernière égalité car $sqrt(2n+1) ~_(n->+oo) sqrt(2)sqrt(n)$. On a alors :
$
  lim_(n->+oo)sqrt(n)W_(2n+1) = sqrt(pi)/2
$
De même,
$
  lim_(n->+oo)sqrt(2n-2)W_(2n-2) = sqrt(pi/2) = sqrt(2)lim_(n->+oo)sqrt(n)W_(2n-2)
$
D'où :
$
  lim_(n->+oo)sqrt(n)W_(2n-2) = sqrt(pi)/2
$
Par gendarmes, on en déduit que :
$
  lim_(n->+oo)integral_(0)^(sqrt(n)) e^(-t^2)"d"t = sqrt(pi)/2
$
Comme $sqrt(n) -->^(n->+oo) +oo$, par unicité de la limite dont on a établi l'existence en $1)$, on a enfin :
$
  integral_0^(+oo)e^(-t^2) = lim_(n->+oo)integral_0^sqrt(n) e^(-t^2)"d"t  = sqrt(pi)/2
$
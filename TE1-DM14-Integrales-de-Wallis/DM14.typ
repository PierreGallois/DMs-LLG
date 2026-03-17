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
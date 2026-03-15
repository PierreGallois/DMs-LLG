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

D'après 2b, d'une part,
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
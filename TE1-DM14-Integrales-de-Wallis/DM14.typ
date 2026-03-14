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
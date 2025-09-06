#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 1,
  titre: [
    Fonctions contractantes,\ dilatantes et points fixes],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM01-Fonctions-Contractantes-Dilatantes-et-Points-Fixes/"

#sous-partie[Partie A - Fonctions contractantes et rétrécissantes.]

==
Soient $ k in RR_+^*$, et $f$ une fonction définie sur $I$ telle que pour tous $x, y in I, |f(x) - f(y)| <= k|x - y|$.

==
Soit $f$ une fonction contractante définie sur $I$, et $x, y in I$. Il existe donc $k in ]0,1[$ tel que $|f(x) - f(y)| <= k|x - y| (*)$.

Or,
$
  k < 1 &==> k|x-y| < |x-y| \
  &==> |f(x) - f(y)| < |x-y| "d'après" (*)
$

// D'après la dernière inégalité,
// $
//   |f(x) - f(y)| < |x-y| &==> 0 <= |f(x) - f(y)| < |x-y| \
//   &==> 0 < |x-y| \
//   &==> x != y
// $

$f$ est donc rétrécissante.

De plus,
$
  |f(x) - f(y)| < |x-y| &==> |f(x) - f(y)| <= 1 times |x-y|
$

$f$ est donc 1-lipschitzienne.

==
Soient $a in RR$, $I = [a,+infinity[$, et $f:x mapsto.long x + 1/(x-a+1)$ pour tous $x in I$.

===
$f$ est dérivable sur $I$. Pour tout $x in I$, $f'(x) = 1 - 1/(x-a+1)^2$.
Or,
$
  x in I &==> x >= a \
  &==> x-a >= 0 \
  &==> x-a+1 >= 1 \
  &==> (x-a+1)^2 >= 1 \
  &==> 1/((x-a+1)^2) <= 1 \
  &==> 0 <= f'(x).
$
La dérivée de $f$ est positive pour tout $x in I$, donc $f$ est bien croissante sur $I$.

Soit $x in I$.
$
  x in I &==> x >= a \
  &==> x-a >= 0 \
  &==> x-a+1 > 0 \
  &==> 1/(x-a+1) > 0.
$

$x >= a$, donc par somme d'inégalités, $x + 1/(x-a+1) >= a$ i.e. $f(x) in I$.

#sous-partie[Partie B - Fonctions rétrécissantes et point fixe.]



#sous-partie[Partie C - Fonctions dilatantes.]
  On fixe $f :RR -> RR$ continue et dilatante.

==
===
La fonction $g: x |-> x + e^x$ est continue sur $RR$ comme somme de fonctions continues. De plus, si $x,y in RR$, 
$
  |g(x) - g(y)| = |(x-y) + (e^x - e^y)| &>=^(#text[Triangulaire]) |x-y| + |e^x - e^y| \
  &>= |x-y|
$
Donc $g$ est bien dilatante.

===
La fonction $g_lambda$ est continue sur $]-oo;lambda[$ et sur $]lambda; +oo[$ car ses restrictions à ces intervalles sont continues. Montrons que $g_lambda$ est continue en $lambda$. D'une part,
$
lim_(x -> lambda^-) g(x) = lim_(x -> lambda^-) -x = -lambda
$
et d'autre part,
$
  lim_(x -> lambda^+) g(x) = lim_(x -> lambda^+) lambda - 2x = lambda - 2lambda = -lambda
$
Comme les limites de $g$ (qui existent par continuité avant et après $lambda$) en $lambda$ coïncident avec $g(lambda) = -lambda$, on en déduit que $g$ est continue en $lambda$ et donc sur tout $RR$. Montrons maintenant que $g$ est dilatante. On distingue trois cas :

  - $x, y < lambda$ : $|g(x) - g(y)| = |y-x| = |x-y| >= |x-y|$
  - $x,y >= lambda$ : $|g(x) - g(y)| = |2y-2x| = 2|x-y| >= |x-y|$
  - $x < lambda$ et $y >= lambda$ : $|g(x) - g(y)| = |2y - lambda - x| = |(y-lambda) + (y-x)| >=^(#text[Triangulaire]) |x-y|$
Ce qui montre que $g$ est bien dilatante
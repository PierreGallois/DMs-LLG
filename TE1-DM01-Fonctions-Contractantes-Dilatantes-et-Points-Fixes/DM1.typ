#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 1,
  titre: [
    Fonctions contractantes,\ dilatantes et points fixes],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM01-Fonctions-Contractantes-Dilatantes-et-Points-Fixes/"

=

#sous-partie[Partie A - Fonctions contractantes et rétrécissantes.]

==
Soient $k in RR_+^*$, et $f$ une fonction lipschitzienne définie sur $I$ qui respecte donc pour tous $x, y in I, abs(f(x) - f(y)) <= k abs(x - y)$.
Montrons que cette fonction est continue.

Soit $y$ dans $I$. Pour tout $epsilon > 0$, posons $alpha = epsilon / k$. Dans les cas où $abs(x - y) < alpha$, on obtient :
$
    abs(x - y) < epsilon / k <==> k abs(x - y) < epsilon
$

Et comme $f$ est lipschitzienne, $abs(f(x) - f(y)) <= k abs(x - y) < epsilon$ donc $abs(f(x) - f(y)) < epsilon$.

Nous avons prouvé que quelque soit le point $y$ que l'on choisit dans le domaine de définition $I$ de $f$, $forall epsilon > 0, exists alpha > 0, forall x in I, abs(x - y) < alpha => abs(f(x) - f(y)) < epsilon$ ie toute fonction lipschitzienne est continue.

==
Soit $f$ une fonction contractante définie sur $I$, et $x, y in I$. Il existe donc $k in ]0,1[$ tel que $abs(f(x) - f(y)) <= k abs(x - y) quad (*)$.

Or,
$
  k < 1 &==> k abs(x-y) < abs(x-y) \
  &==> abs(f(x) - f(y)) < abs(x-y) "d'après" (*)
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
  abs(f(x) - f(y)) < abs(x-y) &==> abs(f(x) - f(y)) <= 1 times abs(x-y)
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

===


#sous-partie[Partie B - Fonctions rétrécissantes et point fixe.]



#sous-partie[Partie C - Fonctions dilatantes.]
#counter(heading).update(1)
  On fixe $f :RR -> RR$ continue et dilatante.

==
===
La fonction $g: x |-> x + e^x$ est continue sur $RR$ comme somme de fonctions continues. De plus, si $x,y in RR$, 
$
  abs(g(x) - g(y)) = abs((x-y) + (e^x - e^y)) &>=^(#text[Triangulaire]) abs(x-y) + abs(e^x - e^y) \
  &>= abs(x-y)
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
Ce qui montre que $g$ est bien dilatante.

==
===
Soit $lambda in thin ]f(a_1);f(a_2)[ thin inter thin ]f(a_3);f(a_2)[ thin$. Cette intersection n'est pas vide, car elle contient au moins $]max(f(a_1), f(a_3)); f(a_2)[ thin$. Alors en posant $g: x |-> f(x) - lambda$, qui est continue par somme, comme $g(a_1), g(a_3) < 0$ et $g(a_2) > 0$, on obtient en appliquant TVI un $b in thin ]a_1;a_2$[ et un $c in thin ]a_2;a_3[$ tels que $g(b) = g(c) = 0$, c'est à dire $f(b) = f(c) = lambda$.

===
Comme $f$ est dilatante,
$
  |f(b) - f(c)| = 0 >= |b-c| >= 0
$
On en déduit que $|b-c| = 0$, donc $b = c$. Donc $f$ dilatante implique $f$ injective.

===
Supposons que $f$ ne soit pas strictement monotone, i.e $f$ n'est ni strictement croissante ni strictement décroissante. Comme $f$ n'est pas strictement décroissante, il existe $a_1 < a_2$ tels que $f(a_1) <= f(a_2)$; a fortiori, comme $f$ est injective, $f(a_1) < f(a_2)$.

TODO : l'argument est long


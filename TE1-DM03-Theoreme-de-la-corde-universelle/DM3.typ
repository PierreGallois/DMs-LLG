#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 3,
  titre: [\
    Théorème de la corde universelle],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM03-Theoreme-de-la-corde-universelle/"

= Exemples.
Dans les parties A et B, $n$ désigne un entier supérieur ou égal à 2.

==
Soient $f : x |-> 1 - abs(2x - 1)$ définie sur $[0, 1]$, et $n in NN without {0, 1}$.

On a $f(x+1/n) = 1 - abs(2x + 2/n - 1)$.

De plus, $n >= 2 ==> 1 >= 2/n ==> 1/2 >= 1/n ==> 1/2 > 1/2 - 1/n >= 0$.

#table(
  columns: (auto, 0pt, auto, 0pt, auto, 0pt, auto, 0pt),
  align: (x, y) => if y == 0 { center + bottom } else { center },
  stroke: (x, y) => (
    // Dash stroke inside
    right: if x > 0 and y > 0 { (paint: black, dash: "dotted") },
    // Left border
    left: if y > 0 and x <= 1 { black },
    // Top border
    top: if y == 1 { black },
    rest: none),
  $x$, $0$, [], $1/2-1/n$, [], $1/2$, [], $1$,

  // Right border
  table.vline(start: 1, stroke: (dash: none)),

  $abs(2x - 1)$, [], $-2x+1$, [], $-2x+1$, [0], $2x-1$, [],
  $f(x)$, [], $2x$, [], $2x$, [], $-2x+2$, [],
  $abs(2x - 1 + 2/n)$, [], $-2x + 1 - 2/n$, [0], $2x - 1 + 2/n$, [], $2x - 1 + 2/n$, [],
  $f(x+1/n)$, [], $2x + 2/n$, [], $-2x +2 - 2/n$, [], $-2x +2 - 2/n$, [],
  $f(x)-f(x+1/n)$, [], $-2/n$, [], $4x-2+2/n$, [], $2/n$, [],

  // Have to place bottom border manually
  // to avoid having to somehow fetch the amount of rows
  table.hline(start: 0, stroke: (dash: none))
)

L'équation $f(x) = f(x+1/n)$ équivaut à $f(x)-f(x+1/n) = 0$ qui n'a pas de solutions sur $[0, 1/2-1/n [ union ] 1/2, 1]$ d'après les tableau d'expressions.

Pour tout $x in [1/2 - 1/n, 1/2]$,
$
  f(x)-f(x+1/n) = 0 &<==> 4x-2+2/n = 0 \
  &<==> x = 1/2 - 1/(2n)
$

Et :
$
  n>=2 &==> n>0
  &==> cases(2n > n, 1/(2n) > 0)
  &==> cases(1/(2n) < 1/n, -1/(2n) < 0)
  &==> cases(1/2 - 1/(2n) > 1/2 - 1/n, 1/2 - 1/(2n) < 1/2) \
$

Notre solution est donc acceptable.

$
  S = {1/2 - 1/(2n)}.
$

==
Soit $f:x |-> 16x^2(1-x)^2$ définie sur $[0,1]$. Pour tout $x in [0, 1/n]$,

$
  f(x+1/n) = f(x) &<==> f(x+1/n) - f(x) = 0 \
  &<==> 16(x+1/n)^2(1-x-1/n)^2 - 16x^2(1-x)^2 = 0 \
  &<==> ((x+1/n)(1-x-1/n))^2-(x(1-x))^2 = 0 \
  &<==> (x-x^2-x/n+1/n-x/n-1/n^2)^2 - (x-x^2)^2 = 0 \
  &<==> (-x^2+(1-2/n)x+(n-1)/n^2)^2 - (x-x^2)^2 = 0 \
  &<==> (-x^2+(1-2/n)x+(n-1)/n^2 + x-x^2)(-x^2+(1-2/n)x+(n-1)/n^2 - x+x^2) = 0 \
  &<==> (-2x^2+(2-2/n)x+(n-1)/n^2)(-2/n x+(n-1)/n^2) = 0 \
  &<==> -2x^2+(2-2/n)x+(n-1)/n^2 = 0 or -2/n x+(n-1)/n^2 = 0 \
  &<==> -2x^2+ (2n-2)/n x+(n-1)/n^2 = 0 or x = (n-1)/(2n) \
$

Et :
$
  0 <= (n-1)/(2n) <= 1 - 1/n &<==> cases(0 <= n-1, n-1 <= 2n - 2) \
  &<==> cases(1 <= n, 0 <= n-1) \
  &<==> n>=1
$

Vrai car $n>=2$, donc par équivalence, $(n-1)/(2n) in [0, 1-1/n]$.

Cette solution est donc acceptable, et ainsi l'équation $f(x+1/n) = f(x)$ admet au moins cette solution sur $[0, 1-1/n]$.

// Vous qui vous apprêtez à lire cela, abandonnez toute espérance

// Or, $0 <= (n-1)/(2n) <= 1/n <==> 1 <= n <= 3$, donc cette solution ne convient pas pour $n >= 4$.
// 
// Pour $n>=4$, posons $g : x |-> -2x^2+ (2n-2)/n x+(n-1)/n^2$.

// $
//   Delta_g = (2n-2)^2/n^2 - 4 (-2) (n-1)/n^2 = (4n^2-4n+4+8n-8)/n^2 = (4n^2+4n-4)/n^2.
// $
// 
// Soit $Delta_n = 4^2-4 times 4 times (-4) = 80$.
// $
//   4n^2+4n-4 >= 0 &<==> n <= (-4-sqrt(80))/8 or n >= (-4+sqrt(80))/8 \
//   &<==> n >= (-1+sqrt(5))/2 "car" n "positif" \
// $
// 
// Or $n >= 2$ donc $n > (-1+sqrt(5))/2$. Ainsi $Delta_g > 0$ et l'équation $g(x) = 0$ admet deux solutions distinctes :
// $
//   g(x) = 0 &<==> x = ((2-2n)/n - sqrt((4n^2+4n-4)/n^2))/(-4) or x = ((2-2n)/n + sqrt((4n^2+4n-4)/n^2))/(-4) \
//   &<==> x = -(2-2n - sqrt(4n^2+4n-4))/(4n) or -(2-2n - sqrt(4n^2+4n-4))/(4n) \
// $


= Généralisation.
Soit $f$ une fonction continue sur $[0, 1]$ telle que $f(0) = f(1)$.
Pour tout $x in [0, 1 - 1/n]$, on pose $g(x) = f(x) - f(x + 1/n)$.

==
La fonction continue $x |-> x + 1/n$ a son ensemble image inclus dans $[0, 1]$ d'après le théorème des valeurs intermédiaires.
Or $f$ est continue sur $[0, 1]$ donc $g$ est continue sur $[0, 1]$ par opérations et composition de fonctions continues sur $[0, 1]$.

==
$
  sum_(k=0)^(n-1) g(k/n) &= sum_(k=0)^(n-1) f(k/n) - f((k+1) / n)\
                         &= f(0) - f(1) quad "par télescopage" \
                         &= 0 "car" f(0) = f(1)
$

==
On recherche s'il existe $alpha in [0, 1 - 1/n]$ tel que $g(alpha) = 0$.
Comme $sum_(k=0)^(n-1) g(k/n) = 0$,
- soit $g(k/n)$ est égal à 0 pour tous $k in [0, n-1]$ et l'on peut prendre n'importe quel $k$ pour avoir $alpha = k/n$ puisque $k in [|0, n-1|]$ donc $k/n in [0, 1- 1/n]$.
- soit il existe $k'$ tel que $g(k'/n) != 0$. Dans ce cas puisque la somme vaut 0, il existe nécessairement au moins un $k''$ tel que $g(k''/n)$ soit de signe opposé à $g(k'/n)$. Comme $g$ est continue sur $[0, 1]$, il existe d'après le théorème des valeurs intermédiaires #footnote[Soit $a, b in RR$, $[a <-> b] = cases([a, b] &"si" a <= b, [b, a] &"si" b < a)$] $alpha in [k'/n <-> k''/n]$ tel que $g(alpha) = 0$. Comme $[k'/n <-> k''/n] subset.eq [0, 1-1/n]$, on a bien $alpha in [0, 1-1/n]$.

= Généraliser encore ?
Soit $T in ]0, 1[$ tel que $1/T in.not ZZ$, et $f$ une fonction continue sur $[0, 1]$ telle que $f(0) = f(1)$.
On considére $f: x |-> sin^2((pi x) / T) - x sin^2(pi / T)$ d'inconnue $x in [0, 1 - T]$.

==
Comme la fonction sinus est continue sur $RR$ et que $T != 0$, $f$ est continue sur $[0, 1]$ par opérations et composition de fonctions continues.

$
  &f(0) = sin^2(0) - 0 = 0 \
  &f(1) = sin^2(pi/T) - sin^2(pi/T) = 0
$

Donc on a bien $f(0) = f(1)$.

==

$
  f(x) - f(x + T) &= sin^2((pi x) / T) underline(- x sin^2(pi/x)) - sin^2((pi (x + T)) / T ) + (underline(x) + T) sin^2(pi/T) \
                  &= sin^2((pi x)/T) - sin^2((pi x) / T + pi) + T sin^2(pi/T) \
                  &= sin^2((pi x)/T) - (sin((pi x) / T) underbrace(cos(pi), = -1) + cos((pi x)/T) underbrace(sin(pi), =0))^2 + T sin^2(pi/T) \
                  &= T sin^2(pi/T)
$

Or $T != 0$ et comme $sin^2(pi/T) = 0 <=> sin(pi/T) = 0 <=> pi/T = 0 "ou" pi/T = pi$ et $T != 1$, on a que pour tout $x$ dans $[0, 1 - T]$, $f(x) - f(x + T) > 0$

==
On a que $f(x) - f(x + T) > 0$ ie $f(x) > f(x + T)$ donc $f(x) != f(x + T)$ pour tout $x$ dans $[0, 1 - T]$.

$f(x + T) = f(x)$ est impossible pour tout $x$ dans $[0, 1-T]$.
#import "./../templates/homework.typ": dm, sous-partie
#import "@preview/vartable:0.2.3": tabvar
#import "@preview/lilaq:0.5.0" as lq

#show: dm.with(
  numero: 6,
  titre: [Localisation de racines],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM06-Localisation-de-racines/"

#if sys.version.minor != 14 {
  panic("Please compile with Typst 0.14")
}

#let Re(val) = $op("Re")(#val)$

=

Considérons, pour tout entier $n >= 2$, l'équation $(E_n)$ d'inconnue $z in CC$ :

$ z^n + z + 1 = 0 $

== Cas $n = 2$.

On considère l'équation $(E_2)$ à résoudre dans $CC$
$ z² + z + 1 = 0, $
Puisqu'il s'agit d'une équation quadratique, calculons le discriminant : $Delta = 1 - 4 = -3$ 

Les solutions sont donc
$ z = -(1 + sqrt(3)i)/2 "ou" z = (-1 + sqrt(3)i)/2 $


Et le module de chacune de ces racines est
$ |z| = sqrt(1^2 + sqrt(3)^2)/2 = sqrt(4)/2 = 1 $

ce qui est inférieur à 2.

== Cas $n = 3$

===
Soit $f : t #sym.arrow.r.long.bar t³ + t + 1$, définie sur $RR$.

Remarquons d'abord que $f$ est continue et dérivable sur $RR$ puisque c'est une fonction polynomiale.

De plus, pour tout $t in RR$, on a  
$ f'(t) = 3t^2 + 1 > 0 $ 
ce qui montre que $f$ est strictement croissante sur $RR$.  

Ainsi, comme $f(-1) = -1 < 0$ et $f(-1/2) = 3/8 > 0$, le corollaire du théorème des valeurs intermédiaires garantit que $f$ admet une unique racine $r in ]-1,-1/2[$.
Celle-ci constitue donc la seule solution réelle de $(E_3)$.

===
Notons $z_1$ et $z_2$ les deux autres solutionss complexes de $(E_3)$.

Puisque $r$ est une racine de $(E_3)$, le polynôme $P(z) = z^3 + z + 1$ se factorise sous la forme
$ P(z) = (z - r)(z² + a z + b)" avec "a, b in CC"." $

Ainsi, en développant cette expression, on obtient :
$ P(z) = z^3 + (a - r) z² + (b - a r) z - b r $

Par identification polynomiale, on en déduit le système suivant :

#set math.cases(gap: 0.7em)

$ cases(a - r = 0,
b - a r = 1,
-b r = 1) <==> cases(a = r,
b = r² + 1,
underbrace(r³ + r + 1 = 0, (E_3))) $

Par conséquent, les racines $z_1$ et $z_2$ sont les solutions de l'équation quadratique
$ z² + r z + (r² + 1) = 0. $

Enfin, par les propriétés des racines d'un polynôme du second degré, on obtient avec $r != 0$ : 
$ z_1 + z_2 = -r "et" z_1 z_2 = r² + 1 $

Or $r³ + r + 1 = 0$ avec $r != 0$, d'où $r² + 1 = -1/r$, soit $z_1 z_2 = -1/r$.

===
Puisque l'on a $r in ]-1,-1/2[$, il vient $1/2 < |r| < 1$,
$ "i.e" 1/2 < |z_1 + z_2| < 1 "car" |r| = |z_1 + z_2|. $

De même, on a $|z_1 z_2| = 1/(|r|)$, ce qui donne 
$ 1 < |z_1 z_2| < 2. $

===
Supposons que $|z_1| >= 2$. Alors,
$ |z_1| + |z_2| >= 2 + |z_2| $

Or nous avions montré précédemment que $|z_1 + z_2| < 1$, donc on obtient
$ 2 + |z_2| < 1 ==> |z_2| < -1 $

ce qui est absurde car $|z_2| >= 0$.

Nous concluons donc que $ |z_1| < 2. $

===
Le même raisonnemt (en échangeant les rôles de $z_1$ et de $z_2$) donne $|z_2| < 2$.

Ainsi, toutes les racines de l'équation $(E_3)$ ont un module strictement inférieur à 2.

#pagebreak()
== Cas général. 
Soit un entier $n >= 2$.

===

Considérons la fonction $phi : [2, +infinity[ #sym.arrow.r.long.bar RR $ telle que 
$ phi : t #sym.arrow.r.long.bar t^n - t - 1 $

Déterminons ses limites aux bornes de son intervalle de définition :
$ lim_(t -> 2) phi(t) = 2^n - 2 - 1 = 2^n - 3 >= 1 $
et
$ lim_(t -> +infinity) phi(t) = +infinity $

Remarquons ensuite que $phi$ est continue et dérivable sur $[2, +infinity[$ puisque c'est une fonction polynomiale.

Ainsi, pour tout $t in [2, +infinity[$, on a
$ phi'(t) = n t^(n-1) - 1 >= 3 > 0 "et donc" phi(t) >= phi(2) >= 3 > 0 $
ce qui montre que $phi$ est strictement croissante sur $[2, +infinity[$.

On en déduit le tableau suivant :
#align(center)[
#tabvar(
  variable: $t$,
  label: (
    ([signe de $phi'$], "s"),
    ([variation de $phi$],  "v"),
    ([signe de $phi$], "s"),
  ),
  domain: ($2$, $pi(=4)$, $+infinity$),
  contents: (
    ($+$,()),
    ((bottom, $2^n - 3$), (), (top, $+infinity$)),
    ($+$,()),
  )
)
]


===

Soit $z in CC$,

Si $z$ est une racine de l'équation $z^n + z + 1 = 0$,
alors $|z^n + z + 1| = 0$.

Or, par l'inégalité triangulaire inversée, on a
$ |z^n + z + 1| >= | |z^n| - |z| - |1| | = | |z|^n - |z| - 1 | $
Ainsi, pour que $|z^n + z + 1| = 0$, il faut et il suffit que $| |z|^n - |z| - 1 | = 0$, c'est-à-dire que $|z|^n - |z| - 1 = 0$.
Cela signifie que $|z|$ est une racine de l'équation $t^n - t - 1 = 0$.

Or, d'après le tableau précédent, l'équation $t^n - t - 1 = 0$ n'admet pas de racine dans l'intervalle $[2, +infinity[$.
On en déduit que pour toute racine $z$ de l'équation $(E_n)$, on a $|z| < 2$.

Ainsi, pour tout $z in CC$, $ (z^n + z + 1 = 0) ==> (|z| < 2). $


=
Soit $n in NN without {0, 1}$. On considère le polynôme
$
  P(X) = sum^n_(k=0) a_k X^k = a_n X^n + a_(n-1) X^(n-1) + ...+ a_1 X + a_0
$
- $a_n$ et $a_(n-1)$ sont des réels avec $a_n >= 1$ et $a_(n-1) > 0$
- Pour tout $k in [|0, n-2|], a_k in CC$
On note $M = max lr(size: #1.5em, {abs(a_0), abs(a_1), ..., abs(a_(n-2))})$

==
Soit $z$ une racine complexe de $P$ de partie réelle strictement positive.

===
Sachant que d'une part $Re(z) > 0$, et que : $ Re(1/z) = Re((Re(z) - Im(z))/(Re(z)² + Im(z)²)) = Re(z)/underbrace(Re(z)² + Im(z)²,   > 0) $
Alors on obtient bien $Re(1/z) > 0$.

===
On suppose que $abs(z) > 1$, prouvons les unes après les autres les inégalités suivantes :
$
  1 <= Re(a_n + a_(n-1) 1/z) <= M sum^(n-2)_(k=0) abs(z)^(k-n) <= M / (abs(z)^2 - abs(z))
$

====
Montrons que $1 <= Re(a_n + a_(n-1) 1/z)$.

Comme $a_n >= 1$ et $a_(n-1) > 0$, il vient grâce au résultat de la question précédente $Re(1/z) > 0$

$
  Re(a_n) = a_n >= 1 "et" Re(a_(n-1) 1/z) = a_(n-1)Re(1/z) > 0
$

d'où par addition membre à membre,
$
  Re(a_n + a_(n-1) 1/z) = Re(a_n) + Re(a_(n-1) 1/z) >= 1
$

#pagebreak()
====
Montrons que $Re(a_n + a_(n-1) 1/z) <= M sum^(n-2)_(k=0) abs(z)^(k-n)$.

$z$ est une racine complexe de $P$ donc $P(z) = 0$.
$
  (*) #h(1em) P(z) = 0 <=> P(n) / z^n = 0 <=> underparen(a_n + a_(n-1) 1/z)  = - sum^(n-2)_(k=0) a_k z^k/z^n
$
$
  underbrace(Re(a_n + a_(n-1) 1/z), >0) <= abs(underparen(a_n + a_(n-1) 1/z)) =^((*)) abs(- sum^(n-2)_(k=0) a_k z^k/z^n) <= sum^(n-2)_(k=0) abs(a_k) abs(z)^(k-n) <= M sum^(n-2)_(k=0) abs(z)^(k-n)
$

On trouve que $Re(a_n + a_(n-1) 1/z) <= M sum^(n-2)_(k=0) abs(z)^(k-n)$.

====
Montrons que $M sum^(n-2)_(k=0) abs(z)^(k-n) <= M / (abs(z)^2 - abs(z))$.
$
  M sum^(n-2)_(k=0) abs(z)^(k-n) = M sum^(n-2)_(k=0) (abs(z)^k) / (abs(z)^n) = M / (abs(z)^n) sum^(n-2)_(k=0) abs(z)^k = M / abs(z)^n dot.c (abs(z)^(n-1) - 1) / (abs(z) - 1) = underparen((abs(z)^(n-1) - 1) / (abs(z)^(n-1))) dot.c M / (abs(z)^2 - abs(z))
$

Or,
$
  (abs(z)^(n-1) - 1) / abs(z)^(n-1) <= 1 <=> abs(z)^(n-1) -1 <= abs(z)^(n-1) <=> underbrace(-1 <= 0, "vrai")
$
Par successions d'équivalences $(abs(z)^(n-1) - 1) / abs(z)^(n-1) <= 1$, cela donne finalement $M sum^(n-2)_(k=0) abs(z)^(k-n) <= M / (abs(z)^2 - abs(z))$.

===
====
Si $abs(z) <= 1$
$
  abs(abs(z) - 1/2) <= abs(1 - 1/2) = 1/2 <=^((*)) sqrt(1 + 4M) / 2
$
$(*)$ Par croissance de la fonction racine carré sur $RR_+$ comme $M >= 0$.

====
Si $abs(z) > 1$, grâce à l'inégalité de la question précédente, $1 <= M / (abs(z)^2 - abs(z))$.
Comme $abs(z) > 1$, $abs(z)^2 - abs(z) > 0$.

$
  1 <= M / (abs(z)^2 - abs(z)) &<=> 4 abs(z)^2 - 4 abs(z) <= 4 M \ &<=> 4 (abs(z) - 1/2)^2 <= 1 + 4M \ &<=> 4 abs(abs(z) - 1/2)^2 <= 1 + 4M  \ &<=>^"tout est"_"positif"  abs(abs(z) - 1/2) <= sqrt(1 + 4M) / 2
$
#pagebreak()
====
D'autre part,
$
  abs(abs(z) - 1/2) <= sqrt(1 + 4M) / 2 => abs(z) - 1/2 <= sqrt(1 + 4M) / 2 <=> abs(z) <= (1 + sqrt(1 + 4M)) / 2
$
Notons que grâce à la disjonction de cas précédente, ce dernier résultat ne dépend plus de $abs(z) > 1$ ou $abs(z) <= 1$.
==
Prenons $z$ une racine complexe de $P$.
- Ou bien $Re(z) <= 0$
- Ou bien $Re(z) > 0 =>^(Q 1a) Re(1/z) > 0$. On peut alors utiliser le résultat de la question $Q 1b$ puis $Q 1c$ ce qui donne $abs(z) <= (1 + sqrt(1 + 4M)) / 2$.

==
On considère le polynôme $Q(X) = X^3 + 1/2 X^2 - (7 + 4i) X - (5 + 10i)$

#counter(heading).step(level: 3) // skip a)
===
Le polynôme $Q$ possède une racine réelle évidente $r = -5/2$. En divisant $Q$ par $(X + 5/2)$ on a un polynôme du second degré à coefficients complexes. Les racines de $Q$ sont donc :
// Merci Wolfram
$
  {-5/2, -1-i, 3+i}
$

#counter(heading).update((2, 3, 0))
===
#counter(heading).step(level: 3)
===
Le polynôme $Q$ peut s'écrire comme $P$ avec, $n = 3$
$
  &a_n = a_3 = 1 >= 1 #h(3em)
  &&a_(n-1) = a_2 = 1/2 > 0 \
  &a_1 = - (7 + 4i) #h(3em)
  &&a_0 = - (5 + 10i)
$
$
  M = max lr(size: #1.5em, {abs(a_0), abs(a_1), ..., abs(a_(n-2))}) = abs(a_0) = sqrt(125) = 5sqrt(5)
$

#let col1 = teal.transparentize(30%)
#let col2 = olive.transparentize(30%)
#let racine = box(pad(left: 1pt, right: 4pt, place(dy: -5pt, circle(radius: 2pt, fill: navy))))

D'après les propriétés des polynômes $P$ (question $Q 2$) les racines #racine de $Q$ vérifient #box($Re(z) <= 0$, fill: col1, radius: 5pt, outset: 2.5pt) ou #box($abs(z) <= (1 + sqrt(1 + 4M)) / 2 = (1 + sqrt(1 + 20 sqrt(5))) / 2$, fill: col2, radius: 5pt, outset: (x: 2.5pt, y:6pt)) (les bordures comprises puisqu'il s'agit d'inégalités larges).

#let xs = lq.linspace(-5, 5)


#let module = (1 + calc.sqrt(1 + 4 * calc.sqrt(125))) / 2
#align(center, lq.diagram(
  xlim: (-7, 7),
  ylim: (-7, 7),
  width: 8cm,
  height: 8cm,
  lq.rect(-10, 10, width: 10, height: -20, fill: col1),
  lq.ellipse(-module, -module, width: 2*module, height: 2*module, fill: col2),
  lq.plot((-5/2, -1, 3), (0, -1, 1),
    stroke: none, mark-size: 7pt, color: navy)
))
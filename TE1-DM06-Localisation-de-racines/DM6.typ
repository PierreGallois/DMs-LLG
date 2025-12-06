#import "./../templates/homework.typ": dm, sous-partie
#import "@preview/vartable:0.2.3": tabvar

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

== Cas général. Soit un entier $n >= 2$.

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
  domain: ($2$, $pi=4$, $+infinity$),
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

== Soit $z$ une racine complexe de P de partie réelle positive

===

Puisque $Re(1/z) = Re((Re(z) - Im(z))/(Re(z)² + Im(z)²)) = Re(z)/underbrace(Re(z)² + Im(z)²,   > 0)$
et que $Re(z) > 0$, alors $Re(1/z) > 0$.
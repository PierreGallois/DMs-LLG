#import "./../templates/homework.typ": dm, sous-partie, code-from-file

#show: dm.with(
  numero: 18,
  titre: [Répartition des nombres premiers],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM18-Repartition-des-nombres-premiers/"

#sous-partie[Problème 1]

= Minoration de $pi (n)$ par la méthode de Nair (1982)


==
Un rapide script python opérant par récursivité permet d'obtenir la valeur de $Delta_n$ pour $n$ entre 2 et 9 :
#code-from-file(folder-name, "delta.py")
$
Delta_2 = 2, quad
Delta_3 = 6, quad
Delta_4 = 12, quad
Delta_5 = Delta_6 = 60, quad
Delta_7 = 420, quad
Delta_8 = 840, "et" 
Delta_9 = 2520
$

==
===
Soit $q in NN^*$.
$
  I(1,q) = integral_0^1 x^(1-1)(1-x)^(q-1)d x = integral_0^1(1-x)^(q-1)d x 
  \ = [-(1-x)^q/q]_0^1 = 1/q
$
===
Soit $p in NN^*$, supposons que $p<q$ i.e $p+1 <= q$.

$
  I(p+1, q) = integral_0^1 x^p (1-x)^(q-p-1) d x = integral_0^1 u(x) v'(x) d x
$
Avec $u(x) = x^p$ et $v(x) = (1-x)^(q-p)/(q-p)$, deux fonctions de classe $C^1$ sur $[0,1]$.

Par intégration par partie, il vient :
$
  I(p+1,q) = [u(x)v(x)]_0^1 - integral_0^1 u'(x)v(x)d x
  \ = 0 + p/(q-p) integral_0^1 x^(p-1) (1-x)^(q-p)d x = p/(q-p) I(p,q).
$

===

Indubitablement, il en découle :
$
  I(p+2, q) = (p(p+1))/((q-p)(q-p-1))I(p,q)
  \ \ dots.h.c \
  \ I(q,q) = (p(p+1)dots.h.c(q-1))/((q-p)(q-p-1)dots.h.c(1))I(P,q)
$

Soit : 
$
  I(q,q) = integral_0^1 x^(q-1) d x = 1/q = (q-1)!/((p-1)!(q-p)!)I(p,q)
$

On en déduit que :
$
  1 = p binom(q,p)I(p,q).
$

==
===
Soient $p,q in NN^*$ tels que $p<q$.
En remarquant que pour tout $x in [0,1]$ :
$
  (1-x)^(q-p) = sum_(j=0)^(q-p) binom(q-p, j) (-1)^(j) x^(j)
$

En remplaçant dans l'intégrale, on obtient : 
$
  I(p,q) = sum_(j=0)^(q-p) binom(q-p, j) (-1)^(j) underbrace(integral_0^1 x^(p-1) x^j d x, = 1/(p+j) )
  \ = sum_(j=0)^(q-p) (-1)^(j)/(p + j) binom(q-p, j)
$

===
Comme $(p+j) in [|p, q|]$ pour tout $j in [|0,q-p|]$, alors $Delta_q = "ppcm"(1,...,p,...,q) in NN$ est divisble par chacune de ces telles quantités $(p+j)$.

Ainsi, puisque $(-1)^j in ZZ "et" binom(q-p, j) in NN$ pour tout $j in [|0,q-p|]$, alors par somme et produit on obtient que $Delta_q I(p,q) in ZZ$.

Or pour tout $x in [0,1]$, $x^(p-1)(1-x)^(q-p) >= 0$, donc $I(p,q) >= 0$ par croissance de l'intégrale.

On en déduit finalement que $Delta_q I(p,q) in NN$.

===
Par conséquent, comme $I(p,q) = 1/(p binom(q,p))$, alors :
$
  Delta_q I(p,q) = Delta_q 1/(p binom(q,p)) in NN quad "i.e" p binom(q,p) "divise" Delta_q.
$

==
Soit $n in NN^*$.
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

===
En posant $p = n "et" q = 2n$, on a bien $p,q in NN^* "et" p < q$.

Ainsi, comme pour tout $k in NN^*, Delta_k | Delta_(k+1)$, alors on obtient :
$
p binom(q,p) | Delta_(q) <==> n binom(2n, n) | Delta_(2n) ==> n binom(2n, n) | Delta_(2n +1)
$

De même, en posant $p = n+1 "et" q=2n+1$, il vient :
$
  p binom(q,p) | Delta_q <==> (n+1) binom(2n+1, n+1) = (2n+1) binom(2n, n)| Delta_(2n+1)
$

===
Comme pour tout $n in NN^*$ on a $(2n +1) + (-2)n = 1$, alors $(2n+1)$ et $n$ sont premiers entre eux.

Ainsi, on en déduit par le théorème de Gauss que :
$
  cases(
    n binom(2n,n) | Delta_(2n+1),
    (2n+1) binom(2n,n) | Delta_(2n+1)
  ) ==> n(2n+1)binom(2n,n) | Delta_(2n+1)
$

===
Soit $k in [|0,n-1|]$.

$
  binom(2n, k+1) / binom(2n,k) = (k! dot (2n-k)!)/((k+1)! dot (2n-k-1)!) = (2n-k)/(k+1) > 1 "car" k < n
$
 
Ainsi, la suite $k --> binom(2n,k)$ est strictement croissante pour $0 <= k <= n$.  
En particulier, pour tout $k in [|0,n|]$, on a $binom(2n, k) <= binom(2n,n)$.

Par symétrie du binôme, on en déduit que cette inégalité est vraie pour tout $k in [|0,2n|]$.

===
Il en découle que par somme :
$
  binom(2n,0) + binom(2n,1) + dots.h.c + binom(2n,2n) <= (2n+1) times binom(2n,n)
  \ <==> sum_(k=0)^(2n) binom(2n,k) 1^k 1^(2n-k) = (1 + 1)^(2n) = 4^n <= (2n+1) binom(2n,n)
$

===
Ainsi, en multipliant des deux côtés de l'inégalité par $n in NN^*$, il vient :
$
  n 2^(2n) <= n(2n+1) binom(2n,n)
$

Or $underbrace(n(2n+1) binom(2n,n),  > 0) | underbrace(Delta_(2n+1), >0) ==> n(2n+1) binom(2n,n) <= Delta_(2n+1)$ 

Par transitivité on en conclut que :
$
  n 2^(2n) <= Delta_(2n+1)
$

===
Montrons que $Delta_m >= 2^m$ pour tout $m >= 9$.


- Si $m$ est impair, alors posons $m = 2n +1, n in NN^*$.

On sait que $Delta_(2n+1) = Delta_m >= n 2^(2n)$. Or $2^m = 2^(2n+1) = 2 times 2^(2n)$.

Ainsi, pour tout $n >= 4 >= 2$ i.e pour tout entier impair $m >= 9$, on a $Delta_m >= 2^m$.

- Si $m$ est pair, alors posons $m = 2n, n in NN^*$ tel que $n >= 5$.

Par croissance de $m --> Delta_m$, on a $Delta_m >= Delta_(2n -1)$. 

Or $Delta_(2n-1) >= (n-1)2^(2n-2) = 2^(2n) times underbrace((n-1)/4, >= 1) >= 2^(2n) ==> Delta_m >= 2^m$.

Ainsi, pour tout entier $m >= 9$, on a $Delta_m >= 2^m$.

L'inéquation $Delta_n >= 2^n$ d'inconnue $n in NN^*$ admet donc pour solution :
$
  S = NN^* without {3, 4, 6}
$

==
Soit $n in NN^*$.

===
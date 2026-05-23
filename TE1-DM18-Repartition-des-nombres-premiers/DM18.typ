#import "./../templates/homework.typ": dm, sous-partie, code-from-file
#import "@preview/vartable:0.2.3": tabvar

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
Par conséquent, comme $display(I(p,q) = 1/(p binom(q,p)))$, alors :
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
 
Ainsi, la suite $display(k --> binom(2n,k))$ est strictement croissante pour $0 <= k <= n$.  
En particulier, pour tout $k in [|0,n|]$, on a $display(binom(2n, k) <= binom(2n,n))$.

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
  S = NN^* without {1,2,3, 4, 6}
$

==
Soit $n in NN^*$.

===
Soit $p in P$.

Comme $Delta_n = "ppcm"(1,...,n)$, alors $v_p (Delta_n) = max(v_p (2), ..., v_p (n))$.

Posons $a = v_p (Delta_n)$. Alors, il existe un entier $1 <= k <= n$ tel que $v_p (k) = a$.

Ainsi, $p^a | k$, d'où $p^(v_p (Delta_n)) <= k <= n$.

===
La décomposition de $Delta_n$ en facteurs premiers est : 
$
  Delta_n = product_(p in P) p^(v_p (Delta_n))
$

Or pour tout $p in P$, on a $p^(v_p (Delta_n)) <= n$.

En multipliant ces inégalités sur tous les nombres premiers $p <= n$, on en déduit :
$
  Delta_n <= product_(p <= n) n = n^(pi (n))
$

==
Subséquemment, on obtient par transitivité que pour tout entier $n >= 9$ :
$
  n^(pi (n)) >= Delta_n >= 2^n > 0
  \ <==> pi(n) ln(n) >= n ln(2) "par croissance de" x --> ln(x) "sur" RR_+^*
$
D'où, finalement :
$
  pi(n) >= ln(2) n/ln(n).
$

Cette égalité est vraie si et seulement si $n$ est une puissance de 2, car on aurait $n^(pi(n)) = 2^n$.

Or, d'après les résultats du 4)f), pour tout $m > 10$, on a $Delta_n > 2^n ==> n^pi(n) > 2^n$.

Il ne reste plus qu'à vérifier les puissance de 2 comprises entre $1$ et $10$. 

Comme $2^pi(2) = 2 != 2² = 4$, $4^pi(4) = 16 = 2^4$, et $8^pi(8) = 8⁴ = 2^(12) > 2^8$, alors :
$
  pi(n) = ln(2) n/ln(n) <==> n = pi = 4.
$

= Majoration de $pi(n)$ par la méthode de Erdos (1939) 

==
===
Soient $a,b in NN^*$ tels que $a < b <= 2a$.

Pour tout nombre premier $p$ tel que $a < p <= b$, on a :
$
  cases(
    p <= b ==> p divides b!,
    p > a ==> p divides.not a!,
    b <= 2a ==> (b - a) <= a ==> p divides.not (b-a)!
  )
  ==> p divides b! / (a!(b-a)!) = binom(b,a)
$

Or, pour tous $p, p' in P$, par définition, $p and p' = 1$.

Ainsi, d'après le théorème de Gauss :
$
  product_(p in P \ a < p <= b) p divides binom(b,a)
$

===
Par conséquent, pour tout $m in NN^*$, comme $(m+1) < (2m + 1) < 2 times (m+1) $, alors on peut poser $a = (m+1)$ et $b = (2m+1)$ deux entiers qui respectent les conditions de la question précédente.

On en déduit que :
$
  product_(p in P \ a < p <= b) p divides binom(b,a) <==> product_(p in P \ m+1 < p <= 2m+1) p divides binom(2m+1,m+1)
$

===
Soit $m in NN^*$.

$
  4^m = 2^(2m) = 1/2 (1+1)^(2m+1) = 1/2sum_(k=0)^(2m+1) binom(2m+1, k)
  \ = underbrace((sum_(k=0)^(m-1) binom(2m+1, k), >0)) + binom(2m+1, m) "par symétrie du binôme"
$

On a donc bien $4^m >= binom(2m+1, m)$ pour tout $m in NN^*$.

===
Or, comme :
$
  underbrace((product_(p in P \ m+1 < p <= 2m+1) p), >= 1 > 0) divides underbrace(binom(2m+1,m+1), > 0)
$

Alors on en déduit une relation d'ordre, puis par transitivité avec l'inégalité ci-dessus :
$
product_(p in P \ m+1 < p <= 2m+1) p <= binom(2m+1,m+1) <= 4^m
$

===
Soit $n in NN^*$. Posons l'assertion $P(n)$ : "pour tout $k in [1,2n],  display(product_(p in P \ p <= k) p)<= 4^k$"

Montrons par récurrence que $P(n)$ est vraie pour tout $n in NN^*$.

Initialisation : $n=1$, comme $display(product_(p in P \ p <= 1) p) = 1 <= 4^1$ et $display(product_(p in P \ p <= 2) p) = 2 <= 4^2$, alors $P(1)$ vraie.

Hérédité : Soit $n in NN^*$. Supposons que $P(n)$ vraie.

Pour tout $k in [0,2n]$, on a bien $display(product_(p in P \ p <= k) p)<= 4^k$ par H.R.

De plus, comme $display(product_(p in P \ p <= 2n+1) p) = display(product_(p in P \ p <= n+1) p) times display(product_(p in P \ n+1< p <= 2n+1) p)$, et que par ailleurs :
$
  display(product_(p in P \ p <= n+1) p) <= 4^(n+1) "par H.R., et" display(product_(p in P \ n+1 < p <= 2n+1) p) <= 4^n
$

Alors il vient :
$
  display(product_(p in P \ p <= 2n+1) p) <= 4^n 4^(n+1) = 4^(2n+1)
$

Et puisque $(2n+2) = 2 times underbrace((n+1), > 1)$ n'est pas premier, alors :
$
  display(product_(p in P \ p <= 2n+2) p) = display(product_(p in P \ p <= 2n+1) p) <= 4^(2n+1) <= 4^(2n+2)
$
Donc $P(n+1)$ vraie aussi et on en déduit que $P(n)$ vraie pour tout $n in NN^*$.

Finalement, pour tout $k in NN^*, display(product_(p in P \ p <= k) p)<= 4^k$.

==
Soit $n in NN^*$. Posons $k = pi(n) in NN^*$.

Alors il existe exactement $k$ nombre premiers inférieurs ou égaux à $n$ : $p_1 < p_2 < dots.h.c < p_k$.

Comme $p_i  >= i +1$ pour tout $i >= 1$, alors $p_1 dot p_2 dot dots.h.c dot p_k >= 2 dot 3 dot dots.h.c dot k = (k+1)! > pi(n)!$

Or on sait que : $p_1 dot p_2 dot dots.h.c dot p_k = display(product_(p in P \ p <= n) p) <= 4^n$. 

Ainsi, pour tout $n in NN^*$, $pi(n)! <= 4^n$ par transitivité.

Or d'après l'énoncé, comme $pi(n) in NN^*$, alors $display(pi(n)! > (pi(n)/e)^pi(n))$ donc on a :
$
display( (pi(n)/e)^pi(n) < 4^n)
$
Puisque tous les membres de cette inégalité sont strictement positifs, alors par croissance de $x --> ln(x) "sur" RR_+^*$ :
$
  pi(n) ln(pi(n)) - pi(n) <= n ln(4)
$
==
Supposons qu'il existe un entier $n_0 >= 3$ tel que $display(pi(n_0) > e n_0 / ln(n_0))$.

===
Soit $f : x mapsto.long x ln(x) - x$ une fonction définie sur $]0, + infinity [$ et dérivable sur ce même intervalle par composition.

Pour tout $x in RR_+ ^*$, comme $f'(x) = ln(x) > 0 <==> x > 1$ et que $f'(1) = 0$, alors on en déduit que $f$ est strictement croissante sur $[1,+infinity[$.

Ainsi, comme pour tout $x in RR_+ ^*$ on a $display(e x/ln(x) > 1)$, il vient par hypothèse puis par stricte croissance de $f$ que : 
$
  pi(n_0) > e n_0 / ln(n_0) ==> underbrace(pi(n_0)ln(n_0) - pi(n_0), <= n_0 ln(4)) > e n_0 - e n_0 ln(ln(n_0))/ln(n_0)
  \ <==> ln(ln(n_0))/ln(n_0) > 1 - ln(4)/e = (e - ln(4))/e
$ 

===
Posons maintenant $g : x mapsto.long display(ln(x)/x)$, définie et dérivable par composition sur $[1, + infinity[$.

Pour tout $x >= 1$, $g'(x) = display((1 - ln(x))/(x²))$ d'où :

#align(center)[
#tabvar(
  variable: $x$,
  label: (
    ([signe de $g'$], "s"),
    ([variation de $g$],  "v"),
  ),
  domain: ($1$, $e$, $+infinity$),
  contents: (
    ($+$, ("0", $-$)),
    ((bottom, $0$), (top, $e^(-1)$), (bottom, $0$)),
  )
)
]

Ainsi, pour tout $x >= 1$, on a $display(ln(x)/x <= 1/e)$.

Par conséquent, $n >= 3 > e ==> ln(n_0) > ln(e) = 1$ d'où :
$
  (e - ln(4))/e < ln(ln(n_0))/ln(n_0) < 1/e ==> e - ln(4) < 1
  \ ==> underbrace(e, approx 2.718) < underbrace(1 + ln(4), approx 2.386)
$

Ce qui est absurde. Par conséquent, il n'existe aucun tel entier $n_0 >= 3$ respectant la condition initiale $display(pi(n_0) > e n_0 / ln(n_0))$ : 
$
  "Pour tout entier" n >= 3, pi(n) <= e n / ln(n). 
$


$
  "Fin du DM18 = DM"9/2pi
$
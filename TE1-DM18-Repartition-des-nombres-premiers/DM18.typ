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
--> binome de newton dans l'intégrale, puis linéarité somme, etc..
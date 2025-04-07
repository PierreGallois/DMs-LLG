#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 12,
  titre: [Première fois. Stabilité géométrique],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM12-Premiere-fois--stabilite-geometrique"

= Première fois.

- Partie A : Une fonction agissant sur les nombres entiers naturels.

Soit une fonction $Delta : NN -> NN$ possédant les propriétés :
/ $(1)$ : $Delta(0) = Delta(1) = 0$
/ $(2)$ : Pour tout entier premier $p$, $Delta(p) = 1$
/ $(3)$ : Pour tous entiers $a$ et $b$ : $Delta(a times b) = b Delta(a) + a Delta(b)$

==
Soit $p$ un nombre premier, $n$ un entier naturel.
On cherche à prouver que $Delta(p^n) = n p^(n-1)$.

*Initialisation :*

Pour $n = 0$, $Delta(p^0) = Delta(1) = 0$ d'après $(1)$.
Ce qui correspond à la formule.

Pour $n = 1$, $Delta(p^1) = Delta(p) = 1$ d'après $(2)$.
Or avec la formule on obtient $p^0 = 1$, ce qui est donc correct.

*Hérédité :*

On suppose que $Delta(p^n) = n p^(n-1)$, cherchons à prouver que $Delta(p^(n+1)) = (n+1)p^n$.

$
  Delta(p^(n+1)) = Delta(p times p^n) = p^n Delta(p) + p Delta(p^n) = p^n + p n p^(n-1) = (n+1)p^n
$

Par principe de récurrence, $Delta(p^n) = n p^(n-1)$.

==
===
Soit $p$ et $q$ des nombres premiers distincts, $m$ et $n$ des entiers naturels supérieurs ou égaux à 1.
$Delta(p^m times q^n) = q^n Delta(p^m) + p^m Delta(q^n)$
D'après la question précédente, on a alors :
$m q^n p^(m-1) + n p^m q^(n-1) = (p^(m-1) q^(n-1))(m q + n p)$

===
$Delta(10^n) = Delta(2^n times 5^n)$
Comme 2 et 5 sont premiers et distincts, $n$ supérieur ou égal à 1, on a d'après la question précédente :
$Delta(2^n times 5^n) = 7n(2^(n-1) times 5^(n-1))$
$Delta(10^n)$ est donc un multiple de 7 avec $n >= 1$.

==
===


- Partie B : Étude de quelques images d'entiers par la fonction $Delta$.

==
===

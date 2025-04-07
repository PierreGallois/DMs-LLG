#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 12,
  titre: [Première fois. Stabilité géométrique],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM12-Premiere-fois--stabilite-geometrique"

= Une fonction agissant sur les nombres entiers naturels.

- Partie A.

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

$Delta(p^(n+1)) = Delta(p times p^n) = p^n Delta(p) + p Delta(p^n) = p^n + p n p^(n-1) = (n+1)p^n$

Par principe de récurrence, $Delta(p^n) = n p^(n-1)$.


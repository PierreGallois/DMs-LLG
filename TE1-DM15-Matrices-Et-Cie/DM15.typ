#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 15,
  titre: [Matrices et Cie],
  sections: [Exercice],
  alpha: false
)

#let GL = $upright(G L)_2(ZZ)$

= Équation matricielle de Fermat
==
===
On calcule (directement ou avec les formules de produit de matrices élémentaires) :
$
  E_(1,1)^2 = E_(1,1) "   " E_(2,2)^2 = E_(2,2) "   " E_(1,2) ^2 = E_(2,1)^2 = 0_2
$
On en conclut immédiatement que pour tout entier $n >= 1$, $E_(1,1)^n = E_(1,1)$ et $E_(2,2)^n = E_(2,2)$. De même, pour tout $n >= 2$, $E_(1,2)^n = E_(2,1)^n = 0_2$.

===
Soit $n >= 2$. On a alors, par exemple, l'équation :
$
  E_(1,1)^n + E_(1,2)^n = E_(1,1)^n
$
Le triplet de matrices non nulles $(E_(1,1), E_(2,1), E_(1,1)) in GL^3$ est donc solution de $(F_n)$.

= Matrice et probabilité
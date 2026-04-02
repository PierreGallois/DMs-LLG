#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 15,
  titre: [Matrices et Cie],
  sections: [Exercice],
  alpha: false
)

#let GL = $upright(G L)_2(ZZ)$
#let colred(x) = text(fill: red, $#x$)
#let colblue(x) = text(fill: blue, $#x$)

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

==
Notons pour $a,b,c,d,alpha, beta, gamma, delta in ZZ$ :
$
  A = mat(a,c;b,d) " et " B = mat(alpha, gamma; beta, delta)
$
On a alors :
$
  A B = mat(a alpha + c beta, a gamma + c delta; b alpha + d beta, b gamma + d delta)
$
Et par définition :
$
  det(A B) &= (a alpha + c beta)(b gamma + d delta) - (b alpha + d beta)(a gamma + c delta) \
  &= colred(a alpha b gamma) + a alpha d delta + c beta b gamma + colblue(c beta d delta) - colred(b alpha a gamma) - b alpha c delta - d beta a gamma - colblue(d beta c delta) \
  &= a d (alpha delta - beta gamma) - b c (alpha delta - beta gamma) \
  &= det(A)det(B)
$
Ce qui donne la résultat attendu

= Matrice et probabilité
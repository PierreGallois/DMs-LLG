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
===
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
Ce qui donne la résultat attendu.

===
Notons pour $a,b,c,d in ZZ$ :
$
  A = mat(a,c;b,d)
$
On a alors :
$
  A^2 = mat(a^2 + b c, a c + c d; b a + b d, b c + d^2)
$
Sachant que $tr(A) = a + d$, on obtient :
$
  A^2 - tr(A)A &= mat(a^2 + b c - a^2 - a d, c (a + d) - c(a+ d); b(a+ d) - b(a + d), b c + d^2 - d a - d^2) \
  &= mat(b c - a d, 0;0, b c - a d) = -det(A)I_2 \
$
C'est à dire $A^2 - tr(A)A + det(A)I_2 = 0_2$.

==
Soit $A,B in GL$. Alors $A B in cal(M)_2(ZZ)$ car les coefficients de $A B$ sont des sommes de produits d'entiers, et $A B in GL$ car :
$
  det(A B) = det(A) det(B) in {plus.minus 1}
$
D'autre part, soit $A in GL$. Comme $det(A) != 0$, $A$ est inversible dans $cal(M)_2(RR)$ d'inverse :
$
  A^(-1) = 1/(det(A))(tr(A)I_2 - A)
$
Comme $1/det(A) in ZZ$ car $A in GL$, $tr(A) in ZZ$ et que $cal(M)_2(ZZ)$ est clos par la somme, on a que $A^(-1) in cal(M)_2(ZZ)$. Enfin :
$
  det(A A^(-1)) = det(I_2) = 1 = det(A)det(A^(-1))
$
Donc $det(A^(-1)) = 1/det(A) in {plus.minus 1}$ et $A^(-1) in GL$.

==
Par symétrie, on détermine sans perte de généralité les solutions triangulaires supérieures pour en déduire les triangulaires inférieures. On procède par analyse-synthèse

#underline[Analyse :] Soit $a,b,c in ZZ$ et notons une solution :
$
  T = mat(a,b;0,c) " i.e " T^2 = mat(a^2, b(a+c);0,c^2) = I_2
$
On en déduit le système :
$
  cases(a^2 = c^2 = 1, b(a+c) = 0)
$
Si $b = 0$, alors $T$ est de la forme :
$
  T = mat(plus.minus 1, 0;0, plus.minus 1)
$
Sinon, $a+c = 0$ et $T$ est de la forme :
$
  T = mat(a,b;0,-a) "où" a  = plus.minus 1
$


#underline[Synthèse :] Soit $T$ de la première forme. Alors, immédiatement, $T^2 = I_2$ car $T$ est diagonale. Si $T$ est la deuxième forme pour $a = plus.minus 1$ et $b in ZZ$, alors :
$
  T^2 = mat(a^2, a b - a b; 0, (-a)^2) = I_2
$

Par symétrie, les solutions triangulaires de l'équation sont donc enfin :
$
  cal(S) = {mat(plus.minus 1, 0 ; 0, plus.minus 1)} union {mat(a,b;0,-a), a = plus.minus 1, b in ZZ} union {mat(a,0;b,-a), a = plus.minus 1, b in ZZ}
$
(où les 4 choix de signes sont possibles dans le premier ensemble).

= Matrice et probabilité
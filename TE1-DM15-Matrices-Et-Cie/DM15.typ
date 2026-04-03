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
===
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

===
On pose :
$
  A = mat(1,1;0,-1) " et " B = mat(-1, 0; 1, 1)
$
On calcule $det(A) = -1 = det(B)$, c'est à dire que $A,B in GL$. D'après la question précédente, $A^2 = B^2 = I_2$. Enfin :
$
  A + B = mat(0,1;1,0)
$
Remarquons que :
$
  (A+B)^2 = mat(1, 0;0, 1) = I_2
$

===
Soit $n in NN$ impair. On écrit $n = 2k + 1$. On a alors :
$
  A^(n) = (A^(2))^k A = I_2^k A = A " et similairement" B^n = B "et" (A+B)^n = A+B
$
Ainsi, pour tout $n$ impair :
$
  A^n + B^n = A + B = (A+B)^n
$
Ce qui montre que $(A,B,A+B) in GL^3$ est une solution de l'équation $(F_n)$.

==
===
Soit $M in GL$ telle que $tr(M)$ est pair. On a alors :
$
  M^2 = tr(M)M - det(M)I_2
$
Tous les coefficients de la matrice $tr(M)M$ sont pairs, et comme $det(M) = plus.minus 1$, on a que $det(M)I_2 in cal(E)$. Les coefficients de la diagonale de $M^2$ sont donc impairs (somme d'un pair et d'un impair) et ceux hors de la diagonale sont pairs (égaux à ceux de $tr(M)M$).

  Donc $M^2 in cal(E)$ comme attendu.
  
===
Soit $M in GL$. Avec le théorème de Cayley-Hamilton, on exprime :
$
  M^3 &= M(tr(M)M - det(M)I_2) \
  &= tr(M)M^2 - det(M)M \
  &= tr(M)(tr(M)M - det(M)I_2) - det(M)M \
  &= (tr(M)^2 - det(M))M - det(M)I_2
$

Par linéarité de la trace, on en déduit que :
$
  tr(M^3) = (tr(M)^2 - det(M))tr(M) - 2det(M)
$

$2det(M)$ est pair, et comme $det(M)$ est impair, que $tr(M)$ soit pair ou impair, $(tr(M)^2 -det(M))tr(M)$ est pair car l'un des facteurs est pair. Donc $tr(M^3)$ est bien pair.

===
On raisonne par l'absurde. Supposons que $(A,B,C) in GL^3$ soit une solution de $(F_6)$.

Pour toute matrice $M in GL$, $tr(M^3)$ est pair (par le $5b$). Donc $M^6 in cal(E)$ (par le $5a$). Ainsi, comme $A^6 + B^6 = C^6$, on a une somme de matrices de $cal(E)$ qui est à nouveau dans $cal(E)$. Cependant, la somme de deux matrices de $cal(E)$ a des coefficients diagonaux pairs et ne peut être dans $cal(E)$, ce qui est une contradiction.

Donc $(F_6)$ n'admet pas de solution dans $GL^3$.

= Matrice et probabilité
==
===
On calcule, pour tout $a,b in RR$ :
$
  M(a,b)^2 = mat(
    a^2 + 4b^2, 2a b + 3b^2, dots, 2a b + 3b^2;
    2 a b + 3b^2, dots.down, dots.down, dots.v;
    dots.v, dots.down, dots.down, 2 a b + 3b^2 ;
    2 a b + 3b^2, dots, 2 a b + 3b^2, a^2 + 4b^2
  )
$
Soit $a in RR, b in RR^*$. Montrons par analyse-synthèse que $M(a,b)^2$ peut être écrite comme une combinaison linéaire de $M(a,b)$ et $I_5$. 

#underline[Analyse :] Supposons que $M(a,b)^2 = x M(a,b) + y I_5$. Par égalité des coefficients diagonaux, on a l'égalité :
$
  a x + y = a^2 + 4b^2
$
Et en ajoutant l'égalité des coefficients non diagonaux, on obtient le système :

$
  cases(
    a x + y = a^2 + 4b^2,
    b x = 2a b + 3b^2
  ) &" i.e" (b != 0)" " cases(
    a x + y = a^2 + 4b^2,
    x = 2a + 3b
  ) \
  &" d'où" cases(
    y = 4b^2 - 3a b - a^2,
    x = 2a + 3b
  )
$
#underline[Synthèse :] On calcule effectivement que $M(a,b)^2 = (2a + 3b)M(a,b) + (4b^2 - 3 a b - a^2)I_5$.

===
Soit $(a,b) in RR times RR^*$. Alors :
$
  M(a,b)^2 = M(a,b) <==> (2a + 3b - 1)M(a,b) + (4b^2 - 3 a b - a^2)I_5 = 0
$

$M(a,b)$ et $I_5$ sont linéairement indépendantes : en effet, si :
$
  lambda M(a,b) + mu I_5 = 0
$
Alors, comme $b != 0$, en regardant les coefficients hors de la diagonale, on a $lambda b = 0$ soit $lambda = 0$. Dès lors, on en déduit $mu = 0$.

Ainsi, $M(a,b)^2 = M(a,b)$ si et seulement si :
$
  cases(
    2a + 3b = 1,
    a^2 + 3 a b= 4b^2
  ) & <==>
  cases(
    2a + 3b = 1,
    a^2 + a(1-2a) = a - a^2 = 4b^2
  ) \
  &<==> cases(
    b = 1/3(1-2a),
    a - a^2 = 4/9(1 + 4a^2 - 4a)
  ) \
  &<==> cases(
    b = 1/3(1-2a),
    25/9a^2 - 25/9a + 4/9 = 0
  ) \
  &<==> cases(
    b = 1/3(1-2a),
    25a^2 - 25a + 4 = 0
  )
$
Le discriminant de l'équation du second degré est $Delta = 625 - 400 = 225 = 15^2$. $a$ est solution de cette équation si et seulement si :
$
  a = (25+15)/50 = 4/5 " ou " a = (25-15)/50 = 1/5
$
Ce qui donne les couples solutions :
$
  cal(S) = {(4/5, -1/5), (1/5, 1/5)}
$

==
===
D'après la question précédente, $P = M(1/5,1/5)$ satisfait $P^2 = P$.
Ainsi :
$
  Q^2 = I_5^2 +P^2 - 2P = I_5 - P = Q
$
Ainsi que :
$
  P Q = Q P = P - P^2 = 0_5
$
(tout se déduit du fait que $P$ est idempotente).

On en déduit immédiatement que pour tout $k >= 1$ :
$
  P^k = P " et " Q^k = Q
$

===
On procède par analyse synthèse comme dans le $1a$. Soit $(a,b) in RR times RR^*$.

#underline[Analyse :] Si $M(a,b) = lambda P + mu Q = (lambda -mu) P +mu I_5$, alors en écrivant l'égalité des coefficients diagonaux et non diagonaux :
$
  cases(
    1/5(lambda - mu) + mu = a,
    1/5(lambda - mu) = b
  ) <==>
  cases(
    mu = a-b,
    lambda = 5b + (a-b) = a + 4b
  )
$
#underline[Synthèse :] On vérifie facilement que :
$
  M(a,b) = (a+4b)P + (a-b)Q = 5b P + (a-b)I_5
$

Ainsi, pour tout $n in NN^*$, comme $P,Q$ commutent :
$
  M(a,b)^n = sum_(k=0)^(n)binom(n,k)(a+4b)^k (a-b)^(n-k)P^k Q^(n-k)
$

Comme $P Q = O_5$, $P^i Q^j = 0_5$ pour tous $i,j >= 1$. On en déduit que :
$
  M(a,b)^n &= (a+4b)^n P^n + (a-b)^n Q^n \
  &= (a+4b)^n P + (a-b)^n Q \
  &= ((a+4b)^n - (a-b)^n)P + (a-b)^n I_5
$
En calculant :
$
  1/5((a+4b)^n - (a-b)^n) + (a-b)^n = (a+4b)^n/5 + (4(a-b)^n)/5
$

On déduit enfin l'expression de $M(a,b)^n$ :
$
  M(a,b)^n = mat(
    (a+4b)^n/5 + (4(a-b)^n)/5, ((a+4b)^n - (a-b)^n)/5, dots, ((a+4b)^n - (a-b)^n)/5;
    ((a+4b)^n - (a-b)^n)/5, dots.down, dots.down, dots.v;
    dots.v, dots.down, dots.down, ((a+4b)^n - (a-b)^n)/5;
    ((a+4b)^n - (a-b)^n)/5, dots, ((a+4b)^n - (a-b)^n)/5, (a+4b)^n/5 + (4(a-b)^n)/5
  )
$

==
===
===
D'après l'expression du $2a$, pour tout $n in NN^*$ :
$
  M(a,b)^n &= (1 - 4b + 4b)^n P + (1 - 4b - b)^n Q\
  &= P + (1-5b)^n Q
$

Or, comme $0 < b <= 1/4$, $-1/4 <= 1-5b < 1$ et $abs(1-5b) < 1$. Comme $(1-5b)^n -->^(n->+oo) 0$, en regardant coefficient par coefficient :
$
  L = lim_(n->+oo) M(a,b)^n = P
$

==
===
Pour tous $k,j in [|0,4|]$, avec $k$ et $j$ distincts, on a :
$
  cases(
    PP_(X_n = j) (X_(n+1) = j) = 1/2,
    PP_(X_n = j) (X_(n+1) = k) = 1/8
  )
$

Ainsi, en posant pour tout $n in NN$ la matrice colonne $V_n$ = $[PP (X_n = j)]_(0 <= j<=4)$, on obtient :

#set math.mat(column-gap: 2em, row-gap: 1em)
$
  V_(n+1) = M V_n "avec" M = mat(1/2, 1/8, 1/8, 1/8, 1/8;1/8, 1/2, 1/8, 1/8, 1/8; 1/8, 1/8, 1/2, 1/8, 1/8; 1/8, 1/8, 1/8, 1/2, 1/8;1/8, 1/8, 1/8, 1/8, 1/2) = M(1/2, 1/8)
$

=== 
Soit $n in NN$. Il vient par récurrence immédiate que $V_n = M^n V_0$.

Grâce à l'expression générale de $(M(1/2, 1/8))^n$ trouvée précédemment, il vient :
$
  cases(PP (X_n = 0) = 1/5 + 4/5 (3/8)^n,
  PP (X_n = 1) = PP (X_n = 2) = PP (X_n = 3) = PP (X_n = 4)= 1/5 (1 - (3/8)^n)
  )
$

Finalement :
$
  lim_(n -> +oo) PP (X_n = 0)= ... = lim_(n -> +oo) PP (X_n = 4) = 1/5
$
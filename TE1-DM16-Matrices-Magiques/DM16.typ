#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 16,
  titre: [Matrices Magiques],
  sections: [Partie],
  alpha: false
)

#set math.cases(gap: 1em)
#set math.mat(row-gap: 1em, column-gap: 2em)

= Généralités

==
Soit $n in NN$, puisque la somme de chaque ligne, et la somme de chaque colonne de $I_n$ est 1, alors $I_n$ semi-magique de $M_n (RR)$ avec $sigma(I_n) = 1$.

De même, $J in "SMag"_n (RR)$ avec $sigma(J) = n$.

==
Soient $A,B in "SMag"_n (RR)$ et $lambda in RR$.

$
  forall i in [|1,n|], cases(sum_(j=1)^n a_(i,j) = sigma(A),lambda sum_(j=1)^n b_(i,j) = lambda sigma(B)) "et" forall j in [|1,n|], cases(sum_(i=1)^n a_(i,j) = sigma(A),lambda sum_(i=1)^n b_(i,j) = lambda sigma(B))
$

D'où, par linéarité de la somme  :
$
  cases(forall i in [|1,n|]"," sum_(j=1)^n (a_(i,j) + lambda b_(i,j)) = sigma(A) + lambda sigma(B),forall j in [|1,n|]"," sum_(i=1)^n (a_(i,j) + lambda b_(i,j)) = sigma(A) + lambda sigma(B))
$

Soit $(A + lambda B) in "SMag"_n (RR)$ et $sigma(A + lambda B) = sigma(A) + lambda sigma(B).$

Par ailleurs, en prenant $B = A$ et $lambda = -2$, il vient que $-A in "SMag"_n (RR)$. On en déduit que $"SMag"_n (RR)$ est stable par addition et par passage à l'opposé. 

==
Soit $A in M_n (RR)$.
$
  A in "SMag"_n (RR) <==> cases(forall i in [|1,n|]"," sum_(j=1)^n a_(i,j) = sigma(A),forall j in [|1,n|]"," sum_(i=1)^n a_(i,j) = sigma(A))
\ <==> cases(J A = sigma(A)J, A J = sigma(A) J) <==> J A = A J = lambda J "avec" lambda = sigma(A)
$

==
Soient $A,B in "SMag"_n (RR)$.

Il vient ainsi :
$
  cases(
    J A B = sigma(A) J B = sigma(A) sigma(B) J,
    A B J = A sigma(B) J = sigma(A) sigma(B) J
  )
$

Puisque $(A B)J = J(A B) = sigma(A) sigma(B) J$, alors on en déduit que $(A B) in "SMag"_n (RR)$ avec $sigma(A B)= sigma(A) sigma(B)$ et que $"SMag"_n (RR)$ est stable par produit.

==
Soit $A in "SMag"_n (RR) inter "GL"_n (RR)$.

Puisque $A A^(-1) = I_n$ et que $I_n in "SMag"_n (RR)$, alors il vient :
$
  J I_n = I_n J ==> J A A^(-1) = A^(-1) A J ==> sigma(A) J A^(-1) = A^(-1) sigma(A) J = J
  \ ==> cases(
    sigma(A) != 0,
    J A^(-1) = A^(-1) J = 1/sigma(A) J
  )
$

Soit $A^(-1) in "SMag"_n (RR)$, $sigma(A) != 0$ et $sigma(A^(-1)) = 1/sigma(A)$.

= Matrices magiques dans le cas n = 3
==
Soient $A,B in "Mag"_3 (RR)$ et $lambda in RR$.

D'une part, comme  $A,B in "SMag"_n (RR)$ et $lambda in RR$, alors $(A + lambda B) in "SMag"_n (RR)$.

De plus :
$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = sigma(A),
    b_(1,1) + b_(2,2) + b_(3,3) = sigma(B),
    b_(1,3) + b_(2,2) + b_(3,1) = sigma(B)
  )
  ==>
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) + lambda (b_(1,1) + b_(2,2) + b_(3,3)) = sigma(A) + lambda sigma(B),
    a_(1,3) + a_(2,2) + a_(3,1) +lambda (b_(1,3) + b_(2,2) + b_(3,1)) = sigma(A) + lambda sigma(B)
  )
$

On en déduit que $(A + lambda B) in "Mag"_3 (RR)$ avec $sigma(A + lambda B) = sigma(A) + lambda sigma(B)$.

==
Soit $A in "Mag"_3 (RR)$.

$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = sigma(A),
    a_(1,2) + a_(2,2) + a_(3,2) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = sigma(A)
  )
  ==> 3 sigma(A) = 3 a_(2,2) + (a_(1,1) + a_(1,2) + a_(1,3)) + (a_(3,1) + a_(3,2) + a_(3,3))
  \ ==> sigma(A) = 3 a_(2,2)
$

==
Soit $A in "Mag"_3 (RR)$.

On obtient d'après la définition de la transposée $A^T$ :
$
  cases(
    forall i in [|1,3|]"," sum_(j=1)^3 a_(i,j) = sum_(j=1)^3 (a^T)_(j,i)= sigma(A),
    forall j in [|1,3|]"," sum_(i=1)^3 a_(i,j) = sum_(i=1)^3 (a^T)_(j,i) = sigma(A)
  )
$

Et par ailleurs,
$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = (a^T)_(1,1) + (a^T)_(2,2) + (a^T)_(3,3) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = (a^T)_(1,3) + (a^T)_(2,2) + (a^T)_(3,1) = sigma(A)
  )
$

Ainsi on a $A^T in "Mag"_3 (RR)$ et $sigma(A^T) = sigma(A).$

==
Soient $(a, b, c, d, e, f, g, h, i) in RR^9$.

Analyse :
$
  A = mat(a, b, c; d, e, f; g, h, i) in "Mag"_3 (RR) inter A_3 (RR)
  \ ==> cases(sigma(A) = -sigma(A) = 0, a=e=i=0, b=-d=f=-h, g=-c = b) <==> A in {mat(0, m, -m; -m, 0, m; m, -m, 0), m in RR}
$

Et d'autre part :
$
  A = mat(a, b, c; d, e, f; g, h, i) in "Mag"_3 (RR) inter S_3 (RR)
  \ ==> cases(b=d=i, a=f=h, c=e=g, a+b=2c) <==> A in {mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n), (m,n) in RR^2}
$

Synthèse :

Soit $m in RR$. Si $A = mat(0, m, -m; -m, 0, m; m, -m, 0)$, alors : 
$
  A^T = mat(0, -m, m; m, 0, -m; -m, m, 0) = -A
  "et" sigma(A) = 0 = sigma(A^T)
$

Soit $(m,n) in RR^2$. Si $A = mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n)$, alors :
$
  A^T = mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n) = A
  "et" sigma(A) = 3/2 (a+b) = sigma(A^T)
$

Ainsi, l'ensemble des matrices antisymétriques de $"Mag"_3 (RR)$ est :
$
  "Mag"_3 (RR) inter A_3 (RR) = {mat(0, m, -m; -m, 0, m; m, -m, 0), m in RR}
$

Et l'ensemble des matrices symétriques de $"Mag"_3 (RR)$ est :
$
  \ "Mag"_3 (RR) inter S_3 (RR) = {mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n), (m,n) in RR^2}
$

==
===
Soient $n in NN$ et $M in M_n in (RR)$ avec $ M = mat(
  a_(1,1),  ..., a_(n,1);
  dots.v, dots.down, dots.v;
  a_(1,n), ..., a_(n,n);
)$.

Posons :
$ A = mat(
  0, (a_(2,1) - a_(1,2))/2,  ..., (a_(n,1) - a_(1,n))/2;
  (a_(1,2) - a_(2,1))/2, 0,  , dots.v;
  dots.v,   , dots.down, (a_(n,n-1) - a_(n-1,n))/2;
  (a_(1,n) - a_(n,1))/2, ..., (a_(n-1,n) - a_(n,n-1))/2, 0;
)
$


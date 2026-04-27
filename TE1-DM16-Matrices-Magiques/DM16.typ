#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 16,
  titre: [Matrices Magiques],
  sections: [Partie],
  alpha: false
)

#set math.cases(gap: 1em)

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
  J I_n = I_n J => J A A^(-1) = A^(-1) A J => sigma(A) J A^(-1) = A^(-1) sigma(A) J = J
  \ => cases(
    sigma(A) != 0,
    J A^(-1) = A^(-1) J = 1/sigma(A) J
  )
$

Soit $A^(-1) in "SMag"_n (RR)$, $sigma(A) != 0$ et $sigma(A^(-1)) = 1/sigma(A)$.
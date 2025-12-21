#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 8,
  titre: [Chemins sur un quadrillage],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM08-Chemins-Sur-Un-Quadrillage/"

= Retrouver des formules bien connues
==
Un chemin entre $O$ et $M(p,q)$ équivaut à une somme ordonnée de $p$ vecteurs $arrow(i)$ et de $q$ vecteurs $arrow(j)$. Une telle somme est composée de $p+q$ termes, et est déterminée uniquement par la position des $p$ vecteurs $arrow(i)$ parmi les $p+q$ termes, en complétant tous les autres termes par des $arrow(j)$. Ainsi, comme l'ordre des $arrow(i)$ n'importe pas, il y a $binom(p+q,p)$ telles sommes. 
  
On en déduit que le nombre de chemins entre $O$ et $M(p,q)$ est de $binom(p+q,p) = binom(p+q,q)$ (par symétrie).

==
Un chemin de longueur $n$ partant d'un point consiste en une somme ordonnée de $n$ vecteurs parmi ${arrow(i), arrow(j)}$, assimilable à une $n$-liste de cet ensemble à deux éléments. On en déduit qu'il y a $2^n$ chemins de longueur $n$ partant de tout point (et en particulier de l'origine).

==
===
Par translation de vecteur $arrow(P O) = vec(0,-1)$, un chemin joignant $P(0,1)$ à $B_k (n-k, k)$ équivaut à un chemin joignant l'origine et $B'_k (n-k,k-1)$. Ceux ci sont donc au nombre de $binom(n-k+k-1,k-1) = binom(n-1,k-1)$.

Similairement, un chemin entre $Q$ et $B_k (n-k, k)$ équivaut à un chemin entre l'origine et $B''_k (n-k-1,k)$. Ils sont donc au nombre de $binom(n-k-1 + k, k) = binom(n-1,k)$.

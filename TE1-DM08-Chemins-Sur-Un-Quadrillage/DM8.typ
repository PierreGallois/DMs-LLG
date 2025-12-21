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

===
On double compte les chemins de $O$ à $B_k$. D'une part, ceux-ci sont au nombre de $binom(n,k)$ par le 1). D'autre part, un tel chemin doit passer soit par $Q(1,0)$, soit par $P(0,1)$ en fonction du premier vecteur du chemin. Ainsi, un chemin entre $O$ et $B_k$ est soit un chemin de $Q$ à $B_k$, soit un chemin de $P$ à $B_k$. On en déduit :
$
  binom(n,k) = binom(n-1,k) + binom(n-1,k-1)
$
===
Un chemin de $O$ à $B_n (n,n)$ passant par $B_k (n-k, k)$ équivaut à la donnée de deux chemins, l'un de $O$ à $B_k$, et l'autre de $B_k$ à $B_n$. Ainsi, ces chemins sont au nombre de :
$
  binom(n-k+k,k) dot binom(n - (n-k) + (n-k),n-k) = binom(n,k) binom(n,n-k) = binom(n,k)^2
$
Où l'on a dénombré les chemin de $B_k$ à $B_n$ par translation de vecteur $arrow(B_k O)$.

===
On double compte les chemins de $O$ à $B_n (n,n)$. D'une part, ceux-ci sont au nombre de $binom(n+n,n) = binom(2n,n)$. D'autre part, chaque tel chemin, après $n$ étapes, se trouve sur un unique point de la forme $B_k (n-k, k)$ avec $k in {0, dots, n}$, car ceux-ci forment l'ensemble des points atteignables depuis $O$ par un chemin de longueur $n$. Ainsi, par disjonction et le dénombrement de la question précédente, on déduit :
$
  sum_(k=0)^n binom(n,k)^2 = binom(2n,n)
$

= Chemins de Dyck et nombres de Catalan

==
===
TODO : Thomas stp :3
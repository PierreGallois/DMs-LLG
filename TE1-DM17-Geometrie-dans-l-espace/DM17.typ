#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 17,
  titre: [Géométrie dans l'espace],
  sections: [Partie],
  alpha: true
)


#sous-partie[Problème 1]

= Existence de tétraèdres non orthocentriques

==
Au sein de ce tétraèdre, les quatres faces sont des triangles rectangles : $A B C$ et $A B D$ sont rectangles en $B$, et $B C D$ et $A C D$ sont rectangles en $D$.

Comme $h_A$ est la droite passant par $A$ et perpendiculaire au plan $(B C D)$, et que l'on a $(A B) perp (B C)$, alors $h_A = (A B)$. De même, on en déduit $h_C = (C D)$.

Les hauteurs $h_B$ et $h_D$ ne se trouvent elles pas sur des arêtes, mais se trouvent dans les directions perpendiculaires aux faces opposées $(A C D)$ et $(A B C)$ passant respectivement par $B$ et par $D$.

Ainsi, on en déduit que $h_A inter h_B = B$ et que $h_C inter h_D = D$ : puisque les quatre hauteurs se rencontrent en deux points distincts, elles ne sont pas concourantes et le tétraèdre $A B C D$ n'est pas orthocentrique.

==
Ici on dispose de : $(A B) perp (A C), (A B) perp (A D), "et" (A C) perp (A D)$.

Indubitablement, il en découle $h_B = (A B), h_C = (A C), "et" h_D = (A D)$.

Comme $h_A$ est une droite passant par $A$, alors on en déduit que les quatres hauteurs sont concourantes en ce même point et que le tétraèdre $A B C D$ est orthocentrique.

= Concourance de deux hauteurs
Soit $A B C D$ un tétraèdre.

==
Supposons que $h_A$ et $h_B$ soient sécantes en un point $H$.

Ainsi, $(A H) perp (B C D)$ et $(B H) perp (A C D)$.

Par conséquent, 
$
  cases(
    (C D)" orthogonale à "(A H) "car" (C D) subset (B C D),
    (C D)" orthogonale à "(B H) "car" (C D) subset (A C D)
  )
$

Donc la droite $(C D)$ est orthogonale à deux droites sécantes $(A H)$ et $(B H)$ : on en déduit que $(C D) $ orthogonale à $ (A B H)$ et enfin que $(A B) $ orthogonale à $ (C D)$ car $(A B) subset (A B H)$.

==
Supposons que $(A B)$ orthogonale à $(C D)$.

===
On a ainsi $arrow(A B) dot arrow(C D) = 0$.

Soit $R$ le projeté orthogonal de $A$ sur $(C D)$, donc $(A R) perp (C D)$. 

Par Chasles, $arrow(A B) = arrow(A R) + arrow(R B) ==> arrow(B R) = arrow(A R) - arrow(A B)$.

On en déduit que :
$
  arrow(B R) dot arrow(C D) = arrow(A R) dot arrow(C D) - arrow(A B) dot arrow(C D) = 0 - 0 = 0
$

Par conséquent, comme $R subset (C D)$, on a $(B R) perp (C D)$ : le point $R$ est le projeté orthogonal de $B$ sur la droite $(C D)$.

===
Puisque la hauteur $h_A$ est l'unique droite perpendiculaire au plan $(B C D)$ et passant par $A$, alors il s'agit également de l'unique droite perpendiculaire à $(B R)$ passant par $A$. 

Et comme la hauteur issue de $A$ au sein du triangle $A B R$ respecte ces conditions, alors on en déduit qu'il s'agit de $h_A$.

De même, on trouve que la hauteur issue de $B$ au sein du triangle $A B R$ est la droite $h_B$.
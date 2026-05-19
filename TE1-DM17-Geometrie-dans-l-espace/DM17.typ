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

On en conclut que $A$ et $B$ ont le même projeté orthogonal $R$ sur la droite $(C D)$.

===
Puisque la hauteur $h_A$ est l'unique droite perpendiculaire au plan $(B C D)$ et passant par $A$, alors il s'agit également de l'unique droite perpendiculaire à $(B R)$ passant par $A$. 

Et comme la hauteur issue de $A$ au sein du triangle $A B R$ respecte ces conditions, alors on en déduit qu'il s'agit de $h_A$.

De même, on trouve que la hauteur issue de $B$ au sein du triangle $A B R$ est la droite $h_B$.

Enfin, on en déduit que les hauteurs $h_A$ et $h_B$ sont sécantes en un point $H$ car il s'agit de deux hauteurs d'un même triangle : ce sont deux droite coplanaires et non parallèles.

== 

Si les hauteurs $h_A$ et $h_B$ d'un tétraèdre sont sécantes en un point $H$, alors $(A B)$ est orthogonale à $(C D)$, ce qui implique réciproquement que les hauteurs $h_C$ et $h_D$ sont également sécantes en un point $H'$.

= Concourance des quatre hauteurs
Soit $A B C D$ un tétraèdre.

==
Si les hauteurs $h_A, h_B, h_C "et" h_D$ sont concourantes, alors on a d'après la partie précédente : 

$
  cases(
    h_A "sécante à" h_B ==> (A B) "orthogonale à" (C D),
    h_B "sécante à" h_C ==> (B C) "orthogonale à" (A D),
    h_C "sécante à" h_A ==> (C A) "orthogonale à" (B D),
  )
$

On a bien $(A B) perp (C D), (B C) perp (A D) "et" (C A) perp (B D)$.

==
Supposons que le tétraèdre $A B C D$ possède 3 paires d'arêtes opposées orthogonales.

Ainsi, $(A B) perp (C D), (B C) perp (A D) "et" (C A) perp (B D)$.

===
Puisque $(A B) perp (C D)$, alors comme vu précédemment, les hauteurs $h_A$ et $h_B$ sont sécantes en un point $H$. 

===
Comme $h_A$ et $h_B$ sont sécantes en un point $H$, alors elle sont coplanaires et il existe un unique plan $P$ qui les contient toutes deux.

De plus, $(B C) perp (A D) "et" (C A) perp (B D)$ nous donnent que $h_C$ coupe $h_A$ et $h_B$.

On a ainsi deux options :

  - Soit $h_C$ traverse le plan $P$ à l'endroit où se croisent $h_A$ et $h_B$, c'est-à-dire en $H$.
  - Soit $h_C$ est entièrement contenue dans le plan $P$, auquel cas on aurait un tétraèdre plat : Absurde.

En appliquant le même raisonnement avec la droite $h_D$, on en déduit que les quatres hauteurs sont concourantes en $H$.

==
===
Au sein du tétraèdre $A B C D$, on a par la relation de Chasles :
$
  arrow(A B) dot arrow(C D) + arrow(A C) dot arrow(D B) + arrow(A D) dot arrow(B C) 
  \ = arrow(A B) dot (arrow(C A) - arrow(D A)) + arrow(A C) dot (arrow(D A) - arrow(B A)) + arrow(A D) dot (arrow(B A) - arrow(C A))
  \ = 0 "car les termes s'annulent deux à deux."
$

===

Ainsi, $A B C D$ possède deux paires d'arêtes opposées orthogonales si et seulement si (sans perte de généralité, quitte à renommer les sommets) $arrow(A B) dot arrow(C D) = 0 "et" arrow(A C) dot arrow(D B) = 0$.

Or on dispose de l'égalité $arrow(A B) dot arrow(C D) + arrow(A C) dot arrow(D B) + arrow(A D) dot arrow(B C) = 0$.

On en déduit que :
$
  cases(
    (A B) perp (C D),
    (A C) perp (D B)
  )
  <==> arrow(A B) dot arrow(C D) = arrow(A C) dot arrow(D B) = arrow(A D) dot arrow(B C) = 0
  \ <==> A B C D "possède trois paires d'arêtes opposées orthogonales"
  \ <==> h_A, h_B, h_C "et" h_D "concourantes"
  \ <==> A B C D "orthocentrique"
$

Un tétraèdre est donc orthocentrique si et seulement si il possède deux paires d'arêtes opposées orthogonales.

==
===
Au sein du tétraèdre $A B C D$ :
$
  A B² + C D² - (A C² + B D²)\ = A B² - A C² + (arrow(A D) - arrow(A C))² - (arrow(A D) - arrow(A B))²
  \ = -2 arrow(A D) dot arrow(A C) + 2 arrow(A D) dot arrow(A B)
  \ = 2 arrow(D A) dot arrow(B C)
$

===
Ainsi, on en déduit que :
$
A B² + C D² = A C² + B D² <==> arrow(D A) dot arrow(B C) = 0 <==> (A D) perp (B C)
$

Par conséquent, on obtient par permutation au sein des sommets que :
$
  A B² + C D² =  A C² + B D² = A D² + B C² \ <==> A B C D "possède deux paires d'arêtes opposées orthogonales" \ <==> A B C D "orthocentrique"
$

==
Comme au sein d'un tétraèdre régulier la longueur de chaque arête est la même, alors on obtient l'égalité vue ci-dessus, et le tétraèdre est orthocentrique.
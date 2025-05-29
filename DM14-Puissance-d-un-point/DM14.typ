#import "./../templates/homework.typ": dm, sous-partie
#import "@preview/cetz:0.3.4"
#import "vectors.typ": *

#show: dm.with(
  numero: 14,
  titre: [
    Puissance d'un point par rapport à un cercle],
  sections: [Problème],
  alpha: false
)

#let folder-name = "DM13-Ln-IAF-et-suites/"

=
#sous-partie[Partie A - Définition]

#set align(center)
#cetz.canvas({
  import cetz.draw: *

  let point(coord) = {
    circle(coord, radius:0.01)
    content(coord, coord, anchor: "south", padding: "0.1")
  }

  anchor("O", (0,0))
  anchor("M", (4,0.5))
  let deg = 230deg
  anchor("A", (2*calc.cos(deg),2*calc.sin(deg)))
  anchor("A'", (-2*calc.cos(deg),-2*calc.sin(deg)))
  circle(name: "G", "O", radius:2)
  line(name:"AM", "A", "M")

  intersections("C", "AM", "G")
  anchor("B","C.1")

  point("M")
  point("O")
  point("A")
  point("A'")
  point("B")
})

#set align(left)

==
===
Comme $[A A']$ forme un diamètre de $Gamma$, les vecteurs $arrow(A B)$ et $arrow(A' B)$ sont orthogonaux. Comme $arrow(M A)$ et $arrow(B A)$ sont colinéaires, $arrow(M A) perp arrow(A' B)$ et :
$ arrow(M A) dot arrow(M B) &= arrow(M A) dot arrow(M A ') + arrow(M A) dot arrow(A'B) \
&= arrow(M A) dot arrow(M A') $

===
Comme $[A A']$ est un diamètre de $Gamma$, en appliquant la formule de la médiane, $ arrow(M A) dot arrow(M B) = arrow(M A) dot arrow(M A') = O M^2 - R^2 $ 

==
===
TODO

===
Notons $H$ l'un des points $T$ ou $S$ : la preuve est la même pour les deux. Par définition des tangentes, le triangle $M H O$ est rectangle en $H$, et par Pythagore :
$ M H^2 + O H ^2 &= O M^2\
<==> P_Gamma (M) = O M^2 - O H ^2 = M H ^2 $

Ce qui prouve l'égalité.
==
- $cal(E)_1$ : Pour un point $M$ n'appartenant pas à $Gamma$, $O M != R$ et $O M^2 != R^2$, d'où $P_Gamma (M) != 0$. Donc $cal(E)_1 = emptyset$. (Alternativement, en étendant la définition de $P_Gamma$, $cal(E)_1 = Gamma$)
- $cal(E)_2$ et $cal(E)_3$ : Soit $M in cal(P) \\ Gamma$. Alors :
$ P_Gamma (M) < 0 &<=> O M^2 < R^2 \
&<=> O M < R $
Donc $cal(E)_2$ est l'intérieur de $Gamma$ et $cal(E)_3$ est l'extérieur de $Gamma$.

==
===
C'est un cercle (montrer que comme $P_Gamma$ est cste, $O M$ est constant)
$ M in cal(F)_k &<==> O M^2 = R^2 + k $
Comme $R$ et $k$ sont des constantes, $cal(F)_k$ est l'ensemble des points à une certaine distance du centre $O$. Ainsi :
- Si $k >= -R^2$, $cal(F)_k$ est un cercle de centre $O$ et de rayon $sqrt(R^2 + k)$
- Si $k < - R^2$, $cal(F)_k = emptyset$

===
:3:3

#sous-partie[Partie B - Critère de cocyclicité]
#counter(heading).update(1)
==
Notons $Gamma$ le cercle tel que $A,B,C,D in Gamma$. Comme $A,B,C,D$ sont disticts, $M$ n'appartient pas à $Gamma$.
Ainsi, le résultat du 1)b) d'unicité de la puissance d'un point s'applique et comme $[A B]$ et $[C D]$ sont des cordes de $Gamma$ :
$ arrow(M A)dot arrow(M B) = P_Gamma (M) = arrow(M C) dot arrow(M D) $
Ce qui donne l'égalité cherchée.

==
Supposons que $ arrow(M A)dot arrow(M B) = arrow(M C) dot arrow(M D) $
Par définition, $D, E in (M C)$. On a donc dans un premier temps $arrow(D E)$ et $arrow(M C)$ colinéaires.
De plus, comme $A,B,C,E$ sont sur un même cercle $Gamma$,  par unicité de la puissance d'un point, on obtient :
$ arrow(M A)dot arrow(M B) = P_Gamma (M) =  arrow(M C) dot arrow(M E) $
En faisant la différence des deux expressions de $arrow(M A)dot arrow(M B)$, on obtient :
$ arrow(M C) dot (arrow(M E) - arrow(M D)) &= arrow(M C) dot arrow(D E) \
&= arrow(0) $
Donc $arrow(D E) perp arrow(M C)$. Comme $arrow(D E)$ et $arrow(M C)$ sont à la fois perpendiculaires et colinéaires, et que $arrow(M C) != arrow(0)$, $arrow(D E) = arrow(0)$ et $E = D$.
Donc $A,B,C,D$ sont bien cocycliques.

==
Notons $Gamma$ le cercle circonscrit à $A B T$ et $O$ son centre. Soit $M in (A B)$. Comme $arrow(M A) dot arrow(M B) = P_Gamma (M) = O M^2 - R^2$, on trouve que :
$ O M^2 - R^2 = M T^2 <==> O M^2 = O T^2 + M T^2 $
Par le théorème de Pythagore, le triangle $O T M$ est rectangle en $T$ et $(M T)$ est bien tangente à $Gamma$

#sous-partie[Partie C - Quelques applications]
#counter(heading).update(1)

==
Notons $I$ le milieu de $[A B]$. Donc $arrow(I M) = 1/2 arrow(C A) + arrow(A M)$. Calculons $arrow(I M) dot arrow(D B)$ pour montrer que $(I M) perp (B D)$.
$ arrow(I M) dot arrow(D B) &= arrow(I M) dot arrow(D M) + arrow(I M) dot arrow(M B) \
&= 1/2 arrow(C A) dot arrow(D M) + underbrace((A M) dot arrow(D M), = 0) + 1/2 arrow(C A) dot arrow( M B) + underbrace((A M) dot arrow(M B), = 0)\
&= 1/2 arrow(C A) dot (arrow(D M) + arrow(M B))\
&= 1/2 arrow(C A) dot arrow(D M)\ 
&= 0 $

Donc $(I M) perp (D B)$ : comme $M in (I M)$, $(I M)$ est bien la hauteur issue de $M$ dans $M D B$.
==
===

===
==
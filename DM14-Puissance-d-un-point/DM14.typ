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
On peut tracer $I$ le milieu de $[O M]$ (faisable au compas et à la règle) et tracer le cercle $Omega$ de centre $I$ qui passe par $O$. Alors, si $T,S$ sont les points d'intersection de $Omega$ et $Gamma$, alors $T,S in Gamma$ et le triangle $O T M$ (respectivement $O S M$) est rectangle en $T$ (respectivement $S$) car $[O M]$ forme un diamètre de $Omega$ : $T,S$ sont donc les points de contact des tangentes à $Gamma$ passant par $M$.

#set align(center)
#cetz.canvas({
  import cetz.draw: *

  anchor("O", (0,0))
  anchor("M", (7,0))
  anchor("I", (3.5, 0))

  let R = 1
  let scale = 2
  let point(coord, name) = {
    circle(coord, radius:0.05, name:name)
    content(coord, name, anchor: "south-east", padding: 0.1)
  }

  circle("O", radius: scale*R, name: "Gamma")
  circle("I", radius: 3.5, name:"Omega")

  content((name:"Gamma", anchor: 130deg), [$Gamma$], anchor: "east", padding: 0.2)
  content((name:"Omega", anchor: 50deg), [$Omega$], anchor: "west", padding: 0.3)

  intersections("TS", "Omega", "Gamma")
  for-each-anchor("TS", (name) => {
    point("TS." + name, {
      if name == "0" {"T"} else {"S"}
    })
  })

  line("O", "M")
  line("M", "T")
  line("O", "T")
  line("M", "S")
  line("O", "S")

  point("O", "O")
  point("I", "I")
  point("M", "M")

  cetz.angle.right-angle("T", "O", "M", radius: 0.3)
  cetz.angle.right-angle("S", "O", "M", radius: 0.3)
})
#set align(left)

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
#set align(center)
#cetz.canvas({
  import cetz.draw: *

  let O = (0,0)
  let R = 1
  let scale = 2

  circle(O, radius: scale*R)
  circle(O, radius: scale*calc.sqrt(R*R - 3/4), name:"F34", stroke: blue)
  circle(O, radius: scale*calc.sqrt(R*R + 1), name:"F1", stroke: green)
  circle(O, radius: scale*calc.sqrt(R*R + 3), name:"F3", stroke: red)

  circle(O, radius: 0.01, name: "O")
  content("O", [O], anchor: "south", padding: 0.1)
  line(O, (R*scale,0), name:"Rad")
  content("Rad.70%", [1], anchor: "north", padding: 0.1)

  content((name:"F34", anchor: 45deg), [#text(blue)[$cal(F)_(3/4)$]], anchor: "west", padding: 0.1)
  content((name:"F1", anchor: 45deg), [#text(green)[$cal(F)_(1)$]], anchor: "west", padding: 0.1)
  content((name:"F3", anchor: 45deg), [#text(red)[$cal(F)_(3)$]], anchor: "west", padding: 0.1)
})


#set align(left)

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
$ arrow(B H) dot arrow(A C) &= (arrow(B K) + arrow(K H)) dot (arrow(A K) + arrow(K C))\
&= underbrace(arrow(B K) dot arrow(A K), =0) + arrow(B K) dot arrow(K C) + arrow(K H) dot arrow(A K) + underbrace(arrow(K H)dot arrow(K C), =0) \
&= arrow(B K) dot arrow(K C) + arrow(K H) dot arrow(A K) $

De plus, $arrow(B K) dot arrow(K C) = - arrow(K B) dot arrow(K C) = -P_Gamma (K)$

Et $arrow(K H) dot arrow(A K) = - arrow(K H) dot arrow(K A) =arrow(K A_1) dot arrow(K A)= P_Gamma (K)$

Donc $arrow(B H) dot arrow(A C) = 0$, et $H$ appartient à la hauteur issue de $B$.

===
Ce calcul est indépendant de l'ordre des sommets : ainsi, en permutant les sommets, on trouve que $H$ appartient aux hauteurs issues de $A,B$ et $C$ : $H$ est donc l'orthocentre du triangle $A B C$.
==
#underline([Lemme (Axe radical) :])
Si $Gamma$ et $Omega$ sont deux cercles différents d'intersection $T$ et $S$ #underline[distincts], alors le lieu des points $Pi = {M | P_Gamma (M) = P_Omega (M)}$ est la droite $(T S)$.

#underline[Preuve :] D'une part, si $M in (T S)$, comme $[T S]$ est une corde de $Gamma$ et de $Omega$, alors :
$ P_Gamma (M) = MT dot MS = P_Omega (M) $
Donc $M in Pi$.

D'autre part, soit $M in Pi$. Comme $P_Gamma (T) = 0 = Omega (T)$ et idem pour $S$, alors $T,S in Pi$ et on peut supposer $M != T,S$.

Tout d'abord, la droite $(M T)$ n'est pas tangente aux cercles $Gamma$ ou $Omega$ : si c'était le cas (sans perte de généralité, pour $Gamma$) alors $P_Gamma (M) = M T^2 = P_Omega (M)$ : Donc $(M T)$ serait tangente aux deux cercles en même temps, ce qui est une contradiction car $T in Gamma, Omega$.

Ainsi, on peut noter $R$ l'intersection de $(M T)$ et $Gamma$ différente de $T$ et $R'$ l'intersection de $(M T)$ et $Omega$ différente de $T$. On a donc :
$ P_Gamma (M)  = MR dot MT = P_Omega (M) = MR' dot MT $
En faisant la différence des équations, on trouve :
$ MT dot (MR' - MR) &= - MT dot (RM - arrow(R'M))\
&= -MT dot arrow(R R') = 0 $
Donc $MT perp arrow(R R')$. Mais $arrow(R R') \/\/ MT$, et on trouve donc que $R = R'$.

Ainsi, $(M T)$ intersecte $Gamma$ et $Omega$ en un même point, qui ne peut que être $S$. Donc $S in (M T)$ et $M in (T S)$, ce qu'il fallait démontrer.


#set align(center)
#figure(
  image("images/schema2.png")
)
#set align(left)

Notons maintenant $M$ l'intersection des deux perpendiculaires de l'énoncé. $M$ est l'intersection de deux hauteurs du triangle $A B C$ : c'est donc son orthocentre, qui est de plus dans le triangle car celui-ci n'a que des angles aigus (source: Wikipedia).

Notons $Gamma$ le cercle de diamètre $[A B]$ et $Omega$ le cercle de diamètre $[A C].$ Ceux-ci sont sécants en $A$, et comme l'angle $hat(B A C)$ ne peut être plat, en un second point $A'$. Comme $A' in Gamma$, le triangle $A A' B$ est rectangle en $A'$, et $A'$ est donc la base de la hauteur issue de $A$. Comme $M$ est l'orthocentre de $A B C$, on a donc enfin que $M in (A A')$.

Par le lemme précédent, $M$ est donc sur l'axe radical des cercle $Gamma$ et $Omega$ : Ainsi, on trouve que :
$ P_Gamma (M) = MP dot MQ = P_Omega (M) = MR dot MS $
Donc $MP dot MQ = MR dot MS$, et $P,Q,R,S$ sont cocycliques par le $B)2)$, ce qu'il fallait démontrer.

#set align(center)
#figure(
  image("images/schema.png")
)
#set align(left)
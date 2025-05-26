#import "./../templates/homework.typ": dm, sous-partie

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

===
:3:3

#sous-partie[Partie B - Critère de cocyclicité]
#counter(heading).update(1)
==

==

==

#sous-partie[Partie C - Quelques applications]
#counter(heading).update(1)

==

==
===

===
==
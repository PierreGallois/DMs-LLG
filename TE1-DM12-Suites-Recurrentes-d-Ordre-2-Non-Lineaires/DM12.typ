#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 12,
  titre: [Suites récurrentes d'ordre 2 non linéaires],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM12-Suites-Recurrentes-d-Ordre-2-Non-Lineaires/"

= 

Considérons la suite $(u_n)_(n in NN)$ définie par :
$
u_0 = 1, u_1 = 1 text("et pour tout") n in NN, u_(n+2) = sqrt(u_n) + sqrt(u_(n+1))
$

==

===

Pour tout $n in NN$, montrons que $u_n >= 1$ :

D'une part, $u_0 = 1$ et $u_1 = 1$ sont clairement supérieurs ou égaux à 1. D'autre part, pour tout $n in NN$, si $u_n >= 1$ et $u_(n+1) >= 1$. Alors, en utilisant la relation de récurrence, il vient : 
$
u_(n+2) = sqrt(u_n) + sqrt(u_(n+1)) >= sqrt(1) + sqrt(1) = 2 >= 1
$
Ainsi, par récurrence immédiate, pour tout $n in NN$, $u_n >= 1$.

===

===

==

===

===

===

===

===

===

=

Considérons la suite $(u_n)_(n in NN)$ définie par :
$
u_0 = 1, u_1 = 1 text("et pour tout") n in NN, u_(n+2) = 1/u_n + 1/u_(n+1)
$

==

===

Pour tout $n in NN$, montrons que $u_n >= 1$ :

D'une part, $u_0 = 1$ et $u_1 = 1$ sont clairement supérieurs ou égaux à 1. D'autre part, pour tout $n in NN$, si $u_n >= 1$ et $u_(n+1) >= 1$. Alors, en utilisant la relation de récurrence, il vient : 
$
u_(n+2) = 1/u_n + 1/u_(n+1) >= 1/1 + 1/1 = 2 >= 1
$
Ainsi, par récurrence immédiate, pour tout $n in NN$, $u_n >= 1$.

===

===

==

===

===

===

===

===

$
  text("Fin du DM12 - J'ai perdu.")
$
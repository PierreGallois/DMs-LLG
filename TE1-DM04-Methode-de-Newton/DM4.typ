#import "./../templates/homework.typ": dm, sous-partie, code-from-file

#show: dm.with(
  numero: 4,
  titre: [Méthode de Newton],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM04-Methode-de-Newton/"


= Description de la méthode de Newton


==

D'une part on sait que la fonction $f$ est dérivable donc continue sur $[a,b]$ et qu'elle y est strictement monotone  car $f'$ strictement négative.
D'autre part, on dispose de $f(a) > 0$ et de $f(b) < 0$.

Ainsi, d'après le corollaire du Théorème des Valeurs Intermédiaires, il existe un unique $alpha in [a,b]$ tel que $f(alpha) = 0$.

== 

=== 

Soit $u in [a,b]$. On note $tau_u$ la tangente à la courbe représentative de $f$ au point d'abscisse $u$. 

Ainsi, l'équation de $tau_u$ est donnée par :
$y = f'(u)(x - u) + f(u)$

Or $y = 0 <=> x = u - (f(u)) / (f'(u))$.

Par conséquent, $tau_u$ coupe donc l'axe des abscisses au point d'abscisse $u - (f(u)) / (f'(u))$.



===





= Algorithmes

==
==
==

Tentons maintenant de simplifier et d'optimiser ce code :

#code-from-file(folder-name, "newton_simplifie.py")

Pour aller encore plus loin dans la simplification, changeons de language pour Haskell :

#code-from-file(folder-name, "newton.hs")
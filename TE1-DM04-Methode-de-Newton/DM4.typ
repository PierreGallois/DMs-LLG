#import "./../templates/homework.typ": dm, sous-partie, code-from-file

#show: dm.with(
  numero: 4,
  titre: [Méthode de Newton],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM04-Methode-de-Newton/"


=

=

= Algorithmes

==
==
==

Tentons maintenant de simplifier et d'optimiser ce code :

#code-from-file(folder-name, "newton_simplifie.py")

Pour aller encore plus loin dans la simplification, changeons de language pour Haskell :

#code-from-file(folder-name, "newton.hs")
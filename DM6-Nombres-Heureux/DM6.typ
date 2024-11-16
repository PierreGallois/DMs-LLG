#import "./../templates/homework.typ": dm, code-from-file

#import "./code/karma.typ": karma
#import "./code/heureux.typ": heureux

#let folder-name = "DM6-Nombres-Heureux"
#show: dm.with(
  numero: 6,
  titre: [Nombres Heureux],
  sections: [Problème],
  alpha: true
)

= Description de l'algorithme
==
L'image de ... est ...
==
===

===
==

= Trajectoire des nombrse inférieurs à 100
==
Voici les programmes :
#code-from-file(folder-name, "/code/karma.typ")
#code-from-file(folder-name, "/code/heureux.py")

// #code-from-file(folder-name, "/code/heureux.typ")

Et le tableau :
#table(
  align: center,
  columns: 10,
  [X],
  ..array.range(1, 100)
    .map((n) =>
      if heureux(n) [*H*] else [m]
    )
)
==
La proba est de ...

= Trajectoires des nombres de chiffres
==

==

==
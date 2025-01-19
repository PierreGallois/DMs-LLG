#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 9,
  titre: [Fonction du Boulanger],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM9-Fonction-du-Boulanger"

=

==

==

La fonction `suite` repose naturellement sur de la récursivité. Nous allons donc la programmer dans un language qui supporte de manière optimale les fonctions récursives.

Voici `suite a p` en Haskell.

#code-from-file(folder-name, "/code/suite.hs")
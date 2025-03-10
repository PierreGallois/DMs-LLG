#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 11,
  titre: [Équation de Pell-Fermat],
  sections: [Partie],
  alpha: true
)
#let folder-name = "DM11-Equation-de-Pell-Fermat"

= Premières propriétés

= L'ensemble #text($ZZ[sqrt(5)] = {a + b sqrt(5) | a, b in ZZ}$, size: 0.8em)

= Détermination d'un élément générateur de $UU$.
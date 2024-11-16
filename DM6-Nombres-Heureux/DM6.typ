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

= Trajectoire des nombres inférieurs à 100
==

#block(breakable: false)[
  Réimplémentation de la fonction `karma` en python et en typst. 

  #grid(
    columns: (50% - 5pt, 10pt, 50% - 5pt),
    rows: (auto),
    code-from-file(folder-name, "/code/karma.py"),
    none,
    code-from-file(folder-name, "/code/karma.typ"),
  )
]

#block(breakable: false)[
  Création de la fonction `heureux` permettant de déterminer si un nombre `n` est heureux ou non :

  #grid(
    columns: (59% - 5pt, 10pt, 41% - 5pt),
    rows: (auto),
    code-from-file(folder-name, "/code/heureux.py"),
    none,
    code-from-file(folder-name, "/code/heureux.typ"),
  )

  Seul un nombre de la boucle (89) est testé pour simplifier le programme, la perte de vitesse engendrée est négligeable.
]

Pour obtenir la liste des nombreux heureux strictement inférieurs à 100, il suffit d'éxecuter le code python ```python [n for n in range(1, 101) if heureux(n)]```.

On récapitule le résultat dans le tableau suivant :

#{ // code pour le tableau
  let header-spacing = 8pt
  let cell-size = 20pt
  let array-cell-size = array.range(10).map(e => cell-size)

  let table-content = table(
    align: center,
    columns: array-cell-size,
    rows: array-cell-size,
    [X],
    ..array.range(1, 100)
      .map((n) => {
        if heureux(n) [*H*] else [m]
      })
  )

  stack(
    dir: ttb,
    spacing: header-spacing,
    stack(
      dir: ltr,
      h(cell-size + header-spacing),
      table(
        align: center,
        columns: array-cell-size,
        rows: cell-size,
        ..array.range(10).map(str)
      ),
    ),
    stack(
      dir: ltr,
      spacing: header-spacing,
      table(
        align: center,
        columns: cell-size,
        rows: array-cell-size,
        ..array.range(10).map(str)
      ),
      table-content,
    ),
  )
}

==
On utilise l'algorithme suivant pour calculer la probabilité qu'un nombre choisit au hasard entre 1 et 100 soit heureux :

#code-from-file(folder-name, "/code/probabilite.py")

On obtient une probabilité de $20%$.

= Trajectoires des nombres de chiffres
==

==

==
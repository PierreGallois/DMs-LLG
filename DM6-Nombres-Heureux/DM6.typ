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
En éxécutant l'algorithme pour $n=12med 345$, on trouve que son image est de $55$.

En l'éxécutant encore, on confirme bien que $157 arrow.r 75 arrow.r 74 arrow.r 65$.
==
A chaque itération, l'algorithme calcule le dernier chiffre $r$ en base $10$ du nombre $d$, ajoute à la somme $p$ le carré de $r$ et pose $d$ comme le $d$ précédant, sans son dernier chiffre en base 10.

L'algorithme calcule donc la somme des carrés des chiffres en base $10$ du nombre $n$.
==
===
Les nombres $157$, $175$, $517$, $571$, $715$ et $751$ ont les mêmes chiffres en base 10 : leurs images par la fonction karma sont donc identiques.

===
Soit $p in NN^*$. Alors le nombre $n_0 = overline(1dots 1)$ avec $p$ chiffres $1$ est un antécédant de $p$ par la fonction karma. De plus, si $k in NN^*$, alors le nombre $10^k n_0$ a $p$ chiffres 1 et $k$ chiffres 0 : c'est donc aussi un antécédant de $p$ par karma.

Donc $p$ a une infinité d'antécédants par la fonction karma.

===
Montrons par l'absurde que $157$ n'a pas d'antécédant à 3 chiffres par la fonction karma, en supposant que $overline(a b c)$ soit un antécédant de $157$.

Donc $157$ n'a pas d'antécédant à 3 chiffres. Cependant, $8852$ est un antécédant à 4 chiffres de $157$.

#block(breakable: false)[
= Trajectoire des nombres inférieurs à 100
==
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

#block(
  breakable: false,
  width: 100%,
  [On récapitule le résultat dans le tableau suivant :
#{ // code pour le tableau
  let header-spacing = 7pt
  let cell-size = 20pt
  let array-cell-size = array.range(10).map(_ => cell-size)

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

  align(
    center,
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
    ),
  )
}]
)

Il n'existe pas de nombre strictement inférieur à 100 qui soit ni heureux ni malheureux.

#block(breakable: false)[
==
  On utilise l'algorithme suivant pour calculer la probabilité qu'un nombre choisit au hasard entre 1 et 100 soit heureux :

  #code-from-file(folder-name, "/code/probabilite.py")

  On obtient une probabilité de $20%$.
]

= Trajectoires des nombres de chiffres
==

==

==

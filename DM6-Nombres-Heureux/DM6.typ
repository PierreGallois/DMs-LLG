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
Comme $3 dot 7^2 = 147 < 157$, au moins l'un des chiffres de $overline(a b c)$ est supérieur ou égal à 8. Comme l'image par la fonction karma de $overline(a b c)$ est indépendant de l'ordre, supposons sans perte de généralité que $a >= 8$.

Si $overline(a b c)$ est un antécédant de $157$, alors $a^2 + b^2 + c^2 equiv 7$ modulo $10$. Un carré vaut $0,1,4,5,6$ ou $9$ modulo $10$, et les sommes de deux carrés modulo 10 sont reportées dans le tableau ci-dessous.

#{
  let squares = (0,1,4,5,6,9)

  let entry(n) = {
    let column = calc.rem(n, 7);
    let row = calc.div-euclid(n, 7);
    if column == 0 {
      str(squares.at(row))
    } else{
      str(calc.rem(squares.at(row) + squares.at(column - 1),10))
    }
  }

  show table.cell: it => {
    if it.body == [3] {
      set text(blue)
      strong(it)
    } else if it.body == [6] and it.x != 0 and it.y != 0 {
      set text(red)
      strong(it)
    } else {
      it
    }
  }

  set align(center)
  table(
    align: center,
    columns:  array.range(7).map(_ => 20pt),
    rows:  array.range(7).map(_ => 20pt),
    [$+$], ..squares.map(str),
    ..array.range(0,42).map(entry)
  )
}

Si $a=8$, alors $a^2 equiv 4$ modulo 10. Il faut donc que $b^2 + c^2 equiv 3 mod 10$ et que $b$ et $c$ soient $9$ et $4$ (l'ordre n'importe pas). Mais $8^2 + 9^2 + 4^2 = 161 eq.not 157$. Donc $a eq.not 8$

Si $a=9$, $a^2 equiv 1 mod 10$, et $b^2 + c^2 equiv 6 mod 10$. Donc $b$ et $c$ sont $0$ et $6$, ou $1$ et $5$. Mais $9^2 + 0^2 + 6^2 = 117 eq.not 157$ et $9^2 + 1^2 + 5^2 = 107 eq.not 157$. Donc $a eq.not 9$.

Donc $overline(a b c)$ n'est pas un antécédant de $157$, ce qui est une contradiction.

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
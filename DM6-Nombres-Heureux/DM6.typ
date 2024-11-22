#import "./../templates/homework.typ": dm, code-from-file

#import "./code/karma.typ": karma
#import "./code/heureux.typ": heureux

#import "@preview/cades:0.3.0": qr-code // Pour la note de fin

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
Soit $p in NN^*$. Alors le nombre $n_0 = overline(1 dots 1)$ avec $p$ chiffres $1$ est un antécédant de $p$ par la fonction karma. De plus, si $k in NN^*$, alors le nombre $10^k n_0$ a $p$ chiffres 1 et $k$ chiffres 0 : c'est donc aussi un antécédant de $p$ par karma.

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
    code-from-file(folder-name, "/code/karma.py"), // Le code est stocké dans des fichiers séparés pour faciliter sa vérification (./code/)
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

= Typst

// On aime se compliquer la vie pour avoir un rendu parfait
#let TeX = {
  set text(font: "New Computer Modern",)
  let t = "T"
  let e = text(baseline: 0.22em, "E")
  let x = "X"
  box(t + h(-0.14em) + e + h(-0.14em) + x)
}
#let LaTeX = {
  set text(font: "New Computer Modern")
  let l = "L"
  let a = text(baseline: -0.35em, size: 0.66em, "A")
  box(l + h(-0.32em) + a + h(-0.13em) + TeX)
}

== 
Coder le dernier DM sur la méthode de Cardan, avec de nombreux polynomes donc, en #LaTeX nous a définitivement dégouté de sa syntaxe peu lisible et datée de nombreuses années. Nous avons cherché des alternatives et avons trouvé Typst (https://typst.app).

Typst permet de faire la même chose que #LaTeX, avec un rendu proche et des options de mise en page assez puissantes. Le language de programmation se rapproche _beaucoup_ plus des standarts (mélange de Rust et Markdown) et est _beaucoup_ plus lisible. Les syntaxes des formules mathématiques sont aussi grandement améliorées. De plus l'éxécutable Typst permettant de compiler vers pdf pèse une dizaine de Mo contre plusieurs Go pour #LaTeX et compiler un document Typst est _instantané_ ; les modifications s'affichent en temps réel.

Nous n'avons donc trouvé que des avantages à changer vers Typst.

== 
Quelques exemples de la puissance de Typst utilisée dans ce DM (des exemples plus orientés sur les formules mathématiques sont disponibles sur https://typst.app)

Mise en page complète : l'ensemble des titres avec les numéros sont bien sûr générés automatiquement. Ils sont adaptés au format du DM grâce à notre template (cf code du template sur Github).

Programmation puissante : Il est possible de coder des algorithmes directement dans le language Turing-complet de Typst. Nous avons mis l'équivalent en Typst des algorithmes de ce devoir à côté de ceux en python. Créer automatiquement le tableau récapitulatif est alors une tache très simple qui est remplie par ce code :

```c
table(
    align: center,
    columns: 20pt,
    [X],
    ..array.range(1, 100)
      .map((n) => {
        if heureux(n) [*H*] else [m]
      })
  )
```

Typst a une très bonne intégration avec les logiciels d'écriture du code (vscode) et de gestion de version (git) grâce à de puissants plugins créés par la communauté : par exemple cliquer sur la preview du document nous amène directement sur l'élèment correspondant dans le code, ou encore créer une nouvelle version du devoir (commit) compile automatiquement tous les documents modifiés (grâce à un script de notre création).

Enfin lorsque Typst ne possède pas nativement une fonctionnalité (le support du français et les encadrés sont natifs par exemple), des packages de base existent déjà. Par exemple, il a suffit d'une ligne d'import (pas d'installation compliquée) pour créer ce qr-code.

#v(1fr)
#figure(
  qr-code("https://github.com/PierreGallois/DMs-LLG", width: 3cm),
  caption: [
    Tous nos DMs, code et pdf, sont disponibles sur \
    github.com/PierreGallois/DMs-LLG
  ],
  supplement: none,
)
#v(1fr)
#import "./../templates/homework.typ": dm, code-from-file

#import "./code/karma.typ": karma
#import "./code/heureux.typ": heureux

#import "@preview/cades:0.3.0": qr-code // Pour la note de fin

#let folder-name = "DM06-Nombres-Heureux"
#show: dm.with(
  numero: 6,
  titre: [Nombres heureux],
  sections: [Partie],
  alpha: true
)

= Description de l'algorithme
==
En exécutant l'algorithme pour $n=12med 345$, on trouve que son image est de $55$.

En l'exécutant encore, on confirme bien que $157 arrow.r 75 arrow.r 74 arrow.r 65$.
==
A chaque itération, l'algorithme calcule le dernier chiffre $r$ en base $10$ du nombre $d$, ajoute à la somme $p$ le carré de $r$ et pose $d$ comme le $d$ précédant, sans son dernier chiffre en base 10.

L'algorithme calcule donc la somme des carrés des chiffres en base $10$ du nombre $n$.
==
===
Les nombres $157$, $175$, $517$, $571$, $715$ et $751$ ont les mêmes chiffres en base 10 : leurs images par la fonction karma sont donc identiques.

===
Soit $p in NN^*$. Alors le nombre $n_0 = overline(1 dots 1)$ avec $p$ chiffres $1$ est un antécédent de $p$ par la fonction karma. De plus, si $k in NN^*$, alors le nombre $10^k n_0$ a $p$ chiffres 1 et $k$ chiffres 0 : c'est donc aussi un antécédent de $p$ par karma.

Donc $p$ a une infinité d'antécédents par la fonction karma.

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

Donc $157$ n'a pas d'antécédent à 3 chiffres. Cependant, $8852$ est un antécédent à 4 chiffres de $157$.

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

Pour obtenir la liste des nombreux heureux strictement inférieurs à 100, il suffit d'exécuter le code python ```python [n for n in range(1, 101) if heureux(n)]```.

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

Il n'existe pas de nombre strictement inférieur à 100 qui ne soit ni heureux ni malheureux.

#block(breakable: false)[
==
  On utilise l'algorithme suivant pour calculer la probabilité qu'un nombre choisi au hasard entre 1 et 100 soit heureux :

  #code-from-file(folder-name, "/code/probabilite.py")

  On obtient une probabilité de $20%$.
]

= Trajectoires des nombres de $n$ chiffres
Pour des raisons pratiques, nous appelerons par la suite $f(n)$ l'image de $n in NN$ par la fonction karma.

==
===
Pour un nombre à $n$ chiffres, le nombre ayant la plus grande image est celui composé de $n$ neufs. Soit, pour un nombre $N$ à 3 chiffres, 999.
L'image de 999 par la fonction karma étant 243, $f(N)$ est majoré par 243.

Pour $f(f(N)) in bracket.l.double 100, 199 bracket.r.double$, $f(f(N))$ est majoré par $2 times 9^2 + 1$, soit $163$.

Pour $f(f(N)) in bracket.l.double 200, 243 bracket.r.double$, $f(f(N))$ est majoré par $2^2 + 3^2 + 9^2$, soit $94$.

$f(N)$ étant majoré par $243$, on en déduit que $f(f(N))$ est majoré par $163$.

===
Soit $n in bracket.l.double 100, 163 bracket.r.double$.
$f(n)$ est majoré par $107$.

Soit $n in bracket.l.double 100, 107 bracket.r.double$.
$f(n)$ est majoré par $50$.

On a donc montré que tout nombre à trois chiffres, lorsqu'on lui applique la fonction karma suffisamment de fois, finit par donner un nombre à deux chiffres.

Tout nombre à deux chiffres étant toujours soit heureux soit malheureux, et tout nombre à trois chiffres retombant toujours à un nombre à deux chiffres, on en déduit que tout nombre à trois chiffres est ou bien heureux, ou bien malheureux, c'est-à-dire, $P(3)$ est vraie.

==
===
Montrons par récurrence que pour tout entier $n gt.eq.slant 4$, on a $n times 9^2 lt.eq.slant 10^(n-1) - 1$.

- Initialisation, pour $n = 4$ :

  $4 times 9^2 = 324$ et $10^3 - 1 = 999$. L'inégalité est donc vérifiée pour $n = 4$.

- Hérédité : Soit $n in NN, "avec" n gt.eq.slant 4$. On suppose que :

$ n times 9^2 lt.eq.slant 10^(n-1) - 1 <==> 10^(n-1) - 81n - 1 gt.eq.slant 0 $

Montrons que $(n+1) times 9^2 lt.eq.slant 10^n - 1$.

$ &     & (n+1) times 9^2                            & lt.eq.slant 10^n - 1 \
  &<==> & 9 times 10^(n-1) + 10^(n-1) - 1 - 81n - 81 & gt.eq.slant 0 \
  &<==> & 10^(n-1) - 81n - 1 + 9(10^(n-1) - 9)       & gt.eq.slant 0 \
  &<==> & 10^(n-1) - 81n - 1                         & gt.eq.slant - 9(10^(n-1) - 9)
$

Or $n gt.eq.slant 4$, donc $10^(n-1) gt.eq.slant 1000$. Alors $10^(n-1) gt.eq.slant 9$, i.e. $10^(n-1) - 9 gt.eq.slant 0$.

Donc $-9(10^(n-1) - 9) lt.eq.slant 0$. Or d'après l'hypothèse de récurrence, $10^(n-1) - 81n - 1 gt.eq.slant 0$. Donc l'inégalité $10^(n-1) - 81n - 1 gt.eq.slant - 9(10^(n-1) - 9)$ est vérifiée, et par équivalence, l'inégalité $(n+1) times 9^2 lt.eq.slant 10^n - 1$ l'est aussi.

On a donc montré par récurrence que pour tout entier $n gt.eq.slant 4$, on a $n times 9^2 lt.eq.slant 10^(n-1) - 1$.

==
On réutilise l'agorithme ci-dessus, et on trouve une probabilité de 14.42% pour qu'un nombre entre 1 et $10000$ soit heureux.

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
Coder le dernier DM sur la méthode de Cardan, avec de nombreux polynômes donc, en #LaTeX nous a définitivement dégouté de sa syntaxe peu lisible et datée de nombreuses années. Nous avons cherché des alternatives et avons trouvé Typst (https://typst.app).

Typst permet de faire la même chose que #LaTeX, avec un rendu proche et des options de mise en page assez puissantes. Le language de programmation se rapproche _beaucoup_ plus des standards (mélange de Rust et Markdown) et est _beaucoup_ plus lisible. Les syntaxes des formules mathématiques sont aussi grandement améliorées. De plus l'exécutable Typst permettant de compiler vers PDF pèse une dizaine de Mo contre plusieurs Go pour #LaTeX et compiler un document Typst est _instantané_ ; les modifications s'affichent en temps réel.

Nous n'avons donc trouvé que des avantages à migrer vers Typst.

== 
Quelques exemples de la puissance de Typst utilisée dans ce DM (des exemples plus orientés sur les formules mathématiques sont disponibles sur https://typst.app)

Mise en page complète : l'ensemble des titres avec les numéros sont bien sûr générés automatiquement. Ils sont adaptés au format du DM grâce à notre template (cf code du template sur GitHub).

Programmation puissante : Il est possible de coder des algorithmes directement dans le language Turing-complet de Typst. Nous avons mis l'équivalent en Typst des algorithmes de ce devoir à côté de ceux en Python. Créer automatiquement le tableau récapitulatif est alors une tâche très simple qui est remplie par ce code :

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

Typst a une très bonne intégration avec les logiciels d'écriture du code (VS Code) et de gestion de version (git) grâce à de puissants plugins créés par la communauté : par exemple cliquer sur la preview du document nous amène directement sur l'élèment correspondant dans le code, ou encore créer une nouvelle version du devoir (commit) compile automatiquement tous les documents modifiés (grâce à un script de notre création).

Enfin lorsque Typst ne possède pas nativement une fonctionnalité (le support du français et les encadrés sont natifs par exemple), des packages de base existent déjà. Par exemple, il a suffi d'une ligne d'import (pas d'installation compliquée) pour créer ce QR-code.

#pagebreak()
#v(1fr)
#figure(
  qr-code("https://www.youtube.com/watch?v=dQw4w9WgXcQ", width: 3cm),
  caption: [
    Tous nos DMs, code et PDF, sont disponibles sur \
    github.com/PierreGallois/DMs-LLG
  ],
  supplement: none,
)
#v(1fr)
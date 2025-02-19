#import "./../templates/homework.typ": dm, code-from-file
#import "tropiques.typ": *
#import "polynomes.typ": *

#show: dm.with(
  numero: 10,
  titre: [Droites Tropicales],
  sections: [Partie],
  alpha: true
)
#let folder-name = "DM10-Droites-Tropicales"

// Auto-transform style of letters :
#show math.equation: it => {
  show regex("^A$") : math.cal("A")
  show regex("^B$") : math.cal("B")
  show regex("^C$") : math.cal("C")
  show regex("^H$") : math.cal("H")
  show regex("^V$") : math.cal("V")
  show regex("^D$") : math.cal("D")
  show regex("^i$") : math.accent("i", math.arrow)
  show regex("^j$") : math.accent("j", math.arrow)
  it
}


= Les droites tropicales

/ $(A')$ : "Par deux points du plan passe une droite tropicale."

/ $(B')$ : "Par deux points quelconques indépendants du plan passe une et une seule droite tropicale."

/ $(C')$ : "Deux droites tropicales dont les points centraux sont indépendants se coupent toujours en un unique point."

==
===
#exemples()

===
On cherche à prouver $(A')$.
Soient $A$ et $B$ deux points quelconques du plan. Par une translation $T$ on se ramène au cas où :
$
  A(0, 0) "et" B(x, y) "avec" x in RR "et" y in RR
$

Etudions d'abord des cas particuliers :

/ Si $x = 0$ et $y = 0$ : alors $A = B$, la droite tropicale de centre $A$ convient.
/ Si $y = 0$ : alors la droite tropicale de centre $C(max(0, x), 0)$ convient.
/ Si $x = 0$ : alors la droite tropicale de centre $C(0, max(0, y))$ convient.
/ Si $x = y$ : alors la droite tropicale de centre $C(min(0, x), min(0, y))$ convient.

Attaquons nous désormais aux cas généraux :

==== Si $x < 0$ et $y > 0$

#table(
  columns: 2,
  column-gutter: 1em,
  stroke: none,
  align(center + horizon, illustration(15pt, ill-squares)),
  align(center + horizon, figure(style-square(25pt), caption: [style], supplement: none))
)

Il existe $C(0, y)$.
Soient les demi-droites :
$
  H &: [C, B) "par construction," H "est parallèle à l'axe des abscisses." \
  V &: [C, A) "par construction," V "est parallèle à l'axe des ordonnées."
$

Comme $x < 0$, $H$ est de direction $-i$ et comme $y > 0$, $V$ est de direction $-j$.
Donc $A$ et $B$ appartiennent à la droite tropicale de centre $C$.

En inversant les rôles de $A$ et $B$, on obtient la deuxième partie rayée.

==== Si $x > 0$ et $y > 0$ et $y > x$

#table(
  columns: 2,
  column-gutter: 1em,
  stroke: none,
  align(center + horizon, illustration(15pt, ill-triangles-up)),
  align(center + horizon, figure(style-triangle-up(25pt), caption: [style], supplement: none))
)

Soit $D'$ la droite parallèle à $y = x$ et passant par $B$.
On nomme $C$ l'intersection entre $D'$ et l'axe des ordonnées.
Comme $y > x$, $y_C > 0$.
Soient les demi-droites :
$
  D &: [C, B) "par construction," D "est de direction" i + j \
  V &: [C, A) "par construction," V "est de direction" -j
$
Donc $A$ et $B$ appartiennent à la droite tropicale de centre $C$.

En inversant les rôles de $A$ et $B$, on obtient que pour $0 > x$ et $0 > y$ et $x > y$, $A$ et $B$ appartiennent à la droite tropicale de centre $C$, soit la deuxième zone rayée.

==== Si $x > 0$ et $y > 0$ et $y < x$

#table(
  columns: 2,
  column-gutter: 1em,
  stroke: none,
  align(center + horizon, illustration(15pt, ill-triangles-down)),
  align(center + horizon, figure(style-triangle-down(25pt), caption: [style], supplement: none))
)

Doit $D'$ la droite parallèle à $y = x$ et passant par $B$.
On nomme $C$ l'intersection entre $D'$ et l'axe des abscisses.
Comme $y < x$, $x_C > 0$.
Soient les demi-droites :
$
  D &: [C, B) "par construction," D "est de direction" i + j \
  H &: [C, A) "par construction," H "est de direction" -i
$
Donc $A$ et $B$ appartiennent à la droite tropicale de centre $C$.

En inversant les rôles de $A$ et $B$, on obtient que pour $0 > x$ et $0 > y$ et $x < y$, $A$ et $B$ appartiennent à la droite tropicale de centre $C$, soit la deuxième zone rayée.

==== Conclusion

En combinant les différentes disjonctions de cas démontrées plus haut on obtient :

#illustration(20pt,
  (env) => {
    ill-squares(env)
    ill-triangles-up(env)
    ill-triangles-down(env)  
  }
)

Le cas des lignes noires est couvert par les cas particuliers.
Nous avons donc prouvé que pour tout point quelconque $B$, il existe une droite tropicale passant par $B$ et par l'origine $A$. Nous pouvons revenir au cas général avec deux points quelconques par la translation inverse de $T$.

Nous avons donc démontré $(A')$ : par deux points du plan passe une droite tropicale.

==
===
La propriété $(B)$ n'est pas vraie pour les droites tropicales dans le cas de deux points dépendants.

Contre-exemple : Prenons les points $A(0, 0) "et" B(1, 0)$, qui sont dépendants. La droite tropicale de point central $C_1 (2, 0)$ passe par $A$ et par $B$, mais celle de point central $C_2 (3, 0)$ aussi. Il y a même une infinité de droites tropicales passant par ces deux points : toutes celles dont le point central est d'ordonnée nulle et d'abscisse supérieure à 1.

= Addition et Multiplication tropicales

#let tadd = math.class(
  "relation",
  sym.plus.circle
)

#let tmul = math.class(
  "relation",
  sym.times.circle
)

On définit sur $RR$ l'addition tropicale et la multiplication tropicale tel que pour tous $a, b in RR$,
$
  a tadd b = max(a, b) #h(1em) "et" #h(1em) a tmul b = a + b
$

==
On a donc : #h(1fr) $3 tadd 7 = 7$ #h(1fr) $-5 tadd 2 = 2$ #h(1fr) $3 tmul 7 = 10$ #h(1fr) $-5 tmul 2 = -3$

== 
$tadd$ est associatif et commutatif car $max$ est associatif et commutatif.

Soient $a, b, c in RR$. Supposons sans perte de généralité que $b <= c$ car $tadd$ est commutatif.

On a $a tmul (b tadd c) = a tmul c = a tmul b tadd a tmul c "puisque" a tmul b <= a tmul c$.

==

Voici à quoi ressemble une fonction tropicale
#footnote[Pour des raisons esthétiques, nous utilisons dans les graphiques l'opposé des valeurs de $x$ et $y$.]
de degré 1 :
$a tmul x tadd b tmul y tadd c$ :

#align(center)[
  $1 tmul x tadd 1 tmul y tadd 1$ \
  #premier-degre(20, teal, 1, 1, 1)
]


#table(
  columns: 3,
  stroke: none,
  align(center)[
    $1 tmul x tadd 5 tmul y tadd 1$ \
    #premier-degre(6, purple.lighten(30%), 1, 4, 1)
  ],
  align(center)[
    $5 tmul x tadd 1 tmul y tadd 1$ \
    #premier-degre(6, olive, 4, 1, 1)
  ],
  align(center)[
    $1 tmul x tadd 1 tmul y tadd 5$ \
    #premier-degre(6, yellow.darken(10%), 1, 1, 4)
  ]
)

On remarque que modifier les valeurs $a$, $b$ et $c$ "décale" l'un des "bords".

#pagebreak()
==
Voici à quoi ressemble la fonction tropicale du second degré
#footnote[On prend l'opposé pour l'axe $y$] :
$ 1 tadd (-1) tmul x tadd 0 tmul y tadd (-5) tmul x^2 $

#table(
  columns: 2,
  stroke: none,
  [
    D'un côté :
    #align(center)[
      #second-degre(green.saturate(50%), 1)
    ]
  ],
  [
    De l'autre en prenant l'opposé pour l'axe $x$ :
    #align(center)[
      #second-degre(lime.lighten(50%), -1)
    ]
  ]
)



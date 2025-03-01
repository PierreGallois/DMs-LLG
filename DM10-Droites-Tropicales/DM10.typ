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

#let equiv = $#h(1em)&<=>#h(1em)$
#let arrow = $#h(1em)&->&#h(1em)$

= Les droites tropicales

/ $(A')$ : "Par deux points du plan passe une droite tropicale."

/ $(B')$ : "Par deux points quelconques indépendants du plan passe une et une seule droite tropicale."

/ $(#strong($cal(D)$)')$ : "Deux droites tropicales dont les points centraux sont indépendants se coupent toujours en un unique point."
// Voir https://github.com/typst/typst/issues/5913 pour comprendre la ligne d'au-dessus
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

#pagebreak()
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

Contre-exemple : Prenons les points $A(0, 0)$ et $B(1, 0)$, qui sont dépendants. La droite tropicale de point central $C(2, 0)$ passe par $A$ et par $B$, mais celle de point central $C'(3, 0)$ aussi. Il y a même une infinité de droites tropicales passant par ces deux points : toutes celles dont le point central est d'ordonnée nulle et d'abscisse supérieure à 1.

===
Prouvons tout d'abord $(B'')$ : "Si deux droites tropicales se coupent en plus d'un point alors ces points sont dépendants."

Soient $C$ et $C'$ deux centres non confondus de droite tropicale. On réalise une translation $T$ pour se ramener au cas où $C(0, 0)$ et $C'(x, y)$ avec $x, y in RR$.

==== Si $C$ et $C'$ sont dépendants
/ Si $x = 0$ : alors les droites tropicales de centre $C$ et $C'$ se coupent dans l'infinité de points dont l'abscisse est nulle et l'ordonnée inférieure à 0.
/ Si $y = 0$ : alors les droites tropicales de centre $C$ et $C'$ se coupent dans l'infinité de points dont l'ordonnée est nulle et l'abscisse inférieure à 0.
/ Si $x = y$ : alors les droites tropicales de centre $C$ et $C'$ se coupent dans l'infinité de points dont l'abscisse et l'ordonnée sont égales, positives et supérieures ou égales à $x$.

Nous avons prouvé que si $C$ et $C'$ sont dépendants alors les droites tropicales leur correspondant se coupent en une infinité de points _qui sont tous dépendants les uns des autres_.

==== Si $C$ et $C'$ sont indépendants
On nomme respectivement $H$, $V$ et $D$ les demi-droites de direction $-i$, $-j$ et $i+j$ contituant la droite tropicale $C$. On fait de même pour $C'$ avec $H'$, $V'$ et $D'$.

Par définition, ($H$ et $H'$), ($V$ et $V'$) et ($D$ et $D'$) sont respectivement parallèles non confondus puisque qu'elles sont de même direction et que $C != C'$.

/ Si $y > 0$ et $x < 0$ : alors $V'$ coupe $H$ en $I$. $H'$ et $V'$ ne peuvent pas couper $D$ puisque tous les points de $D$ sont d'ordonnée positive et ceux de $H'$ et $V'$ d'ordonnée strictement négative. $H'$ ne peut pas couper $V$ puisque tous les points de $H'$ sont d'ordonnée strictement positive. $D'$ ne peut pas couper $H$ ou $V$ puisque tous les points de $D'$ sont d'ordonnée strictement positives.
De manière similaire :
#footnote[Il s'agit des mêmes disjonctions qu'à la question 1b sur $(A')$]
/ Si $y > 0$ et $x > 0$ et $y > x$ : alors $V'$ coupe $D$ en $I$. etc$...$
/ Si $y < 0$ et $x < 0$ et $y > x$ : alors $D'$ coupe $H$ en $I$. etc$...$
/ Si $y < 0$ et $x < 0$ et $y < x$ : alors $D'$ coupe $V$ en $I$. etc$...$
/ Si $y > 0$ et $x > 0$ et $y < x$ : alors $H'$ coupe $D$ en $I$. etc$...$
/ Si $y < 0$ et $x > 0$ : alors $H'$ coupe $V$ en $I$. etc$...$

Il n'y a aucune intersection autre que $I$ entre les demi-droites pour chacun des cas, donc deux droites tropicales dont les centres sont indépendants se croisent en un unique point.

==== Conclusion
Nous avons démontré $(B'')$, que si deux droites tropicales se coupent en plus d'un point alors ces points sont dépendants.

On cherche maintenant à prouver $(B')$ : "Par deux points quelconques indépendants du plan passe une et une seule droite tropicale."

Nous savons d'après $(A')$ qu'il existe au minimum une droite tropicale passant par deux points quelconques du plan.

Raisonnons par l'absurde, supposons qu'il existe plus qu'une droite tropicale passant par deux points indépendants. Il est alors _nécessaire_ qu'il existe deux droites tropicales qui se coupent en ces deux points indépendants. Or deux droites tropicales se coupent en plus d'un point _implique_ que ces points soient dépendants, ce qui est en contradiction avec l'hypothèse de départ.

Nous avons démontré $(B')$.
#h(1fr) $qed$
==
On chercher à prouver $(C')$ : "Deux droites tropicales dont les points centraux sont indépendants se coupent toujours en un unique point."

Soient $C$ et $C'$ deux centres de droites tropicales, indépendants.
Par une translation $T$, on se ramène à $C(0, 0)$ et $C'(x, y)$ avec $x in RR$ et $y in RR$. Comme $C$ et $C'$ sont indépendants, $x != 0$, $y != 0$, $x != y$.

On nomme respectivement $H$, $V$ et $D$ les demi-droites de direction $-i$, $-j$ et $i+j$ contituant la droite tropicale $C$. On fait de même pour $C'$ avec $H'$, $V'$ et $D'$.
#pagebreak()
/ Si $y > 0$ et $x < 0$ : alors $V'$ coupe $H$ en $I$.
/ Si $y > 0$ et $x > 0$ et $y > x$ : alors $V'$ coupe $D$ en $I$.
/ Si $y < 0$ et $x < 0$ et $y > x$ : alors $D'$ coupe $H$ en $I$.
/ Si $y < 0$ et $x < 0$ et $y < x$ : alors $D'$ coupe $V$ en $I$.
/ Si $y > 0$ et $x > 0$ et $y < x$ : alors $H'$ coupe $D$ en $I$.
/ Si $y < 0$ et $x > 0$ : alors $H'$ coupe $V$ en $I$.

Il n'y a aucune intersection autre que $I$ entre les demi-droites pour chacun des cas, donc $I$ est bien l'unique intersection de deux droites tropicales.

==
Voici l'exemple donné de triangle tropical :

#align(center, triangle-exemple(30pt))

Il est spécifié que dans cet exemple, $hat(A) + hat(B) + hat(C) = 360 degree$.

===
On considère le triangle tropicale suivant :

#align(center, triangle-exemple-modifie(30pt))

On a repris la figure de l'exemple, sur laquelle on a rajouté $2$ à l'abscisse de $C_2$.

$C^*$ représente l'emplacement de $C$ sur l'ancienne figure. $hat(A)$ et $hat(B)$ ne sont pas impactés par le changement, par contre alors que $hat(C^*)$ était obtus, $hat(C)$ est droit. Donc $hat(A) + hat(B) + hat(C) < 360$.

L'égalité $hat(A) + hat(B) + hat(C) = 360$ n'est pas vrai pour tous les triangles tropicaux.

===
Soient $C_1$, $C_2$, $C_3$ trois points indépendants du plan, centres de trois droites tropicales et sommets d'un triangle tropical.

D'après $(C')$, les trois intersections $A$, $B$, $C$ des trois droites tropicales doivent exister.

Il existe deux intersections sur une demi-droite de direction $-i$, $-j$ ou $i + j$ *si et seulement si* les deux intersections sont dépendantes.

Or on suppose $A$, $B$, $C$ indépendants donc chaque demi-droite possède _au plus_ une intersection.

Nous savons donc que chaque droite tropicale possède deux intersections qui sont répartis entre ses trois demi-droites.
Donc l'unique cas de figure possible est que chacune des trois intersections soit entre deux demi-droites dont la combinaisons de leur direction est inédite.
#footnote[En effet, soient deux directions, pour avoir deux fois une intersection entre des demi-droites ayant ces directions, comme cela arrive à la figure de la question 4) a), il est nécessaire que la troisième demi-droite formant les intersections (appartenant à $C_2$ dans l'exemple) possède deux intersections, ce qui est contraire à la conclusion que chaque demi-droite possède _au plus_ une intersection.]

Or, l'intersection entre une demi-droite de direction $-i$ et $-j$ donne un angle de $90 degree$. $i + j$ et $-i$ donne $90 degree + 45 degree$. $i + j$ et $-j$ donne $90 degree + 45 degree$.

La somme des angles d'un triangle tropical dont les sommets sont indépendants donne donc $4 times 90 degree = 360 degree$.

#v(1fr)

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
Soient $a, b, c in RR$ les paramètres du polynome de premier degré et $(x, y) in RR^2$ représentant les points du plan.

#v(1fr)

#pagebreak()
==== Visualisation graphique

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

==== Démonstration

On recherche le lieu (les droites) qui permettent d'atteindre deux fois le maximum dans $P_T = max(a + x, b + y, c)$, ce qui est vrai si et seulement si :
$
  a + x = c     #equiv x = c - a      #arrow "parallèle à l'ordonnée" \
  b + y = c     #equiv y = c - b      #arrow "parallèle à l'abscisse" \
  a + x = b + y #equiv x - y = b - a  #arrow "parallèle à" x = y \
$

Nous avons donc bien trois droites habituelles avec les bonnes directions qui permettraient de former une droite tropicale si ces trois droites se coupaient au même point.
#footnote[En effet, trois droites parallèles à l'abscisse, l'ordonnée et $x = y$ qui se croisent en un point $cal(C)$ permettent de former trois demi-droites partant de $cal(C)$ dans les direction $-accent(i, #math.arrow)$, $-accent(j, #math.arrow)$ et $accent(i, #math.arrow) + accent(j, #math.arrow)$ et donc de former une droite tropicale de centre $cal(C)$.]
// Les regex n'ont pas l'air de marcher dans les footnotes

Or $x - y = (c-a) - (c-b) = b - a$, donc le point $C(c-a, c-b)$ appartient aux trois droites et est le centre de la droite tropicale.
#footnote[Dans l'espace, le point $cal(C)(c-a, c-b, c)$ est bien l'intersection des trois droites.]

Par ailleurs, remplacer $x$ et $y$ par $c-a$ et $c-b$ dans $max(a + x, b + y, c)$ permet bien d'atteindre trois fois le maximum.

Le lieu des coins de $P_T$ est une droite tropicale de centre $C(c-a, c-b)$.

#v(1fr)

==
Soient $(x, y) in RR^2$ représentant les points du plan.

==== Visualisation graphique
Voici à quoi ressemble la fonction tropicale du second degré
#footnote[On prend l'opposé pour l'axe $y$] :
$ Q_T (x, y) = 1 tadd (-1) tmul x tadd 0 tmul y tadd (-5) tmul x^2 $

#block(breakable: false)[
#table(
  columns: 2,
  stroke: none,
  [
    D'un côté :
    #footnote[Il est interessant de remarquer que les deux lignes montantes ne sont pas des droites contrairement à ce que l'on pourrait penser. Il s'agit d'un polynôme du second degré étiré.]
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
)]

#v(1fr)
#pagebreak()
==== Démonstration
De manière similaire à ce que nous avons réalisé pour le polynôme de premier degré, recherchons les ensembles de points permettant d'atteindre deux fois le maximum $Q_T (x, y) = max(1, x-1, y, x^2-5)$ :
$
  1 = x-1     #equiv x = 2                           #arrow "parallèle à l'ordonnée" \
  x-1 = y     #equiv x - y = 1                       #arrow "parallèle à" x = y \
  y = 1       #equiv y = 1                           #arrow "parallèle à l'abscisse" \
  x^2-5 = 1   #equiv x = plus.minus sqrt(6)          #arrow "parallèle à l'ordonnée" \
  x^2-5 = x-1 #equiv x = (1 plus.minus sqrt(17)) / 2 #arrow "parallèle à l'ordonnée" \
  x^2-5 = y   #equiv x^2 - y = 5                     #arrow "n'est pas une droite" \
$

Pour réaliser une droite tropicale, nous avons besoin d'une droite parallèle à l'abscisse et d'une parallèle à $x = y$, nous devons donc nécessairement utiliser $y = 1$ et $x - y = 1$ et nous ne pourrons construire qu'une seule droite tropicale.
En combinant ces deux équations nous obtenons $x = 2$ comme point de croisement. La droite $x = 2$ que nous avons précedement déterminée passe par ce point et convient donc.

Le lieu des coins de $Q_T$ est la droite tropicale de centre $C(2, 1)$.
#h(1fr) $qed$
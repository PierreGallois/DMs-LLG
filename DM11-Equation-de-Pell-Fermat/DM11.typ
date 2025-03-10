#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 11,
  titre: [Équation de Pell-Fermat],
  sections: [Partie],
  alpha: true
)
#let folder-name = "DM11-Equation-de-Pell-Fermat"

= Premières propriétés

$
  (E) : x^2 - 5 y^2 = 1
$

== Symétries :
Les variables $x$ et $y$ sont mises au carré dans $(E)$ et donc toujours positives.
Donner un nombre négatif présent dans $ZZ$ est équivalent à donner son opposé qui est dans $NN$.
Il suffit donc de chercher toutes les solutions $(x, y)$ positives qui sont dans $NN^2$ pour obtenir toutes les solutions dans $ZZ^2$ de $(E)$.

== Nombre de solutions

===
Soient $a,b in NN$.
$
  (a^2 - 5b^2)^2
  &= (a^2 + 5b^2 - 10b^2)^2 \
  &= (a^2 + 5b^2)^2 + (10b^2)^2 - 2(a^2 + 5b^2)(10b^2) \
  &= (a^2 + 5b^2)^2 + 100b^4 - 20a^2b^2 - 100b^4 \
  (a^2 - 5b^2)^2
  &= (a^2 + 5b^2)^2 - 5(2a b)^2 #h(3em) #text(font:"Libertinus Serif", smallcaps[Brahmagupta])
$

===
Soient $(x, y) in NN^2$, tel que $(x, y) != (1, 0)$ et $(x, y)$ solution de $(E) : x^2 - 5 y^2 = 1.$

D'après #smallcaps[Brahmagupta], on obtient $(E) <=> (x^2 + 5y^2)^2 - 5(2x y)^2 = 1$

Or en remplaçant $X := x^2 + 5y^2, Y := 2x y$, on a $X^2 - 5Y^2 = 1$

$(X, Y) in NN^2$ et $(X, Y) != (x, y)$ car $(x, y) != (1, 0)$. Cette nouvelle équation étant équivalente à $(E)$, $(X, Y)$ est donc une nouvelle solution de $(E)$.

On peut itérer cette opération autant de fois que l'on veut. Pour une solution $(x, y)$ de $(E)$, $(x^2 + 5y^2, 2x y)$ est aussi solution. S'il existe au moins une solution de $(E)$ différente de $(0, 1)$, alors il en existe une infinité.


= L'ensemble #text($ZZ[sqrt(5)] = {a + b sqrt(5) | a, b in ZZ}$, size: 0.8em)

= Détermination d'un élément générateur de $UU$.
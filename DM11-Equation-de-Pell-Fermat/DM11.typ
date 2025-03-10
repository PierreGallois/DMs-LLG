#import "./../templates/homework.typ": dm, code-from-file

// On oublie ça marche pas car ils ont merge des trucs faux
// #import "./local_lib/plotst/lib.typ": *
// // La version de typst-plotting (plotst) disponible sur typst Universe est incompatible avec typst 3.13
// // A executer depuis DMs-LLG:
// // cd DM11-Equation-de-Pell-Fermat && mkdir local_lib && cd local_lib && mkdir plotst && cd plotst && git clone https://github.com/Pegacraft/typst-plotting.git . && rm .git/ -rf
// // Si vous êtes sous windows, c'est votre faute débrouillez vous (ça peut se faire à la main ou facilement traduit)
// // PUIS modifier _à la main_ les imports de la librairie pour que le dossier parent pour les liens relatifs soit DMs-LLG :-)
// // conseil : utiliser la fonctionnalité copier le lien relatif de vscode en sélectionnant le fichier dans l'onglet explorer

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
Soit $(x, y) in NN^2$, tel que $(x, y) != (1, 0)$ et $(x, y)$ solution de $(E) : x^2 - 5 y^2 = 1$.

D'après #smallcaps[Brahmagupta], on obtient $(E) <=> (x^2 + 5y^2)^2 - 5(2x y)^2 = 1$

Or en remplaçant $X := x^2 + 5y^2, Y := 2x y$, on a $X^2 - 5Y^2 = 1$

$(X, Y) in NN^2$ et $(X, Y) != (x, y)$ car $(x, y) != (1, 0)$. Cette nouvelle équation étant équivalente à $(E)$, $(X, Y)$ est donc une nouvelle solution de $(E)$.

On peut itérer cette opération autant de fois que l'on veut. Pour une solution $(x, y)$ de $(E)$, $(x^2 + 5y^2, 2x y)$ est aussi solution. S'il existe au moins une solution de $(E)$ différente de $(0, 1)$, alors il en existe une infinité.

===
Soit $(a, b)$ une solution de $(E)$ avec $a, b in NN^*$.
On a donc :
$
  &(E) : a^2 - 5 b^2 = 1 \
  &<=> a^2 = 1 + 5b^2 \
  &<=> a = sqrt(1 + 5b^2)
$
car $a in NN$, $b in NN$ donc $a >= 0$, $1 + 5b^2 >= 0$.

Une telle fonction est donc
$
  f: NN &-> RR_+ \
  b &|-> sqrt(1 + 5b^2)
$
La solution est valide si et seulement si $f(b) in NN$.

Voici un script Haskell qui détermine des couples solution :
#code-from-file(folder-name, "calc_sol.hs")

On obtient :
```
[4, 72, 1292, 23184, 416020, 7465176, 16692641, 24157817, 31622993, 48315634, 55780810, 63245986, 79938627, 87403803, 94868979, 111561620, 119026796, 126491972, 133957148, ..., 3077073806,3077489826, 3078836095, ...]
```

= L'ensemble #text($ZZ[sqrt(5)] = {a + b sqrt(5) | a, b in ZZ}$, size: 0.8em)

= Détermination d'un élément générateur de $UU$.
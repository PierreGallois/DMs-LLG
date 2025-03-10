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
#let ZZ5 = $ZZ[sqrt(5)]$

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
Soient $a,b in NN$. L'identité de #smallcaps[Brahmagupta] est équivalente à :
$ (a^2 + 5b^2)^2 - (a^2 - 5b^2)^2 = 5(2a b)^2 $
En factorisant le côté gauche de l'équation, on trouve :
$ (a^2 + 5b^2)^2 - (a^2 - 5b^2)^2 &= (a^2 + a^2 + 5b^2 - 5b^2)(a^2 - a^2 + 5b^2 + 5b^2) \
&= (2a^2)(2 dot 5b^2) \
&= 5(2a b)^2 $
Ce qu'il fallait démontrer.

===
Soit $(x, y) in NN^2$, tel que $(x, y) != (1, 0)$ et $(x, y)$ solution de $(E) : x^2 - 5 y^2 = 1$.

l'identité de #smallcaps[Brahmagupta] assure que :
$ 1 = (a^2 + 5b^2) - 5(2a b)^2 $
Autrement dit, $(a^2 + 5b^2, 2a b)$ est également une solution de $(E)$. Comme $a^2 + 5b^2 > a$ et $2 a b >b$, cette solution est également différente de $(a,b)$ et de tout autre solution $(x,y)$ où $x<a$, $y<b$. Il existe donc, en itérant ce procédé, une infinité de solutions de $(E)$ dans $NN^2$.

===
$(a,b) in NN^2$ est solution de $(E)$ si et seulement si $a^2 = 1 + 5b^2$. Comme $b^2 >=0$ et $a >= 0$, on trouve que $(a,b)$ est solution si et seulement si $a = sqrt(1 + 5b^2)$. On pose donc $f(b) = sqrt(1 + 5b^2)$.

La solution est valide si et seulement si $f(b) in NN$.

#block(breakable: false)[
  Voici un script Haskell qui détermine des couples solution :
  #code-from-file(folder-name, "calc_sol.hs")
]

On obtient :
```
[4, 72, 1292, 23184, 416020, 7465176, 16692641, 24157817, 31622993, 48315634, 55780810, 63245986, 79938627, 87403803, 94868979, 111561620, 119026796, 126491972, 133957148, ..., 3077073806,3077489826, 3078836095, ...]
```
===
Supposons que $(a, b)$ et $(a', b)$ soient solutions. Alors $a = f(b) = a'$ et $a=a'$. On peut donc bien choisir un "couple minimal" comme le couple avec le $b$ minimal.

= L'ensemble #text($ZZ5 = {a + b sqrt(5) | a, b in ZZ}$, size: 0.8em)
==
L'existence de cette écriture est assurée par la définition de $ZZ5$. Supposons que $x = a + b sqrt(5) = c + d sqrt(5)$ pour $(a,b), (c,d) in ZZ^2$. Si $b != d$, alors :
$ a + b sqrt(5) &= c + d sqrt(5) \
<==>sqrt(5) &= (c-a)/(b-d) $
Ce qui contredit l'irrationalité de $sqrt(5)$. Donc $b=d$, et $a + b sqrt(5) = c + b sqrt(5)$, d'où $a=c$. Donc l'écriture $x = a + b sqrt(5)$ de chaque $x in ZZ5$ est unique.

==
Posons $x = a + b sqrt(5), y = c + d sqrt(5)$. Alors :
$ overline(x + y) &= overline((a+c) + (b+d)sqrt(5)) \
&= (a+c) - (b+d)sqrt(5) \
&= (a - b sqrt(5)) + (c - d sqrt(5)) \
&= overline(x) + overline(y) $
Et similairement :
$ overline(x y) &= overline((a c + 5b d) + (a d + b c) sqrt(5)) \
&= a c + 5b d - (a d + b c) sqrt(5) \
overline(x) dot overline(y) &= (a - b sqrt(5)) dot (c - d sqrt(5)) \
&= (a c + 5 b d) - (a d + b c) sqrt(5) $
D'où $overline(x y) = overline(x) dot overline(y)$.
= Détermination d'un élément générateur de $UU$.
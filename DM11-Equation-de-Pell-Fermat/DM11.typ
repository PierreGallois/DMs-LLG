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
Soient $a,b in NN$. L'identité de #smallcaps[Brahmagupta] est équivalente à :
$ (a^2 + 5b^2)^2 - (a^2 - 5b^2)^2 = 5(2a b)^2 $
En factorisant le côté gauche de l'équation, on trouve :
$ (a^2 + 5b^2)^2 - (a^2 - 5b^2)^2 &= (a^2 + a^2 + 5b^2 - 5b^2)(a^2 - a^2 + 5b^2 + 5b^2) \
&= (2a^2)(2 dot 5b^2) \
&= 5(2a b)^2 $
Ce qu'il fallait démontrer.

===
Soient $(x, y) in NN^2$, tel que $(x, y) != (1, 0)$ et $(x, y)$ solution de $(E) : x^2 - 5 y^2 = 1.$

l'identité de #smallcaps[Brahmagupta] assure que :
$ 1 = (a^2 + 5b^2) - 5(2a b)^2 $
Autrement dit, $(a^2 + 5b^2, 2a b)$ est également une solution de $(E)$. Comme $a^2 + 5b^2 > a$ et $2 a b >b$, cette solution est également différente de $(a,b)$ et de tout autre solution $(x,y)$ où $x<a$, $y<b$. Il existe donc, en itérant ce procédé, une infinité de solutions de $(E)$ dans $NN^2$.

===
$(a,b) in NN^2$ est solution de $(E)$ si et seulement si $a^2 = 1 + 5b^2$. Comme $b^2 >=0$ et $a >= 0$, on trouve que $(a,b)$ est solution si et seulement si $a = sqrt(1 + 5b^2)$. On pose donc $f(b) = sqrt(1 + 5b^2)$.

TODO : script

===
Supposons que $(a, b)$ et $(a', b)$ soient solutions. Alors $a = f(b) = a'$ et $a=a'$. On peut donc bien choisir un 'couple minimal' comme le couple avec le $b$ minimal.


= L'ensemble #text($ZZ[sqrt(5)] = {a + b sqrt(5) | a, b in ZZ}$, size: 0.8em)

= Détermination d'un élément générateur de $UU$.
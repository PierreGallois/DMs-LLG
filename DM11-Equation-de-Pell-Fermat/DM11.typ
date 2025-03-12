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
```Haskell
[(9, 4), (161, 72), (2889, 1292), (51841, 23184), (930249, 416020), (16692641, 7465176), (37325880, 16692641), (54018521, 24157817), (70711162, 31622993), ..., (686478381, 307002465), (703171022, 314467641), (723804261, 323695106), ...]
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

==
Soient $x,y in ZZ5$

===
On a les égalités suivantes :
$ N(x y) = x y overline(x y)  = x overline(x) y overline(y) = N(x)N(y)$

===
En développant pour $x = a + b sqrt(5)$:
$ N(x) &= (a + b sqrt(5))(a - b sqrt(5)) \
&= a^2 - 5b^2 $
Ainsi $x$ a pour norme $N(x) = 1$ si et seulement si $(a,b) in ZZ^2$ est solution de l'équation $(E)$.

== Groupe des unités $UU = {x in ZZ5, N(x) = 1}$

===
Soient $x,y in UU$. Alors $N(x y) = 1 dot 1 = 1$, et $UU$ est clos sous la multiplication héritée de $ZZ5$.

===
Soit $x = a + b sqrt(5) in UU$. Comme $N(0) = N(0 + 0 sqrt(5)) = 0$, $x != 0$. En passant au conjugué :
$ 1 / (x) &= N(a + b sqrt(5)) / (a + b sqrt(5)) \
&= (a^2 - 5b^2)/(a+b sqrt(5)) \
&= a - b sqrt(5) = overline(x) $
Comme $N(overline(x)) = N(x) = 1$, $overline(x)$ et donc $1/x in UU$. Donc $UU$ est un groupe sous la multiplication héritée de $ZZ5$ (l'associativité est héritée).

= Détermination d'un élément générateur de $UU$.
==
Posons $EE = UU sect ]1; +oo[$. Soit $x = a + b sqrt(5) in EE$. 

===
D'une part, $x + 1/x > 0$ car $x > 1$. D'autre part, $x + 1/x = x + overline(x) = 2a$. Donc $2a > 0$ et $a >0$.

===
Comme $x > 1$, $x - 1/x > 0$. De plus $x + 1/x = x + overline(x) = 2b$. Donc $2b > 0$ et $b >0$.

==
Soit $(a_0, b_0) in NN^2$ la solution fondamentale de $(E)$. Comme $b_0 != 0$, $b_0 > 0$ et $a_0 = f(b_0) > 0$. De plus, comme $b_0$ est minimal et que $f$ est croissante sur $RR^+$, $a_0$ doit aussi être minimal. Donc $x_0 = a_0 + b_0 sqrt(5)$ est bien le plus petit élément de $EE$.

==
===
La suite $(x_0^n)_(n in NN^*)$ est strictement croissante et diverge vers $+oo$ car $x_0 > 1$. Ainsi, pour chaque $y in RR^+$, il existe un unique $n in NN^*$ tel que $x_0^n <= y < x_0^(n+1)$ : en particulier, pour tout $x in EE$, il existe $n in NN^*$ tel que $x_0^n <= x < x_0^(n+1)$.

===
Soit $n in NN^*$ l'unique entier tel que $x_0^n <= x < x_0^(n+1)$. Supposons que $x != x_0$, soit $ x_0^n < x < x_0^(n+1) $
En divisant par $x_0 ^ n > 0$, on trouve l'inégalité :
$ 1 < x/(x_0^n) < x_0 $
Comme $UU$ est un groupe et $x, x_0 in UU$, $x/(x_0^n) in UU$. De plus, le côté gauche assure que $x/(x_0^n) in EE$. Mais le côté droit contredit la minimalité de $x_0$ : on doit donc avoir $x = x_0$.

==
Par la question $bold(C.1)$, $EE$ est l'ensemble des $x = a + b sqrt(5) in UU$ pour $a,b in NN^*$. Ainsi, comme on peut passer $a$ et $b$ au négatif en restant dans $UU$, déterminer les éléments de $EE$ suffit à déterminer les éléments de $UU$, et donc ensuite les solutions dans $ZZ^2$ de $(E)$. Or tous les éléments de $EE$ sont générés par les puissances de $x_0$. 

On peut donc prendre $x_0 = T O D O$, et calculer les "coordonnées" de ses puissances successives, ce qui permet de trouver toutes les solutions de $(E)$.
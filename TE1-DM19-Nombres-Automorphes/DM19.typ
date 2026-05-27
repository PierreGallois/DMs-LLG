#import "./../templates/homework.typ": code-from-file, dm

#show: dm.with(
  numero: 19,
  titre: [Nombres Automorphes],
  sections: [Partie],
  alpha: true,
)


#let mod(x) = $space [#x]$
#let folder-name = "TE1-DM19-Nombres-Automorphes/"

= Dénombrement des nombres automorphes de $n$ chiffres

==
Pour tout $n >= 1$, $0$ et $1$ (écrits avec $n$ chiffres) sont égaux à leur carré et donc automorphes de $n$ chiffres.

==
En testant avec le programme de la question B2), on trouve que les nombres automorphes de $2$ chiffres sont $00$, $01$, $25$ et $76$.

==
Soit $b$ automorphe à deux chiffres. Comme $b^2$ a au plus 4 chiffres, écrivons $b^2 = 10^3A + 10^2B + b$ avec $A,B in [|0;9|]$. Ainsi, pour tout $a in [|0;9|]$ :
$
  (100a+b)^2 & = 10^4a = 200a b + b^2 \
             & = 10^4a + 10^3 A + 100 (2 a b + B) + b
$
Ainsi, $100a + b$ est automorphe de $3$ chiffres si et seulement si le dernier chiffre de $2a b + B$ est exactement $a$, c'est à dire que $2a b + B = a mod(10)$. Pour tous $b, B$ :
$
  2a b + B equiv a mod(10) <==> a (2b-1) equiv -B mod(10)
$
Or, $2b-1$ est toujours impair. De plus, $2b equiv 1 mod(5)$ si et seulement si $b equiv 3 mod(5)$. Or, si $b equiv 3 mod(5)$, le dernier chiffre de $b$ est 3 ou 8 et $b$ ne peut être automorphe. Donc $5 divides.not 2b - 1$. Ainsi, $2b-1$ est premier avec $10$, est inversible modulo $10$ et la congruence précédente admet une unique solution $a in [|0;9|]$, qui est telle que $100a + b$ est automorphe à $3$ chiffres.

On calcule ainsi (ou avec le script suivant) quatre nombres automorphes de $3$ chiffres : $000$, $001$, $376$ et $625$. Ce sont tous les nombres automorphes de $3$ chiffres par la question 5).

==
On montre immédiatement la version générale de la méthode précédente : "Pour tout $b$ automorphe de $n$ chiffres, il existe un unique $a in [|0;9|]$ tel que $10^n a + b$ est automorphe à $n+1$ chiffres."

*Preuve :* Comme $b$ est automorphe de $n$ chiffres, on peut écrire $b^2 = 10^(n+1)A + 10^n B + b$ pour $A in NN$ et $B in [|0;9|]$. Alors pour tout $a in [|0;9|]$ :
$
  (10^n a + b)^2 & = 10^(2n)a^2 + 2dot 10^n a b + 10^(n+1)A + 10^n B + b \
                 & = 10^(2n)a^2 + 10^(n+1)A + 10^n (2 a b + B) + b
$
Ainsi, $10^n a + b$ est automorphe de $n+1$ chiffres si et seulement si le dernier chiffre de $2a b + B$ est exactement $a$. Par l'argument précédent, un tel $a in [|0;9|]$ existe et est unique.

Le script python suivant applique la méthode précédente pour calculer des nombres automorphes :
#code-from-file(folder-name, "gen_automorphe.py")

On trouve ainsi les nombres automorphes de $4$ chiffres $0000$, $0001$, $0625$ et $9376$, qui sont tous les nombres automorphes de $4$ chiffres par la question suivante.

==
On procède par récurrence sur $n >= 1$. Les nombres automorphes de $1$ chiffres sont $0,1,5$ et $6$ qui sont au nombre de $4$.

Supposons que pour $n >= 1$ il y ait exactement $4$ nombres automorphes de $n$ chiffres. Les $n$ derniers chiffres d'un nombre automorphe de $n+1$ chiffres forment un nombre automorphe de $n$ chiffres, et à chaque nombre automorphe de $n$ chiffres correspond, par le lemme précédent, à un unique nombre automorphe de $n+1$ chiffres. Ainsi, il y a autant de nombres automorphes à $n$ et à $n+1$ chiffres. Par l'hypothèse de récurrence, il y a exactement $4$ nombres automorphes à $n+1$ chiffres.

= Propriétés des nombres automorphes de $n$ chiffres
==
Soit $a in NN$ à $n$ chiffres. Alors $a$ est automorphe (à $n$ chiffres) si et seulement si le nombre qui compose $n$ derniers chiffres de $a^2$ est $a$. Or, le nombre composant les $n$ derniers chiffres d'un nombre est précisément le résidu de ce nombre modulo $10^n$.

Ainsi, $a$ est automorphe si et seulement $a$ est le résidu de $a^2$ modulo $10^n$ i.e $a^2 equiv a mod(10^n)$. ($a$ est son propre résidu car $a < 10^n$)

==
Le code suivant teste si le nombre $a$ est automorphe à $n$ chiffres.
#code-from-file(folder-name, "automorphe.py")

==
Supposons que $a$ soit automorphe. Par une récurrence immédiate, pour tout $k >= 1$, $a^k equiv a mod(10^n)$. Ainsi, les $n$ derniers chiffres des puissances de $a$ sont ceux de $a$ (encore car $a$ est son propre résidu).

==
$a'$ est automorphe (de $2n$ chiffres) si et seulement si $(a')^2 - a' equiv 0 mod(10^(2n))$. On calcule, par définition de $a'$ :
$
  (a')^2 - a' equiv 4a^6 - 12a^5 + 9a^3 + 2a^3 - 3a^2 mod(10^(2n))
$
En calculant la division euclidienne par $a^2 - a$, on trouve que :
$
  (a')^2 - a' equiv (4a^2 - 4a - 3) (a^2 - a)^2 mod(10^(2n))
$
Comme $10^n divides a^2 - a$, $10^(2n) divides (a^2 - a)^2$ et on en déduit que $a'$ est bien automorphe de $2n$ chiffres.

Remarquons enfin que les derniers chiffres de $a'$ sont ceux de $a$, puisque $ a' equiv 3a - 2a equiv a mod(10^n) $

= Génération des nombres automorphes de $n$ chiffres
==
===
Supposons que $a equiv 1 mod(b)$. On montre l'énoncé par récurrence sur $n$. L'initialisation est l'hypothèse : supposons donc l'énoncé pour $n >= 1$. Alors :
$
  a^(b^(n+1 - 1)) - 1 & = (a^b^(n-1))^b - 1^b \
                      & =^"Bernoulli" (a^b^(n-1) - 1)(a^(b^n - b^(n-1)) + dots + 1)
$
Où la somme de du facteur de droite contient $b$ termes, qui sont tous congrus à $1$ modulo $b$ car $a^k equiv 1 mod(b)$ pour tout $k in NN$. La somme est divisible par $b$. De plus, par l'hypothèse de récurrence, le facteur de gauche est divisible par $b^n$. Ainsi :
$
  a^(b^n) - 1 equiv 0 mod(b^(n+1)) " soit " a^b^n equiv 1 mod(b^(n+1))
$

===
D'une part, $5 equiv 1 mod(2)$. Ainsi, pour tout $n in NN^*$, $2^n divides 5^2^(n-1) - 1$. D'autre part, pour tout\ $n in NN^*$, $n <= 2^(n-1)$ : ainsi, $5^n divides 5^2^(n-1)$. Par produit, on obtient que :
$
  10^n divides (5^2^(n-1))^2 - 5^2^(n-1) " i.e " (5^2^(n-1))^2 = 5^2^(n-1) mod(10^n)
$
On applique le même argument pour la deuxième partie en utilisant que $6 equiv 1 mod(5)$ et que $2 divides 6$.

==
===
On calcule que $a_3 = 625$ et que $a_3^2 = 390625$ : $a_3$ est donc bien automorphe de $3$ chiffres. Similairement, $b_3 = 376$ et $b_3^2 = 141376$ : $b_3$ est bien automorphe.

De même, $a_4 = 0625$ qui est automorphe de $4$ chiffres, et $b_4 = 9376$ : on a bien $b_4^2 = 87 909 376$, et $b_4$ est automorphe de $4$ chiffres.

D'après la partie A, il y a $4$ nombres automorphes de $8$ chiffres dont $0$ et $1$. Ainsi, les nombres donnés par la méthode de la question B4) appliquée à $a_4$ et $b_4$ sont automorphes et distincts, et sont donc :
$
  12890625 = a_8 " et " 87108376 = b_8
$
(où l'on identifie que $12890625 = a_8$ et pas $b_8$ car une puissance de $5$ se termine toujours par un $5$ modulo $10$).

===
$a_n$ et $b_n$ sont automorphes, puisque par définition :
$
  a_n^2 equiv (5^2^(n-1))^2 equiv 5^2^(n-1) equiv a mod(10^n)
$
Et idem pour $b_n$.

Comme $a_n$ finit toujours par un $5$ et $b_n$ par un nombre pair, $a_n != b_n$. Clairement,\ $a_n, b_n != 0$ car $10^n$ ne peut jamais diviser une puissance de $5$ ou de $6$. Enfin, en regardant encore les derniers chiffres, $a_n, b_n != 1$.

Ainsi, les nombres automorphes de $n$ chiffres sont exactement $0$, $1$, $a_n$ et $b_n$.

===
Remarquons d'abord que pour tout $n in NN^*$ :
$
  a_n b_n equiv 2^5^(n-1)3^5^(n-1)5^(2^(n-1)) equiv 0 mod(10^n)
$
Ainsi, on obtient que :
$
  (a_n + b_n)^2 equiv a_n^2 + b_n^2 + 2a_n b_n equiv a_n + b_n mod(10^n)
$
Ainsi, le résidu de $a_n + b_n$ modulo $10^n$ est un nombre automorphe, c'est à dire $0, 1, a_n$ ou $b_n$. Il est impossible que $a_n + b_n equiv a_n$ ou $b_n mod(10^n)$ car $a_n$ et $b_n$ sont non-nuls modulo $10^n$. De même, le résidu de $10^n - b_n$ se termine par un chiffre pair : il est donc impossible que $a_n equiv -b_n$ c'est-à-dire $a_n + b_n equiv 0 mod(10^n)$. Ainsi, $a_n + b_n equiv 1 mod(10^n)$

Enfin, par définition, $1 < a_n, b_n < 10^n$ d'où le fait que $1 < a_n + b_n < 2 dot 10^(n)$. Le seul nombre congru à $1$ modulo $10^n$ dans cet intervalle est $10^n + 1$. Ainsi, on obtient :
$
  a_n + b_n = 10^n + 1
$

= Annexe : le théorème des restes chinois
On peut trouver systématiquement et prouver un certain nombre des propriétés précédentes en exploitant le théorème des restes chinois (#emoji.heart). En effet, pour tout $x in ZZ$ et $n in NN$ :
$
  x^2 equiv x mod(10^n) <=> x(x-1) equiv 0 mod(10^n) equiv cases(x(x-1) equiv 0 mod(2^n), x(x-1) equiv 0 mod(5^n))
$
Pour tout $n >= 1$, comme $x$ et $x-1$ sont premiers entre eux, leurs facteurs premiers sont différents et $2^n divides x(x-1)$ si et seulement si $2^n divides x$ ou $2^n divides x-1$, c'est à dire que $x equiv 0$ ou $1 mod(2^n)$, et idem pour $5^n$. ($ZZ slash p^k ZZ$ n'a pas d'idempotents non triviaux / est local)

Ainsi, à tout choix de $(a,b) in {0,1}^2$ correspond, par le théorèmes de restes chinois, une unique solution $x in [|0; 10^n-1]$ du système :
$
  cases(x equiv a mod(2^n), x equiv b mod(5^n))
$
Qui satisfait donc $x(x-1) equiv 0 mod(10^n)$, c'est à dire que $x$ est automorphe de $n$ chiffres.

*(A5)* Il y a donc $4$ nombres automorphes de $n$ chiffres, et cette méthode s'adapte aux nombres dans n'importe quelle base en écrivant la décomposition primaire de la base ($2^omega(b)$ nombres automorphes de $n$ chiffres en base $b$, avec $omega(b)$ le nombre de facteurs premiers de $b$). "DM20 : Les idempotents de $ZZ slash n ZZ$ ?"

*(C2)* Par cette méthode, $0$ correspond au couple $(0,0)$, $1$ au couple $(1,1)$. Pour $(1,0)$, si $m$ est l'inverse de $5^n$ modulo $2^n$, alors $x$ est le résidu modulo $10^n$ de $a_n = 5^n m$. Inversement, pour $(0,1)$, $x$ est le résidu de $b_n = 2^n m'$ pour $m'$ l'inverse de $2^n$ modulo $5^n$.

Ces inverses peuvent être calculés pour chaque $n$, ou l'on peut trouver une formule fermée (somme géométrique) avec le lemme de Hensel.

Enfin, on trouve immédiatement que :
$
  cases(a_n + b_n equiv 1 mod(2^n), a_n + b_n equiv 1 mod(5^n))
$
Dont on déduit par l'unicité dans le théorèmes des restes chinois que $a_n + b_n equiv 1 mod(10^n)$ et que $a_n + b_n = 10^n + 1$

*(A4)* On peut enfin donner une explication plus rapide de la construction de la partie A. Notons $P(x) = x^2 - x$, de dérivée $P'(x) = 2x - 1$. Alors un nombres automorphe de $n$ chiffres, c'est à dire la donnée d'une racine de $P$ modulo $2^n$ et $5^n$. Comme mentionné, si $x$ est automorphe, $P'(x) equiv.not 0 mod(2^n)$ ou $mod(5^n)$. Ainsi par le lemme de Hensel, on peut obtenir un unique couple de racines de $P$ modulo $2^(n+1)$ et $5^(n+1)$, et donc un unique nombre automorphe de $(n+1)$ chiffres, ce qui prouve le lemme.

#show: set align(center)
#set text(25pt)
*MERCI POUR TOUS LES DMS ET CES DEUX ANNÉES #emoji.heart*

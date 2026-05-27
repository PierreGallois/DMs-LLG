#import "./../templates/homework.typ": code-from-file, dm

#show: dm.with(
  numero: 19,
  titre: [Nombres Automorphes],
  sections: [Partie],
  alpha: true,
)


#let mod(x) = $space [#x]$
#let folder-name = "TE1-DM19-Nombres-Automorphes/"

= Dénombrement des nombres automorphes de $n$ chiffres²
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
Or, $2b-1$ est toujours impair. De plus, $2b equiv 1 mod(5)$ si et seulement si $b equiv 3 mod(5)$. Or, si $b equiv 3 mod(5)$, le dernier chiffre de $b$ est 3 ou 8 et $b$ ne peut être automorphe. Donc $5 divides.not 2b - 1$. Ainsi, $2b-1$ est premier avec $10$ et la congruence précédente admet une unique solution $a in [|0;9|]$, qui est telle que $100a + b$ est automorphe à $3$ chiffres.

Les deux derniers chiffres d'un nombre automorphe de 3 chiffres forment un nombre automorphe de 2 chiffres, et le premier chiffre d'un nombre automorphe de 3 chiffres peut être déduit de ses deux derniers chiffres par la méthode précédente. Ainsi, il y a exactement $4$ nombres automorphes de $3$ chiffres, produits en appliquant la méthode précédente aux nombre automorphes de $2$ chiffres, qui sont : $000$, $001$, $625$ et $376$.

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

RESTES CHINOIS

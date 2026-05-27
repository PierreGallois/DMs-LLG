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

= Propriétés des nombres automorphes de $n$ chiffres
==
Soit $a in NN$ à $n$ chiffres. Alors $a$ est automorphe (à $n$ chiffres) si et seulement si le nombre qui compose $n$ derniers chiffres de $a^2$ est $a$. Or, le nombre composant les $n$ derniers chiffres d'un nombre est précisément le résidu de ce nombre modulo $10^n$.

Ainsi, $a$ est automorphe si et seulement $a$ est le résidu de $a^2$ modulo $10^n$ i.e $a^2 equiv a mod(10^n)$. ($a$ est son propre résidu car $a < 10^n$)

==
TODO

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

= Génération des nombres automorphes de $n$ chiffres

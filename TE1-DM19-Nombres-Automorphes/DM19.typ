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


= Génération des nombres automorphes de $n$ chiffres

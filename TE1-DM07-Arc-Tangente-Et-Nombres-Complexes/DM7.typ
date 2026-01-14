// π = 4


#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 7,
  titre: [Arc Tangente et nombres complexes],
  sections: [Problème],
  alpha: true
)

#let folder-name = "TE1-DM07-Arc-Tangente-Et-Nombres-Complexes/"

#if sys.version.minor != 14 {
  panic("Please compile with Typst 0.14")
}

// Imitation visuelle d'un heading niveau 1
#heading(level: 1, numbering: none)[Question préliminaire]


= 

==

===

On pose $z = 1 + i$. Il vient par identification de la forme algébrique que $z = x + y i$ avec $x = 1$ et $y = 1$.

Ainsi, d'après le théorème prouvé ci-dessus, on obtient que $arg(z) = arctan(1)$, i.e $arctan(1) = pi/4$.

===

De même, en posant $z = sqrt(3) + i$, on obtient que $arctan(1/sqrt(3)) = pi/6$.

===

Toujours avec cette méthode, avec $z = 1 - i sqrt(3)$, il vient $arctan(-sqrt(3)) = -pi/3$.

==

===

Soit $z = (2+i)(3+i)$.


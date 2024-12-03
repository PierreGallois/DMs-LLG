#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 7,
  titre: [Autour de Farey],
  sections: [Partie],
  alpha: true
)

= Somme des cancres dans $QQ_+.$
Soient $x = a/b, y = c/d, z = e/f, " avec" a, c, e in NN, " et" b, d, f in NN^*$.

==
$ x plus.circle x = a/b plus.circle a/b = (2a)/(2b) = a/b $
Donc $x plus.circle x = x$.

==
$
  x plus.circle y = (a+c)/(b+d) " et " y plus.circle x = (c+a)/(d+b) = (a+c)/(b+d)
$

$x plus.circle y = y plus.circle x$ donc l'opération est commutative.

==
D'une part :
$
  (x plus.circle y) plus.circle z = ((a+c)/(b+d)) plus.circle e/f = (a+c+e)/(b+d+f)
$

Et d'autre part :
$
  x plus.circle (y plus.circle z) = a/b plus.circle ((c+e)/(d+f)) = (a+c+e)/(b+d+f)
$

$(x plus.circle y) plus.circle z = x plus.circle (y plus.circle z)$ donc l'opération est associative.

#pagebreak()
= B
= C
= Cercles de Ford

== Tangents à l'axe des abscisses. <tangeant_abscisse>

Prouvons que tout cercle de Ford est tangent à l'axe des abscisses.
Soit $a/b$ une fraction irréductible. Son cercle de Ford associé est de centre $(a/b, 1/(2b^2))$ et de rayon $1/(2b^2)$. Comme le rayon du cercle et son ordonnée sont égaux, tout cercle Ford est bien tangent à l'axe des abscisses.

== Tangents entre eux quand consécutifs.

Soient $alpha$ et $beta$ deux fractions consécutives de $F_n$ tel que
$
  alpha = m/a " et " beta = n/b 
$
avec $m, n in NN$, $a, b in NN^*$ et $alpha < beta$.

Les deux cercles de Ford associés à $alpha$ et $beta$ sont tangents à l'axe des abscisses d'après la propriété 
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



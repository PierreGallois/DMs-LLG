#import "./../templates/homework.typ": dm
#import "figure.typ": fig

#show: dm.with(
  numero: 7,
  titre: [Autour de Farey],
  sections: [Partie],
  alpha: true
)

#let _F_fracs_unsorted(max) = {
  for denominateur in array.range(1, max+1) {
    for numerateur in array.range(denominateur+1) {
      if calc.gcd(numerateur, denominateur) == 1 {
        // Si la fraction est irréductible
        // car si la fraction est réductible c'est qu'elle a déjà été rajoutée
        ((numerateur, denominateur),)
      }
    }
  }
}

#let _F_frac_inside(max) = {
  for (numerator, denominator) in _F_fracs_unsorted(max)
    .sorted(key: e => e.at(0)/e.at(1)) {
      ($#str(numerator)/#str(denominator)$,)
  }
}

#let F_frac(max) = [
  ${#_F_frac_inside(max).join("; ")}$
]

#let oplus = $plus.circle$


= Somme des cancres dans $QQ_+.$
Soient $x = a/b, y = c/d, z = e/f, " avec" a, c, e in NN, " et" b, d, f in NN^*$.

==
$ x oplus x = a/b oplus a/b = (2a)/(2b) = a/b $
Donc $x oplus x = x$.

==
$
  x oplus y = (a+c)/(b+d) " et " y oplus x = (c+a)/(d+b) = (a+c)/(b+d)
$

$x oplus y = y oplus x$ donc l'opération est commutative.

==
D'une part :
$
  (x oplus y) oplus z = ((a+c)/(b+d)) oplus e/f = (a+c+e)/(b+d+f)
$

Et d'autre part :
$
  x oplus (y oplus z) = a/b oplus ((c+e)/(d+f)) = (a+c+e)/(b+d+f)
$

$(x oplus y) oplus z = x oplus (y oplus z)$ donc l'opération est associative.

==
Raisonnons par contraposée :
Montrons que $(x gt.eq.slant x oplus y or x oplus y gt.eq.slant y) ==> x gt.eq.slant y$.

- Supposons $x gt.eq.slant x oplus y$ :
$
  x gt.eq.slant x oplus y &==> a/b gt.eq.slant (a+c)/(b+d) \
  &==> (a b + a d - a b - b c)/(b(b+d)) gt.eq.slant 0 \
  &==> a d - b c gt.eq.slant 0 "  car" b(b+d) in NN\
  &==> a/b gt.eq.slant c/d \
  &==> x gt.eq.slant y
$

- Supposons $x oplus y gt.eq.slant y$ :
$
  x oplus y gt.eq.slant y &==> (a+c)/(b+d) gt.eq.slant c/d \
  &==> (a d + c d - b c - c d)/(d(b+d)) gt.eq.slant 0 \
  &==> a d - b c gt.eq.slant 0 "  car" d(b+d) in NN\
  &==> a/b gt.eq.slant c/d \
  &==> x gt.eq.slant y
$

Nous avons montré que $(x gt.eq.slant x oplus y or x oplus y gt.eq.slant y) ==> x gt.eq.slant y$,
et donc, par contraposée, que \ $x < y ==> x < x oplus y < y$.

= Déterminant de deux nombres de $QQ_+$.
Nous reprenons $x, y$ tels que dans la partie précédente.

==
Montrons que : $x = y <==> delta(x, y) = 0$.

- Supposons que $x = y$. Alors :
$
  delta(x, y) &= delta(x, x) \
  &= a b - b a \
  &= 0
$

- Supposons que $delta(x, y) = 0$. Alors :
$
  a d - b c = 0 \
  a d = b c \
  a/b = c/d \
  x = y
$

Nous avons donc montré que $x = y <==> delta(x, y) = 0$.

==
D'une part :
$
  delta(y, x) = mat(delim: "|", c, a; d, b) = b c - a d
$

D'autre part :
$
  - delta(x, y) = - mat(delim: "|", a, c; b, d) = - a d + b c
$

Donc $delta(y, x) = - delta(x, y)$.

#pagebreak()

==
$
  x < y &<==> a/b < c/d \
  &<==> a d < b c " car" b, d > 0\
  &<==> a d - b c < 0 \
  &<==> delta(x, y) < 0 \
  &<==> delta(x, y) lt.eq.slant -1 "  car" delta(x, y) in ZZ.
$
Donc $x < y <==> delta(x, y) lt.eq.slant -1$.

= Ensembles de Farey.
==

$
  &F_5 = #F_frac(5) \
  &F_6 = #F_frac(6) \
  &F_7 = #F_frac(7) \
  &F_8 = #F_frac(8) \
$
#strike[Tapé à la main par nos soins.] Généré automatiquement par un algorithme, voir le code du devoir sur Github.
==
Si $m/n in F_n$, alors $0 <= m <= n$ et $n >= n-m >= 0$. Donc $(n-m) / n in F_n$.

Comme $n - (n-m) = m$, $m/n in F_n$ si et seulement si $(n-m) / n in F_n$, qui est son symétrique par rapport à leur moyenne $1/2$. Ce centre de symétrie ne dépend pas de $m$ : on en conclut donc que $1/2$ est le centre de $F_n$ pour $n >= 2$.

== Pas trouvé :/

==
Notons pour $n in NN^*, P(n)$ l'assertion suivante : Si $x<y$ sont deux fractions consécutives de $F_n$, alors :
  - $delta(x,y) = -1$
  - La première fraction qui apparaît dans un $F_m, m > n$ est $x oplus y$

Il s'agit de prouver par récurrence $P(n)$ pour tout $n in NN^*$.

=== Initialisation :
Les seules fractions de $F_1$ sont $0/1$ et $1/1$. On a bien $delta(0/1, 1/1) = -1$ et la première fraction qui apparaît entre elles dans un $F_m$ suivant est $1/2$ dans $F_2$ : or, $1/2 = 0/1 oplus 1/1$.
Donc $P(1)$ est vraie.

=== Hérédité : 
On suppose par la suite $P(n)$ pour $n in NN^*$, et on prouve $P(n+1)$.

On pose $x = a/b$ et $y = c/d$ deux fractions irréductibles et consécutives dans $F_(n+1)$. Par *C.3*, on sait que $x in F_n$ ou $y in F_n$.

*1#super[er] cas :* $x in F_n$ et $y in F_n$. 

Comme $x$ et $y$ sont consécutives dans $F_(n+1)$, alors elles le sont aussi dans $F_n$, car $F_n subset.eq F_(n+1)$. Alors par l'hypothèse de récurrence, $delta(x,y) = -1$. De plus, la première fraction qui apparaît entre $x$ et $y$ est $x oplus y$ dans $F_m, m > n$. Mais $x$ et $y$ sont consécutives dans $F_(n+1)$, donc $m > n+1$.
Ainsi, dans ce cas, $P(n+1)$ est vérifiée.

*2#super[e] cas :* $x in F_n$ et $y in F_(n+1) \\ F_n$. Posons $z in F_n$ la fraction successive de $x$ dans $F_n$.

Par hypothèse de récurrence, comme $y$ doit être la première fraction à s'être intercalée entre $x$ et $y$, on doit avoir $y = x oplus z$. De plus, on a $delta(x,z) = -1$. On a donc
$ delta(x,y) = delta(x, x oplus z) = delta(x,z) = -1 $
Ce qui valide la première condition de $P(n+1)$.

Posons maintenant $t = r/s$ la première fraction irréductible à apparaître entre $x$ et $y$ dans un $F_m$ pour $m > n+1$.

D'abord, on a les équivalences suivantes :
$ cases(delta(t,x) >= 1, delta(y,t) >= 1)
&<==>^(#text[*B.2*]) cases(delta(x,t) <= -1, delta(t,y) <= -1) \
&<==>^(#text[*B.3*]) x < t < y $
Comme $t$ s'intercale entre $x$ et $y$, $delta(t,x)$ et $delta(y,t)$ sont bien supérieurs ou égaux à $1$.

Ensuite, on a :
$ a delta(y,t) + c delta(t,x) &= a(c s - d r) + c(b r - a s) \
&= a c s - a c s + r b c - r a d \
&= r(b c - a d) \
&= -r delta(x,y) \
&= r $

Similairement, on a :
$ b delta(y,t) + d delta(t,x) &= b(c s - d r) + d(b r - a s) \
&= b d r - b d r + s b c - s a d \
&= s(b c - a d) \
&= -s delta(x,y) \
&= s $

Si $delta(t,x) eq.not 1$ ou $delta (t,y) eq.not 1$, alors la fraction $t' = x oplus y$ a un dénominateur $s' = b + d < s$. De plus, comme $delta(x,y) = -1$, $t'$ est irréductible. Donc $t'$ s'intercale entre $x$ et $y$ strictement avant $t$, ce qui contredit la minimalité de $t$. Donc $delta(x,t) = delta(y,t) = 1$, et $t = x oplus y$, ce qui conclut la preuve de la deuxième condition de $P(n+1)$ dans ce cas.

*3#super[e] cas :* TODO

= Cercles de Ford.

== Tangents à l'axe des abscisses. <tangeant_abscisse>

Prouvons que tout cercle de Ford est tangent à l'axe des abscisses.
Soit $a/b$ une fraction irréductible. Son cercle de Ford associé est de centre $(a/b, 1/(2b^2))$ et de rayon $1/(2b^2)$. Comme le rayon du cercle et son ordonnée sont égaux, tout cercle Ford est bien tangent à l'axe des abscisses.

== Tangents entre eux quand consécutifs.

Nous allons raisonner par équivalence dans un repère orthonormé.

Soient $alpha$ et $beta$ deux fractions consécutives de $F_n$ tel que
$
  alpha = m/a " et " beta = n/b 
$
avec $m, n in NN$, $a, b in NN^*$ et $alpha < beta$.

D'après la propriété ci-dessus, les deux cercles de Ford $C_alpha$ et $C_beta$ associés à $alpha$ et $beta$, de rayon respectif $r_alpha$ et $r_beta$, sont tangents à l'axe des abscisses.
Les ordonnées $y_alpha$ et $y_beta$ des centres de $C_alpha$ et $C_beta$ est donc fixée, seules leurs abscisses $x_alpha$ et $x_beta$ pourraient encore varier.
La distance entre elles est notée $D$ et comme $alpha < beta$, $D = x_beta - x_alpha$.

Soit le triangle vert tel que son hypothénuse relie les centres de $C_alpha$ et $C_beta$, et que ses côtés soient respectivement parallèle à l'abscisse et à l'ordonnée.
Le triangle vert est donc un triangle rectangle.

#align(
  center,
  pad(top: 1em, bottom: 1em, fig),
)

Deux cercles sont tangents ssi il existe un unique point appartenant aux deux cercles, ssi la distance entre les deux centres est égale à la somme des deux rayons.
L'hypothénuse du triangle rectangle vert relie justement les centres de $C_alpha$ et $C_beta$. 
Nous pouvons vérifier si l'hypothénuse mesure bien la somme des deux rayons en déterminant si le triangle ainsi formé est bien rectangle.

#block(
  breakable: false,
[
$C_alpha$ et $C_beta$ sont tangents ssi
$
  &&D^2 &= (r_alpha + r_beta)^2 - (y_alpha - y_beta)^2 \
  &<==> &D^2 &= (1/(2a^2) + 1/(2b^2))^2 - (1/(2a^2) - 1/(2b^2))^2 \
  &<==> &D^2 &= (2(1/(2a^2)))(2(1/(2b^2))) \
  &<==> &D^2 &= (1/(a b))^2 quad quad "Or" D > 0 "et" a, b in NN^* \
  &<==> &D &= 1/(a b) \
  &<==> &n/b - m/a &= 1/(a b) quad quad "car" alpha < beta \
  &<==> quad quad &(a n - m b -1)/(a b) &= 0 \
  &<==> &m b - a n &= -1 \
  &<==> &delta(alpha, beta) &= -1
$
])

Or $delta(alpha, beta)$ est bien égal à -1 car $alpha$ et $beta$ sont consécutives dans $F_n$. Par équivalence, $C_alpha$ et $C_beta$ sont tangeants.

Nous avons prouvé que les cercles Ford associés à deux fractions consécutives de $F_n$ sont tangeants entre eux.

Accessoirement nous avons aussi prouvé que deux cercles tangeants entre eux et à l'abscisse sont des cercles de Ford associés à deux fractions consécutives de $F_n$.


= Approximation

== 

===  Encadrement du nombre $alpha = 1/sqrt(2)$

#show table.cell.where(x: 0): strong
#show table.cell.where(y: 0): strong

#set align(center)

#table(
  columns: 6,
  [Etape], [$2$], [$3$], [$4$], [$5$], [$6$],
  [Valeur par défaut], [$2/3$], [$2/3$], [$2/3$], [$7/10$], [$12/17$],
  [Valeur par excès], [$1/1$],  [$3/4$], [$5/7$], [$5/7$], [$5/7$],
)

#set align(left)

=== Meilleur encadrement 

En poursuivant la méthode utilisée dans le tableau ci-dessus, nous pouvons obtenir un encadrement de $alpha$ sur un dénominateur allant jusqu'à $100$ :

#set align(center)


#table(
  columns: 6,
  [Etape], [$5$], [$6$], [$dots$], [$5$], [$6$],
  [Valeur par défaut], [$7/10$], [$12/17$], [$dots$], [$7/10$], [$12/17$],
  [Valeur par excès], [$5/7$],  [$5/7$], [$dots$], [$5/7$], [$5/7$],
)

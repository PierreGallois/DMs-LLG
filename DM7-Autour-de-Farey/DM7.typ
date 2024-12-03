#import "./../templates/homework.typ": dm

#show: dm.with(
  numero: 7,
  titre: [Autour de Farey],
  sections: [Partie],
  alpha: true
)

#let oplus = $plus.circle$

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

= Ensembles de Farey
==
Bah non en fait, Thomas python please
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
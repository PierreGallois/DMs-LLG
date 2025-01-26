#import "./../templates/homework.typ": dm, code-from-file
#import "@preview/plotst:0.2.0": *

#show: dm.with(
  numero: 9,
  titre: [Fonction du Boulanger],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM9-Fonction-du-Boulanger"

=

==

#columns(
  2,
  gutter: 0pt,
  align(center)[
    Si $x in [0, 1/2]$, $f(x) = 2x$ donc
    $
      0 <= &x <= 1/2 \
      <=> 0 <= &2x <= 1 \
      <=> f([0, 1/2]) &= [0, 1]
    $
    #colbreak()
    Si $x in #h(0.5em) ]1/2, 1]$, $f(x) = 2(1-x)$ donc
    $
      1/2 < x <= 1 \
      <=> 0 <= 1-x < 1/2 \
      <=> 0 <= 2(1-x) < 1 \
      <=> f(lr(]1/2, 1])) = [0, 1[
    $
  ]
)

Donc nous avons bien $f([0, 1]) = [0, 1]$.

#v(2em)

#let f(x) = {
  if 0 <= x and x <= 1/2 {
    2 * x
  } else if 1/2 < x and x <= 1 {
    2 * (1 - x)
  } else {
    assert(false)
  }
}

#let data = range(100).map(x => (x/100, f(x/100)))
#let x_axis = axis(min: 0, max: 1, step: 0.25, location: "bottom")
#let y_axis = axis(min: 0, max: 1, step: 0.25, location: "left")
#let pl = plot(data: data, axes: (x_axis, y_axis))
#figure(
  graph_plot(
    pl,
    (200pt, 150pt),
    caption: none),
  supplement: none,
  caption: [Représentation graphique de $f$ sur $[0, 1]$],
)

==
La fonction `suite` repose naturellement sur de la récursivité. Nous allons donc la programmer dans un language qui supporte de manière optimale les fonctions récursives.

#block(breakable: false)[
  Voici `suite a p` en Haskell.

  #code-from-file(folder-name, "/code/suite.hs")
]

#block(breakable: false)[
  Voici `suite a p` en OCaml.

  #code-from-file(folder-name, "/code/suite.ml", lang: "ocaml")
]

#block(breakable: false)[ 
  Voici `suite(a, p)` en Python. 
  
  #code-from-file(folder-name, "/code/suite.py") ]
==
===
- Si $a = 1/3$: 
  - $u_0 = 1/3$
  - $u_1 = f(u_0) = 2/3$ car $u_0 < 1/2$
  - $u_2 = 2(1-2/3) = 2/3$ car $u_1 > 1/2$
On remarque que $u_1 = u_2 = 2/3$ puisque $f(2/3) = 2/3$, donc la suite $(u_n)_(n in NN)$ sera constante pour $n >= 1$.

Avec $a = 1/3$:
$
  u_n = cases(delim: "{",
    1/3 "si" n = 0,
    2/3 "si" n>=1
  )
$

- Si $a = 0.33$, On obtient : $(0.33, 0.66, 0.68, 0.64, 0.72, 0.56, 0.88, 0.24, 0.48)$
On remarque que, bien que $1/3 approx 0.33$, la suite ne devient pas constante pendant les 9 premiers termes.

===

Soit $k in NN^*$ et $a = 1/2^k$.
$forall k in NN^*, 1/2^k <= 1/2$, donc

$u_0 = 1/2^k$ #h(1fr) $u_1 = 2(1/2^k) = 1/2^(k-1)$ #h(1fr) $u_2 = 1/2^(k-2)$

Cela ne varie pas tant que $n < k$.

$u_k = 1/2^(k-k) = 1$ #h(1fr) $u_(k+1) = 0$ #h(1fr) $u_(k+2) = 0$

Or, $f(0) = 0$, donc

Avec $a = 1/2^k$ :
$
  u_n = cases(delim: "{",
    1/2^(k-n) &"si" n in bracket.l.double 0 "," k bracket.r.double,
    0 &"si" n > k
  )
$

===

Soit $k in NN^*$ et $a = 1/(3 times 2^k)$.
$forall k in NN^*, 1/(3 times 2^k) <= 1/(3 times 2) < 1/2$, donc

$u_0 = 1/(3 times 2^k)$ #h(1fr) $u_1 = 2(1/(3 times 2^k)) = 1/(3 times 2^(k-1))$ #h(1fr) $u_2 = 1/(3 times 2^(k-2))$

Cela ne varie pas tant que $n < k$.

$u_k = 1/(3 times 2^(k-k)) = 1/3$ #h(1fr) $u_(k+1) = 2/3$ #h(1fr) $u_(k+2) = 2/3$

Or, $f(2/3) = 2/3$, nous l'avions déjà observé à la question 3) a).

Avec $a = 1/(3 times 2^k)$ :
$
  u_n = cases(delim: "{",
    1/(3 times 2^(k-n)) &"si" n in bracket.l.double 0 "," k bracket.r.double,
    2/3 &"si" n > k
  )
$

==
===
Choisissons $a = 0$. Comme $f(0) = 0$, la suite $(u_n)_(n in NN)$ sera bien constante. Nous aurions aussi pu choisir $a = 2/3$.

===
Choisissons $a = 2/5$. Comme $f(2/5) = 4/5$, $f(4/5) = 2/5$, la suite $(u_n)_(n in NN)$ est bien périodique de période 2. Nous aurions aussi pu choisir $a = 4/5$.

===
Choisissons $a = 2/7$. Comme $f(2/7) = 4/7$, $f(4/7) = 6/7$ et $f(6/7) = 2/7$, la suite $(u_n)_(n in NN)$ sera bien périodique de période 3. Nous aurions aussi pu choisir $a = 4/7$ ou $a = 6/7$.

==

Si $k = 2$, comme vu auparavant, la suite $(u_n)_(n in NN)$ est constante, nous n'étudierons donc pas ce cas afin de simplifier le raisonnement.

Soit un entier $k$ tel que $k> 2$. 

On a $2^k - 1 >= 7$, donc $0 < 2/(2^k - 1)<1/2$. Ainsi, $a in [0, 1/2]$, ce qui garantit que la suite $(u_n)_(n in NN)$ est bien définie par $f$.

On remarque de manière évidente que si tous les termes de la suite $u_n$ sont inférieurs à $1/2$ jusqu'à un rang $n$, $n in NN$, on a : $ u_n = 2^n dot a =2^(n+1)/(2^k - 1) $

Or, $2^n dot a$ tend vers $+infinity$ lorsque $n$ tend vers $+infinity$,
donc il adviendra un moment où $2^n dot a > 1/2$

D'où, au rang $k-1$, car 

$u_(k-3) = 2^(k-2)/(2^k - 1) < 1/2$ #h(20%) et #h(20%) $u_(k-2) = 2^(k-1)/(2^k - 1) > 1/2$ 

On a :
$ u_(k-1) = 2(1 - 2^(k-1)/(2^k - 1)) = 2 - 2^k/(2^k - 1) = 1 - 1/(2^k - 1) > 1/2 $ 
$ u_k = 2(1 - (1 - 1/(2^k - 1))) = 2 - 2 - 2/(2^k - 1) = a $


Et la suite $(u_n)_(n in NN)$ est donc périodique de période $k$.

==
===
Supposons $a$ rationnel, i.e $a = p/q$, $p, q in NN$, $q != 0$ et $p <= q$.

Toutes les images de $a$ par $f$ peuvent être écrites sous la forme $m/q$, $m in NN$ :

- si $a <= 1/2$, on a $f(a) = 2 dot a = (2 dot p) / q = m/q$ avec $m = 2 dot p$

- si $a > 1/2$, on a $f(a) = 2 dot (1 - a) = 2 - (2 dot p)/q = m/q$ avec $m = 2 dot (q-p)$

Or, il existe un nombre fini de fractions possibles $m/q$, $m < q$, conditions satisfaites par les propriétés de la fonction $f$, qui ne change pas le dénominateur et renvoie toujours un nombre positif inférieur à $1$ (cf question 1).

Ce qui implique que la suite finira par "revisiter" un de ses termes précédants, formant ainsi un cycle périodique.

===
Supposons que $(u_n)$ est périodique de période $k$.

On remarque que pour tout $n$, $f compose f compose ... compose f(x)$ ($n$ fois) est de la forme $a + b x$, avec $a, b in ZZ$.
Or, comme $u_n = u_(n+k)$, $u_n$ est un point fixe de $f^k$ ($f$ composée $k$ fois avec elle-même),
et puisque $a + b u_n = u_n$, alors $u_n in QQ$.

Enfin, puisque $u_n in QQ$, $a in QQ$ car $u_n = m + n a$ pour $m, n in ZZ$.

== 
On dit que "$a$ atteint sa cible" si la suite $(u_n)_(n in NN)$ est nulle à partir d'un certain rang.

Soit $a = 0$ et la suite $(u_n)_(n in NN)$ est nulle par récurrence immédiate : "$a$ atteint sa cible".

Sinon, supposons que $a != 0$, $u_(n-1) != 0$ et $u_n = 0$, on n'a que deux cas :

- $u_n = 2 dot u_(n-1) != 0$ : contradiction car on suppose que $u_n = 0$
- $u_n = 2(1-u_(n-1)) = 2- 2 dot u_(n-1)$, si et seulement si $u_(n-1) = 1$

Donc "$a$ atteint sa cible" si l'un des termes de la suite $(u_n)_(n in NN)$ est égal à 1.

En poursuivant ce raisonnement, nous pouvons conjecturer le fait que "a atteint sa cible" si et seulement si $a = p/2^m$, avec $p, m in NN$ et $p <= 2^m$.

En effet, à partir d'un certain rang, $a$ aura "subi" une série de modifications au niveau de son numérateur : des multiplications par $2$ et/ou des "renversements". 

Ce terme pourra alors être réécrit sous forme d'entier, son dénominateur ayant été "anihilé" par les multiplications par $2$.

Enfin, on peut exprimer celui-ci comme $p$, avec $p in NN$ tel que $p <= 1$ (propriétés de la fonction $f$, d'où $u_n = 0$ ou $u_n = 1$, ce qui conclut.


===

Si l'on pose $a = 1789/2^1789$, $a$ devrait atteindre sa cible.

En effet, comme $a < 1/2$, au rang $1778$ : $u_1778 = 2^1778 dot 1789/2^1789 = 1789/2^11 < 1$, $u_1778$ étant le premier terme de la suite supérieur à $1/2$ car $2^10 < 1789 < 2^11$.

Puis on a : $u_1789 = 1$ d'où, pour tout $N in NN$ tel que $N >= 1790$ : $u_N = 0$, ce qui implique que $1789/2^1789$ atteint bien sa cible.

===

Comme vu ci-dessus, tous les nombres de la forme $p/2^m$, avec $p, m in NN$ et $p <= 2^m$ atteignent leur cible.

==

===

On remarque graphiquement qu'il existe deux cas, déterminés par $x$ :

- si $0<= x <= 1/2$, $y$ est "contracté" par un facteur $2$ tandis que $x$ est "dilaté" par un facteur 2
- si $1/2 < x <= 1$, $x$ est d'abord "dilaté" par un facteur $2$ avant de se voir soustraire à $2$ (on cherche sa distance au bord droit après élongation de la pâte), tandis que $y$ est d'abord "contracté" par un facteur $2$ avant de se faire soustraire à $1$ (on cherche sa distance au bord inférieur après élongation de la pâte).


$
  phi(x, y) = cases(delim: "{",
    (2 dot x, y/2) &"si" 0 <= x <= 1/2,
    (2(1-x), (y+1)/2) &"si" 1/2 < x <= 1
  )
$

===

Nous devons montrer qu'il existe un unique couple $(x,y)$ pour tout couple $(a,b)$ donné.

==== Cas 1) $0 <= x <= 1/2$

On a : 
$ a = 2 dot x, b = y/2 $

D'où:
$ x=a/2, y=2 dot b $

Valide car:
$ 0 <= x <= 1/2 => 0 <= a/2 <= 1/2 => 0 <= a <= 1 $ 
$ 0 <= y <= 1 => 0 <= 2 dot b <= 1 => 0 <= b <= 1/2 $

Donc cette solution est valide pour $0 <= b <= 1/2$


==== Cas 2) $1/2 < x <= 1$

On a:
$ a=2(1-x), b=(y+1)/2 $

D'où:
$ x=1-a/2, y=2 dot b - 1$

Valide car:
- $ 1/2 < x <= 1 => 1/2 < 1 - a/2 <= 1$ 
- $ 0 <= y <= 1 => 0 <= 2 dot b - 1 <= 1 => 1/2 < b <= 1 $

Donc cette solution est valide pour $1/2 < b <= 1$


Pour chaque couple $(a,b)$, il existe donc un unique couple $(x,y)$ respectant les conditions de base.

===

$
  phi(x, y) = cases(delim: "{",
    (2 dot x, y/2) &"si" 0 <= x <= 1/2,
    (2(1-x), (y+1)/2) &"si" 1/2 < x <= 1
  )
$

#let fphi(a) = {
  let (x, y) = a
  if 0 <= x and x <= 1/2 {
    (2 * x, y / 2)
  } else if 1/2 < x and x <= 1 {
    (2 * (1 - x), (y+1) / 2)
  } else {
    assert(false)
  }
}

#let data_phi1 = data.map(a => fphi(a))
#let pl_phi1 = plot(data: data_phi1, axes: (x_axis, y_axis))
#let data_phi2 = data_phi1.map(a => fphi(a))
#let pl_phi2 = plot(data: data_phi2, axes: (x_axis, y_axis))

#colbreak() // corrige un bug
#columns(
  2,
  gutter: 0pt,
  align(center)[
    #figure(
    graph_plot(
        pl_phi1,
        (200pt, 150pt),
        caption: none),
      supplement: none,
      caption: [Représentation graphique de $phi$ sur $[0, 1]$],
    )
    #colbreak()
    #figure(
      graph_plot(
        pl_phi2,
        (200pt, 150pt),
        caption: none),
      supplement: none,
      caption: [Représentation graphique de $phi compose phi$ sur $[0, 1]$],
    )
  ]
)


= Galette des rois

#v(1fr)

#figure(
  image("img/galette.png", width: 40%),
  supplement: none,
  caption: [
    Bon appétit !#footnote[L'aire de cette galette est $4r^2$.]
  ],
)

#v(1fr)

#figure(
  image("img/feve.jpg", width: 25%),
  supplement: none,
  caption: [
    Avec une jolie fève :)
  ],
)

#v(1fr)
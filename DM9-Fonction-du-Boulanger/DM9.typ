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
test
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

Donc nous avons bien $f([0, 1]) = [0, 1]$

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
  Voici `suite a p` en OCaml 🔥.

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
Choisissons $a = 0$, comme $f(0) = 0$, la suite $(u_n)_(n in NN)$ sera bien constante. Nous aurions aussi pu choisir $a = 2/3$.

===
Choisissons $a = 2/5$, comme $f(2/5) = 4/5$, $f(4/5) = 2/5$, la suite $(u_n)_(n in NN)$ est bien périodique de période 2. Nous aurions bien-sûr aussi pu choisir $a = 4/5$.

===
Choisissons $a = 2/7$, comme $f(2/7) = 4/7$, $f(4/7) = 6/7$ et $f(6/7) = 2/7$, la suite $(u_n)_(n in NN)$ sera bien périodique de période 3. Nous aurions bien-sûr aussi pu choisir $a = 4/7$ ou $a = 6/7$.

==

Si $k = 2$, comme vu auparavant, la suite $(u_n)_(n in NN)$ est constante, nous n'étudierons donc pas ce cas afin de simplifier le raisonnement.

Soit un entier $k$ tel que $k> 2$. 

On a $2^k - 1 >= 7$, donc : $0 < 2/(2^k - 1)<1/2$. Ainsi, $a in [0, 1/2]$, ce qui garantit que la suite $(u_n)_(n in NN)$ est bien définie par $f$.

On remarque de manière évidente que si tous les termes de la suite $u_n$ sont inférieurs à $1/2$ jusqu'à un rang $n$, $n in NN$, on a : $ u_n = 2^n dot a =2^(n+1)/(2^k - 1) $

Or, $2^n dot a$ tend vers $+infinity$ lorsque $n$ tend vers $+infinity$,
donc il adviendra un moment où $2^n dot a > 1/2$

D'où, au rang $k-1$, car 

$u_(k-3) = 2^(k-2)/(2^k - 1) < 1/2$ #h(20%) et #h(20%) $u_(k-2) = 2^(k-1)/(2^k - 1) > 1/2$ 

On a :
$ u_(k-1) = 2(1 - 2^(k-1)/(2^k - 1)) = 2 - 2^k/(2^k - 1) = 1 - 1/(2^k - 1) > 1/2 $ 
$ u_k = 2(1 - (1 - 1/(2^k - 1))) = 2 - 2 - 2/(2^k - 1) = a $

Et la suite $(u_n)_(n in NN)$ est donc périodique de période $k$.

#pagebreak()
= Galette des rois

#figure(
  image("code/galette.png", width: 100%),
  caption: [
    Bon appétit !#footnote[L'aire de cette galette est $4r^2$.]
  ],
)

#figure(
  image("code/feve.jpg", width: 55%),
  caption: [
    Avec une jolie fève :)
  ],
)

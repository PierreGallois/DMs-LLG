#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 3,
  titre: [\
    Théorème de la corde universelle],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM03-Theoreme-de-la-corde-universelle/"

= Exemples
Dans les parties A et B, $n$ désigne un entier supérieur ou égal à 2.

= Généralisation
Soit $f$ une fonction continue sur $[0, 1]$ telle que $f(0) = f(1)$.
Pour tout $x in [0, 1 - 1/n]$, on pose $g(x) = f(x) - f(x + 1/n)$.

==
La fonction continue $x |-> x + 1/n$ a son ensemble image inclus dans $[0, 1]$ d'après le théorème des valeurs intermédiaires.
Or $f$ est continue sur $[0, 1]$ donc $g$ est continue sur $[0, 1]$ par opérations et composition de fonctions continues sur $[0, 1]$.

==
$
  sum_(k=0)^(n-1) g(k/n) &= sum_(k=0)^(n-1) f(k/n) - f((k+1) / n)\
                         &= f(0) - f(1) quad "par télescopage" \
                         &= 0 "car" f(0) = f(1)
$

==
On recherche s'il existe $alpha in [0, 1 - 1/n]$ tel que $g(alpha) = 0$.
Comme $sum_(k=0)^(n-1) g(k/n) = 0$,
- soit $g(k/n)$ est égal à 0 pour tous $k in [0, n-1]$ et l'on peut prendre n'importe quel $k$ pour avoir $alpha = k/n$ puisque $k in [|0, n-1|]$ donc $k/n in [0, 1- 1/n]$.
- soit il existe $k'$ tel que $g(k'/n) != 0$. Dans ce cas puisque la somme vaut 0, il existe nécessairement au moins un $k''$ tel que $g(k''/n)$ soit de signe opposé à $g(k'/n)$. Comme $g$ est continue sur $[0, 1]$, il existe d'après le théorème des valeurs intermédiaires #footnote[Soit $a, b in RR$, $[a <-> b] = cases([a, b] &"si" a <= b, [b, a] &"si" b < a)$] $alpha in [k'/n <-> k''/n]$ tel que $g(alpha) = 0$. Comme $[k'/n <-> k''/n] subset.eq [0, 1-1/n]$, on a bien $alpha in [0, 1-1/n]$.

= Généraliser encore ?
Soit $T in ]0, 1[$ tel que $1/T in.not ZZ$, et $f$ une fonction continue sur $[0, 1]$ telle que $f(0) = f(1)$.
On considére $f: x |-> sin^2((pi x) / T) - x sin^2(pi / T)$ d'inconnue $x in [0, 1 - T]$.

==
Comme la fonction sinus est continue sur $RR$ et que $T != 0$, $f$ est continue sur $[0, 1]$ par opérations et composition de fonctions continues.

$
  &f(0) = sin^2(0) - 0 = 0 \
  &f(1) = sin^2(pi/T) - sin^2(pi/T) = 0
$

Donc on a bien $f(0) = f(1)$.

==

$
  f(x) - f(x + T) &= sin^2((pi x) / T) underline(- x sin^2(pi/x)) - sin^2((pi (x + T)) / T ) + (underline(x) + T) sin^2(pi/T) \
                  &= sin^2((pi x)/T) - sin^2((pi x) / T + pi) + T sin^2(pi/T) \
                  &= sin^2((pi x)/T) - (sin((pi x) / T) underbrace(cos(pi), = -1) + cos((pi x)/T) underbrace(sin(pi), =0))^2 + T sin^2(pi/T) \
                  &= T sin^2(pi/T)
$

Or $T != 0$ et comme $sin^2(pi/T) = 0 <=> sin(pi/T) = 0 <=> pi/T = 0 "ou" pi/T = pi$ et $T != 1$, on a que pour tout $x$ dans $[0, 1 - T]$, $f(x) - f(x + T) > 0$

==
On a que $f(x) - f(x + T) > 0$ ie $f(x) > f(x + T)$ donc $f(x) != f(x + T)$ pour tout $x$ dans $[0, 1 - T]$.

Nous avons trouvé un contre-exemple donc $f(x + T) = f(x)$ est impossible pour tout $x$ dans $[0, 1-T]$.
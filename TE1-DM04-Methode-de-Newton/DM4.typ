#import "./../templates/homework.typ": dm, sous-partie, code-from-file
#import "@preview/lilaq:0.5.0" as lq

#show: dm.with(
  numero: 4,
  titre: [Méthode de Newton],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM04-Methode-de-Newton/"


= Description de la méthode de Newton


==
D'une part on sait que la fonction $f$ est dérivable donc continue sur $[a,b]$ et qu'elle y est strictement monotone  car $f'$ strictement négative.
D'autre part, on dispose de $f(a) > 0$ et de $f(b) < 0$.

Ainsi, d'après le corollaire du Théorème des Valeurs Intermédiaires, il existe un unique $alpha in [a,b]$ tel que $f(alpha) = 0$.

== 
=== 
Soit $u in [a,b]$. On note $tau_u$ la tangente à la courbe représentative de $f$ au point d'abscisse $u$. 

Ainsi, l'équation de $tau_u$ est donnée par :
$y = f'(u)(x - u) + f(u)$

Or $y = 0 <=> x = u - (f(u)) / (f'(u))$.

Par conséquent, $tau_u$ coupe donc l'axe des abscisses au point d'abscisse $u - (f(u)) / (f'(u))$.

===
Considérons maintenant la fonction $g$ définie sur $[a,b]$ par $g : x arrow.r.long.bar x - (f(x)) / (f'(x))$ et la suite $(x_n)_(n in NN)$ par $x_0 = a$ et $x_(n+1) = g(x_n)$.

Cette suite se construit donc de la manière suivante : on part du point d'abscisse $x_n$ sur la #highlight(fill: red.lighten(70%).saturate(20%))[courbe représentative] de $f$, on trace la #highlight(fill: eastern.lighten(70%).saturate(50%))[tangente] à cette courbe en ce point, puis on #box(outset: 2pt, stroke: (dash: "dotted", join: "round", cap: "round"))[reporte] l'intersection de cette tangente avec l'axe des abscisses pour obtenir le point d'abscisse $x_(n+1)$.
#footnote[Schémas générés automatiquement pour n'importe quelle fonction. (programme dans le code source du DM, cf Github).]

#show: lq.set-tick(inset: 0pt, outset: 0pt)

#let tengeante-graph(f, fp, us, repeat, xlim, ylim) = {
  let xs = lq.linspace(xlim.at(0), xlim.at(1))
  lq.diagram(
    grid: none,
    xaxis: none,
    yaxis: none,
    xlim: xlim,
    ylim: ylim,
    width: 15cm,
    height: 7cm,
    
    lq.xaxis(format-ticks: none),
    lq.yaxis(format-ticks: none),
    lq.hlines(0),
    lq.place(0% + 5pt, 0, clip:true, move(dy: 7pt, text($0$, size: 10pt))),
    ..for (us_n, u) in us.enumerate() {
      for n in range(repeat.at(us_n)) {
        let nu = u - (f(u) / fp(u))
        (lq.line((u, f(u)), (nu, 0), stroke: (paint: eastern, thickness: 1.5pt)),)
        (lq.line((nu, 0), (nu, f(nu)), stroke: (dash: "dotted", join: "round", cap: "round")),)
        (lq.place(u, f(u), clip: true, move(dx: 7pt, dy: -7pt, text($x_(#n)$, size: 10pt))),)
        u = nu
      }
    },
    lq.plot(xs, xs.map(x => f(x)), mark: none, color: red, stroke: (thickness: 1.5pt)),
  )
}
#align(center, tengeante-graph(x => calc.exp(x), x => calc.exp(x), (3,), (10,), (-5, 10), (-2, 10)))
#align(center, tengeante-graph(x => calc.pow(x, 4) + 2*calc.pow(x, 3) - calc.sqrt(2)*x - 2/5, x => 4*calc.pow(x, 3) + 6*calc.pow(x, 2) - calc.sqrt(2), (-0.5877,), (6,), (-1.8, 0.9), (-1, 3/4)))
//#tengeante-graph(x => calc.exp(x))
// tester : -0.584

==

===
La fonction $g$ est dérivable sur $[a,b]$ par composition de fonctions dérivables, dont $f'$ qui ne s'y annule pas, et pour tout $x in [a,b]$, on a : $g'(x) = (f(x)f''(x))/((f'(x))^2)$

Ainsi, $g'$ de même signe que $f$ sur $[a,b]$ et donc $g$ est strictement croissante sur $[a,alpha]$ et strictement décroissante sur $[alpha,b]$.

===
Montrons que pour tout $n in NN$, $a <= x_n <= b$ en procédant par récurrence :

- Initialisation : $x_0 = a$ donc $a <= x_0 <= b$.
- Hérédité : Soit $n in NN$, supposons que $a <= x_n <= b$.
  - Si $x_n = alpha$, alors $x_(n+1) = g(x_n) = g(alpha) = alpha$ donc $a <= x_(n+1) <= b$.
  - Si $x_n < alpha$, alors par croissance de $g$ sur $[a,alpha]$, on a $g(a) <= g(x_n) <= g(alpha) = alpha$. Or $a  <= g(a) <= alpha$ par l'hypothèse de récurrence, donc $a <= x_(n+1) <= b$.
  - Si $x_n > alpha$, alors par décroissance de $g$ sur $[alpha,b]$, on a $g(b) >= g(x_n) >= g(alpha) = alpha$. Or $b >= g(b) >= alpha$ par l'hypothèse de récurrence, donc $a <= x_(n+1) <= b$.

Par conséquent, on en déduit que pour tout $n in NN$, $a <= x_n <= b$.

==

===

===


= Vitesse de convergence
==
$phi: x mapsto f(b) - f(x)  -(b-x)f'(x) - (b-x)^2/(b-a)^2 (f(b)-f(a)-(b-a)f'(a))$, définie sur $[a;b]$, est dérivable sur $[a;b]$ par opérations. Sa dérivée est pour tout $x in [a;b]$ :
$
  phi'(x) = (b - x) ((2 ((a - b) f'(a) - f(a) + f(b)))/(b - a)^2 - f''(x))
$
 De plus, on vérifie que $phi(a) = phi(b) = 0$. Le théorème de Rolle donne l'existence de $c in ]a:b[$ tel que $phi'(c) = 0$, c'est à dire :
 $
   f''(c) = (2(f(b)-f(a)-(b-a)f'(a)))/(b-a)^2\
   <=> f(b)-f(a) = (b-a)f'(a) + (b-a)^2/2f''(c)
 $
 Ce qu'il fallait démontrer.

==
$f'$ est dérivable donc continue sur $[a;b]$. Le théorème des bornes atteintes donne donc un $m in RR$ tel que $f' <= m$. De plus, $f'$ atteint $m$ : comme $f' < 0$, $m < 0$ et pour tout $x in [a;b], |f'(x)| >= |m| > 0$.

De même, $f''$ est continue sur $[a;b]$, donc bornée sur $[a;b]$ : il existe donc $M >= 0$ tel que $|f''(x)| <= M$. Comme $f'' > 0$, $M > 0$ et on a ce que l'on voulait démontrer.

==
La formule de Taylor-Lagrange appliquée à $f$ sur $[x;alpha]$ donne $c in ]x;alpha[$ tel que :
$
  f(alpha)-f(x)-(alpha-x)f'(x) = (alpha-x)^2/2f''(c)
$
En passant à la valeur absolue et en utilisant $f'' <= M$, on obtient :
$
  |f(alpha)-f(x)-(alpha-x)f'(x)| <= (alpha-x)^2/2M \
  <=> abs(x - f(x)/(f'(x)) - (f(alpha) - f(alpha)/(f'(x)))) <= ((alpha-x)^2M)/(2f'(x))
$
En remarquant que $f(alpha) = 0$, on a $f(alpha) / (f'(x)) = f(alpha) / (f'(alpha))$. En utilisant cette réécriture et le fait que $f' >= m$, on a enfin :
$
  |g(x) - alpha| = |g(x) - g(alpha)| <= ((alpha-x)^2 M)/(2m)
$
==
Posons pour tout $n in NN, u_n = M/(2m)|x_n-alpha|$. D'après le $4)b)$ de la partie A, on sait que $(x_n) -> alpha$. Donc $(u_n) -> 0$ par continuité de $|dot|$ et produit, et il existe donc par définition un $N in NN$ tel que $u_n = M/(2m)|x_N-alpha| < 1$.




= Algorithmes
==

==
==

Tentons maintenant de simplifier et d'optimiser ce code :

#code-from-file(folder-name, "newton_simplifie.py")

Pour aller encore plus loin dans la simplification, changeons de language pour Haskell :

#code-from-file(folder-name, "newton.hs")
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
Considérons maintenant la fonction $g$ définie sur $[a,b]$ par $g : x arrow.r.long.bar x - (f(x)) / (f'(x))$ et la suite $(x_n)_(n in N)$ par $x_0 = a$ et $x_(n+1) = g(x_n)$.

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
$f$ est deux fois dérivable sur $[a, b]$ donc $f'$ est dérivable sur $[a, b]$. $g$ est donc dérivable sur $[a, b]$ par opérations et $g'(x) = 1 - ((f'(x))^2 - f''(x)f(x)) / (f'(x))^2 = - (f''(x)f(x)) / (f'(x))^2$. Comme $f''$ est strictement positive sur $[a, b]$, $g'$ a le signe opposé de $f$.

===



= Vitesse de convergeance



= Algorithmes
==

==
==

Tentons maintenant de simplifier et d'optimiser ce code :

#code-from-file(folder-name, "newton_simplifie.py")

Pour aller encore plus loin dans la simplification, changeons de language pour Haskell :

#code-from-file(folder-name, "newton.hs")
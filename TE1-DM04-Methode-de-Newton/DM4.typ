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
#align(center, tengeante-graph(x => calc.exp(-x)-1, x => -calc.exp(-x), (-2.3,), (4,), (-5, 10), (-2, 10)))
#align(center, tengeante-graph(x => calc.pow(x, 4) + 2*calc.pow(x, 3) - calc.sqrt(2)*x - 2/5, x => 4*calc.pow(x, 3) + 6*calc.pow(x, 2) - calc.sqrt(2), (-0.5877,), (6,), (-1.8, 0.9), (-1, 3/4)))
//#tengeante-graph(x => calc.exp(x))
// tester : -0.584
(Exemple de fonction ne satisfaisant pas l'énoncé, pour lequel la suite $(x_n)$ a un comportement erratique jusqu'à atteindre un intervalle sur lequel l'énoncé est satisfait, où elle converge bien vers une racine).

==
===
La fonction $g$ est dérivable sur $[a,b]$ par composition de fonctions dérivables, dont $f'$ qui ne s'y annule pas, et pour tout $x in [a,b]$, on a : $g'(x) = (f(x)f''(x))/((f'(x))^2)$

Ainsi, $g'$ de même signe que $f$ sur $[a,b]$ et donc $g$ est strictement croissante sur $[a,alpha]$ et strictement décroissante sur $[alpha,b]$.

===
Montrons que pour tout $n in NN$, $a <= x_n <= alpha$ en procédant par récurrence :

- Initialisation : $x_0 = a$ donc $a <= x_0 <= alpha$.
- Hérédité : Soit $n in NN$, supposons que $a <= x_n <= alpha$. Comme $alpha <= b$, $x_n in [a;b]$ et $g(x_n)$ est bien défini. Par croissance de $g$ sur $[a,alpha]$, on a $g(a) <= g(x_n) <= g(alpha) = alpha$. Or $a  <= g(a)$, donc $a <= x_(n+1) <= alpha$.

Par conséquent, on en déduit que pour tout $n in NN$, $a <= x_n <= alpha$.

==
===
Montrons que $(x_n)$ est croissante. Pour tout $n in NN$:
$
  x_(n+1) - x_n = g(x_n) - x_n = -(f(x_n))/(f'(x_n))
$
Comme $x_n in [a;alpha]$, $f(x_n) >= 0$. De plus, $f'$ est strictement négative sur $[a;b]$. Ainsi, on a $x_(n+1) - x_n >= 0$ et $(x_n)$ est bien croissante.

===
La suite $(x_n)$ est croissante et bornée par $alpha$ : par le théorème de la limite monotone, la suite $(x_n)$ tend vers une limite $ell in [a;alpha]$; $g(ell)$ est donc bien définie. De plus, par continuité de $g$ et unicité de la limite :
$
  g(ell) = g(lim_(n-> oo) x_n) = lim_(n-> oo) g(x_n) = lim_(n -> +oo) x_(n+1) = ell
$
Donc $ell$ est un point fixe de $g$ : le seul point fixe de $g$ sur $[a;alpha]$ étant $alpha$, on déduit que $(x_n) -> alpha$.


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

==
D'après le $3)$, $u_(n+1) <= u_n^2$. Montrons d'abord par récurrence que pour tout $n >= N, u_n <= u_N^(2^(n-N))$.

Initialisation : $u_N <= u_N^1$.

Hérédité : Si pour $n >= N, u_n <= u_N^(2^(n-N))$, alors :
$
  u_(n+1) <= u_n^2 <= u_N^(2 dot 2^(n-N)) = u_N^(2^((n+1)-N))
$
Ce qui conclut la récurrence.

Ainsi, pour tout $n >= N$ :
$
  u_n <= u_N^(2^(n-N)) <=> M/(2m)|x_n-alpha| <= (u_N^(2^(-N)))^(2^n) \
  <=> |x_n - alpha| <= (2m)/M (u_N^(2^(-N)))^2^n
$
On obtient le résultat voulu avec $C = (2m)/M > 0$ et $k = u_N^2^(-N)$, où $k < 1$ car $u_N < 1$ et $x^a < 1$ pour tout $a in RR^+_*$ quand $x < 1$.


= Algorithmes
==
Pour $f(x) = x^2 - a$, $f'(x) = 2x$ et on a donc pour tout $n in NN$ :
$
  u_(n+1) = u_n - (u_n^2-a)/(2u_n) = (u_n^2+a)/(2u_n)
$
Qui tend pour tout $a in RR^+_*$ vers $sqrt(a)$, car $f$ satisfait les conditions de l'énoncé sur $[0; X]$ pour tout $X > sqrt(a)$ : pour $a > 1$, on peut prendre $X=a$ sans avoir à calculer $sqrt(a)$.

==
Pour $f(x) = x^3 - 2$, $f'(x) = 3x$ et pour tout $n in NN$ :
$
  u_(n+1) = u_n - (u_n^3 -2)/(3u_n)  = (3u_n^2 - u_n^3 + 2)/(3u_n)
$
Qui tend vers $root(3,2)$ car $f$ satisfait les conditions de l'énoncé sur $[0; 3]$, car $3 > root(3,2)$ et $f$ est strictement croissante.

==
Ce script calcule (dans la boucle) les termes de la suite $(x_n)$ jusqu'à avoir atteint une précision suffisante $epsilon$ en image, et renvoie le dernier terme calculé comme valeur de $alpha$.

Tentons maintenant de simplifier et d'optimiser ce code :

#code-from-file(folder-name, "newton_simplifie.py")

Pour aller encore plus loin dans la simplification, changeons de language pour Haskell :

#code-from-file(folder-name, "newton.hs")
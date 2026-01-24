#import "./../templates/homework.typ": dm, code-from-file
#import "@preview/cetz:0.4.2"

#show: dm.with(
  numero: 8,
  titre: [Chemins sur un quadrillage],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM08-Chemins-Sur-Un-Quadrillage/"

#show "Dyck": smallcaps
#show "Catalan": smallcaps

= Retrouver des formules bien connues
==
Un chemin entre $O$ et $M(p,q)$ équivaut à une somme ordonnée de $p$ vecteurs $arrow(i)$ et de $q$ vecteurs $arrow(j)$. Une telle somme est composée de $p+q$ termes, et est déterminée uniquement par la position des $p$ vecteurs $arrow(i)$ parmi les $p+q$ termes, en complétant tous les autres termes par des $arrow(j)$. Ainsi, comme l'ordre des $arrow(i)$ n'importe pas, il y a $binom(p+q,p)$ telles sommes. 
  
On en déduit que le nombre de chemins entre $O$ et $M(p,q)$ est de $binom(p+q,p) = binom(p+q,q)$ (par symétrie).

==
Un chemin de longueur $n$ partant d'un point consiste en une somme ordonnée de $n$ vecteurs parmi ${arrow(i), arrow(j)}$, assimilable à une $n$-liste de cet ensemble à deux éléments. On en déduit qu'il y a $2^n$ chemins de longueur $n$ partant de tout point (et en particulier de l'origine).

==
===
Par translation de vecteur $arrow(P O) = vec(0,-1)$, un chemin joignant $P(0,1)$ à $B_k (n-k, k)$ équivaut à un chemin joignant l'origine et $B'_k (n-k,k-1)$. Ceux ci sont donc au nombre de $binom(n-k+k-1,k-1) = binom(n-1,k-1)$.

Similairement, un chemin entre $Q$ et $B_k (n-k, k)$ équivaut à un chemin entre l'origine et $B''_k (n-k-1,k)$. Ils sont donc au nombre de $binom(n-k-1 + k, k) = binom(n-1,k)$.

===
On double compte les chemins de $O$ à $B_k$. D'une part, ceux-ci sont au nombre de $binom(n,k)$ par le 1). D'autre part, un tel chemin doit passer soit par $Q(1,0)$, soit par $P(0,1)$ en fonction du premier vecteur du chemin. Ainsi, un chemin entre $O$ et $B_k$ est soit un chemin de $Q$ à $B_k$, soit un chemin de $P$ à $B_k$. On en déduit :
$
  binom(n,k) = binom(n-1,k) + binom(n-1,k-1)
$
===
Un chemin de $O$ à $B_n (n,n)$ passant par $B_k (n-k, k)$ équivaut à la donnée de deux chemins, l'un de $O$ à $B_k$, et l'autre de $B_k$ à $B_n$. Ainsi, ces chemins sont au nombre de :
$
  binom(n-k+k,k) dot binom(n - (n-k) + (n-k),n-k) = binom(n,k) binom(n,n-k) = binom(n,k)^2
$
Où l'on a dénombré les chemin de $B_k$ à $B_n$ par translation de vecteur $arrow(B_k O)$.

===
On double compte les chemins de $O$ à $B_n (n,n)$. D'une part, ceux-ci sont au nombre de $binom(n+n,n) = binom(2n,n)$. D'autre part, chaque tel chemin, après $n$ étapes, se trouve sur un unique point de la forme $B_k (n-k, k)$ avec $k in [|0;n|]$, car ceux-ci forment l'ensemble des points atteignables depuis $O$ par un chemin de longueur $n$. Ainsi, par disjonction et le dénombrement de la question précédente, on déduit :
$
  sum_(k=0)^n binom(n,k)^2 = binom(2n,n)
$

= Chemins de Dyck et nombres de Catalan
==
===

#let sub_divide(path) = {
  let full = (path.at(0),)
  for n in range(path.len() - 1) {
    let start = path.at(n)
    let end = path.at(n + 1)
    let (sx, sy) = start
    let (ex, ey) = end
    // start is always smaller than end
    if sx <= ex and sy == ey {
      for i in range(1, ex - sx) {
        full.push((sx + i, sy))
      }
    } else if sx == ex and sy <= ey {
      for i in range(1, ey - sy) {
        full.push((sx, sy + i))
      }
    } else {
      panic("wrong inputs")
    }
    full.push(end)
  }
  full
}

#let hash(tuple) = {
  str(tuple.at(0).at(0)) + "," + str(tuple.at(0).at(1)) + "," + str(tuple.at(1).at(0)) + "," +str(tuple.at(1).at(1))
}

#let draw-table(n, style-pt, e: 0.1, draw-grid: true) = {
  import cetz.draw: *
  let style-table = (:)
  for (style, points) in style-pt {
    let full_points = sub_divide(points)
    for i in range(full_points.len() - 1) {
      let start = full_points.at(i)
      let end = full_points.at(i + 1)
      let already-here = style-table.at(hash((start, end)), default: ())
      already-here.push(style)
      style-table.insert(hash((start, end)), already-here)
    }
  }
  let style_line(a, b) = {
    let style = style-table.at(hash((a, b)), default: ())
    if style.len() == 0 {
      if draw-grid {
        line(a, b, stroke: (thickness: 2pt, paint: black))
      }
    } else {
      for (n, style_elem) in style.enumerate() {
        let (ax, ay) = a
        let (bx, by) = b
        let full_size = (style.len() - 1) * e
        if ax != bx {
          // vertical
          line((ax, ay - e * n + full_size / 2), (bx, by - e * n + full_size / 2), ..style_elem)
        } else {
          line((ax + e * n - full_size / 2, ay), (bx + e * n - full_size / 2, by), ..style_elem)
        }
    }
    }
    
  }
  for c in range(n) {
    for l in range(n) {
      style_line((c, l), (c + 1, l)) // horizontal
      style_line((c, l), (c, l + 1)) // vertical
    }
  }
  // closing
  for c in range(n) {
    style_line((c, n), (c + 1, n))
  }
  for l in range(n) {
    style_line((n, l), (n, l + 1))
  }
  // circles for points
  for (_, points) in style-pt {
    // all direction changes
    for point in points {
      circle(point, radius: 6pt, stroke: (paint: black, thickness: 2pt), fill: white)
    }
  }
}

#let explore(n, p: (0, 0), last-move: "any", half: true) = {
  let (px, py) = p
  if not (px <= n and py <= n) {
    return ()
  }
  if half and px > py {
    return ()
  }
  let up-tree = explore(n, p: (px, py + 1), last-move: "up")
  let right-tree = explore(n, p: (px + 1, py), last-move: "right")
  // flatten the tree
  if p == (n, n) {
    return ((p,),)
  }
  let r = ()
  for sub-tree in up-tree {
    if sub-tree.last() == (n, n) {
      if last-move != "up" {
        r.push((p,) + sub-tree)
      } else {
        r.push(sub-tree)
      }
    }
  }
  for sub-tree in right-tree {
    if sub-tree.last() == (n, n) {
      if last-move != "right" {
        r.push((p,) + sub-tree)
      } else {
        r.push(sub-tree)
      }
    }
  }
  r
}

#let zip-color(tuple, color-map) = {
  let lin = gradient.linear(..color-map)
  let len = tuple.len()
  // On triche pour les premiers
  let manuel = ("1": (teal,), "2": (eastern, orange))
  if str(len) in manuel {
    tuple.zip(manuel.at(str(len)))
  } else {
    tuple.zip(lin.samples(..range(len).map(n => n / (len - 1) * 100%)))
  }
}

#let dyck-graph(n) = {
  let (thickness, e) = if n <= 2 {
    (3pt, 0.1)
  } else if n == 3{
    (2pt, 0.07)
  } else {
    (0.9pt, 0.02)
  }
  figure(cetz.canvas({
    import cetz.draw: *
    draw-table(n, zip-color(explore(n), color.map.rainbow).map(a => ((stroke: (paint: a.at(1), thickness: thickness)), a.at(0))), e: e)
  }, length: 1.5cm),
  caption: [chemins de Dyck de longueur #(2*n)]
)
}

#align(center, grid(
  columns: 2,
  align: center,
  inset: 20pt,
  ..for n in range(1, 5) {
    (dyck-graph(n),)
  }
))

(Chemins de Dyck générés automatiquement).
On trouve $C_1$ = 1, $C_2 = 2$ et $C_3 = 5$.

===
Un chemin de Dyck de longueur $2n$ ne rencontrant la diagonale qu'en $O$ et $A_n$ doit forcément passer par $P(0,1)$ (monter à la première étape) et $P'(n-1,n)$ : sinon, le chemin passerait par $Q(n,n-1)$ qui est en dessous de la diagonale. (voir _Schéma 1_ ci-dessous)

De plus, le chemin induit entre $P$ et $P'$, de longueur $2(n-1)$, doit forcément être de Dyck relativement à la diagonale entre $P$ et $P'$ : sinon, il rencontrerait la diagonale entre $O$ et $A_n$. Ainsi, ces chemin sont au nombre de $C_(n-1)$. (voir _Schéma 2_)

#align(center, grid(
  columns: 2,
  align: center,
  inset: 20pt,
  figure(cetz.canvas({
    import cetz.draw: *
    line((-0.5, -0.5), (3.5, 3.5), (3.5, -0.5), stroke: none, fill: gray.lighten(70%))
    draw-table(3, (((stroke: (paint: olive, thickness: 3pt)), ((0, 0), (0, 1))),
                  ((stroke: (paint: olive, thickness: 3pt)), ((2, 3), (3, 3))),
                  ((stroke: (paint: black, thickness: 3pt, dash: "dashed")), ((3, 2), (3, 3))),
                  ((stroke: (paint: black, thickness: 3pt, dash: "dashed")), ((0, 0), (1, 0)))), e: 0.1)
    content((-0.32, -0.05), [$O$])
    content((3.1, 3.32), [$A_n$])
    content((-0.32, 1 - 0.05), [$P$])
    content((2.2, 3.32), [$P'$])
    content((3.3, 2.1), [$Q$])
  }, length: 1.5cm), caption: [_Schéma 1_: Premier trait]),
  figure(cetz.canvas({
    import cetz.draw: *
    line((-0.5, -0.5), (3.5, 3.5), (3.5, -0.5), stroke: none, fill: gray.lighten(70%))
    draw-table(3, (((stroke: (paint: olive, thickness: 3pt)), ((0, 0), (0, 1))),
                  ((stroke: (paint: olive, thickness: 3pt)), ((2, 3), (3, 3))),
                  ((stroke: (paint: black, thickness: 3pt, dash: "dashed")), ((3, 2), (3, 3))),
                  ((stroke: (paint: black, thickness: 3pt, dash: "dashed")), ((0, 0), (1, 0))),
                  ..explore(2).map(a => ((stroke: (paint: white)), a.map(b => (b.at(0), b.at(1) + 1))))), e: 0.1)
    content((-0.32, -0.05), [$O$])
    content((3.1, 3.32), [$A_n$])
    content((-0.32, 1 - 0.05), [$P$])
    content((2.2, 3.32), [$P'$])
    content((3.3, 2.1), [$Q$])
    translate((0, 1))
    draw-table(2, zip-color(explore(2), color.map.rainbow).map(a => ((stroke: (paint: a.at(1), thickness: 3pt)), a.at(0))), e: 0.1, draw-grid: false)
  }, length: 1.5cm), caption: [_Schéma 2_: Chemins de Dyck de $P$ à $P'$])
))



===
Soit $k in [|1;n-1|]$. Un tel chemin passe forcément par $M_k (k,k)$, et est de Dyck jusqu'à avoir atteit $M_k$, et strictement au dessus de la diagonale $Delta$ (qui est aussi la diagonale entre $M_k$ et $M_n$) entre $M_k$ et $M_n$, à la manière du b).

Ainsi, la donnée d'un tel chemin équivaut à celle d'un chemin de Dyck entre $O$ et $M_k$, de longueur $2k$, au nombre de $C_k$, et d'un chemin, comme dans le b), de longueur $2n - 2k = 2(n-k)$, qui sont donc au nombre de $C_(n-k-1)$.

Par le principe du et, ces chemins sont au nombre de $C_k C_(n-k-1)$.

===
On double compte les chemins de Dyck entre $O$ et $M_n$. D'une part, par définition, ceux-ci sont au nombre de $C_n$. D'autre part, tout chemin de Dyck atteint la diagonale pour la dernière fois avant son arrivée en un point $M_k (k,k), k in [|0;n-1|]$. Pour chaque $k in [|1;n-1|]$, ces chemins sont au nombre de $C_k C_(n-k-1)$, et pour $k = 0$, les chemins sont ceux de la question b), qui sont au nombre de $C_(n-1) = C_0 C_(n-0-1)$, où l'on utilise la convention $C_0 = 1$.

Par disjonction, on obtient :
$
  C_n = C_0 C_(n-0-1) + sum_(k=1)^(n-1) C_k C_(n-k-1) = sum_(k=0)^(n-1) C_k C_(n-k-1)
$

===
En appliquant la formule précédente, on obtient :
$
  C_4 &= C_0 C_3 + C_1 C_2 + C_2 C_1 + C_3 C_0 \
  &= 2(C_0 C_3 + C_1 C_2) \
  &= 2(5 + 2) \
  &= 14
$

== 
#code-from-file(folder-name, "catalan.py")
==
===
Un chemin entre $O$ et $M_n (n,n)$ est soit toujours au dessus de la diagonale, soit franchit la diagonale en un point. Par disjonction, on obtient :
$
  C_n + F_n = binom(2n,n)
$

===
Supposons que le chemin franchissant $scr(C)$ prenne la forme :
$
  underbrace(arrow(j) + dots + arrow(i), (k+1) arrow(i) + k arrow(j)= arrow(O A(k+1,k))) + underbrace(dots, (n-k-1)arrow(i) + (n-k)arrow(j)) = arrow(O M_n)
$
Le chemin $scr(C')$ prend alors la forme :
$
  (k+1)arrow(i) +k arrow(j) + (n-k-1)arrow(j) + (n-k)arrow(i) &= (n+1)arrow(i) + (n-1) arrow(j) \
  &= arrow(O B(n+1,n-1))
$

===
Tout chemin de $O$ à $B(n+1, n-1)$ franchit la diagonale $Delta$ au moins une fois, au plus tard en passant de $P(n-1,n-1)$ à $Q(n,n-1)$. Montrons que pour tout $k in [|0;n-1|]$, les chemins de $O$ à $M_n$ franchissant pour la première fois en $A_k (k+1,k)$ sont en même nombre que les chemins de $O$ à $B$ passant par $A_k$.

La construction précédente entre les chemins franchissants en $A_k$ et les chemins de $0$ à $B$ passant par $A_k$ est involutive : inverser le sens des pas après le $2k+1$-ième pas à deux reprises revient à n'avoir rien fait. Ainsi, cette construction est bijective, et le nombre de chemins franchissant en $A_k$ est le même que le nombre de chemins de $O$ à $B$ passant par $A_k$

Comme tout chemin franchissant doit passer par un unique $A_k$, on en déduit que les chemins franchissants sont en même nombre que les chemins de $O$ à $B$.

===
Les chemins joigant $O$ et $B(n+1,n-1)$ sont au nombre de $binom(n+1 + n - 1, n+1)$. Par la question précédente, on déduit que :
$
  F_n = binom(2n,n+1)
$

D'où $C_n = binom(2n,n) - F_n = binom(2n,n)-binom(2n,n+1)$

===
Par l'expression des coefficients binomiaux :
$
  binom(2n, n+1) = (2n)!/((n+1)!(n-1)!) = (2n)!/((n+1)/n n!n!) = n/(n+1) (2n!)/(n!n!) = n/(n+1)binom(2n,n)
$
Ainsi, on obtient :
$
  C_n = binom(2n,n) - n/(n+1)binom(2n,n) = 1/(n+1)binom(2n,n)
$

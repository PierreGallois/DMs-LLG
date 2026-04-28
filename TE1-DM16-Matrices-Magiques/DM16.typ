#import "./../templates/homework.typ": dm
#import "@preview/lilaq:0.6.0" as lq
#import "@preview/tiptoe:0.3.1"
#import "@preview/elembic:1.1.0" as e

#show: dm.with(
  numero: 16,
  titre: [Matrices Magiques],
  sections: [Partie],
  alpha: false
)

#set math.cases(gap: 1em)
#set math.mat(row-gap: 1em, column-gap: 2em)

= Généralités

==
Soit $n in NN$, puisque la somme de chaque ligne, et la somme de chaque colonne de $I_n$ est 1, alors $I_n$ semi-magique de $M_n (RR)$ avec $sigma(I_n) = 1$.

De même, $J in "SMag"_n (RR)$ avec $sigma(J) = n$.

==
Soient $A,B in "SMag"_n (RR)$ et $lambda in RR$.

$
  forall i in [|1,n|], cases(sum_(j=1)^n a_(i,j) = sigma(A),lambda sum_(j=1)^n b_(i,j) = lambda sigma(B)) "et" forall j in [|1,n|], cases(sum_(i=1)^n a_(i,j) = sigma(A),lambda sum_(i=1)^n b_(i,j) = lambda sigma(B))
$

D'où, par linéarité de la somme  :
$
  cases(forall i in [|1,n|]"," sum_(j=1)^n (a_(i,j) + lambda b_(i,j)) = sigma(A) + lambda sigma(B),forall j in [|1,n|]"," sum_(i=1)^n (a_(i,j) + lambda b_(i,j)) = sigma(A) + lambda sigma(B))
$

Soit $(A + lambda B) in "SMag"_n (RR)$ et $sigma(A + lambda B) = sigma(A) + lambda sigma(B).$

Par ailleurs, en prenant $B = A$ et $lambda = -2$, il vient que $-A in "SMag"_n (RR)$. On en déduit que $"SMag"_n (RR)$ est stable par addition et par passage à l'opposé. 

==
Soit $A in M_n (RR)$.
$
  A in "SMag"_n (RR) <==> cases(forall i in [|1,n|]"," sum_(j=1)^n a_(i,j) = sigma(A),forall j in [|1,n|]"," sum_(i=1)^n a_(i,j) = sigma(A))
\ <==> cases(J A = sigma(A)J, A J = sigma(A) J) <==> J A = A J = lambda J "avec" lambda = sigma(A)
$

==
Soient $A,B in "SMag"_n (RR)$.

Il vient ainsi :
$
  cases(
    J A B = sigma(A) J B = sigma(A) sigma(B) J,
    A B J = A sigma(B) J = sigma(A) sigma(B) J
  )
$

Puisque $(A B)J = J(A B) = sigma(A) sigma(B) J$, alors on en déduit que $(A B) in "SMag"_n (RR)$ avec $sigma(A B)= sigma(A) sigma(B)$ et que $"SMag"_n (RR)$ est stable par produit.

==
Soit $A in "SMag"_n (RR) inter "GL"_n (RR)$.

Puisque $A A^(-1) = I_n$ et que $I_n in "SMag"_n (RR)$, alors il vient :
$
  J I_n = I_n J ==> J A A^(-1) = A^(-1) A J ==> sigma(A) J A^(-1) = A^(-1) sigma(A) J = J
  \ ==> cases(
    sigma(A) != 0,
    J A^(-1) = A^(-1) J = 1/sigma(A) J
  )
$

Soit $A^(-1) in "SMag"_n (RR)$, $sigma(A) != 0$ et $sigma(A^(-1)) = 1/sigma(A)$.

= Matrices magiques dans le cas n = 3
==
Soient $A,B in "Mag"_3 (RR)$ et $lambda in RR$.

D'une part, comme  $A,B in "SMag"_n (RR)$ et $lambda in RR$, alors $(A + lambda B) in "SMag"_n (RR)$.

De plus :
$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = sigma(A),
    b_(1,1) + b_(2,2) + b_(3,3) = sigma(B),
    b_(1,3) + b_(2,2) + b_(3,1) = sigma(B)
  )
  ==>
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) + lambda (b_(1,1) + b_(2,2) + b_(3,3)) = sigma(A) + lambda sigma(B),
    a_(1,3) + a_(2,2) + a_(3,1) +lambda (b_(1,3) + b_(2,2) + b_(3,1)) = sigma(A) + lambda sigma(B)
  )
$

On en déduit que $(A + lambda B) in "Mag"_3 (RR)$ avec $sigma(A + lambda B) = sigma(A) + lambda sigma(B)$.

==
Soit $A in "Mag"_3 (RR)$.

$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = sigma(A),
    a_(1,2) + a_(2,2) + a_(3,2) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = sigma(A)
  )
  ==> 3 sigma(A) = 3 a_(2,2) + (a_(1,1) + a_(1,2) + a_(1,3)) + (a_(3,1) + a_(3,2) + a_(3,3))
  \ ==> sigma(A) = 3 a_(2,2)
$

==
Soit $A in "Mag"_3 (RR)$.

On obtient d'après la définition de la transposée $A^T$ :
$
  cases(
    forall i in [|1,3|]"," sum_(j=1)^3 a_(i,j) = sum_(j=1)^3 (a^T)_(j,i)= sigma(A),
    forall j in [|1,3|]"," sum_(i=1)^3 a_(i,j) = sum_(i=1)^3 (a^T)_(j,i) = sigma(A)
  )
$

Et par ailleurs,
$
  cases(
    a_(1,1) + a_(2,2) + a_(3,3) = (a^T)_(1,1) + (a^T)_(2,2) + (a^T)_(3,3) = sigma(A),
    a_(1,3) + a_(2,2) + a_(3,1) = (a^T)_(1,3) + (a^T)_(2,2) + (a^T)_(3,1) = sigma(A)
  )
$

Ainsi on a $A^T in "Mag"_3 (RR)$ et $sigma(A^T) = sigma(A).$

==
Soient $(a, b, c, d, e, f, g, h, i) in RR^9$.

Analyse :
$
  A = mat(a, b, c; d, e, f; g, h, i) in "Mag"_3 (RR) inter A_3 (RR)
  \ ==> cases(sigma(A) = -sigma(A) = 0, a=e=i=0, b=-d=f=-h, g=-c = b) <==> A in {mat(0, m, -m; -m, 0, m; m, -m, 0), m in RR}
$

Et d'autre part :
$
  A = mat(a, b, c; d, e, f; g, h, i) in "Mag"_3 (RR) inter S_3 (RR)
  \ ==> cases(b=d=i, a=f=h, c=e=g, a+b=2c) <==> A in {mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n), (m,n) in RR^2}
$

Synthèse :

Soit $m in RR$. Si $A = mat(0, m, -m; -m, 0, m; m, -m, 0)$, alors : 
$
  A^T = mat(0, -m, m; m, 0, -m; -m, m, 0) = -A
  "et" sigma(A) = 0 = sigma(A^T)
$

Soit $(m,n) in RR^2$. Si $A = mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n)$, alors :
$
  A^T = mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n) = A
  "et" sigma(A) = 3/2 (a+b) = sigma(A^T)
$

Ainsi, l'ensemble des matrices antisymétriques de $"Mag"_3 (RR)$ est :
$
  "Mag"_3 (RR) inter A_3 (RR) = {mat(0, m, -m; -m, 0, m; m, -m, 0), m in RR}
$

Et l'ensemble des matrices symétriques de $"Mag"_3 (RR)$ est :
$
  \ "Mag"_3 (RR) inter S_3 (RR) = {mat(m, n, (m+n)/2; n, (m+n)/2, m; (m+n)/2, m, n), (m,n) in RR^2}
$

==
===
Soient $n in NN$ et $M in M_n in (RR)$ avec $ M = mat(
  a_(1,1),  ..., a_(n,1);
  dots.v, dots.down, dots.v;
  a_(1,n), ..., a_(n,n);
)$.

Posons :
$ A = mat(
  0, (a_(2,1) - a_(1,2))/2,  ..., (a_(n,1) - a_(1,n))/2;
  (a_(1,2) - a_(2,1))/2, 0,  , dots.v;
  dots.v,   , dots.down, (a_(n,n-1) - a_(n-1,n))/2;
  (a_(1,n) - a_(n,1))/2, ..., (a_(n-1,n) - a_(n,n-1))/2, 0;
)
$
Et :
$
S = mat(
  a_(1,1), (a_(2,1) + a_(1,2))/2,  ..., (a_(n,1) + a_(1,n))/2;
  (a_(1,2) + a_(2,1))/2, a_(2,2),  , dots.v;
  dots.v,   , dots.down, (a_(n,n-1) + a_(n-1,n))/2;
  (a_(1,n) + a_(n,1))/2, ..., (a_(n-1,n) + a_(n,n-1))/2, a_(n,n);
)
$

Ainsi, on a bien $A + S = M$, $A^T = -A$ et $S^T = S$ d'où $A in A_n (RR)$ et $S in S_n (RR)$.

Par ailleurs, cette décomposition est unique car s'il existe des couples $(A_1, S_1)$ et $(A_2, S_2)$ respectant les conditions énoncées, alors comme les diagonales de $A_1$ et de $A_2$ sont égales et nulles ($forall i in [|1,n|], A_1_(i,i) = A_2_(i,i) = 0$), les diagonales de $S_1$ et $S_2$ sont les mêmes ($forall i in [|1,n|], S_1_(i,i) = S_2_(i,i)$) ce qui amène $S_1 = S_2$ et $A_1 = A_2$.

On en déduit que pour toute matrice $M in M_n (RR)$, il existe un unique couple $(A,S) in A_n (RR) times S_n (RR)$ tel que $M = S + A$.

===
Soit $M in "Mag"_3 (RR)$ de la forme $M = mat(a_(1,1), a_(2,1), a_(3,1); a_(1,2), a_(2,2), a_(3,2); a_(1,3), a_(2,3), a_(3,3))$

En posant $(A,S) in A_n (RR) times S_n (RR)$ tel que $M = S + A$, on obtient :
$
  A = mat( 0, (a_(2,1) - a_(1,2))/2, (a_(3,1) - a_(1,3))/2;
  (a_(1,2) - a_(2,1))/2, 0, (a_(3,2) - a_(2,3))/2;
  (a_(1,3)-a_(3,1))/2, (a_(2,3)-a_(3,2))/2, 0
  )
  "et"
  S = mat( a_(1,1), (a_(2,1) + a_(1,2))/2, (a_(3,1) + a_(1,3))/2;
  (a_(1,2) + a_(2,1))/2, a_(2,2), (a_(3,2) + a_(2,3))/2;
  (a_(1,3) + a_(3,1))/2, (a_(2,3) + a_(3,2))/2, a_(3,3)
  )
$

Par conséquent, on remarque que $A$ et $S$ sont également des matrices magiques telles que $sigma(A) = 0$ et $sigma(S) = sigma(M)$.

Toute matrice $M in "Mag"_3 (RR)$ s'écrit donc de manière unique comme la somme d'une matrice magique symétrique et d'une matrice magique antisymétrique.

==
Soient $J = mat(1,1,1;1,1,1;1,1,1)$, $K=mat(1,-1,0;-1,0,1;0,1,-1)$ et $L=mat(0,1,-1;-1,0,1;1,-1,0)$.

Remarquons dans un premier temps que $K$ est une matrice magique symétrique et que $L$ est une matrice magique antisymétrique, puis que pour tous $beta, gamma in RR$, $(beta K + gamma L)$ est une matrice magique telle que $sigma(beta K + gamma L) = 0$ : le nombre au milieu de la matrice est 0.

Soit $M = mat(a,b,c;d,e,f;g,h,i) in "Mag"_3 (RR)$ avec $a,...,i in RR$.

On peut décomposer $M$ ainsi :
$
  M = e J + (a-e)K + (e-c)L
  \ = alpha J + beta K + gamma L "avec" cases(alpha = e, beta = a-e, gamma=e-c)
$

Puisque par ailleurs toute matrice de la forme $M = alpha J + beta K + gamma L$ avec $alpha, beta, gamma in RR$ est magique avec $sigma(alpha J + beta K + gamma L) = alpha$, il vient :
$
  cases(
    "Mag"_3 (RR) subset {alpha J + beta K + gamma L | alpha, beta, gamma in RR},
    {alpha J + beta K + gamma L | alpha, beta, gamma in RR} subset "Mag"_3 (RR)
  )
  <==>
  "Mag"_3 (RR) = {alpha J + beta K + gamma L | alpha, beta, gamma in RR}
$

==
===
Soient $a in NN^*$ et $b,c in RR$.

Posons :
$
  A = a J + b K + c L = mat(a+b, a+c-b, a-c; a-b-c, a, a+b+c; a-c, a+b-c, a-b)
$

Indubitablement :
$
  A in "Mag"_3 (NN) 
  <==> 
  cases(
    b","c in ZZ,
    |b| <= a,
    |c| <= a,
    |b+c| <= a,
    |b-c| <= a
  )
  <==> 
  cases(
    b","c in ZZ,
    |b| + |c| <= 3
  )
$

L'ensemble des tels points de coordonnées $(b,c)$ forme de manière discrète un losange (ou un assemblement de carrés concentriques). Ici, exemple avec $a=4$ :

#let x_pts = ()
#let y_pts = ()
#let a = 4

#for b in range(-a, a+1) {
  for c in range(-a, a+1) {
    if calc.abs(b) + calc.abs(c) <= a {
      x_pts = x_pts + (b,)
      y_pts = y_pts + (c,)
    }
  }
}

#let schoolbook-style = it => {
  let filter(value, distance) = value != 0 and distance >= 5pt
  let axis-args = (position: 0, filter: filter, lim: (-6, 6), subticks: none)
  
  show: lq.set-tick(inset: 1.5pt, outset: 1.5pt, pad: 0.4em)
  show: lq.set-spine(tip: tiptoe.stealth)
  show: lq.set-grid(stroke: none)
  

  show: lq.set-diagram(xaxis: axis-args, yaxis: axis-args, width: 60%, height: 20%)

  show: lq.set-label(pad: none, angle: 0deg)
  show: e.show_(
    lq.label.with(kind: "y"),
    it => place(bottom + right, dy: -105% - .0em, dx: -.5em, it)
  )
  show: e.show_(
    lq.label.with(kind: "x"),
    it => place(left + top, dx: 100% + .0em, dy: .4em, it)
  )
  
  it
}

#show: schoolbook-style
$
#pad(top: 1em, bottom: 0em, left: 1em, right: 1em)[
  #lq.diagram(
    xlabel: $b$,
    ylabel: $c$,
    lq.plot(
      x_pts,
      y_pts,
      stroke: none,
      color: purple,
      mark-size: 0.5em
    )
  )
]
$

===
Soient $sigma(A) in NN$ et de la forme $A = (a J + b K + c L) in "Mag"_3 (NN) $ avec $a,b,c in NN$.

Puisque $sigma(A) = 3a$, alors $a = 1/3 sigma(A) in NN <==> sigma(A) = 0 mod 3$.

- Si $sigma(A) != 0 mod 3$, alors il n'existe aucune telle matrice $A in "Mag"_3 (NN)$.

- Si $sigma(A) = 0 mod 3$, puisque pour tout $b in [|-a, a|]$ il existe $2(a-|b|) + 1$ choix pour $c$, alors le nombre $N$ de telles matrices $A in "Mag"_3 (NN)$ est : 
$
  N = sum_(b=-a)^a (2(a - |b|) + 1) = (2a +1) - 2a + 4sum_(b=0)^a (a - b)
  \ = 1 + 4 sum_(b=0)^a a -4sum_(b=0)^a b = 2a(a+1) + 1
  \ = 2/3 sigma(A) (1/3 sigma(A) + 1) +1
$

==
Soit $A$ une matrice magique à coefficients dans $[|1,9|]$ où chacun de ces nombres ne figure qu'une seule fois.

Remarquons dans un premier temps que $sigma(A) >= 9 + 1 + 2 = 12$ (si l'on cherche à minimiser la somme dans une ligne contenant 9) et de même que $sigma(A) <= 1 + 9 + 8 = 18$.

Par ailleurs, puisque chaque nombre entre 1 et 9 est présent dans une ligne et dans une colonne de $A$, alors si $sigma(A) = 12$, on a une ligne (ou une colonne) contenant ${9, 1, 2}$ et une colonne (ou une ligne) cherchant à minimiser sa somme et contenant aussi 9, donc de somme supérieure ou égale à $9 + 3 + 4 = 16$ : contradiction car $sigma(A) = 12 < 16$ et $sigma(A) > 12$.

En opérant de même pour le cas $sigma(A) = 18$, on obtient que $12 < sigma(A) < 18$.

Or, comme $A in "Mag"_3 (NN)$, alors $sigma(A)$ est un multiple de 3, d'où $sigma(A) = 15$.

Ensuite, $a = 1/3 sigma(A) = 5$ donc 5 est au milieu de A.

On complète ensuite $A$ en effectuant quelques hypothèses (placement exact de 9 et de ses voisins) puis en plaçant rigoureusement les autres nombres.

On obtient ainsi :

$
  A = mat(8,3,4;1,5,9;6,7,2)
$

Il existe 3 autres matrices respectant ces conditions, que l'on obtient en changeant de place 1 et 9, et 2 et 4 lors de la contruction.

$
  "Fin du DM16"
$
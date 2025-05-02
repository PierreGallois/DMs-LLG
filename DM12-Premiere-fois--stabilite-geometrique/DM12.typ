#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 12,
  titre: [
    Première fois. \ Stabilité géométrique.],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM12-Premiere-fois--stabilite-geometrique"

#let sous-partie(content) = {
  block(
    width: 100%,
    inset: 8pt,
    radius: 7pt,
    stroke: (paint: luma(75), thickness: 1pt, cap: "round", dash: "loosely-dashed"),
    content
  )
}

= Première fois.

#sous-partie[*Partie A :* Une fonction agissant sur les nombres entiers naturels.]

Soit une fonction $Delta : NN -> NN$ possédant les propriétés :
/ $(1)$ : $Delta(0) = Delta(1) = 0$
/ $(2)$ : Pour tout entier premier $p$, $Delta(p) = 1$
/ $(3)$ : Pour tous entiers $a$ et $b$ : $Delta(a times b) = b Delta(a) + a Delta(b)$

==
Soit $p$ un nombre premier, $n$ un entier naturel.
On cherche à prouver que $Delta(p^n) = n p^(n-1)$.

*Initialisation :*

Pour $n = 0$, $Delta(p^0) = Delta(1) = 0$ d'après $(1)$.
Ce qui correspond à la formule.

Pour $n = 1$, $Delta(p^1) = Delta(p) = 1$ d'après $(2)$.
Or avec la formule on obtient $p^0 = 1$, ce qui est donc correct.

*Hérédité :*

On suppose que $Delta(p^n) = n p^(n-1)$, cherchons à prouver que $Delta(p^(n+1)) = (n+1)p^n$.

$
  Delta(p^(n+1)) = Delta(p times p^n) = p^n Delta(p) + p Delta(p^n) = p^n + p n p^(n-1) = (n+1)p^n
$

Par principe de récurrence, $Delta(p^n) = n p^(n-1)$.

On remarque par ailleurs que $Delta(p^p) = p p^(n-1) = p^p$.

==
===
Soit $p$ et $q$ des nombres premiers distincts, $m$ et $n$ des entiers naturels supérieurs ou égaux à 1.
$Delta(p^m times q^n) = q^n Delta(p^m) + p^m Delta(q^n)$
D'après la question précédente, on a alors :
$m q^n p^(m-1) + n p^m q^(n-1) = (p^(m-1) q^(n-1))(m q + n p)$

===
$Delta(10^n) = Delta(2^n times 5^n)$
Comme 2 et 5 sont premiers et distincts, $n$ supérieur ou égal à 1, on a d'après la question précédente :
$Delta(2^n times 5^n) = 7n(2^(n-1) times 5^(n-1))$.
$Delta(10^n)$ est donc un multiple de 7 quand $n >= 1$.

==
===
// Notation raciste alert
On cherche à montrer que si $n >= 2$ alors $Delta(n) = alpha_1 q_1 + alpha_2 q_2 + ... + alpha_k q_k$
avec $q_(1...k) = n / p_(1...k)$.

Soit $n >= 2$,
On a donc, $n = p_1^alpha_1 p_2^alpha_2 ... p_k^alpha_k$ avec $p_(1...k)$ premier et $alpha_(1...k) in NN^*$.

*Initialisations :*

On suppose que $k = 1$, que $n = p_1^alpha_1$, alors $Delta(n) = alpha_1 p_1^(alpha_1 - 1)$
Or $q_1 = n / p_1 = p_1^(alpha_1 - 1)$.

Donc $Delta(n) = alpha_1 q_1$
On suppose que $k = 2$, que $n = p_1^alpha_1 p_2^alpha_2$, alors d'après 2)a), $Delta(n) = p_2^alpha_2 alpha_1 p_1^(alpha_1 - 1) + p_1^alpha_1 alpha_2 p_2^(alpha_2 - 1) = (p_1^alpha_1 p_2^alpha_2)(alpha_1/p_1 + alpha_2/p_2) = alpha_1 q_1 + alpha_2 q_2$.

*Hérédité :*

On suppose que $Delta(m) = alpha'_1 q'_1 + alpha'_2 q'_2 + ... + alpha'_k q'_k$ pour $m$ pouvant s'écrire $m = p'_1^alpha'_1 times p'_2^alpha'_2 times ... times p'_k^alpha'_k$.

On cherche à prouver que $Delta(n) = alpha_1 q_1 + alpha_2 q_2 + ... + alpha_k q_k + alpha_(k+1) q_(k+1)$ pour $n$ pouvant s'écrire sous la forme $n = p_1^alpha_1 times p_2^alpha_2 times ... times p_k^alpha_k times p_(k+1)^alpha_(k+1)$.

$
  Delta(n) &= Delta(p_1^alpha_1)(n / p_1^alpha_1) + p_1^alpha_1 Delta(n / (p_1^alpha_1)) "d'après 2)a)" \
           &= alpha_1 (n p_1^(alpha_1 - 1) / p_1^alpha_1) + p_1^alpha_1 Delta(underbrace(p_2^alpha_2 times ... times p_k^alpha_k times p_(k+1)^alpha_(k+1), "est un nombre comme" m))
$

En faisant correspondre $m = n / p_1^alpha_1$, $p'_1 = p_2$, ..., $p'_k = p_(k+1)$ et $alpha'_1 = alpha_2$, ..., $alpha'_k = alpha_(k+1)$, on a

$
  Delta(n) &= alpha_1 q_1 + p_1^alpha_1 (alpha_2 m/p_2 + ... + alpha_k m/p_k + alpha_(k+1) m/p_(k+1)) \
           &= alpha_1 q_1 + alpha_2 q_2 + ... + alpha_k q_k + alpha_(k+1) q_(k+1) 
$

Par principe de récurrence, nous avons prouvé que quelque soit $k in NN^*$ et par conséquent quelque soit $n in NN$ avec $n >= 2$,
$Delta(n) = alpha_1 q_1 + ... + alpha_k q_k$.

===
Vérifions que $Delta(n) = alpha_1 q_1 + ... + alpha_k q_k$ satisfait les propriétés $(2)$ et $(3)$ :

$(2)$
Pour $p$ premier, $p = p^1$ :
$Delta(p) = 1 times p/p = 1$. Cela correspond bien à la propriété $(2)$.

$(3)$
Soient $a$ et $b$ des entiers naturels tels que : $a &= p_1^alpha_1 ... p_k^alpha_k, b &= p'_1^alpha'_1 ... p'_k'^alpha'_k'$ avec les restrictions habituelles sur les variables.

Donc $a b = p_1^alpha_1 ... p_k^alpha_k times p'_1^alpha'_1 ... p'_k'^alpha'_k'$. Dans le cas où $p_i = p'_i$ on écrit alors $(alpha_i + alpha'_i) p_i$ ce qui permet d'avoir une décomposition unique de produits de facteurs premiers pour $a b$.

On remarque que dans le cas où $p_i = p'_i$ on a $(alpha_i + alpha'_i) (a b) / p_i = alpha_i (a b) / p_i + alpha'_i (a b) / p_i$.
Nous écrivons directement la forme développée :
$
  Delta(a b) &= alpha_1 (a b) / p_1 + ... + alpha_k (a b) / p_k + alpha'_1 (a b) / p'_1 + ... + alpha'_k (a b) / p'_k \
             &= b (alpha_1 a/p_1 + ... + alpha_k a/p_k) + a (alpha'_1 b/p'_1 + ... + alpha'_k' b/p'_k') \
             &= b Delta(a) + a Delta(b)
$

Cela correspond bien à la propriété $(3)$.

#pagebreak()

#sous-partie[*Partie B :* Étude de quelques images d'entiers par la fonction $Delta$.]

==
===

#let integer-factorization(n) = {
  assert(n >= 2)
  let factorization = ()
  while calc.rem(n, 2) == 0 {
    factorization.push(2)
    n /= 2
  }
  for d in range(3, calc.ceil(calc.sqrt(n)) + 1, step: 2) {
    while calc.rem(n, d) == 0 {
      factorization.push(int(d))
      n /= d
    }
  }
  if (n > 1) {
    factorization.push(int(n))
  }
  factorization
}

#let to-power-form(factorization) = {
  // les factorisations sont déjà triés
  let power-fact = ()
  let current-number = none
  for number in factorization {
    if current-number == none {
      current-number = (number, 1)
    } else if current-number.first() == number {
      current-number = (number, current-number.last() + 1)
    } else {
      power-fact.push(current-number)
      current-number = (number, 1)
    }
  }
  power-fact.push(current-number)
  power-fact
  // renvoit sous la forme (nombre, puissance)
}

#let calculate-from-power-form(n, power-form) = {
  return power-form.fold(
    0,
    (acc, (number, power)) => acc + (power * n / number)
  )
}

// (il faut bien que je m'amuse un peu)
#let auto-generate-proof(n, break_line: true) = {
  assert(n >= 2, message: "Je pourrais faire les cas 0 et 1 mais ça n'a pas trop d'intérêt")
  let factorization = integer-factorization(n)
  let power-fact = to-power-form(factorization)
  [Calculons $Delta(#str(n))$. ]
  let facteurs = power-fact.map(
    ((number, power)) => if power == 1 {
      $#number$
    } else {
      $#number^#power$
    }).join($times$)
  [On a $#n = #facteurs$. ]
  if break_line [

  ]
  let delta-formule = power-fact.map(
    ((number, power)) => if power == 1 {
      $#n/#number$
    } else {
      $#power #n/#number$
    }
  ).join($+$)
  let delta-calcule = calculate-from-power-form(n, power-fact)
  [Donc d'après la formule, $Delta(#str(n)) = #delta-formule = #delta-calcule$.]
}

#auto-generate-proof(12)

#auto-generate-proof(56)

#auto-generate-proof(1001)

Preuves générées automatiquement (le script est sur Github).
#footnote([Par exemple :
#auto-generate-proof(987654321, break_line: false) #v(0.5em)])
#footnote([(Pourquoi écrire les preuves à la main alors qu'on peut passer 5 fois plus de temps à coder le script qui le fait automatiquement ?)])

===
Cherchons les solutions de $Delta(x) = 0$ avec $x in NN$.

Si $x = 0$ ou $x = 1$ alors d'après (1), $Delta(x) = 0$.

Si $x >= 2$, $Delta(x) = alpha_1 q_1 + ... + alpha_k q_k$. Or $alpha_(1...k) in NN^*$ et $q_(1...k) = x / p_(1...k)$, comme $x, p_(1...k) in NN^*$ alors $q_(1..k) > 0$. Ainsi comme somme de nombres tous strictements positifs, $Delta(x) > 0$.

Les seules solutions à $forall x in NN, Delta(x) = 0$ sont ${0, 1}$.

Nous avons également prouvé que pour tout $x >= 2$ alors $Delta(x) > 0$.

===
Cherchons les solutions de $Delta(x) = 1$ avec $x in NN$.

Si $x = 0$ ou $x = 1$ alors d'après (1), $Delta(x) = 0$.

Si $x$ est premier alors d'après (2), $Delta(x) = 1$.

Si $x$ n'est pas premier et différent de 0 et 1, alors on peut écrire $x$ sous la forme $x = p times b$ avec $p$ premier et $b in NN, b >= 2$.
En effet si $b = 0$ alors $x = 0$ et si $b = 1$ alors $x$ est premier, ce qui n'est pas autorisé. D'après la question précédente, $Delta(b) > 0$.
On a donc :
$
  Delta(x) = Delta(p times b) = b Delta(p) + p Delta(b) = underbrace(b, >=2) + underbrace(p, >= 2) underbrace(Delta(b), >0)
$
Par addition d'un nombre supérieur ou égal à 2 avec un nombre strictement supérieur à 0, $Delta(x) > 2$.

Les seules solutions à $forall x in NN, Delta(x) = 1$ sont donc l'ensemble des nombres premiers.

===
Nous cherchons à prouver que 2 et 3 ne possèdent pas d'antécédent par $Delta$.

Soit $n in NN$.
Si $n = 0$ ou $n = 1$ alors $Delta(n) = 0$ et si $n$ est premier alors $Delta(n) = 1$.
On considère donc tous les $n >=2$ et qui ne sont pas premiers.

On peut alors réécrire $n$ comme le produit de deux entiers naturels différents de 0 et 1 : $n = a times b$.
On a alors :

$
  Delta(n) = Delta(a times b) = Delta(a) times underbrace(b, >= 2) + underbrace(a, >= 2) times Delta(b)
$

Or nous avons prouvé précédement que les seules solutions à l'équation $Delta(x) = 0$ sont 0 et 1.
Comme $a$ et $b$ sont différents de 0 et 1 on a :

$
  Delta(n) = underbrace(Delta(a), >= 1) times underbrace(b, >= 2) + underbrace(a, >= 2) times underbrace(Delta(b), >= 1)
$

La valeur minimale de $Delta(n)$ est donc 4 quand $n$ est différent de 0 et 1 et n'est pas premier.

Comme 0, 1 et les nombres premiers ne donnent ni 2 ni 3 par $Delta$ nous avons prouvé que 2 et 3 ne possèdent pas d'antécédents par $Delta$.

Tout entier entier naturel $n$ n'a donc pas au moins un antécédent par $Delta$.
#footnote[$Delta$ n'est pas surjective.]

===
// toujours réutiliser le travail précédent :-)
#auto-generate-proof(8)

Nous avons donc $Delta(8) > 8$.
La propriété $forall n in NN, Delta(n) <= n$ est fausse.

==
===
Montrons que pour deux nombres $p$ et $q$ premiers, $Delta(p times q) = p + q$.
D'après les propriétés (1) et (2) :
$
  Delta(p times q) = q Delta(p) + p Delta(q) = p + q
$
===
On considère les entiers naturels 3 et 4.

#auto-generate-proof(3 * 4, break_line: false)

Or $3 + 4 = 7 != 16$.
La propriété $forall n, m in NN, Delta(n times m) = n + m$ est donc fausse.

==
===
Considérons les nombres 2 et 3.
Comme 2, 3 et $2 + 3 = 5$ sont premiers, on a :
$
  Delta(2 + 3) = 1 != Delta(2) + Delta(3) = 2
$
La propriété $forall n, m in NN, Delta(n + m) = Delta(n) + Delta(m)$ est donc fausse.

===
Soient $a, b in NN$ tel que $Delta(a + b) = Delta(a) + Delta(b)$.
Soit $k in NN$.
D'après la propriété (3) :
$
  Delta(k a + k b) &= Delta(k(a+b)) = Delta(k)(a+b) + k Delta(a+b) \
  &= Delta(k) a + Delta(k) b + k Delta(a) + k Delta(b) \
  &= (a Delta(k) + k Delta(a)) + (b Delta(k) + k Delta(b)) \
  Delta(k a + k b) &= Delta(k a) + Delta(k b)
$


#sous-partie[*Partie C :* Les points fixes de la fonction]

==
===
Soit $p$ un nombre premier. Soit $m$ un entier naturel multiple de $p^p$. Soit $n$ un entier naturel tel que $m = n p^p$.

Considérons $Delta(p^p)$, d'après la question 1), $Delta(p^p) = p p^(p-1) = p^p$.
$
  Delta(m) = Delta(n p^p) = p^p Delta(n) + n Delta(p^p) = p^p (n + Delta(n))
$

Nous avons prouvé que $Delta(m)$ est un multiple de $p^p$.

===
Soit $m in NN, m >= 2$. Supposons que $p^alpha | m$ pour $p$ premier et $1 <= alpha < p$ (avec $alpha$ maximal). Notons $m = n p^alpha$ avec $n in NN$ non divisible par $p$. Alors
$ Delta(m) &= n Delta(p^alpha) + p^(alpha-1) Delta(n) \
&= n p^(alpha - 1) + p^alpha Delta(n) \
&= p^(alpha - 1)(n + p Delta(n)) $

Donc $p^(alpha - 1)$ divise $Delta(m)$. Cependant, comme $n$ n'est pas divisible par $p$, $n + p Delta(n)$ non plus et $Delta(m)$ n'est pas divisible par $p^alpha$. La puissance de $p$ dans la décomposition de $Delta(m)$ est donc bien $alpha - 1$.

==
Résolvons $Delta(x) = x$ avec $x in NN$.

Si $x = 0$ alors $Delta(0) = 0$. 0 est solution.
Si $x = 1$ alors $Delta(1) = 0$.

On considère maintenant $x >= 2$.
On a donc :
$
  Delta(x) = x &<=> alpha_1 x / p_1 + ... + alpha_k x / p_k = x \
  &<=> alpha_1 / p_1 + ... + alpha_k / p_k = 1 #h(1em) (*)\
$

- S'il existe au moins un $i in [| 1, k |]$ tel que $alpha_i >= p_i$ :
Si $k > 1$ alors :
$
  underbrace(alpha_1 / p_1, > 0) + ... + underbrace(alpha_i / p_i, >= 1) + ... + alpha_k / p_k  = 1
$

Par somme de nombres tous strictements positifs avec un terme supérieur à 1, cette expression n'est jamais vrai quelque soient les valeurs de $alpha_(1...k)$ et $p_(1...k)$ respectant les conditions.

Si $k = 1$ alors $i = 1$ d'où $alpha_1 >= p_1$ et :

$
  underbrace(alpha_1 / p_1, >= 1) = 1
$

Si $alpha_1 > p_1 <=> alpha_1 / p_1 > 1$ alors la condition n'est pas remplie.

Donc on a $alpha_1 = p_1$. Comme nous avons déjà prouvé que $Delta(p^p) = p^p$ à la question 1), sont solution ${p^p | p in NN "et" p "premier"}$.

- Si pour tout $i in [| 1, k |]$, $alpha_i < p_i$ :

A fortiori, la puissance de $p_1$ dans la décomposition de $m$ est $1 <= alpha_1 < p_1$. Par l'exercice précédent, la puissance de $p_1$ dans $Delta(m)$ est donc de $alpha_1 - 1$ exactement. Mais $Delta(m) = m$, et c'est une contradiction. Ce cas est donc impossible.

Nous avons donc démontré que les seules solutions à $Delta(x) = x$ sont :
$
  cal(S) = {p^p | p in NN "et" p "premier"} union {0}
$

= Stabilité géométrique

Dans tout le problème, soit $epsilon$ et $q$ deux réels strictements positifs.
On considère une suite $(x_n)_(n in NN)$ de réels telle que $x_0 > 0$ et pour tout entier naturel $n$, $0 <= x_(n+1) - q x_n <= epsilon$.

==
Pour tout entier naturel $n$, on pose $b_n = x_(x+1) - q x_n$.
Montrons que pour tout entier naturel $n >= 1$, on a $x_n = q^n x_0 + q^(n-1) b_0 + q^(n-2) b_1 + ... + q b_(n-2) + b_(n-1)$.

#block(breakable: false, width: 100%)[
$
  q^n x_0 + q^(n-1) b_0 + q^(n-2) b_1 + ... + q b_(n-2) + b_(n-1) \
$
$
  
  &= q^n x_0 + sum_(k=0)^(n-1) q^(n-k-1) b_k \
  &= q^n x_0 + sum_(k=0)^(n-1) q^(n-k-1) x_(k+1) - sum_(k=0)^(n-1) q^(n-k) x_k \
  &#h(1.25em) "en posant" l = k +1 \
  &= q^n x_0 + sum_(l=1)^n q^(n-l) x_l - sum_(k=0)^(n-1) q^(n-k) x_k \
  &= q^n x_0 + x_n - q^n x_0 + underbrace(sum_(l=1)^n q^(n-l) x_l - sum_(k=1)^(n) q^(n-k) x_k, "s'annule") \
  &= x_n
$
]

Nous avons montré que pour tout entier naturel $n >= 1$, on a :
$
  x_n = q^n x_0 + q^(n-1) b_0 + q^(n-2) b_1 + ... + q b_(n-2) + b_(n-1)
$

==
On suppose que $0 < q < 1$.

===
Pour tout entier naturel $n$, on pose $y_n = q^(n)x_0$. Montrons que $(y_n)_(n in N)$ est telle que, pour tout $n >= 0$, on a :
$abs(y_n - x_n) <= epsilon/(1 - q)$.

Pour tout entier naturel $n$, on a 
$
x_n - q^(n)x_0 = sum_(k=0)^(n-1) q^(n-k-1) b_k
$
et 
$
  0 <= q^(n-k-1) b_k <= q^(n-k-1) epsilon
$

Or
$
   sum_(k=0)^(n-1) q^(n-k-1) b_k = (1 - q^n)/(1 - q)
$

D'où :
$
   0 <= sum_(k=0)^(n-1) q^(n-k-1) b_k = b((1 - q^n)/(1 - q)) <=  epsilon((1 - q^n)/(1 - q)) < epsilon((1)/(1 - q))
$
car on a $0 < q < 1 => 0 < q^n< 1$

En conséquence, pour tout entier naturel n : 
$
  0 <= sum_(k=0)^(n-1) q^(n-k-1) b_k < epsilon((1)/(1 - q))
$

Autrement dit, quel que soit l’entier naturel n :
$
  0 <= x_n - q^(n)x_0 <=  epsilon((1 - q^n)/(1 - q)) < epsilon((1)/(1 - q))
$

La suite géométrique définie par $y_n = x_n - q^(n)x_0$ et dont le premier terme  $y_0 = x_0$ et de raison $q$ répond donc à la question si pour tout entier naturel $n$:
$
  0 <= x_n - q^(n)x_0 < epsilon((1)/(1 - q)) => abs(y_n - x_n) <= epsilon/(1 - q)
$

===
Considérons une suite géométrique $(y_n)_(n in N)$ de raison $q$ et de premier terme $y_0$ tel que $x_0 < y_0 < (x_0 + epsilon/(1-q))$.

Pour tout entier naturel $n$ : $y_n = y_0q^n$ et $y_n - x_0q^n = (y_0 - x_0)q^n$, donc : 
$
  0 <= y_n - x_0q^n < (epsilon/(1-q))q^n < epsilon/(1-q)
$
Puis si $0 <= x_n - x_0q^n < epsilon/(1-q)$ et $0 <= y_n - x_0q^n < epsilon/(1-q)$, alors :
$
  -epsilon/(1-q) < x_n - y_n < epsilon/(1-q) "c'est-à-dire" abs(x_n - y_n) < epsilon/(1-q)
$
Toute suite géométrique de raison $q$ et de premier terme $y_0$ tel que $x_0 < y_0 < (x_0 + epsilon/(1-q))$ répond ainsi à la question.

Ainsi, il existe une infinité de suites géométriques qui côtoient la suite  $(x_n)_(n in N)$ à moins de $epsilon/(1-q)$ près. 

Celle de premier terme $y_0 = x_0$ et de raison $q$ convient mais on peut choisir une autre suite de même raison et de premier terme "un petit peu plus grand".

==

Supposons maintenant que $q > 1$:

===

La suite $(u_n)_(n in N)$ est définie par : 
$
  u_n = sum_(k=0)^(n-1) b_k/q^(k+1) = 1/q (sum_(k=0)^(n-1) b_k/q^k)
  $ 

Montrons que la suite $(u_n)$ est une suite croissante et majorée.

Pour tout entier $n >= 1$, 
$
u_(n+1) - u_n = b_n/q^(n+1) > 0, " donc" (u_n) "croissante"
$
Soit $n >= 1$. D'autre part, pour tout entier naturel $k$, $b_k <= epsilon$. Nous pouvons ainsi majorer chaque terme de la somme $sum_(k=0)^(n-1) b_k/q^(k+1)$ dans l'expressions de $(u_n)$ par $epsilon/q^k$:

$
  u_n <= 1/q (sum_(k=0)^(n-1) epsilon/q^(k)) = epsilon/q sum_(k=0)^(n-1) (1/q)^k
$

Or 
$
  sum_(k=0)^(n-1) (1/q)^k = (1 - (1/q)^n) / (1 - 1/q)
$

et 
$
  q > 1 => 0 < 1/q < 1, " d'où " 0 < (1 - (1/q)^n) / (1 - 1/q) < 1 / (1 - 1/q) = q / (q - 1)
$

Par conséquent, 
$
  u_n <= epsilon/q dot q / (q - 1) = epsilon / (q - 1)
$

La suite $(u_n)$ est donc majorée par le nombre réel $epsilon / (q - 1)$. Celle-ci étant croissante et majorée, cette suite converge, et sa limite $s$ est telle que $0 < s <= epsilon / (q - 1)$.


// #auto-generate-proof(4)
// #import "@preview/lilaq:0.2.0" as lq


// #let xs = array.range(2, 100000)
// #lq.diagram(
//   width: 15cm,
//   height: 10cm,
//   ylim: (1, 5),
//   lq.plot(xs, xs.map(n => calculate-from-power-form(n, to-power-form(integer-factorization(n)))), stroke: none),
//   //lq.plot(xs, xs.map(x => x/calc.pow(calc.e, 2)))
// )

// bruteforce 1C8
//#array.range(2, 10).map( n => (n, calculate-from-power-form(n, to-power-form(integer-factorization(n))))).filter(((n, c)) => n == c)
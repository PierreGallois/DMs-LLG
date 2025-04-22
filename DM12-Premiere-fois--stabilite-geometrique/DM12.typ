#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 12,
  titre: [Première fois. Stabilité géométrique],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM12-Premiere-fois--stabilite-geometrique"

= Première fois.

- Partie A : Une fonction agissant sur les nombres entiers naturels.

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
Vérifions que $Delta(n) = alpha_1 q_1 + ... + alpha_k q_k$ satisfait les propriétés (2) et (3) :

Pour $p$ premier, $p = p^1$ :
$Delta(p) = 1 times p/p = 1$. Cela correspond bien à la propriété (1).

Pour $a$ et $b$ des entiers naturels :
$a = p_1^alpha_1 ... p_k^alpha_k$
$b = p'_1^alpha'_1 ... p'_k'^alpha'_k'$
D'une part, $Delta(a times b) = Delta(a) times b + a times Delta(b) = b alpha_1 a/p_1 + ... + b alpha_k a/p_k + a alpha'_1 b/p'_1 + ... + a alpha'_k' b/p'_k' = alpha_1 (a times b)/p_1 + ... + alpha_k (a times b)/p_k + alpha'_1 (a times b)/p'_1 + ... + alpha'_k' (a times b)/p'_k'$

...

// a b (alpha_1/p_1 + ... + alpha_k/p_k + alpha'_1/p'_1 + ... + alpha'_k'/p'_k')

- Partie B : Étude de quelques images d'entiers par la fonction $Delta$.

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

// (il faut bien que je m'amuse un peu)
#let auto-generate-proof(n) = {
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
  [On a $#n = #facteurs$]
  [

  ]
  let delta-formule = power-fact.map(
    ((number, power)) => if power == 1 {
      $#n/#number$
    } else {
      $#power #n/#number$
    }
  ).join($+$)
  let delta-calcule = power-fact.fold(
    0,
    (acc, (number, power)) => acc + (power * n / number)
  )
  [Donc d'après la formule, $Delta(#str(n)) = #delta-formule = #delta-calcule$]
}

#auto-generate-proof(12)

#auto-generate-proof(56)

#auto-generate-proof(1001)

Preuves générés automatiquement (le script est sur Github).
#footnote([Par exemple :
#auto-generate-proof(987654321) #v(0.5em)])
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
#strike[
Cherchons à prouver que 2 ne possède pas d'antécédent par $Delta$.
Soit $x in NN$.

Si $x = 0$ ou $x = 1$ alors $Delta(x) = 0$.

Si $x$ est premier alors $Delta(x) = 1$.

Si $x >= 2$ et n'est pas premier, alors $Delta(x) = alpha_1 q_1 + ... + alpha_k q_k$, avec $alpha_(1...k) in NN^*$ et $q_(1...k) = x / p_(1...k)$. $p_(1...k)$ sont premiers.

$p_(1...k)$ divise $x$ donc $x >= p_(1...k)$. Comme $x$ n'est pas premier, $x > p_(1...k)$ donc $q_(1...k) > 1$ soit $q_(1...k) >= 2$

Toujours dans ce cas, supposons que $k = 1$, alors $Delta(x) = underbrace(alpha_1, >= 1) underbrace(q_1, >= 2)$.
On a donc $Delta(x) >= 2$.
Par récurrence immédiate et par somme de nombres strictements positifs on a $Delta(x) >= 2$ quelque soit $k$.]
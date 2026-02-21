#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 12,
  titre: [Suites récurrentes d'ordre 2 non linéaires],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM12-Suites-Recurrentes-d-Ordre-2-Non-Lineaires/"
#let code-from-file(
    folder-name,
    file-name,
    lang:none,
    hide-calls:true,
    hide-imports: true,
  ) = {
  // Astuce à cause de la gestion des paths relatives de typst :
  let path = "./../" + folder-name + "/" + file-name

  let code_file = read(path)
  if lang == none {
    if path.ends-with(".py") {
      lang = "python"
    }
    if path.ends-with(".typ") {
      lang = "typst"
    }
    if path.ends-with(".hs") {
      lang = "haskell"
    }
  }

  // cache tout le code après le `if __name__ ...` pour permettre l'execution du programme sans que cela soit affiché dans typst
  if hide-calls {
    if lang == "python" {
      code_file = code_file.trim(
        regex(`if __name__ == "__main__":[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
    if lang == "haskell" {
      code_file = code_file.trim(
        regex(`-- Ignore after[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
  }

  if hide-imports {
    if lang == "typst" { // TODO en enlève qu'un seul pour une raison inconnue
      code_file = code_file.trim(
        regex(`^#import.*`.text),
        repeat: true
      )
    }
    if lang == "python" { // TODO en enlève qu'un seul pour une raison inconnue
      code_file = code_file.trim(
        regex(`^[from|import].*`.text),
        repeat: true
      )
    }
    if lang == "haskell" { // TODO en enlève qu'un seul pour une raison inconnue
      code_file = code_file.trim(
        regex(`^#!.*`.text), // On enlève le shebang
        repeat: true
      )
    }
  }

  // enlève les espaces de début et fin
  code_file = code_file.trim()

  raw(
    code_file,
    lang: lang,
    block: code_file.contains("\n")
  )
}

= 

Considérons la suite $(u_n)_(n in NN)$ définie par :
$
u_0 = 1, u_1 = 1 "et pour tout" n in NN, u_(n+2) = sqrt(u_n) + sqrt(u_(n+1))
$

==

===

Pour tout $n in NN$, montrons que $u_n >= 1$ :

D'une part, $u_0 = 1$ et $u_1 = 1$ sont clairement supérieurs ou égaux à 1. D'autre part, pour tout $n in NN$, si $u_n >= 1$ et $u_(n+1) >= 1$. Alors, en utilisant la relation de récurrence, il vient : 
$
u_(n+2) = sqrt(u_n) + sqrt(u_(n+1)) >= sqrt(1) + sqrt(1) = 2 >= 1
$
Ainsi, par récurrence immédiate, pour tout $n in NN$, $u_n >= 1$.

===

Supposons que la suite $(u_n)_(n in NN)$ converge vers une limite $l in RR$ lorsque $n$ tend vers $+ infinity$. En utilisant la relation de récurrence, on a :
$
l = sqrt(l) + sqrt(l) = 2sqrt(l) "d'où" l = 4 "ou" l=0
$

Or pour tout $n in NN$, $u_n >= 1$. On en déduit que la seule limite possible de la suite $u_n$ est $l = 4$.

===
Le script python suivant calcule la valeur de $u_n$ suivant la valeur de $n$ fournie. 

#code-from-file(folder-name, "partie_a.py")

==

Considérons la suite $(v_n)_(n in NN)$ définie pour tout $n in NN$ par $v_n = 1/2 sqrt(u_n) - 1$.

===

Supposons que $lim_(n -> +oo) v_n = 0$.

Ainsi, pour tout $epsilon > 0$, il existe un rang $N in NN$ à partir duquel, pour tout $n >= N$ :
$
|v_n - 0| < epsilon "soit" |1/2 sqrt(u_n) - 1| < epsilon "soit" |sqrt(u_n) - 2| < 2epsilon
$

Ainsi, en posant $delta = 2epsilon$, pour tout $n >= N$, $|sqrt(u_n) - 2| < delta$.  Ainsi, $lim_(n -> +oo) sqrt(u_n) = 2$, d'où $lim_(n -> +oo) u_n = 4$ par continuité de la fonction $x --> x^2$ et car pour tout $n in NN$, $u_n >= 1 > 0$.

===

Pour tout $n in NN$, montrons que $v_(n+2) = (v_(n+1) + v_n)/(2(2+v_(n+2)))$ :
$
  (v_(n+1) + v_n)/(2(2+v_(n+2))) = (1/2 u_(n+2) - 2)/(2 + sqrt(u_(n+2))) = ((sqrt(u_(n+2))+2)(sqrt(u_(n+2))-2))/(2(2+sqrt(u_(n+2)))) = 1/2 sqrt(u_(n+2)) - 1 = v_(n+2)
$

===

Ainsi, pour tout $n in NN$, 
$
  |v_(n+2)| = |v_(n+1) + v_n| 1/(2|2+v_(n+2)|) 
$
Or , 
$
 u_(n+2) >= 1 => sqrt(u_(n+2)) >= 1 => 2(2 + v_(n+2)) >= 3 => 1/(2|2+v_(n+2)|) <= 1/3 
$

On en déduit que pour tout $n in NN$ :
$
|v_(n+2)| <= |v_(n+1) + v_n| 1/3
$

===

Considérons la fonction $f : x mapsto x² -1/2 x -1/3$ continue sur $[0,1]$ car polynomiale.

Puisque $f(0) = -1/3 <0$ et que $f(1)=1/3 > 0$, alors d'après le TVI il existe un réel $alpha in ]0,1[$ tel que $f(alpha) = 0$, soit tel que $alpha² = 1/3 alpha + 1/3$. 

===

Posons $mu = max(v_0, v_1) } in RR_+^*$.
Prouvons que pour tout $n in NN$, l'assertion $P(n)$ : "$|v_n| <= mu times alpha^n$" est vraie par récurrence double.

Initialisation : De manière immédiate, $v_0 <= mu$ et $v_1 <= mu$. Ainsi, $P(0)$ et $P(1)$ vraies.

Hérédité : Soit $n in NN$. Supposons $P(n)$ et $P(n+1)$ vraies.

Puisque $|v_(n+2)| <= 1/3 (|v_n| + |v_(n+1)|)$, il vient :

$
  |v_(n+2)| <= 1/3 (mu times alpha^n + mu times alpha ^(n+1)) = mu times alpha^n underbrace((1/3 + 1/3 alpha),  = alpha^2) = mu times alpha^n times alpha^2 = mu times alpha^(n+2)
$

On en déduit que $P(n+2)$ vraie à son tour, et que pour tout $n in NN$, $|v_n| <= mu times alpha^n$.

===

Puisque $|alpha| < 1$ et que $mu$ est un réel fixé, alors $lim_(n -> +oo) (mu times alpha^n) = 0$.

De plus, comme pour tout $n in NN$, on a $0 <= |v_n| <= mu times alpha^n$, alors par théorème d'encadrement, $lim_(n -> +oo) v_n = 0$.

Ainsi, par le résultat de la question 2.a, $lim_(n-> +oo) u_n = 4$.

=

Considérons la suite $(u_n)_(n in NN)$ définie par :
$
u_0 = 1, u_1 = 1 "et pour tout" n in NN, u_(n+2) = 1/u_n + 1/u_(n+1)
$

==

===

Pour tout $n in NN$, montrons que $u_n >= 1$ :

D'une part, $u_0 = 1 } in [1,2]$ et $u_1 = 1 }in [1,2]$. D'autre part, pour tout $n in NN$, si $u_n in [1,2]$ et $u_(n+1) in [1,2]$. Alors, en utilisant la relation de récurrence, il vient : 
$
1 = 1/2 + 1/2 <= u_(n+2) = 1/u_n + 1/u_(n+1) <= 1/1 + 1/1 = 2 
$
Ainsi, par récurrence immédiate, pour tout $n in NN$, $u_n in [1,2]$.

===

Supposons que la suite $(u_n)_(n in NN)$ converge vers une limite $l in RR$ lorsque $n$ tend vers $+ infinity$. En utilisant la relation de récurrence, on a :
$
l = 1/l + 1/l = 2/l "d'où" l = sqrt(2) "ou" l=-sqrt(2)
$

Or pour tout $n in NN$, $u_n in [1,2]$. On en déduit que la seule limite possible de la suite $u_n$ est $l = sqrt(2)$.

===

Le script python suivant calcule la valeur de $u_n$ suivant la valeur de $n$ fournie. 

#code-from-file(folder-name, "partie_b.py")

==

Considérons la suite $(delta_n)_(n in NN)$ définie pour tout $n in NN$ par $delta_n = u_n - sqrt(2)$.

===

Pour tout $n in NN^*$, 
$
-(delta_(n+1)/ (sqrt(2)u_(n+1)) + delta_n / (sqrt(2)u_n)) = (sqrt(2) - u_(n+1))/(sqrt(2)u_(n+1)) + (sqrt(2) - u_n)/(sqrt(2)u_n) = (sqrt(2)u_n - u_n u_(n+1) + sqrt(2)u_(n+1) - u_n u_(n+1))/(sqrt(2)u_n u_(n+1)) 

\ = (u_n + u_(n+1) - sqrt(2)u_n u_(n+1))/(u_n u_(n+1)) = (u_n + u_(n+1)) / (u_n u_(n+1)) - sqrt(2) = (1/u_(n+1) + 1/u_n - sqrt(2)) = delta_(n+2)
$

Et d'autre part,
$
  -delta_n/(2u_n) (sqrt(2) - 1/u_(n+1)) + delta_(n-1)/(2 u_(n-1) u_(n+1)) = 1/(sqrt(2)u_(n+1)) underbrace((delta_n/(sqrt(2)u_n) + delta_(n-1)/(sqrt(2)u_(n-1))), = - delta_(n+1)) - delta_n/(sqrt(2)u_n)

  \ = -(delta_(n+1)/(sqrt(2)u_(n+1)) + delta_n/(sqrt(2)u_n)) = delta_(n+2)
$

Ce qui conclut.

===

Ainsi, pour tout $n in NN^*$, 
$
  |delta_(n+2)| = |delta_n| times |1/u_(n+1) - sqrt(2)|times 1/(2u_n) + |delta_(n-1)| times 1/(2 u_(n-1) u_(n+1))
$

Et comme $u_n in [1, 2]$, on a également :
$
  1/(2 u_(n-1) u_(n+1)) <= 1/2 "et" 1/u_n <= 1/2 "et" 0 <= sqrt(2) - 1/u_(n+1) <= (2sqrt(2) - 2 times 1) /(2 times 2) <= (2sqrt(2) - 1) /4 
$

On obtient finalement :
$
  |delta_(n+2)| <= |delta_(n-1)| 1/2 + (2sqrt(2) - 1)/4 |delta_n|
$

===

Considérons la fonction $f : x mapsto x³ - (2sqrt(2)-1)/4 x -1/2$ continue sur $[0,1]$ car polynomiale.

Puisque $f(0) = -1/2 <0$ et que $f(1)=(3-2sqrt(2))/4 > 0$, alors d'après le TVI il existe un réel $alpha in ]0,1[$ tel que $f(alpha) = 0$, soit tel que $alpha³ = (2sqrt(2)-1)/4 alpha + 1/2$. 

===

Posons $mu = max(delta_0, delta_1)= 1 } in RR_+^*$.
Prouvons que pour tout $n in NN$, l'assertion $P(n)$ : "$|delta_n| <= mu times alpha^n$" est vraie par récurrence double.

Initialisation : 

De manière immédiate, $delta_0 <= mu$ et $delta_1 <= mu$. Ainsi, $P(0)$ et $P(1)$ vraies.

De plus, $delta_2 = 2-sqrt(2) <= 1 = mu$, doù $P(2)$ vraie également.

Hérédité : Soit $n in NN^*$. Supposons $P(n)$ et $P(n-1)$ vraies.

Puisque $|delta_(n+2)| <= (2sqrt(2)-1)/4 |delta_n| + 1/2 |delta_(n-1)|$, il vient :

$
  |delta_(n+2)| <= (2sqrt(2)-1)/4 mu times alpha^n + 1/2 mu times alpha^(n-1) = mu times alpha^(n-1) underbrace(((2sqrt(2)-1)/4 alpha + 1/2)  , = alpha^3)  = mu times alpha^(n+2)
$

On en déduit que $P(n+2)$ vraie à son tour, et que pour tout $n in NN$, $|delta_n| <= mu times alpha^n$.

===

Puisque $|alpha| < 1$ et que $mu$ est un réel fixé, alors $lim_(n -> +oo) (mu times alpha^n) = 0$.

De plus, comme pour tout $n in NN$, on a $0 <= |delta_n| <= mu times alpha^n$, alors par théorème d'encadrement, $lim_(n -> +oo) delta_n = 0$.

Ainsi, $lim_(n-> +oo) (u_n - sqrt(2)) = 0$, d'où $lim_(n-> +oo) u_n = sqrt(2)$.





$
  "Fin du DM12 - J'ai perdu."
$
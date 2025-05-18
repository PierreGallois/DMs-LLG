#import "./../templates/homework.typ": dm, sous-partie, code-from-file
#import "@preview/cetz:0.3.4":
#import "tabvar_patched.typ": tabvar
#import "@preview/lilaq:0.2.0" as lq

#show: dm.with(
  numero: 13,
  titre: [
    Ln, IAF et suites],
  sections: [Problème],
  alpha: false,
)

#let folder-name = "DM13-Ln-IAF-et-suites/"
#let RPS = $RR_+^*$
#let NS = $NN^*$
#let RS = $RR^*$

= Fonction logarithme népérien.
==
Existence : magie noire ($f(x) = integral_1^x 1 / t d t$)

Unicité : soient $f$ et $g$ deux solutions de l'équation différentielle. Posons sur $RPS$ la fonction $h(x) = f(x) - g(x)$. D'une part, $h(1) = 0 - 0 = 0$. D'autre part, $h$ est dérivable comme somme de fonctions dérivables et $h'(x) = 1 / x - 1 / x = 0$. Donc $h$ est constante nulle sur $RPS$, et $f=g$.
==
Soit la fonction $f$ définie sur $RPS$ par $f:x mapsto ln(x y) - ln(y)$ où $y$ est un réel (fixé).
La fonction $f$ est dérivable sur $RPS$ comme différence de fonction dérivables.

Pour tout $x in RPS$,
$
  f'(x) &= ln'(x y) times y "par composition" (ln(y) "constante)" \
  &= 1 / (x y) times y = 1 / x.
$
Aussi, $f(1) = ln(y) - ln(y) = 0$.

Puisque $f'(x) = 1 / x$ et que $f(1) = 0$, par unicité de la fonction $ln$, $f = ln$.

Donc pour tout $x in RPS$, $ln(x y) - ln(y) = ln(x)$ i.e. $ln(x y) = ln(x) + ln(y)$.
==
Soient $x in RPS, n in NS$.
$
  ln(x^n) &= ln(product_(k=1)^n x) \
  &= sum_(k=1)^n ln(x) "d'après 2" \
  &=n ln(x).
$
Donc $ln(x^n) = n ln(x)$.

Soit $x in RPS$.
$
  ln(1 / x) + ln(x) &= ln(1 / x times x) "d'après 2" \
  &= ln(1) \
  &= 0 "par définition."
$
Donc $ln(1 / x) = - ln(x)$.
==
Pour tout $x>0$, la dérivée de la fonction $ln$ est la fonction inverse, par définition.
Or la fonction inverse est strictement positive sur $RPS$. Donc la fonction $ln$ est strictement croissante sur $RPS$.
==
===
Soit $A in RPS$. Alors $A / ln(2) in RPS$, et par la propriété archimédienne, il existe $n in NN^*$ tel que $n >= A / ln(2)$. (Alternativement, $n = ceil(A / ln(2))$)

===
Pour tout $A in RR$, il existe $n in NN^*$ tel que :
$
  n >= A / ln(2) &<==> n ln(2) >= A\
  &<==> ln(2^n) >= A
$
Ainsi, pour tout $x in RPS, x > 2^n$, par croissance de $ln$, $ln(x) > A$. Par définition de la convergence vers $+oo$ en $+oo$, $ lim_(x -> +oo) ln(x) = +oo $
De plus, $ ln(1 / x) = -ln(x) $
d'où $ lim_(x -> 0^+) ln(x) &= lim_(x -> +oo) ln(1 / x) \
&= - lim_(x -> +oo) ln(x)\
&= -oo $

===
D'une part, $ln$ est strictement croissante sur son intervalle de définition : elle est donc injective. De plus, $ln$ est continue, et, au vu de ses limites sur son intervalle de définition, atteint toutes les valeurs de $RR$ (théorème de la bijection). Donc $ln : RPS -->^~ RR$.

= Inégalité des accroissements finis et suites.
#sous-partie[*Partie A*]
==
Supposons être dans les conditions de l'énoncé. Posons :
$
  g(x) = f(x) - f(a) - M(x-a) \
  h(x) = f(x) - f(a) - m(x-a)
$

Alors, d'une part, $g(a) = h(a) = 0$. De plus, ces deux fonctions sont dérivables sur $]a;b[$ par sommes de fonctions dérivables et pour tout $x in ]a;b[$ :
$ g'(x) = f'(x) - M <= 0 #text[par hypothèse] $

Ainsi que :
$ h'(x) = f'(x) - m >= 0 #text[par hypothèse] $

Donc $g$ est décroissante sur $]a;b[$. Comme elle est continue sur $[a;b]$, on peut conclure que, comme $b >= a$, $g(b) <= g(a) = 0$, d'où :
$ f(b) - f(a) <= M(b-a) $

Similairement, $h$ est croissante sur $]a;b[$ et $h(b) >= h(a) = 0$, d'où :
$ m(b-a) <= f(b) - f(a) $
Ce qu'il fallait démontrer.


#sous-partie[*Partie B*]
#counter(heading).update(1)

On définit sur $RR^*$ :
$ phi(x) = 1 / 2(x+ 5 / x) $

==
$phi$ est impaire : soit $x in RS$. Alors $-x in RS$ et :
$
  phi(-x) &= 1 / 2(-x - 5 / x) = -1 / 2(x + 5 / x)\
  &= -phi(x)
$
==
#columns(2)[
  - Quand $x -> +oo$ : $5 / x -> 0$ et par somme : $ lim_(x -> +oo) phi(x) = +oo $
  - Quand $x -> -oo$ : $5 / x -> 0$ et par somme : $ lim_(x -> -oo) phi(x) = -oo $
  #colbreak()
  - Quand $x -> 0^-$ : $5 / x -> -oo$ et par somme : $ lim_(x -> 0^-) phi(x) = -oo $
  - Quand $x -> 0^+$ : $5 / x -> +oo$ et par somme : $ lim_(x -> 0^+) phi(x) = +oo $
]
==
$phi$ est dérivable sur son intervalle de définition comme somme de deux fonctions dérivables sur $RS$. Sa dérivée est pour tout $x in RS$ :

$ phi'(x) = 1 / 2 - 5 / (2x^2) $
Ainsi, $phi'(x) <= 0$ si et seulement si :
$
  1 / 2 &<= 5 / (2x^2) \
  <==> x^2 &<= 5 \
  <==> x &in [-sqrt(5);sqrt(5)] inter RS
$

On a donc le tableau de variations suivant :

#move(dx: -55pt)[
  #tabvar(
    init: (
      variable: $x$,
      label: (
        ([Signe de $phi'(x)$], "Sign"),
        ([Variations de $phi$], "Variation"),
      ),
    ),
    domain: ($-oo$, $-sqrt(5)$, $0$, $sqrt(5)$, $+oo$),
    contents: (
      ($+$, $-$, ("||", $-$), $+$),
      (
        (bottom, $-oo$),
        (center, $-sqrt(5)$),
        (bottom, top, "||", $-oo$, $+oo$),
        (center, $sqrt(5)$),
        (top, $+oo$),
      ),
    ),
  )]

==

#let fun-phi(x) = (1 / 2) * (x + (5 / x))
#let x1s = array.range(-500, -5)
#let y1s = x1s.map(x => fun-phi(x / 50))
#let x2s = array.range(5, 500)
#let y2s = x2s.map(x => fun-phi(x / 50))

#lq.diagram(
  width: 15cm,
  height: 8cm,
  lq.plot(x1s.map(e => e / 50), y1s.map(e => e / 50), mark: none, stroke: 2pt, color: olive),
  lq.plot(x2s.map(e => e / 50), y2s.map(e => e / 50), mark: none, stroke: 2pt, color: olive),
)

==
Soit $x in RS$ :
$
  phi(x) - x &= x / 2 + 5 / 2x - x \
  &= - x / 2 + 5 / 2x \
  &= (5-x^2) / (2x)
$
Ce qu'il fallait démontrer.
==
Soit $x in [sqrt(5); 5 / 2]$. Alors $x >= sqrt(5)$, et par le 3), $phi'(x) >= 0$. De plus :
$
  phi'(x) &<= 1 / 10 \
  <==> 1 / 2 - 1 / 10 &<= 5 / (2x^2) \
  <==> 4 / 5 &<= 5 / (x^2) \
  <==> x^2 &<= 25 / 4 \
  <==> x &<= 5 / 2 #text[car $x >= sqrt(5) >= 0$.]
$
Donc $0 <= phi'(x) <= 1 / 10$ sur $[sqrt(5);5 / 2]$.

#sous-partie[*Partie C*]
#counter(heading).update(1)
==
Par le tableau de variations, $phi$ est croissante sur $[sqrt(5), 5 / 2]$. Ainsi, si pour $n in NN$, $u_n in [sqrt(5); 5 / 2]$, $u_(n+1)$ est bien défini et :
$ sqrt(5) <= u_(n+1) = phi(u_n) <= phi(5 / 2) = 9 / 4 <= 5 / 2 $
Comme $u_0 in [sqrt(5); 5 / 2]$, par récurrence, la suite $(u_n)$ est bien définie et pour tout $n in NN, sqrt(5) <= u_n <= 5 / 2$.
==
Soit $n in NN$. Alors :
$
  u_(n+1) - u_n &= phi(u_n) - u_n\
  &= (5-u_n^2) / (2u_n) #text[par le B)5)] \
  &<= 0 #text[car $u_n >= sqrt(5)$]
$
Donc $u_(n+1) <= u_n$ est la suite $(u_n)$ est décroissante.
==
===
Soit $n in NN$. On sait par le B)6) que pour tout $x in [sqrt(5); 5 / 2]$, $0 <= phi'(x) <= 1 / 10$. $phi$ est dérivable, en particulier continue, sur cet intervalle, et on peut donc appliquer l'IAF avec $u_n$ et $sqrt(5)$ qui sont dans le bon intervalle, donnant :
$
  0(u_n-sqrt(5)) &<= phi(u_n) - phi(sqrt(5)) <= 1 / 10 (u_n - sqrt(5))\
  <==> 0 &<= u_(n+1) - sqrt(5) <= 1 / 10 (u_n - sqrt(5))
$
Ce qu'il fallait démontrer.
#pagebreak()
===
On procède par récurrence.

#underline[Initialisation :] $0 <= u_0 - sqrt(5)$ car $5 / 2 >= sqrt(5)$, et $u_0 - sqrt(5) <= 1 / 2$ car $sqrt(5) >= 2$.

#underline[Hérédité :] Supposons pour $n in NN$ que $0 <= u_n - sqrt(5) <= 1 / 2 dot (1 / 10)^n$. Alors $u_(n+1) - sqrt(5) >= 0$ par le 1), et le 3)a) donne :
$
  u_(n+1) - sqrt(5) &<= 1 / 10 (u_n - sqrt(5)) \
  &<= 1 / 2 dot (1 / 10)^(n+1)
$

Par récurrence, pour tout $n in NN$,
$ 0 <= u_n - sqrt(5) <= 1 / 2 dot (1 / 10)^n $

==
La suite $(u_n)$ est bornée en bas par $sqrt(5)$ (1) et décroissante $(2)$. Elle est donc convergente. Notons $l = lim u_n$ : on a donc $l >= sqrt(5)$. Par passage à la limite du membre droit du 3)b), $l - sqrt(5) <= 0$. Donc $l = sqrt(5)$ : la suite $(u_n)$ tend vers $sqrt(5)$.

(On aurait pu procédér uniquement avec le 3)b) par gendarmes.)
==
On voit par l'inégalité du 3)b) que $u_6 - sqrt(5) <= 10^(-6)$. Ainsi, $k <= 6$. Le code python (non optimisé) suivant calcule la valeur de $k$ :
#code-from-file(folder-name, "suite.py")
Trouvant $k=3$. L'absence d'erreur de précision sur les flottant, trop récurrentes, a été vérifiée a posteriori sur calculatrice.

#sous-partie[*Annexes*]
#counter(heading).update(1)
==
On peut aussi prouver autrement les propriétés de $ln$ : par le théorème de la bijection, $exp: RR -->^~ RPS$ et on définit $ln$ comme sa réciproque. Elle est donc dérivable (j'espère que la preuve est facile) comme réciproque d'une fonction dérivable, et on a
$ exp(ln(x)) = x $
d'où en dérivant des deux côtés $ ln'(x)exp(ln(x)) = x ln'(x) = 1 $
Et $ln'(x) = 1 / x$. Comme $ln(1) = ln(exp(0)) = 0$, on retrouve que $ln$ satisfait l'équation différentielle du sujet, et toutes les conséquences qui vont avec. (Je voulais juste montrer cette jolie preuve de la dérivée de $ln$, qui se généralise à n'importe quelle fonction réciproque : par exemple, on a ainsi $arcsin'(x) = 1 / cos(arcsin(x))$).
==
On peut généraliser la méthode utilisée dans cet exercice, qui est (il me semble) un prétexte pour utiliser l'IAF pour trouver une borne qui permet d'appliquer le théorème du point fixe de Banach.

Posons#footnote[$a >= 5 / 4$ pour la méthode présentée ici, la raison est présentée plus tard] $a in RR^+_*$, pour lequel on veut trouver une suite $(u_n)$ de rationnels qui approche $sqrt(a)$. Posons $phi_a$ une bonne fonction qui a pour point fixe $sqrt(a)$ : on reprend ici l'exemple du problème
$ phi_a (x) = 1 / 2 (x + a / x) $
Que l'on définit uniquement sur $RR^+_*$ par simplicité (on réduira encore l'intervalle après). On cherche, pour un certain $0 <= q < 1$ ($q=1 / 10$ pour les besoins pratiques des décimales) à borner :
$ 0 <= phi'_a <= q $
Sur un intervalle adapté, contenant $sqrt(a)$, de manière a obtenir par l'IAF pour une suite $(u_n)$ contenue dans cet intervalle
$ |u_(n+1) - sqrt(a)| <= q|u_n - sqrt(a)| $
Où on aura défini $u_(n+1) = phi(u_n)$.

=== Trouver le bon intervalle :
La dérivée de $phi$ (dérivable sur son intervalle de définition par somme) est :
$phi'_a (x) = 1 / 2 - a / (2x^2)$. Ainsi :
- $phi'_a (x) >= 0 <==> x^2 >= a <==> x >= sqrt(a)$
- $phi'_a (x) <= 1 / 10 <==> 4 / 5 <= a / x^2 <==> x <= sqrt(5a) / 2$.
On se place donc sur l'intervalle $I = [sqrt(a); sqrt(5a) / 2]$ (si besoin, on peut réduire la borne supérieure de l'intervalle à une valeur $u_0$ plus simple à gérer (rationnelle par exemple), la suite convergera toujours correctement sous réserve que $phi_a (u_0) <= u_0$

L'IAF donne donc que pour tout $x,y in I$ :
$ |phi_a (y) - phi_a (x)| <= 1 / 10|y-x| $
#pagebreak()
=== Trouver la suite :
Posons la suite $(u_n)$ définie pour tout $n in NN$ par :
$
  cases(
    u_0 = sqrt(5a) / 2 #text[(en général $u_0 = sup I$ si celui ci a la bonne propriété)],
    u_(n+1) = phi_a (u_n)
  )
$
Cette suite est bien définie : $u_0 in I$ et si $u_n in I$, alors :
- Par croissance, $u_(n+1) = phi_a (u_n) >= phi_a (sqrt(a)) = sqrt(a)$
- Par croissance encore, $u_(n+1) = phi_a (u_n) <= phi_a (sup I) <= sup I$
(Pour $sup I = sqrt(5a) / 2$, cette dérnière inégalité est ssi $a >= 5 / 4$ : un désavantage d'avoir choisi $q = 1 / 10$)

Donc $u_(n+1) in I$ et la suite est bien définie. Comme le montre le a), $phi_a$ définit une contraction $I -> I subset RR$, qui est complet pour $|.|$. Le théorème du point fixe de Banach donne donc immédiatement l'existence d'un point fixe unique $x^* = sqrt(a)$ sur $I$, et assure que $lim u_n = x^*$.

Enfin, si on arrive à prendre $u_0 in I$ rationnel qui satisfait la bonne propriété, on peut avoir que tout terme de la suite $(u_n)$ est rationnel (en regardant $phi_a$), ce qui est plutot sympa.

Merci d'avoir lu :)

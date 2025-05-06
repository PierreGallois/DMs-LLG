#import "./../templates/homework.typ": dm, sous-partie, code-from-file
#import "@preview/cetz:0.3.4":
#import "tabvar_patched.typ": tabvar

#show: dm.with(
  numero: 13,
  titre: [
    Ln, IAF et suites],
  sections: [Problème],
  alpha: false
)

#let folder-name = "DM13-Ln-IAF-et-suites/"

= Fonction logarithme népérien
==
==
==
==
==
===

===

===

= Inégalité des accroissements finis et suites
#sous-partie[*Partie A*]
==
Supposons être dans les conditions de l'énoncé. Posons :
$ g(x) = f(x) - f(a) - M(x-a) \
h(x) = f(x) - f(a) - m(x-a) $

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

On définit sur $RR_*$ :
$ phi(x) = 1/2(x+ 5/x) $

==
$phi$ est impaire : soit $x in RR_*$. Alors $-x in RR_*$ et :
$ phi(-x) &= 1/2(-x - 5/x) = -1/2(x + 5/x)\
&= -phi(x) $
==
// TODO: Mettre sur deux colonnes ? 
- Quand $x -> +oo$ : $5/x -> 0$ et par somme : $ lim_(x -> +oo) phi(x) = +oo $
- Quand $x -> -oo$ : $5/x -> 0$ et par somme : $ lim_(x -> -oo) phi(x) = -oo $

- Quand $x -> 0^-$ : $5/x -> -oo$ et par somme : $ lim_(x -> 0^-) phi(x) = -oo $
- Quand $x -> 0^+$ : $5/x -> +oo$ et par somme : $ lim_(x -> 0^+) phi(x) = +oo $
==
$phi$ est dérivable sur son intervalle de définition comme somme de deux fonctions dérivables sur $RR_*$. Sa dérivée est pour tout $x in RR_*$ :

$ phi'(x) = 1/2 - 5 / (2x^2) $
Ainsi, $phi'(x) <= 0$ si et seulement si :
$ 1/2 &<= 5 / (2x^2) \
<==> x^2 &<= 5 \
<==> x &in [-sqrt(5);sqrt(5)] inter RR_* $

On a donc le tableau de variations suivant :

// TODO: ajuster la taille
#move(dx:-55pt)[
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
TODO: Thomas ? dis moi si tu ne veux pas le faire :3
==
Soit $x in RR_*$ :
$ phi(x) - x &= x/2 + 5/2x - x \
&= - x / 2 + 5/2x \
&= (5-x^2) / (2x) $
Ce qu'il fallait démontrer.
==
Soit $x in [sqrt(5); 5/2]$. Alors $x >= sqrt(5)$, et par le 3), $phi'(x) >= 0$. De plus :
$ phi'(x) &<= 1/10 \
<==> 1/2 - 1/10 &<= 5/(2x^2) \
<==> 4/5 &<= 5/(x^2) \
<==> x^2 &<= 25 / 4 \
<==> x &<= 5/2 #text[car $x >= sqrt(5) >= 0$.] $
Donc $0 <= phi'(x) <= 1/10$ sur $[sqrt(5);5/2]$.

#sous-partie[*Partie C*]
#counter(heading).update(1)
==
Par le tableau de variations, $phi$ est croissante sur $[sqrt(5), 5/2]$. Ainsi, si pour $n in NN$, $u_n in [sqrt(5); 5/2]$, $u_(n+1)$ est bien défini et :
$ sqrt(5) <= u_(n+1) = phi(u_n) <= phi(5/2) = 9/4 <= 5/2 $
Comme $u_0 in [sqrt(5); 5/2]$, par récurrence, la suite $(u_n)$ est bien définie et pour tout $n in NN, sqrt(5) <= u_n <= 5/2$.
==
Soit $n in NN$. Alors : 
$ u_(n+1) - u_n &= phi(u_n) - u_n\
&= (5-u_n^2)/(2u_n) #text[par le B)5)] \
&<= 0  #text[car $u_n >= sqrt(5)$] $
Donc $u_(n+1) <= u_n$ est la suite $(u_n)$ est décroissante.
==
===
Soit $n in NN$. On sait par le B)6) que pour tout $x in [sqrt(5); 5/2]$, $0 <= phi'(x) <= 1/10$. $phi$ est dérivable, en particulier continue, sur cet intervalle, et on peut donc appliquer l'IAF avec $u_n$ et $sqrt(5)$ qui sont dans le bon intervalle, donnant :
$ 0(u_n-sqrt(5)) &<= phi(u_n) - phi(sqrt(5)) <= 1/10 (u_n - sqrt(5))\
<==> 0 &<= u_(n+1) - sqrt(5) <= 1/10 (u_n - sqrt(5)) $
Ce qu'il fallait démontrer.

===
On procède par récurrence.

#underline[Initialisation :] $0 <= u_0 - sqrt(5)$ car $5/2 >= sqrt(5)$, et $u_0 - sqrt(5) <= 1/2$ car $sqrt(5) >= 2$.

#underline[Hérédité :] Supposons pour $n in NN$ que $0 <= u_n - sqrt(5) <= 1/2 dot (1/10)^n$. Alors $u_(n+1) - sqrt(5) >= 0$ par le 1), et le 3)a) donne :
$ u_(n+1) - sqrt(5) &<= 1/10 (u_n - sqrt(5)) \
&<= 1/2 dot (1/10)^(n+1) $

Par récurrence, pour tout $n in NN$,
$ 0 <= u_n - sqrt(5) <= 1/2 dot (1/10)^n $

==
La suite $(u_n)$ est bornée en bas par $sqrt(5)$ (1) et décroissante $(2)$. Elle est donc convergente. Notons $l = lim u_n$ : on a donc $l >= sqrt(5)$. Par passage à la limite du membre droit du 3)b), $l - sqrt(5) <= 0$. Donc $l = sqrt(5)$ : la suite $(u_n)$ tend vers $sqrt(5)$.

(On aurait pu procédér uniquement avec le 3)b) par gendarmes.)
==
On voit par l'inégalité du 3)b) que $u_6 - sqrt(5) <= 10^(-6)$. Ainsi, $k <= 6$. Le code python (non optimisé) suivant calcule la valeur de $k$ :
#code-from-file(folder-name, "suite.py")
Trouvant $k=3$. L'absence d'erreur de précision sur les flottant, trop récurrentes, a été vérifiée a posteriori sur calculatrice.
#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 10,
  titre: [Théorème de Beatty et jeu de Wythoff],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM10-Theoreme-de-Beatty-et-Jeu-de-Wythoff/"

= Théorème de Beatty

==
===
Sans perte de généralité, supposons que $alpha <= 1$. Alors $1/alpha >= 1$ et comme $beta > 0$,
$
  1/alpha + 1/beta > 1
$
Ce qui est une contradiction. Donc $alpha < 1$, et de la même manière $beta < 1$.

===
Puisque $x,y in.not ZZ$, on a :
$
  x-1 < floor(x) < x "et" y-1 < floor(y) < y
$
En sommant les inégalités, on obtient :
$
  x + y - 2 < floor(x) + floor(y) < x+y
$
Soit comme tous les termes sont entiers :
$
  x+y -1 <= floor(x) + floor(y) <= x+y-1
$
Ce qui donne l'égalité attendue.

==
===
Comme $alpha != 1$, on peut écrire :
$
  1/beta = 1/alpha - 1 "soit" beta = 1/(1/alpha - 1)
$
Comme $alpha in QQ$ et que $QQ$ est clos sous la somme et l'inversion, on a $beta in QQ$.

===
On écrit $alpha = a/b$ et $beta = c/d$ pour $a,b,c,d in NN^*$. Alors :
$
  a c = (b c) alpha in M(alpha) "et" a c = (d a)beta in M(beta)
$
Donc $a c in M(alpha) inter M(beta)$, qui n'est donc pas vide.

De plus, $a c in NN$. On a donc $a c in "Sp"(alpha) inter "Sp"(beta)$. Ces ensembles ne sont donc pas disjoints et ne peuvent former une partition de $NN^*$. On a donc prouvé que si $alpha$ ou $beta$ est rationnel, alors $"Sp"(alpha)$ et $"Sp"(beta)$ ne peuvent former une partition de $NN^*$, i.e la contraposée de l'implication indirecte du théorème de Beatty.

==
===
On procède par contradiction. Supposons que $beta$ soit rationnel. Alors par le même raisonnement qu'au $2)a)$, $alpha$ est également rationnel, ce qui est une contradiction. Donc $beta$ est irrationnel.

===
On raisonne à nouveau par contradiction. Supposons que $M(alpha) inter M(beta) != emptyset$. Il existe alors $n,m in NN^*$ tels que $n alpha = m beta$. On a alors par hypothèse :
$
  n/m = alpha / beta = (1+alpha / beta) - 1 = alpha - 1
$
Donc $alpha = 1 + n/m$ est rationnel, ce qui est une contradiction. Donc $M(alpha)$ et $M(beta)$ sont disjoints.

On ne peut pas encore en conclure que $"Sp"(alpha)$ et $"Sp"(beta)$ sont disjoints, puisqu'il reste la possibilité d'avoir :
$
  n alpha != m beta "mais" floor(n alpha) = floor(m beta)
$

===
Comme $alpha, beta$ sont irrationnels, on a :
$
  k < n alpha, m beta < k+1
$
On en déduit :
$
  k/alpha < n < k/alpha + 1/alpha " et " k / beta < m < k/beta + 1/beta
$
En sommant les inégalités, on obtient :
$
  k(1/alpha + 1/beta) &< n+m < (k+1)(1/alpha + 1/beta) " soit "\
  k &< n+m < k+1
$
On a donc un entier entre deux entiers consécutifs, ce qui est une contradiction. Donc si $"Sp"(alpha)$ et $"Sp"(beta)$ ne sont pas disjoints, alors $alpha$ est rationnel. On en déduit que comme $alpha$ est rationnel, alors $"Sp"(alpha) inter "Sp"(beta) = emptyset$

===
====
Le nombre $p$ d'éléments de $B_N (alpha)$ est le nombre d'entiers $k in NN^*$ tels que :
$
  1 <= k alpha < N " c'est à dire " 1/alpha <= k < N/alpha
$
Comme $1/alpha < 1$ et que $N/alpha$ n'est pas entier, ces $k$ sont au nombre de $p = floor(N/alpha)$.

====
Par la question précédente, $abs(B_N (alpha)) = floor(N/alpha)$ et $abs(B_N (beta)) = floor(N/beta)$.
D'après la question $3)b)$, $M(alpha)$ et $M(beta)$ sont disjoints. Donc $B_N (alpha)$ et $B_N (beta)$ également et :
$
  abs(B_N (alpha) union B_N (beta)) = floor(N/alpha) + floor(N/beta)
$

Or par hypothèse sur $alpha$ et $beta$, $N/alpha + N/beta = N$ est entier. Par la question $1)b)$, on a alors :
$
  abs(B_N (alpha) union B_N (beta)) = N/alpha + N/beta - 1 = N-1
$

Ainsi, 
$
  |(M(alpha) union M(beta)) inter [1;N[ | &= |(M(alpha) inter [1;N[) union (M(beta) inter [1;N[)| \
  &= abs(B_N (alpha) union B_N (beta)) \
  &= N-1
$

====
Pour tout $N >= 2$, il y a $N-1$ entiers et $N-1$ éléments de $M(alpha) union M(beta)$ dans l'intervalle $[1;N[$. Comme $alpha, beta > 1$, deux éléments de $M(alpha)$ ou de $M(beta)$ ne peuvent pas avoir la même partie entière puisqu'ils sont espacés d'au moins $alpha$ ou $beta$.

De même, un élément de $M(alpha)$ et un élément de $M(beta)$ ne peuvent avoir la même partie entière puisque $"Sp"(alpha)$ et $"Sp"(beta)$ sont disjoints d'après la question $3)c)$.

Ainsi, on en déduit qu'il y a $N-1$ éléments de $"Sp"(alpha) union "Sp"(beta)$ dans $[1;N[$. Comme tous ces éléments sont entiers, on en déduit que :
$
  ("Sp"(alpha) union "Sp"(beta)) inter [1;N[ = [|1;N-1|]
$
On en déduit ainsi les égalités d'ensembles suivantes :
$
  "Sp"(alpha) union "Sp"(beta) &= ("Sp"(alpha) union "Sp"(beta)) inter [1;+oo]\
  &= ("Sp"(alpha) union "Sp"(beta)) inter union.big_(N=2)^(+oo) [1;N[ \
  &= union.big_(N=2)^(+oo) ("Sp"(alpha) union "Sp"(beta)) inter [1;N[ \
  &= union.big_(N=2)^(+oo) [|1;N-1|] \
  &= NN^*
$

Ce qui termine la preuve du théorème de Beatty.

= Jeu de Wythoff
==
===
Si l'état initial est $(3,4)$, alors le premier joueur peut retirer $2$ au deux piles pour avoir la configuration $(1,2)$, qui est toujours perdante pour le second joueur. En effet, si ce dernier retire tous les pièces d'une pile, alors le premier joueur gagne en terminant la deuxième. Or, le seul moyen pour le deuxième joueur de ne pas terminer une pile est de jouer la configuration $(1,1)$, auquel cas le joueur $1$ gagne en retirant $1$ à chaque pile.

Donc la position $(2,1)$ est toujours perdante pour le 2e joueur, et la position $(3,4)$ toujours gagnante pour le premier.

===

==
===
Par définition, $phi$ satisfait $phi^2 = phi + 1$. Ainsi :
$
  1/phi + 1/phi^2 = (phi + 1)/phi^2 = 1
$
===
Pour tout $n in NN^*$ :
$
  b_n = floor(n phi^2) = floor(n phi + n) = floor(n phi) + n = a_n + n
$

==
===
Par symétrie des piles, on suppose sans perte de généralité que la configuration de Beatty $(u,v)$ est telle que $u = a_p$ et $v = b_p$. On distingue trois cas, selon si l'on retire $k in NN^*$ pièces :

- A la pile de gauche : La nouvelle configuration est $(u', v') =(a_p - k, b_p)$. Si cette configuration est de Beatty, alors comme $u' < v'$, $(u', v') = (a_q, b_q)$ pour un $q in NN^*$ On a alors :
$
  q = b_q - a_q = v' - u' = b_p - a_p + k = p+k
$.
Donc $q > p$. Pourtant, $a_q < a_p$, ce qui contredit la croissance de la suite $(a_n)$ ($phi, phi^2 > 1$). Donc la nouvelle configuration n'est pas de Beatty.

- A la pile de droite : La nouvelle configuration est $(u', v') = (a_p, b_p - k)$. Si $v > v' >= u'$ alors la nouvelle configuration ne peut être de Beatty : $u' = a_p$ mais $v' < u' + p$. Si $v' < u'$, et que $(u', v')$ est de Beatty alors $u' = b_q$ et $v' = a_q$ pour un entier $q$. En particulier, $b_q = a_p$. Or $"Sp"(phi)$ et $"Sp"(phi^2)$ sont disjoints : c'est donc une contradiction. Donc la nouvelle configuration n'est pas de Beatty.

- Aux deux piles : La nouvelle configuration est $(u', v') = (a_p -k, b_p - k)$. On a alors $u' <= v'$ et $v' - u' = p$. Si $(u', v')$ est de Beatty, alors $(u', v') = (a_p, b_p)$ ce qui est impossible. Donc la nouvelle configuration n'est pas de Beatty.

Ainsi, la configuration suivant une configuration de Beatty n'est jamais de Beatty.

===
On suppose encore que $u<= v$, et on définit $a_0 = b_0 = 0$.

Supposons que la configuration $(u,v)$ ne soit pas de Beatty. Comme $"Sp"(phi)$ et $"Sp"(phi^2)$ partitionnent $NN^*$, alors $u = a_p$ ou $u = b_p$ pour un entier $p in NN$.#footnote[Pour $p = 0$, on peut toujours atteindre l'état $(0,0)$ On suppose que $p>0$ i.e $u$ et $v$ sont non nuls.]

- Si $u = b_p$, alors $v >= b_p >= a_p$. On peut alors retirer à la pile de droite $v - a_p$ pièces pour atteindre la configuration $(b_p, a_p)$ qui est de Beatty.

- Si $u = a_p$, on distingue deux cas. Si $v > u + p = b_p$, alors on peut retirer à la pile de droite pour atteindre la configuration $(a_p, b_p)$. Si $u <= v < u+p$ (inégalité stricte puisque $(u,v)$ n'est pas de Beatty), alors $0 <= v-u < p$. Par croissance stricte de $(a_n)$, $u= a_p > a_(v-u)$. On retire alors aux deux piles $a_p - a_(v-u)$, ce qui donne :
$
  u' = u - a_p + a_(v-u) = a_(v-u) " et " v' &= v - a_p + a_(v-u) \
  &= (v-u) + a_(v-u) \
  &= b_(v-u)
$

On peut donc toujours atteindre une configuration de Beatty depuis une configuration qui ne l'est pas.

===
Si l'état initial est de Beatty, alors le deuxième joueur peut gagner en forçant le premier joueur à ne jouer seulement sur des états de Beatty. En effet, si l'état sur lequel joue le joueur $1$ est de Beatty, alors le joueur $2$ joue sur un état qui ne l'est pas et peut donc jouer de manière à ce que l'état suivant sur lequel joue le joueur 1 soit de Beatty.

La suite des indices correspondant aux états de Beatty sur lesquels joue le joueur $1$ est strictement décroissante. Par descente infinie, le joueur $1$ doit jouer à un moment sur l'état de Beatty d'indice $0$ i.e sur $(0,0)$, c'est à dire que le joueur $2$ a tiré la dernière pièce.

A l'inverse, si la première configuration n'est pas de Beatty, alors le joueur $1$ peut forcer son adversaire à ne jouer que sur des configurations de Beatty et a donc toujours une stratégie gagnante.
#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 5,
  titre: [Existence de la fonction exponentielle],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM05-Existence-De-La-Fonction-Exponentielle/"

= Inégalité de Bernoulli

= Convergence de deux suites  
==
===
On calcule :
$
  (1+x/n)(1-x/((n+1)(n+x))) &= ((n+x)/n)(((n+1)(n+x) - x)/((n+1)(n+x))) \
  &= (n(n+x) + n)/(n(n+1)) \
  &= (n+x+1)/(n+1) = 1 + x/(n+1)
$

Ainsi,
$
  u_(n+1)(x) &= (1+x/(n+1))^(n+1) \
  &= (1+x/n)^(n+1)(1-x/((n+1)(n+x)))^(n+1)
$

===
Pour tout $x$ fixé, la suite $(-x/((n+1)(n+x)))_(n in NN)$ tend vers 0 par quotient, car $n+a -->^(n -> +oo) +oo$ pour tout $a in RR$.
Par définition de la convergence, il existe donc un rang $n_0$ pour lequel, avec $epsilon = 1/2$, on a pour tout $n >= n_0$ que :
$
  -1 < -1/2 < -x/((n+1)(n+x)) < 1/2
$

Similairement, $1+x/n -->^(n->+oo) 1$ et on obtient un rang $n_1$ de la même manière.

===
Posons $n_2 = max(n_0, n_1)$. Ainsi, pour tout $n >= n_2$, $n >= n_0$ permet d'appliquer l'inégalité de Bernoulli à $(1-x/((n+1)(n+x)))^(n+1)$ et $n >= n_1$ permet d'avoir $n+x != 0$. On a donc :
$
  u_(n+1)(x) &>=^(#text[Bernoulli])(1+x/n)^(n+1)(1-x/(n+x)) \
  &>= u_n (x)(1+x/n)(1-x/(n+x)) = u_n (x)(n+x)/n n/(n+x) \
  &>= u_n (x)
$
Donc la suite $(u_n (x))_(n in NN^*)$ est croissante au moins à partir du rang $n_2$.

==
On remarque que $w_n (x) = u_n (-x)$ pour tout $n in NN^*$. Or, la suite $(u_n (a))_(n in NN^*)$ est croissante à partir d'un certain rang pour tout $a in RR$. Donc $(w_n)_(n in NN^*)$ est croissante à partir d'un certain rang.

De plus, $w_n$ n'est nul que pour au plus un rang, et est non nul pour tous les autres termes. On a donc $v_n = w_n^(-1)$ au moins à partir d'un certain rang, et, par croissance de $(w_n)$ et décroissance de la fonction inverse, la suite $(v_n)_(n in NN^*)$ est décroissante à partir d'un certain rang.

==
===
Soit $n > abs(x)$. Alors $v_n != 0$ et :
$
  u_n/v_n = ((1+x/n)/(1-x/n)^(-1))^n = (1-x^2/n^2)^n
$
Or, $x^2/n^2 < 1$. Donc $1 >= u_n/v_n$#footnote[On note temporairement $u_n = u_n (x)$ et $v_n = v_n (x)$, tant que $x$ est fixé.], et on peut également appliquer l'inégalité de Bernoulli pour obtenir :
$
  u_n/v_n >= 1-x^2/n
$

===
On obtient l'inégalité suivante :
$
  x^2/n >= (v_n - u_n)/v_n >= 0
$
Or, la suite $(v_n)$ est strictement positive à partir d'un certain rang $N$ et décroissante à partir d'un certain rang $M$. Ainsi, pour tout $n >= k := max(N,M,floor(abs(x)) + 1) > abs(x)$, on a :
$
  v_k x^2/n >= v_n x^2/n >= v_n-u_n >= 0
$

===
Comme $x^2$ et $v_k (x)$ sont fixés, $lim_(n -> +oo) v_k x^2/n = 0$. D'après le théorème d'encadrement, on a donc :
$
  lim_(n-> +oo)v_n (x) - u_n (x) = 0
$
Ainsi, pour tout $x in RR$, les suites $(u_n (x))$ et $(v_n (x))$ sont adjacentes, en compilant les résultats du 1)c), du 2), et du 3)b). Ces deux suites admettent donc une limite finie commune.

= Existence
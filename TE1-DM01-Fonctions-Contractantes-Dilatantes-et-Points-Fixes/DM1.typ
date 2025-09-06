#import "./../templates/homework.typ": dm, sous-partie

#show: dm.with(
  numero: 1,
  titre: [
    Fonctions contractantes,\ dilatantes et points fixes],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM01-Fonctions-Contractantes-Dilatantes-et-Points-Fixes/"

#sous-partie[Partie A - Fonctions contractantes et rétrécissantes.]

==
Soient $ k in RR_+^*$, et $f$ une fonction définie sur $I$ telle que pour tous $x, y in I, |f(x) - f(y)| lt.eq.slant k|x - y|$.

==
Soit $f$ une fonction contractante définie sur $I$, et $x, y in I$. Il existe donc $k in ]0,1[$ tel que $|f(x) - f(y)| lt.eq.slant k|x - y| (*)$.

Or,
$
  k < 1 &==> k|x-y| < |x-y| \
  &==> |f(x) - f(y)| < |x-y| "d'après" (*)
$

// D'après la dernière inégalité,
// $
//   |f(x) - f(y)| < |x-y| &==> 0 lt.eq.slant |f(x) - f(y)| < |x-y| \
//   &==> 0 < |x-y| \
//   &==> x != y
// $

$f$ est donc rétrécissante.

De plus,
$
  |f(x) - f(y)| < |x-y| &==> |f(x) - f(y)| lt.eq.slant 1 times |x-y|
$

$f$ est donc 1-lipschitzienne.

==
Soient $a in RR$, $I = [a,+infinity[$, et $f:x mapsto.long x + 1/(x-a+1)$ pour tous $x in I$.

===
$f$ est dérivable sur $I$. Pour tout $x in I$, $f'(x) = 1 - 1/(x-a+1)^2$.
Or,
$
  x in I &==> x gt.eq.slant a \
  &==> x-a gt.eq.slant
$

#sous-partie[Partie B - Fonctions rétrécissantes et point fixe.]



#sous-partie[Partie C - Fonctions dilatantes.]

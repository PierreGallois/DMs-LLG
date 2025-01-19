#import "./../templates/homework.typ": dm, code-from-file
#import "@preview/plotst:0.2.0": *

#show: dm.with(
  numero: 9,
  titre: [Fonction du Boulanger],
  sections: [Problème],
  alpha: false
)
#let folder-name = "DM9-Fonction-du-Boulanger"

=

==

#let f(x) = {
  if 0 <= x and x <= 1/2 {
    2 * x
  } else if 1/2 < x and x <= 1 {
    2 * (1 - x)
  } else {
    assert(false)
  }
}

#let data = range(100).map(x => (x/100, f(x/100)))
#let x_axis = axis(min: 0, max: 1, step: 0.25, location: "bottom")
#let y_axis = axis(min: 0, max: 1, step: 0.25, location: "left")
#let pl = plot(data: data, axes: (x_axis, y_axis))
#figure(
  graph_plot(
    pl,
    (200pt, 150pt),
    caption: none),
  supplement: none,
  caption: [Représentation graphique de $f$ sur $[0, 1]$],
)

==
La fonction `suite` repose naturellement sur de la récursivité. Nous allons donc la programmer dans un language qui supporte de manière optimale les fonctions récursives.

Voici `suite a p` en Haskell.

#code-from-file(folder-name, "/code/suite.hs")
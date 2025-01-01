#import "sapin.typ": *

#let p = (0, 0)
#let cad = (blue.lighten(50%),) * 6
#let cbd = (blue.darken(30%),) * 6

#let sapin-transformation(size) = [
  #let ca = (red.lighten(30%), green.lighten(30%),)*3
  $
    #cetz.canvas(sapin(p, 3, 2, ca, cbd)) &= #cetz.canvas(c-triangle(p, size, 1, ca, cbd)) &+ #cetz.canvas({
      a-triangle(p, size/2, ca.at(1))
      b-triangle(p, size/2, cbd.at(1))}) \
    #cetz.canvas(sapin((0, 0), 3, 3, ca, cbd)) &= #cetz.canvas(c-triangle((0, 0), size, 2, ca, cbd)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 1, ca, cbd)) \
    #cetz.canvas(sapin((0, 0), 3, 4, ca, cbd)) &= #cetz.canvas(c-triangle((0, 0), size, 3, ca, cbd)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 2, ca, cbd)) \
    #cetz.canvas(sapin((0, 0), 3, 5, ca, cbd)) &= #cetz.canvas(c-triangle((0, 0), size, 4, ca, cbd)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 3, ca, cbd)) \
  $
]

#let sapin-exemple(size) = {
  align(
    center,
    table(
      columns: 5,
      column-gutter: 10pt,
      align: center + horizon,
      stroke: none,
      cetz.canvas({a-triangle(p, size/2, cad.at(1))
      b-triangle(p, size/2, cbd.at(1))}),
      cetz.canvas(sapin(p, size, 2, cad, cbd)),
      cetz.canvas(sapin(p, size, 3, cad, cbd)),
      cetz.canvas(sapin(p, size, 4, cad, cbd)),
      [...],
      [Sapin 1 ($S_1$)],
      [Sapin 2 ($S_2$)],
      [Sapin 3 ($S_3$)],
      [Sapin 4 ($S_4$)],
      [Sapin $n$ ($S_n$)],
    )
  )
}

#let base-exemple(size) = {
  align(
    center,
    table(
      columns: 5,
      column-gutter: 10pt,
      align: center + horizon,
      stroke: none,
      cetz.canvas({a-triangle(p, size/2, cad.at(1))
      b-triangle(p, size/2, cbd.at(1))}),
      cetz.canvas(c-triangle(p, size, 1, cad, cbd)),
      cetz.canvas(c-triangle(p, size, 2, cad, cbd)),
      cetz.canvas(c-triangle(p, size, 3, cad, cbd)),
      [...],
      [Base 1 ($B_1$)],
      [Base 2 ($B_2$)],
      [Base 3 ($B_3$)],
      [Base 4 ($B_4$)],
      [Base $n$ ($B_n$)],
    )
  )
}

#let base-triangles(size) = {
  cetz.canvas({
    c-triangle(p, size, 3,
    (blue.lighten(80%),) * 5,
    (black.darken(30%), red.darken(30%), green.darken(30%), red.darken(30%))
    )
    b-triangle(p, size, blue)
  })
}
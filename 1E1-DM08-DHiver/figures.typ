#import "sapin.typ": *

#let p = (0, 0)
#let cad = (aqua,) * 5
#let cbd = (eastern.darken(30%),) * 5

#let sapin-transformation(size) = [
  #let ca = (red.lighten(30%), green.lighten(30%),)*3
  #let cb = (blue.darken(30%),) * 4
  $
    #cetz.canvas(sapin(p, 3, 2, ca, cb)) &= #cetz.canvas(c-triangle(p, size, 1, ca, cb)) &+ #cetz.canvas({
      a-triangle(p, size/2, ca.at(1))
      b-triangle(p, size/2, cb.at(1))}) \
    #cetz.canvas(sapin((0, 0), 3, 3, ca, cb)) &= #cetz.canvas(c-triangle((0, 0), size, 2, ca, cb)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 1, ca, cb)) \
    #cetz.canvas(sapin((0, 0), 3, 4, ca, cb)) &= #cetz.canvas(c-triangle((0, 0), size, 3, ca, cb)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 2, ca, cb)) \
    #cetz.canvas(sapin((0, 0), 3, 5, ca, cb)) &= #cetz.canvas(c-triangle((0, 0), size, 4, ca, cb)) &+ #cetz.canvas(c-triangle((0, 0), size/2, 3, ca, cb)) \
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
      cetz.canvas({a-triangle(p, size, cad.at(1))
      b-triangle(p, size, cbd.at(1))}),
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
      column-gutter: 30pt,
      align: center + horizon,
      stroke: none,
      cetz.canvas({a-triangle(p, size, cad.at(1))
      b-triangle(p, size, cbd.at(1))}),
      cetz.canvas(c-triangle(p, size, 1, cad, cbd)),
      cetz.canvas(c-triangle(p, size, 2, cad, cbd)),
      cetz.canvas(c-triangle(p, size, 3, cad, cbd)),
      [...],
      [$#math.bold[B]_1$],
      [$#math.bold[B]_2$],
      [$#math.bold[B]_3$],
      [$#math.bold[B]_4$],
      [$#math.bold[B]_n$],
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

#let simple-triangle(size) = {
  cetz.canvas({
    a-triangle(p, size, cad.at(1))
    b-triangle(p, size, cbd.at(1))
  })
}

#let limite-surface-v1(size) = {
  let limite-surface1(size, depth) = cetz.canvas({
    sapin(p, size, depth, cad, cbd)
    rect(
      stroke: (dash: "dashed", ),
      (0, 0),
      (size, (size * sqrt(3) / 2 * 5/8))
    )
  })
  align(
  center,
  table(
    columns: 3,
    column-gutter: 15pt,
    stroke: none,
    align: bottom,
    cetz.canvas({
      a-triangle(p, size, cad.at(1))
      b-triangle(p, size, cbd.at(1))
      rect(
        stroke: (dash: "dashed", ),
        (0, 0),
        (size, (size * sqrt(3) / 2 * 5/8))
      )
    }),
    limite-surface1(4, 4),
    limite-surface1(4, 6)
  )
)
}

#let limite-surface-v2(size) = {
  let limite-surface2(size, depth) = cetz.canvas({
    sapin(p, size, depth, cad, cbd)
    rect(
      stroke: (dash: "dashed", ),
      (size*3/16, 0),
      (size * 5/8 + size*3/16, (size * sqrt(3) / 2))
    )
  })
  align(
  center,
  table(
    columns: 3,
    column-gutter: 15pt,
    stroke: none,
    align: bottom,
    cetz.canvas({
      a-triangle(p, size, cad.at(1))
      b-triangle(p, size, cbd.at(1))
      rect(
        stroke: (dash: "dashed", ),
        (size*3/16, 0),
        (size * 5/8 + size*3/16, (size * sqrt(3) / 2))
      )
    }),
    limite-surface2(4, 4),
    limite-surface2(4, 6)
  )
)
}

#let grand-sapin(size, depth) = {
  let ca = (white, olive.lighten(80%), olive.lighten(60%), olive.lighten(40%), olive.lighten(20%), olive, olive.darken(20%), black)
  let cb = (black, purple, yellow, green, teal, eastern, olive)
  cetz.canvas(
    sapin(p, size, depth, ca, cb)
  )
}
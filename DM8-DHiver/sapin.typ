#import "@preview/cetz:0.3.1"
#import cetz.draw: *
#import calc.sqrt

#let a-triangle(padding, size, color) = {
  let (px, py) = padding
  line(
    close: true,
    fill: color,
    stroke: none,
    (px, py),
    (px + size, py),
    (px + (size/2), py + (size * sqrt(3) / 2))
  )
}

#let b-triangle(padding, size, color) = {
  let (px, py) = padding
  line(
    close: true,
    fill: color,
    stroke: none,
    (px + (size/4), py + (size * sqrt(3) / 4)),
    (px + (3*size/4), py + (size * sqrt(3) / 4)),
    (px + (size/2), py)
  )
}

#let c-triangle-inside(padding, size, depth, colors-a, colors-b) = {
  assert(depth > 0)
  assert(depth < 9, message: "trop long sinon")
  let (px, py) = padding
  b-triangle((px, py), size/2, colors-b.at(depth - 1))
  b-triangle((px + size/2, py), size/2, colors-b.at(depth - 1))
  b-triangle((px + size/4, py + (sqrt(3)*size/4)), size/2, colors-b.at(depth - 1))
  if depth != 1 {
    c-triangle-inside((px, py), size/2, depth - 1, colors-a, colors-b)
    c-triangle-inside((px + size/2, py), size/2, depth - 1, colors-a, colors-b)
    c-triangle-inside((px + size/4, py + (sqrt(3)*size/4)), size/2, depth - 1, colors-a, colors-b)
  }
}

#let c-triangle(padding, size, depth, colors-a, colors-b) = {
  a-triangle(padding, size, colors-a.at(depth - 1))
  b-triangle(padding, size, colors-b.at(depth - 1))
  c-triangle-inside(padding, size, depth, colors-a, colors-b)
}

#let sapin(padding, size, depth, colors-a, colors-b) = {
  assert(depth > 1)
  let (px, py) = padding
  a-triangle(padding, size, colors-a.at(depth - 1))
  c-triangle(padding, size, depth - 1, colors-a, colors-b)
  let decal = (px + size/4, py + (3 * sqrt(3)*size/8))
  if depth == 2 {
    a-triangle(decal, size / 2, colors-a.at(depth - 1))
    b-triangle(decal, size / 2, colors-b.at(depth - 1))
  } else {
    sapin(decal, size / 2, depth - 1, colors-a, colors-b)
  }
}

ab
#cetz.canvas({
  line((0, 0), (1, 0))
  //a-triangle((1, 0), 4)
  c-triangle((1, 0), 7, 2,
  (blue.lighten(50%), red.lighten(50%), green.lighten(50%)),
  (blue.darken(20%), red.darken(20%), green.darken(20%))
  )
  })
eee

ab
#cetz.canvas({
  line((0, 0), (1, 0))
  //a-triangle((1, 0), 4)
  sapin((1, 0), 5, 2, (blue.lighten(50%), red.lighten(50%), green.lighten(50%)),
  (blue.darken(20%), red.darken(20%), green.darken(20%)))
  })
eeef
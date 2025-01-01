#import "@preview/cetz:0.3.1"
#import cetz.draw: *
#import calc.sqrt

#let a-triangle(padding, size) = {
  let (px, py) = padding
  line(
    close: true,
    fill: blue.lighten(50%),
    stroke: none,
    (px, py),
    (px + size, py),
    (px + (size/2), py + (size * sqrt(3) / 2))
  )
}

#let b-triangle(padding, size) = {
  let (px, py) = padding
  line(
    close: true,
    fill: blue.darken(20%),
    stroke: none,
    (px + (size/4), py + (size * sqrt(3) / 4)),
    (px + (3*size/4), py + (size * sqrt(3) / 4)),
    (px + (size/2), py)
  )
}

#let c-triangle-inside(padding, size, depth) = {
  assert(depth > 0)
  assert(depth < 8, message: "trop long sinon")
  let (px, py) = padding
  b-triangle((px, py), size/2)
  b-triangle((px + size/2, py), size/2)
  b-triangle((px + size/4, py + (sqrt(3)*size/4)), size/2)
  if depth != 1 {
    c-triangle-inside((px, py), size/2, depth - 1)
    c-triangle-inside((px + size/2, py), size/2, depth - 1)
    c-triangle-inside((px + size/4, py + (sqrt(3)*size/4)), size/2, depth - 1)
  }
}

#let c-triangle(padding, size, depth) = {
  b-triangle(padding, size)
  c-triangle-inside(padding, size, depth)
}

#let sapin(padding, size, depth) = {
  assert(depth > 1)
  let (px, py) = padding
  a-triangle(padding, size)
  c-triangle(padding, size, depth - 1)
  let decal = (px + size/4, py + (3 * sqrt(3)*size/8))
  if depth == 2 {
    a-triangle(decal, size / 2)
    b-triangle(decal, size / 2)
  } else {
    sapin(decal, size / 2, depth - 1)
  }
}

ab
#cetz.canvas({
  line((0, 0), (1, 0))
  //a-triangle((1, 0), 4)
  c-triangle((1, 0), 7, 2)
  })
eee

ab
#cetz.canvas({
  line((0, 0), (1, 0))
  //a-triangle((1, 0), 4)
  sapin((1, 0), 5, 2)
  })
eee
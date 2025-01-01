#import "sapin.typ": *


#let sapin-transformation(size) = [
  #let p = (0, 0)
  $
    #cetz.canvas(sapin(p, 3, 2)) &= #cetz.canvas(c-triangle(p, size, 1)) + #cetz.canvas({
      a-triangle(p, size/2)
      b-triangle(p, size/2)}) \
    #cetz.canvas(sapin((0, 0), 3, 3)) &= #cetz.canvas(c-triangle((0, 0), size, 2)) + #cetz.canvas(c-triangle((0, 0), size/2, 1)) \
    #cetz.canvas(sapin((0, 0), 3, 4)) &= #cetz.canvas(c-triangle((0, 0), size, 3)) + #cetz.canvas(c-triangle((0, 0), size/2, 2)) \
    #cetz.canvas(sapin((0, 0), 3, 5)) &= #cetz.canvas(c-triangle((0, 0), size, 4)) + #cetz.canvas(c-triangle((0, 0), size/2, 3)) \
  $
]

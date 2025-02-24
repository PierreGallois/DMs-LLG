#import "@preview/cetz:0.3.2"
#import "@preview/modpattern:0.1.0": modpattern

#let vector(x0, y0, x1, y1, color, size) = {
  import cetz.draw: *
  line((x0, y0), (x1, y1), mark: (end: ">", length: 3pt, width: 3pt), fill: color, stroke: (paint: color, thickness: size))
}

#let repere(env, o-legend: "to-be-set", vectors: true) = {
  import cetz.draw: *
  if o-legend == "to-be-set" {
    o-legend = text([(0, 0)], size: 0.75em)
  }
  grid(env.slice(0, 2), env.slice(2, 4), help-lines: true)
  line((0, env.at(1)), (0, env.at(3)))
  line((env.at(0), 0), (env.at(2), 0))
  if vectors {
    vector(0, 0, 1, 0, black, 1.5pt)
    vector(0, 0, 0, 1, black, 1.5pt)
  }
  content((0.2em, -0.7em), o-legend, anchor: "west")
}

#let point(x, y, name, color) = {
  import cetz.draw: *
  circle((x, y), radius: (0.17em, 0.17em), fill: color, stroke: none)
  content((x + 0.1, y - 0.4), name, anchor: "west")
}

#let droite-tropicale(env, x, y, name, color, size: 1.5pt) = {
  import cetz.draw: *
  import calc.min
  line((env.at(0), y), (x, y), stroke: (paint: color, thickness: size))
  line((x, env.at(1)), (x, y), stroke: (paint: color, thickness: size))
  let m = min(env.at(2) - x, env.at(3) - y)
  line((x, y), (x + m, y + m), stroke: (paint: color, thickness: size))
  point(x, y, name, color)
}


#let exemples() = {
  align(center)[
    #cetz.canvas({
      import cetz.draw: *
      let env = (-6, -6, 8, 7)
      repere(env)
      droite-tropicale(env, 4, 1, text($C_3$, fill: eastern), eastern)
      droite-tropicale(env, -4, 1, text($C_1$, fill: red), red)
      droite-tropicale(env, 1, 2, text($C_2$, fill: olive.darken(30%)), olive.darken(30%))
      droite-tropicale(env, 6, -1, text($C_4$, fill: purple), purple)

      point(-2, 3, $A_1$, black)
      point(0, 5, $B_1$, black)
      point(1, 1, $A_2$, black)
      point(3, 4, $B_2$, black)
      point(2, 1, $A_3$, black)
      point(5, 2, $B_3$, black)
      point(2, -1, $A_4$, black)
      point(6, -4, $B_4$, black)
    }, length: 20pt)
  ]
}

#let pattern-line(color) = modpattern((5pt, 10pt))[
  #move(dx: 50%, line(start: (0%, 100%), end: (100%, 0%), stroke: 0.5pt + color))
]

#let illustration(size, call-fun) = cetz.canvas({
  import cetz.draw: *
  let env = (-2, -2, 2, 2)
  call-fun(env)
  repere(env, o-legend: text([$A$], size: 0.75em), vectors: false)
  point(0, 0, "", black)
}, length: size)

#let ill-squares(env) = {
  import cetz.draw: *
  rect((0, 0), (env.at(0), env.at(3)), fill: pattern-line(blue), stroke: none)
  rect((0, 0), (env.at(2), env.at(1)), fill: pattern-line(blue), stroke: none)
}

#let ill-triangles-up(env) = {
  import cetz.draw: *
  line((0, 0), env.slice(2, 4), (0, env.at(3)), close: true, fill: pattern-line(green), stroke: none)
  line((0, 0), env.slice(0, 2), (0, env.at(1)), close: true, fill: pattern-line(green), stroke: none)
  line(env.slice(0, 2), env.slice(2, 4))
}

#let ill-triangles-down(env) = {
  import cetz.draw: *
  line((0, 0), env.slice(2, 4), (env.at(2), 0), close: true, fill: pattern-line(orange), stroke: none)
  line((0, 0), env.slice(0, 2), (env.at(0), 0), close: true, fill: pattern-line(orange), stroke: none)
  line(env.slice(0, 2), env.slice(2, 4))
}

#illustration(15pt, ill-squares)
#illustration(15pt, ill-triangles-up)
#illustration(15pt, ill-triangles-down)
#illustration(15pt,
  (env) => {
    ill-squares(env)
    ill-triangles-up(env)
    ill-triangles-down(env)  
  }
)

#let style-square(size) = cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (0, 0))
  line((0, -1), (0, 0))
  line((calc.sqrt(0.5), calc.sqrt(0.5)), (0, 0), stroke: (dash: "dashed", cap: "round", thickness: 0.75pt))
}, length: size)

#let style-triangle-up(size) = cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (0, 0), stroke: (dash: "dashed", cap: "round", thickness: 0.75pt))
  line((0, -1), (0, 0))
  line((calc.sqrt(0.5), calc.sqrt(0.5)), (0, 0))
}, length: size)

#let style-triangle-down(size) = cetz.canvas({
  import cetz.draw: *
  line((-1, 0), (0, 0))
  line((0, -1), (0, 0), stroke: (dash: "dashed", cap: "round", thickness: 0.75pt))
  line((calc.sqrt(0.5), calc.sqrt(0.5)), (0, 0))
}, length: size)

#style-square(15pt)
#style-triangle-up(15pt)
#style-triangle-down(15pt)

#let triangle-exemple(size) = cetz.canvas({
  import cetz.draw: *
  let env = (-2, -2, 3, 4)
  repere(env)
  droite-tropicale(env, -1, 1, [$C_1$], eastern)
  droite-tropicale(env, 1, -1, [$C_2$], orange)
  droite-tropicale(env, 2, 3, [$C_3$], green.darken(10%))
  point(-1, -1, [$A$], black)
  point(1, 3, [$B$], black)
  point(2, 0, [$C$], black)
}, length: size)


#triangle-exemple(15pt)

#let triangle-exemple-modifie(size) = cetz.canvas({
  import cetz.draw: *
  let env = (-2, -2, 4, 4)
  repere(env)
  droite-tropicale(env, -1, 1, [$C_1$], eastern)
  droite-tropicale(env, 3, -1, [$C_2$], orange)
  droite-tropicale(env, 2, 3, [$C_3$], green.darken(10%))
  point(-1, -1, [$A$], black)
  point(1, 3, [$B$], black)
  point(2, 0, [$C^*$], black)
  point(2, -1, [$C$], black)
}, length: size)
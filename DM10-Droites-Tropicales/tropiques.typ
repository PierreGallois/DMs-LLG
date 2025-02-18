#import "@preview/cetz:0.3.2"

#let vector(x0, y0, x1, y1, color, size) = {
  import cetz.draw: *
  line((x0, y0), (x1, y1), mark: (end: ">"), fill: color, stroke: (paint: color, thickness: size))
}

#let repere(env, o-legend: "to-be-set") = {
  import cetz.draw: *
  if o-legend == "to-be-set" {
    o-legend = text([(0, 0)], size: 0.75em)
  }
  grid(env.slice(0, 2), env.slice(2, 4), help-lines: true)
  line((0, env.at(1)), (0, env.at(3)))
  line((env.at(0), 0), (env.at(2), 0))
  vector(0, 0, 1, 0, black, 1.5pt)
  vector(0, 0, 0, 1, black, 1.5pt)
  content((0.05, -0.4), o-legend, anchor: "west")
}

#let point(x, y, name, color) = {
  import cetz.draw: *
  circle((x, y), radius: (0.1, 0.1), fill: color, stroke: none)
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
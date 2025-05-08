#import "@preview/cetz:0.3.1"

#let fig = cetz.canvas({
  import cetz.draw: *
  import cetz.angle: right-angle

  let m = 1
  let a = 2
  let n = 2
  let b = 3

  let alpha_v = m/a
  let beta_v = n/b
  let alpha_r = 1 / (2 * calc.pow(a, 2))
  let beta_r = 1 / (2 * calc.pow(b, 2))
  let alpha_center = (alpha_v, alpha_r)
  let beta_center = (beta_v, beta_r)
  let line_style = (paint: green, thickness: 2pt)
  let point_size = 1.5pt
  line(
    (alpha_v - alpha_r - (10/100*alpha_r), 0),
    (beta_v + beta_r + (10/100*alpha_r), 0)
  )
  circle(
    alpha_center,
    radius: alpha_r,
    name: "alpha"
  )
  circle(
    beta_center,
    radius: beta_r,
    name: "beta"
  )
  content(
    (name: "alpha", anchor: 45deg),
    pad(left:1.5em, bottom:1.5em, [$C_alpha$]),
  )
  content(
    (name: "beta", anchor: 45deg),
    pad(left:1.5em, bottom:1.5em, [$C_beta$]),
  )
  line(
    alpha_center,
    beta_center,
    stroke: line_style,
    name: "hyp"
  )
  line(
    alpha_center,
    (alpha_v, beta_r),
    stroke: line_style,
    name: "vert"
  )
  line(
    (alpha_v, beta_r),
    beta_center,
    stroke: line_style,
    name: "horiz"
  )
  right-angle(
    "vert.end",
    "vert.start",
    "horiz.end",
    radius: .01,
    label: none,
  )

  line(
    (alpha_v, 0),
    (beta_v, 0),
    stroke: line_style,
    name: "bottom"
  )

  line(
    (alpha_v, beta_r),
    (alpha_v, 0),
    stroke: (dash: "dashed"),
  )

  line(
    (beta_v, beta_r),
    (beta_v, 0),
    stroke: (dash: "dashed"),
  )

  content(
    "vert.mid",
    pad(right:4em, [$y_alpha - y_beta$]),
  )

  content(
    "bottom.mid",
    pad(top:2em, [$D$]),
  )

  content(
    (name: "hyp", anchor: 33%),
    pad(bottom:1.5em, left:1.5em, [$r_alpha$]),
  )

  content(
    (name: "hyp", anchor: 82%),
    pad(bottom:1.5em, left:1.5em, [$r_beta$]),
  )

  // Points
  circle(
    alpha_center,
    radius: point_size,
    fill: black,
  )
  circle(
    beta_center,
    radius: point_size,
    fill: black,
  )
},
length: 750pt)

#fig
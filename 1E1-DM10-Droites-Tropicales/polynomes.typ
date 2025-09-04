#import "@preview/plotsy-3d:0.1.0": plot-3d-parametric-curve, plot-3d-surface, plot-3d-parametric-surface


#let premier-degre(size, color, a, b, c) = {
  import calc.max

  let scale_factor = 0.01
  let (xscale,yscale,zscale) = (2,2,2)
  let scale_dim = (xscale*scale_factor,yscale*scale_factor, zscale*scale_factor)
  let func(x,y) = max(a - x, b - y, c)
  let color-func(x, y, z, x_lo,x_hi,y_lo,y_hi,z_lo,z_hi) = {
    return color.transparentize(7%).darken((y/(y_hi - y_lo))*100%).lighten((x/(x_hi - x_lo)) * 50%)
  }
  move(dx: 17pt,
  box(inset: (top: -25pt),
  plot-3d-surface(
    func,
    color-func: color-func,
    subdivisions: 1,
    subdivision_mode: "decrease",
    scale_dim: scale_dim,
    xdomain: (-size,size),
    ydomain:  (-size,size),
    pad_high: (0,0,2),
    pad_low: (0,0,1),
    axis_step: (5,5,5),
    dot_thickness: 0.05em,
    front_axis_thickness: 0.05em,
    front_axis_dot_scale: (0.05,0.05),
    rear_axis_dot_scale: (0.08,0.08),
    rear_axis_text_size: 0.5em,
    axis_label_size: 1em,
    rotation_matrix: ((-2, 2, 4), (0, -1, 0))
  )))
}

#premier-degre(15, teal, 1, 1, 5)

#let second-degre(color, side) = {
  import calc.max
  let size = 3
  let scale_factor = 0.007
  let (xscale,yscale,zscale) = (10,10,10)
  let scale_dim = (xscale*scale_factor,yscale*scale_factor, zscale*scale_factor)
  let func(x,y) = max(1, -1 + (x * side), -y, -5 + x*x)
  let color-func(x, y, z, x_lo,x_hi,y_lo,y_hi,z_lo,z_hi) = {
    return color.transparentize(7%).darken((y/(y_hi - y_lo))*100%).lighten((x/(x_hi - x_lo)) * 50%)
  }
  move(dx: 10pt,
  box(inset: (top: -25pt),
  plot-3d-surface(
    func,
    color-func: color-func,
    subdivisions: 10,
    subdivision_mode: "increase",
    scale_dim: scale_dim,
    xdomain: (-size,size),
    ydomain:  (-size,size),
    pad_high: (0,0,1),
    pad_low: (0,0,0),
    axis_step: (2,2,2),
    dot_thickness: 0.05em,
    front_axis_thickness: 0.05em,
    front_axis_dot_scale: (0.05,0.05),
    rear_axis_dot_scale: (0.08,0.08),
    rear_axis_text_size: 0.5em,
    axis_label_size: 1em,
    axis_label_offset: (0.1, 0.1, 0.1),
    axis_text_offset: 0.04,
    rotation_matrix: ((-3, 2, 4), (0, -1, 0))
  )))
}

#second-degre(blue, 1)


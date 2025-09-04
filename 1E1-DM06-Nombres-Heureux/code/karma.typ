

#let karma(n) = {
  let d = n
  let p = 0
  while d != 0 {
    let r = calc.rem-euclid(d, 10)
    d = calc.div-euclid(d, 10)
    p += calc.pow(r, 2)
  }
  p
}


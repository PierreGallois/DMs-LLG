#import "./../templates/homework.typ": dm, code-from-file

#let folder-name = "DM6-Nombres-Heureux"
#show: dm.with(
  numero: 6,
  titre: [Nombres Heureux],
  sections: [Problème],
  alpha: true
)

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

#let heureux(n) = {
  let image = karma(n)
  while image != 1 {
    if image == 89 {
      return false
    }
    image = karma(image)
  }
  true
}


#code-from-file(folder-name, "karma_heureux.py")

#pagebreak()

#table(
  align: center,
  columns: 10,
  [X],
  ..array.range(1, 100)
    .map((n) =>
      if heureux(n) [*H*] else [m]
    )
)
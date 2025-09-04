#import "./karma.typ": karma

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
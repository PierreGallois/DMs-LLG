// π = 4


#import "./../templates/homework.typ": dm, sous-partie
#import "@preview/vartable:0.2.3": tabvar
#import "@preview/lilaq:0.5.0" as lq

#show: dm.with(
  numero: 7,
  titre: [Arc Tangente et nombres complexes],
  sections: [Problème],
  alpha: false
)

#let folder-name = "TE1-DM07-Arc-Tangente-Et-Nombres-Complexes/"

#if sys.version.minor != 14 {
  panic("Please compile with Typst 0.14")
}


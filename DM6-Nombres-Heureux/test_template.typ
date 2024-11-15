#import "./../templates/homework.typ": dm, code-from-file

#let folder-name = "DM6-Nombres-Heureux"
#show: dm.with(
  numero: 6,
  titre: [Nombres Heureux],
  sections: [Problème],
  alpha: true
)

#code-from-file(folder-name, "code.py")
end
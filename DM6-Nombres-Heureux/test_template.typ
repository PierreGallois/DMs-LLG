#import "./../templates/homework.typ": dm, code-from-file

#show: dm.with(
  numero: 6,
  titre: [Nombres Heureux],
  sections: [Problème],
  alpha: true
)

start
#code-from-file("./code.py")
end
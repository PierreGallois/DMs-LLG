#import "./../templates/homework.typ": dm, sous-partie, code-from-file

#show: dm.with(
  numero: 4,
  titre: [Méthode de Newton],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM04-Methode-de-Newton/"


=

=

= Algorithmes

==
==
==


#code-from-file(folder-name, "newton.py")
#import "./../templates/homework.typ": dm, sous-partie, code-from-file

#show: dm.with(
  numero: 18,
  titre: [Répartition des nombres premiers],
  sections: [Partie],
  alpha: true
)

#let folder-name = "TE1-DM18-Repartition-des-nombres-premiers/"

#sous-partie[Problème 1]

= Minoration de $pi (n)$ par la méthode de Nair (1982)


==
Un rapide script python opérant par récursivité permet d'obtenir la valeur de $Delta_n$ pour $n$ entre 2 et 9 :
#code-from-file(folder-name, "delta.py")
$
Delta_2 = 2, quad
Delta_3 = 6, quad
Delta_4 = 12, quad
Delta_5 = Delta_6 = 60, quad
Delta_7 = 420, quad
Delta_8 = 840, "et" 
Delta_9 = 2520
$

==

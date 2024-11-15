#let dm(
  numero: none,
  titre: none,
  sections: "Partie", // Nom par défaut des grandes sections du DM
  alpha: true, // Valeur par défaut de si la numérotation devrait se faire en lettres ou en nombres
  body
) = {
  let author = "Jules Charlier, Thomas Diot, Pierre Gallois, Jim Garnier" 
  set document(author: author, title: "Mathématiques : Devoir maison n° " + str(numero))

  set text(lang: "fr")
  set page("a4", margin: auto)
  set page(footer: context {
    set align(center)
    set text(8pt)
    if counter(page).get().first() == 4 [
      $pi = 4$
    ] else {
      counter(page).display()
    }
  })

  // Titre
  {
    set align(center)
    text(17pt, weight: "bold")[
      Devoir maison n$degree$#numero : #titre
    ]
    v(-5pt)
    text(12pt)[
      #author \
      1E1
    ]
  }
  
  // Pagination


  // Gestion des sections
  let nmbring(..nums) = {
    let number = if alpha {
      str.from-unicode("A".to-unicode() - 1 + nums.at(0))
    } else {
      str(nums.at(0))
    }
    sections + " " + number + " -"
  }


  show heading.where(level: 1): it => {
    set heading(numbering: nmbring);
    // Mettre un bloc autour !!
  }
  
  show heading.where(level: 2): set heading(numbering:(..nums) => str(nums.at(1)) + ")")

  show heading.where(level: 3): set heading(numbering: (..nums) => str.from-unicode("a".to-unicode() - 1 + nums.at(2)) + ")")

  body
}
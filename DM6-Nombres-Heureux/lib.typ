#let dm(
  numero: none,
  titre: none,
  sections: "Partie", // Nom par défaut des grandes sections du DM
  alpha: true, // Valeur par défaut de si la numérotation devrait se faire en lettres ou en nombres
  body
) = {
  let author = "Jim Garnier, Thomas Diot, Jules Charlier, Pierre Gallois" 
  set document(author: author, title: "Mathématiques : Devoir maison n° " + str(numero))

  set text(lang: "fr")
  set page("a4", margin: auto)

  // Titre
  {
    set align(center)
    text(17pt, weight: "bold", "Devoir maison n° " + str(numero) + " : " + titre + "\n\n")

    text(12pt, author + "\n")
    text(12pt, "1E1")
  }

  let nmbring(..nums) = {
    let number = if alpha {str.from-unicode("A".to-unicode() - 1 + nums.at(0))} else {str(nums.at(0))}
    sections + " " + number + " -"
  }


  show heading.where(level: 1): it => {
    set heading(numbering: nmbring);
    // Mettre un bloc autour !!
  }
  
  show heading.where(level: 2): set heading(numbering: (..nums) => str(nums.at(1)) + ")")

  show heading.where(level: 3): set heading(numbering: (..nums) => str.from-unicode("a".to-unicode() - 1 + nums.at(2)) + ")")

  body
}
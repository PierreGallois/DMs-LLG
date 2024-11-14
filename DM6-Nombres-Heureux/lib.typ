#let dm(
  numero: none,
  titre: none,
  sections: "Partie", // Nom par défaut des grandes sections du DM
  alpha: true, // Valeur par défaut de si la numérotation devrait se faire en lettres ou en nombres
  body
) = {
  set document(author: "Jim Garnier, Thomas Diot, Jules Charlier, Pierre Gallois", title: "Mathématiques : Devoir maison n° " + str(numero))

  set text(lang: "fr")
  set page("a4", margin: auto)

  let nmbring(..nums) = {
    let number = if alpha {str.from-unicode("A".to-unicode() - 1 + nums.at(0))} else {nums.at(0)}
    sections + " " + number + " -"
  }

  show heading.where(level: 1): set heading(numbering: nmbring);
  // show heading.where(level: 2):

  body
}
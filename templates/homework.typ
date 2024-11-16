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


  show heading.where(level: 1): set heading(numbering: nmbring);
  
  show heading.where(level: 2): set heading(numbering:(..nums) => str(nums.at(1)) + ")")


  show heading.where(level: 3): set heading(numbering: (..nums) => str.from-unicode("a".to-unicode() - 1 + nums.at(2)) + ")")

  show heading.where(level: 1): it => {
    it + [\ ]
  }

  show heading.where(level: 2): it2 => {
    box(it2)
  }

  show heading.where(level: 3): it3 => {
    box(it3)
  }

  body
}

#let code-from-file(
    folder-name,
    file-name,
    lang:none,
    hide-calls:true,
    hide-imports: true,
  ) = {
  // Astuce à cause de la gestion des paths relatives de typst :
  let path = "./../" + folder-name + "/" + file-name

  let code_file = read(path)
  if lang == none {
    if path.ends-with(".py") {
      lang = "python"
    }
    if path.ends-with(".typ") {
      lang = "typst"
    }
  }

  // cache tout le code après le `if __name__ ...` pour permettre l'execution du programme sans que cela soit affiché dans typst
  if hide-calls {
    if lang == "python" {
      code_file = code_file.trim(
        regex(`if __name__ == "__main__":[\S\s]*`.text),
        at: end,
        repeat: false
      )
    }
  }

  if hide-imports {
    if lang == "typst" { // TODO en enlève qu'un seul pour une raison inconnue
      code_file = code_file.trim(
        regex(`^#import.*`.text),
        repeat: true
      )
    }
    if lang == "python" { // TODO en enlève qu'un seul pour une raison inconnue
      code_file = code_file.trim(
        regex(`^[from|import].*`.text),
        repeat: true
      )
    }
  }

  // enlève les espaces de début et fin
  code_file = code_file.trim()

  block(
    fill: rgb("#1d2433"),
    inset: 20pt,
    radius: 15pt,
    text(
      fill: rgb("#a2aabc"),
      raw(
        code_file,
        lang: lang,
        theme: "vscode_dark_modern_unofficial.tmTheme",
      )
    )
  )
}
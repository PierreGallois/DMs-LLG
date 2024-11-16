#import "./../templates/homework.typ": dm, code-from-file

#import "./code/karma.typ": karma
#import "./code/heureux.typ": heureux

#let folder-name = "DM6-Nombres-Heureux"
#show: dm.with(
  numero: 6,
  titre: [Nombres Heureux],
  sections: [Problème],
  alpha: true
)


#code-from-file(folder-name, "/code/heureux.py")

```python
print(True)
```

```python
print(True)
print(False)
```

#pagebreak()

#code-from-file(folder-name, "/code/karma.typ")

#code-from-file(folder-name, "/code/heureux.typ")

#table(
  align: center,
  columns: 10,
  [X],
  ..array.range(1, 100)
    .map((n) =>
      if heureux(n) [*H*] else [m]
    )
)

= Nombres Heureux

==
===
Le nombre est heureux comme Sisyphe 
from string import ascii_uppercase
from itertools import product

with open("vectors.typ", 'w') as file:
    for a, b in product(ascii_uppercase, ascii_uppercase):
        if a == b:
            continue
        file.write(f"#let {a}{b} = math.class(\"normal\", $arrow({a} {b})$)\n")

print("done.")
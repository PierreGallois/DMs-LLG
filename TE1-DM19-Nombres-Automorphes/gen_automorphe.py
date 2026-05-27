import math


def next_automorphe(b, n):
    # Calcule, sous l'hypothèse que b est automorphe de n chiffres, le nombre automorphe de n+1 chiffres qui lui correspond
    B = math.floor(b * b / (10**n)) % 10
    a = ((-B) * pow(2 * b - 1, -1, 10)) % 10
    return a * (10**n) + b



def karma(n):
    """Calcule la somme des carrés des chiffres de n"""
    d = n
    p = 0
    while d != 0:
        r = d%10
        d //= 10
        p += r**2
    return p


if __name__ == "__main__":
    print(karma(12345))
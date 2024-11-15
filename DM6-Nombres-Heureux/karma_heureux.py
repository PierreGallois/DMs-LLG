# python 3

def karma(n):
    """Calcule la somme des chiffres de n"""
    d = n
    p = 0
    while d != 0:
        r = d%10
        d //= 10
        p += r**2
    return p

def heureux(n):
    """
    Renvoie True si le nombre converge dans le puit 1,
    sinon False (tout nombre converge, voir partie 3)
    """
    image = karma(n)
    while image != 1:
        # Teste si le nombre est arrivé dans la boucle
        # Ne teste qu'un valeur de la boucle (perte de temps négligeable)
        if image == 89:
            return False
        image = karma(image)
    return True

def probabilite(Nmax):
    """Compte la probabilite qu'un nombre inferieur à Nmax soit heureux"""
    return (
        [
            heureux(n) for n in range(1, Nmax+1)
        ].count(True)
        / Nmax
    )



if __name__ == "__main__":
    print(probabilite(100))
from karma import karma

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


if __name__ == "__main__":
    print(heureux(10))
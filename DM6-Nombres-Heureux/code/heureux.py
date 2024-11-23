from karma import karma

def heureux(n):
    """
    Renvoie True si le nombre converge dans le puits 1,
    sinon False
    """
    image = karma(n)
    while image != 1:
        # Teste si le nombre est arrivé dans la boucle
        if image == 89:
            return False
        image = karma(image)
    return True


if __name__ == "__main__":
    print(heureux(10))
    print([n for n in range(1, 101) if heureux(n)])
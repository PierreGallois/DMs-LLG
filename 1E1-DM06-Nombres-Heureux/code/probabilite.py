from heureux import heureux

def probabilite(Nmax):
    """
    Calcule la probabilite qu'un nombre inferieur à Nmax soit heureux
    """
    return (
        [
            heureux(n) for n in range(1, Nmax+1)
        ].count(True)
        / Nmax
    )


if __name__ == "__main__":
    print(probabilite(10000))